# S3: Kompromittierung durch `ssshd`-Downloader

## Zeitpunkt und System

- Festgestellt: 2026-09-06, 15:43–16:00 UTC
- Beginn laut Dateizeit und Journal: 2026-09-05, 16:06 UTC
- System: S3 / `srv1577995` / 187.124.191.206

## Symptom

- S3 war nicht erreichbar; eine Anmeldung war anschließend nicht mehr möglich.
- Der vorherige Boot lief ab 2026-09-05 16:08 UTC in Watchdog-Zeitüberschreitungen zentraler Dienste.
- Neustart des VPS am 2026-09-06 um 15:34 UTC.

## Gesicherte Befunde und Ursache

- Nicht paketverwaltete Root-Dateien wurden am 2026-09-05 um 16:06:54 UTC angelegt:
  - `/usr/bin/ssshd`, SHA-256 `2bcc91fdedb8c583a9fe883be9ad453333a1bba0fdf655474982db3cbb8e7a74`
  - `/usr/lib/systemd/system/myservices.service`, SHA-256 `7f91960639ad28991fe496f5a3d19a3d8714c82d333ccfa1be4bf065f495eceb`
- `myservices.service` ist aktiviert, startet alle 30 Minuten neu und führt `/usr/bin/ssshd` als Root aus.
- `ssshd` lädt Shellcode von `195.24.237.240/.x/black3`, ersatzweise von `digital.digitaldatainsights.org/.x/black3`, und leitet ihn unmittelbar an `bash` weiter.
- Der erste dokumentierte Lauf begann um 16:06:55 UTC. Ab 16:08:01 UTC meldeten `systemd-networkd` und `systemd-udevd` Watchdog-Timeouts, danach weitere zentrale Dienste.
- Gleichzeitig entstanden Hunderte fehlgeschlagene SSH-Anmeldeversuche vom Host gegen sich selbst; OpenSSH protokollierte mindestens 247 zusätzlich verworfene Verbindungen.
- Die unmittelbare Überlastung wurde damit sehr wahrscheinlich durch den nachgeladenen Schadcode ausgelöst. Der ursprüngliche Eindringweg ist noch ungeklärt.
- Alle lokalen Konten zeigen Passwortänderungsdatum 2026-09-05; mehrere `authorized_keys` wurden um 16:06:49–50 UTC überschrieben. Frühere Zugangsdaten bzw. Schlüssel sind daher möglicherweise ungültig oder kompromittiert.

## Rekonstruktion des initialen Zugriffs

Die SSH- und sudo-Protokolle ergeben eine eindeutige Kette:

1. `109.160.32.22` probierte automatisiert zahlreiche Benutzernamen und Passwörter. Root-Anmeldungen derselben Quelle scheiterten, zuletzt am 2026-09-05 um 16:06:38 UTC.
2. Um 16:06:42 und 16:06:45 UTC akzeptierte SSH je eine **Passwortanmeldung als `rocky`** von dieser Adresse.
3. Um 16:06:48 UTC führte `rocky` aus `/var/tmp` die Datei `/var/tmp/cMCDMHZp` über `sudo` als Root aus.
4. `rocky` besaß doppelt konfigurierte, uneingeschränkte Regeln `NOPASSWD: ALL`. Daher war für die Rechteausweitung weder Rockys noch Roots Passwort erforderlich.
5. Um 16:06:49–56 UTC folgten Veränderungen an Passwörtern und SSH-Schlüsseln, Root-Persistenz sowie weitere Payloads. Ab 16:08 UTC setzte die Überlastung ein.

Damit ist ein erfolgreicher direkter Root-Login nicht belegt und nach den vorhandenen Protokollen nicht der Einstieg. Gesichert ist der Einstieg über Rockys Passwort. Nicht mehr bestimmbar ist, ob dieses Passwort schwach, wiederverwendet oder zuvor anderweitig abgeflossen war. Das zeitliche Muster spricht für automatisiertes Passwort-Spraying.

## Härtung nach Neuinstallation

1. Neuinstallation aus einem sauberen Provider-Abbild; aus dem alten System keine Programme, Systemdateien, Home-Verzeichnisse oder SSH-Konfigurationen ungeprüft übernehmen.
2. Vor Inbetriebnahme alle auf S3 vorhandenen SSH-Schlüssel, Passwörter, API-/Bot-Tokens und sonstigen Secrets von einem sauberen Gerät rotieren; Provider-Konto mit MFA schützen.
3. SSH ausschließlich mit neuen ED25519-Schlüsseln: `PasswordAuthentication no`, `KbdInteractiveAuthentication no`, `PermitRootLogin no`; nur einen benannten Administrationsnutzer mittels `AllowUsers` zulassen.
4. Keine pauschalen `NOPASSWD: ALL`-Regeln. Agenten als nicht interaktive Servicekonten ohne SSH-Login und nur mit eng begrenzten sudo-Kommandos betreiben.
5. Provider- und Host-Firewall mit Default-Deny: SSH bevorzugt nur über WireGuard/Tailscale oder von festen Quelladressen; VNC niemals öffentlich, sondern ausschließlich über VPN oder SSH-Tunnel; OpenClaw-Gateways auf Loopback binden.
6. Nur erforderliche Dienste installieren; ungenutzte Konten und Ports deaktivieren. Automatische Sicherheitsupdates aktivieren.
7. Persistente Protokolle, `auditd`, Datei-Integritätskontrolle und Alarmierung für erfolgreiche SSH-Logins, sudo, neue systemd-Units sowie Änderungen an `authorized_keys` einrichten.
8. Verschlüsselte, extern gelagerte Backups samt regelmäßig geprüftem Wiederherstellungstest vorhalten.
9. Fail2ban nur als zusätzliche Bremse einsetzen; Schlüsselpflicht, Netzwerkbegrenzung und minimale Privilegien sind die tragenden Kontrollen.

## Aktueller Zustand

- S3 läuft seit 15:34 UTC wieder; SSH, Docker, die OpenClaw-Gateways, LightDM und VNC-Dienste sind aktiv.
- CPU, RAM und Platte sind aktuell unauffällig.
- Die Malware-Persistenz ist weiterhin aktiviert und kann erneut anlaufen.
- Der bekannte `c3pool_miner.service` ist ebenfalls noch aktiviert, scheitert aber wegen fehlender Binärdatei.

## Fix

- Nach Freigabe durch dto/Slarti ab 16:15 UTC umgesetzt:
  - den übermittelten ED25519-Schlüssel ergänzend und idempotent in `/root/.ssh/authorized_keys` eingetragen; Fingerprint `SHA256:w85sfHviZTzEi6wElEVthS8+inzcJjb42WPNwFBXbjM` geprüft;
  - vom Angreifer gesetzte Attribute `immutable` und `append-only` kontrolliert entfernt; anschließend Datei auf Root/0600 und wieder `immutable` gesetzt;
  - `myservices.service` und `c3pool_miner.service` gestoppt, deaktiviert und maskiert;
  - flüchtige nftables-Quarantäne aktiviert: eingehend nur Loopback, bestehende Verbindungen, ICMP und SSH/22; Forwarding verworfen; ausgehend bekannte Schadadresse `195.24.237.240` und TCP/80 gesperrt;
  - zwei ausführbare Root-Payloads unter `/var/tmp/3ce227b7/` sowie eine Steuerdatei unter `/var/tmp/.ladyg0g0/` gesichert, auf Modus 000 gesetzt und unveränderlich markiert.
  - bei der Nachkontrolle um 16:51 UTC auch dem Downloader `/usr/bin/ssshd`, `/usr/bin/.locatione` und der ursprünglichen Unit-Datei sämtliche Rechte entzogen und diese Beweisstücke unveränderlich markiert.
- Keine Beweisdatei gelöscht und kein unbekannter Schadcode ausgeführt.
- Die Quarantäne-Firewall ist absichtlich noch nicht rebootfest. S3 bis zur Neuinstallation nicht neu starten, außer über Provider-Konsole und mit anschließend erneuter Isolation.

## Backups

- Lokale Beweissicherung samt Prüfsummen unter `/root/incident-s3-20260906T161650Z` angelegt. Dieser Pfad enthält sensible Zugangsinformationen und wird nicht nach GitHub kopiert.
- Vor weiterer Bereinigung sollte zusätzlich ein Provider-Snapshot ausschließlich zu forensischen Zwecken angelegt werden. Er darf nicht als vertrauenswürdige Wiederherstellungsquelle gelten.

## Lernpunkte

- Die am 2026-09-05 bereits festgestellte Miner-Unit war ein ernstes Kompromittierungsindiz.
- Eine offene Host-Firewall, öffentliches SSH mit Passwortanmeldung und öffentlich erreichbare VNC-Dienste vergrößern die Angriffsfläche erheblich.
- Ein wieder laufender VPS ist nach einem solchen Vorfall nicht automatisch wieder vertrauenswürdig.

## Offene Punkte

1. Root-Zugang mit dem neuen Schlüssel von einem sauberen System testen.
2. Provider-Snapshot anlegen und initialen Angriffsweg sowie Umfang der Manipulation forensisch bestimmen.
3. Sämtliche auf S3 vorhandenen Secrets, Passwörter, SSH-Schlüssel und Bot-/API-Tokens außerhalb von S3 rotieren.
4. S3 sauber neu installieren und nur geprüfte Daten/Konfigurationen zurückspielen.
5. Dauerhaft SSH auf Schlüsselzugang beschränken und Firewall/VNC-Exposition korrigieren.
