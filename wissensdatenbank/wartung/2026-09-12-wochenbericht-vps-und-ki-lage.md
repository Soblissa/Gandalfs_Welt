# Wochenbericht VPS und KI-Lage – 12.09.2026, 06:00 UTC

## Fakten

### S1 – 147.93.120.51

- Erreichbar per SSH als `gandalf-ro`; Laufzeit 1 Tag 19 Stunden.
- Last `0,16 / 0,05 / 0,01`; RAM 2,1 von 15 GiB; Root-Platte 32 von 193 GiB (17 %).
- SSH, Docker sowie die OpenClaw-Gateways `chantall`, `cheko` und `user2` laufen. `lightdm.service` ist fehlgeschlagen; die Wochenlogs zeigen ansonsten nur wiederkehrende, geringe PipeWire/JACK-Warnungen.
- 16 Updates installierbar, darunter Sicherheitsupdates für glibc und Python; zwei Pakete zurückgehalten. Kein Neustart angefordert.
- SSH-Passwort- und Root-Anmeldung sind deaktiviert. Firewallstatus ist mit dem Read-only-Konto nicht lesbar. Öffentlich lauschen unter anderem TCP 22, 80, 443, 139, 445, 19870 und 19953.

### S2 – 89.116.39.197

- Von S3 erreichbar: Ping ohne Verlust; TCP 22, 80 und 443 antworten.
- `gandalf-ro` wird abgewiesen. Last, Platte, Dienste, Updates, Logs und innere Sicherheitslage sind daher **nicht geprüft**.

### S3 – lokal, 187.124.191.206

- Erreichbar; Laufzeit 5 Tage; Last `1,74 / 0,72 / 0,35`; RAM 3,1 von 15 GiB; Root-Platte 39 von 197 GiB (21 %).
- Keine fehlgeschlagenen Units. SSH, Docker und die Gateways `gandalf`, `konfuzius`, `turyia` laufen. Keine Updates offen, kein Neustart angefordert. Wochenlogs nur mit wenigen Desktop-/D-Bus-Meldungen.
- SSH-Passwort- und Root-Anmeldung sind deaktiviert; Gateways binden an Loopback. Öffentlich lauschen SSH/22 und TCP 11435.
- Nach dem Neustart ist `c3pool_miner.service` wieder **aktiviert**, derzeit aber wegen fehlender Binärdatei inaktiv. Die bekannten `ssshd`-/`myservices`-Dateien fehlen. Eine wirksame Host-Firewall konnte ohne Root-Rechte nicht belegt werden.
- OpenClaw-Audit: 0 kritisch, 4 Warnungen. Wesentlich sind gemeinsame Telegram-DM-Session, mögliche Mehrbenutzer-Nutzung ohne Isolation und ein veraltetes Gateway-Prüfziel auf Port 18789.

### S4 – 167.235.129.145

- Ping sowie TCP 22, 80 und 443 liefen in Timeouts. `gandalf-ro` ist nicht verfügbar.
- Daraus folgt nur: **von S3 aus derzeit nicht erreichbar**. Last, Platte, Dienste, Updates, Logs und innere Sicherheitslage sind nicht geprüft.

## Vermutung

- S4 kann ausgefallen sein oder Verkehr von S3 filtern; ohne Provider- oder Read-only-Zugang ist beides nicht unterscheidbar.
- S3 zeigt keine laufende bekannte Schadsoftware, bleibt nach der bestätigten Root-Kompromittierung vom 05.09. jedoch nicht vertrauenswürdig. Fehlende Malware-Dateien ersetzen keine saubere Neuinstallation.

## Rat

1. **S3 vorrangig sauber neu installieren**; bis dahin keine neuen Geheimnisse hinterlegen. Miner-Unit und Firewallzustand nach Freigabe mit Root-Rechten sichern und prüfen.
2. S1 im Wartungsfenster patchen; `lightdm` klären und öffentliche SMB-/Gateway-Ports gegen die beabsichtigte Firewallregel prüfen.
3. Read-only-Zugriff für S2 und S4 wiederherstellen; S4 zusätzlich im Provider-Panel prüfen.

## KI-Lage der Woche, 05.–12.09.2026

- Google DeepMind veröffentlichte am 08.09. den **AlphaGenome Atlas** mit Vorhersagen für neun Milliarden mögliche menschliche DNA-Varianten – ein bedeutender Einsatz spezialisierter KI in der Genomforschung.
- NASA und IBM stellten am 10.09. ein **offenes Foundation Model für Mondforschung** vor, unter anderem zur Kartierung von Eis und Kratern.
- Anthropic veröffentlichte am 10.09. einen neuen Bericht zur **Erkennung und Abwehr missbräuchlicher KI-Nutzung**.
- NSA und Partner warnten am 08.09. vor systematischer **Destillation US-amerikanischer Frontier-Modelle** durch chinesische KI-Unternehmen.
- Keine belastbar bestätigte neue Frontier-Modellgeneration oder regulatorische Zäsur in diesem Wochenfenster gefunden.

Quellen (frisch abgerufen am 12.09.2026): [Google DeepMind / AlphaGenome](https://news.google.com/search?q=AlphaGenome%20Atlas%20September%202026), [NASA/IBM](https://news.google.com/search?q=NASA%20IBM%20lunar%20foundation%20model%20September%202026), [Anthropic Missbrauchsbericht](https://news.google.com/search?q=Anthropic%20Detecting%20and%20countering%20misuse%20September%202026), [NSA-Warnung](https://news.google.com/search?q=NSA%20AI%20distillation%20September%202026). `web_search` war wegen des bekannten fehlenden Perplexity-Schlüssels nicht verfügbar; deshalb wurden aktuelle Google-News-RSS-Ergebnisse mit Primärquellenbezug verwendet.
