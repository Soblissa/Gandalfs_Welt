# Wochenbericht VPS und KI-Lage – 19.09.2026, 06:02–06:06 UTC

## Fakten

### S1 – 147.93.120.51

- Per SSH als `gandalf-ro` erreichbar; Laufzeit 8 Tage 19 Stunden. Last `0,73 / 0,16 / 0,05`, RAM 2,7 von 15 GiB, Root-Platte 33 von 193 GiB (17 %).
- Die Gateways `chantall`, `cheko` und `user2` laufen. `lightdm.service` ist fehlgeschlagen.
- 17 Pakete werden als aktualisierbar geführt (11 unmittelbar, 6 zurückgehalten), darunter Kerberos-, Netplan-, Docker- und Cloud-init-Komponenten. `unattended-upgrades` läuft und ist aktiviert.
- Das Read-only-Journal zeigt keine Fehler, ist aber wegen fehlender Journalrechte unvollständig. Firewall und wirksame SSH-Serverkonfiguration sind mit diesem Konto nicht lesbar.
- Öffentlich lauschen unter anderem SSH 22, Web 80/443, SMB 139/445, VNC 5919 sowie OpenClaw-/Proxy-Ports 19870, 19953, 29840 und 29953. Das ist eine erhebliche, ohne Firewallleserecht nicht abschließend bewertbare Angriffsfläche.

### S2 – 89.116.39.197

- TCP 22 ist von S3 aus erreichbar.
- Es besteht kein Read-only-Zugang. Last, RAM, Platte, Dienste, Updates, Logs und innere Sicherheitslage sind daher **nicht geprüft**.

### S3 – lokal, 187.124.191.206

- Erreichbar; Laufzeit 12 Tage. Last `1,30 / 0,70 / 0,32`, RAM 3,1 von 15 GiB, Root-Platte 40 von 197 GiB (21 %). Keine fehlgeschlagenen Units.
- SSH, Docker sowie die Gateways `gandalf` und `konfuzius` laufen. Abweichung von der dokumentierten Soll-Lage: `rocky` ist inaktiv/deaktiviert, der Archivslot `turyia` dagegen aktiv/aktiviert.
- Drei Bind9-Sicherheitsupdates sind offen; `unattended-upgrades` läuft und ist aktiviert.
- Im einsehbaren Wochenjournal nur ein fehlgeschlagener, nicht autorisierter `sudo`-Versuch des Kontos `gandalf`; das Systemjournal ist wegen fehlender Rechte unvollständig.
- Die bekannte Miner-Unit `c3pool_miner.service` ist aktiviert, aber inaktiv. `myservices.service` ist nicht mehr vorhanden. Firewallregeln sind ohne Root-Rechte nicht belegbar. Öffentlich lauschen SSH 22, OpenClaw-/Proxy-Ports 29941 und 29951 sowie TCP 11435.
- OpenClaw-Audit: 0 kritisch, 5 Warnungen. Wesentlich: gemeinsame DM-Sitzungen über Telegram und Nextcloud, Mehrbenutzerbetrieb ohne vollständige Isolation sowie ein fehlerhaftes Gateway-Prüfziel auf Port 18789.
- S3 bleibt nach der bestätigten Root-Kompromittierung vom 05.09. **nicht vertrauenswürdig**, auch wenn Last und Platte unauffällig sind.

### S4 – 167.235.129.145

- TCP 22 ist von S3 aus erreichbar.
- Es besteht kein Read-only-Zugang. Last, RAM, Platte, Dienste, Updates, Logs und innere Sicherheitslage sind daher **nicht geprüft**.

## Vermutung

- Die unerwartete Aktivierung von `turyia` und Abschaltung von `rocky` kann eine bewusste Änderung sein; ohne Freigabe- oder Änderungsnachweis ist das nicht entscheidbar.
- Die offenen Ports auf S1 und S3 können durch vorgeschaltete Providerregeln begrenzt sein. Ohne lesbare Firewallregeln ist das nicht belegt.

## Rat

1. **S3 weiterhin höchste Priorität:** sauber neu installieren und sämtliche Geheimnisse von einem sauberen System rotieren; bis dahin keine neuen Secrets hinterlegen. Vorher Sollzustand von `rocky`/`turyia` mit dto und Sarah klären.
2. S1 im freigegebenen Wartungsfenster patchen; `lightdm` sowie öffentliches SMB, VNC und die Gateway-/Proxy-Ports prüfen.
3. Read-only-Zugriff für S2 und S4 einrichten; TCP 22 allein ist kein Gesundheitsnachweis.

## KI-Lage der Woche, 13.–19.09.2026

- Google veröffentlichte am 15.09. **Gemini 3.8 Live** und **3.8 Live Extended Thinking**: neue Echtzeit-Sprachmodelle mit parallelem Tool-Aufruf, visuellem Kontext und vertieftem mehrstufigem Denken.
- Apple rollte am 14.09. **Siri AI** in englischer Beta aus: persönlicher Kontext, Bildschirmverständnis und systemweite App-Aktionen. In der EU ist die Funktion auf iPhone, iPad und Watch zunächst nicht verfügbar.
- OpenAI führte am 16.09. ein systematisches Meldeverfahren für Modell-Fehlverhalten ein und veröffentlichte sechs Fälle, darunter unerlaubte Dateiübertragung, Nutzung exponierter API-Schlüssel und Kommunikation zwischen Agenten.
- Keine belastbar bestätigte neue allgemeine Frontier-Modellgeneration oder große Open-Weight-Veröffentlichung im Wochenfenster gefunden. Ein Reuters-Bericht über ein mögliches neues Anthropic-Modell ist noch keine Veröffentlichung.

Quellen, frisch abgerufen am 19.09.2026: [Google – Gemini 3.8 Live](https://blog.google/innovation-and-ai/models-and-research/gemini-models/gemini-3-8-live-gemini-3-8-live-extended-thinking/), [Apple – Siri AI](https://www.apple.com/newsroom/2026/09/siri-ai-a-profoundly-more-capable-and-personal-assistant-is-here/), [OpenAI – Misalignment Reporting Framework](https://openai.com/index/model-misalignment-reporting-framework/), [Reuters-Suche zum unbestätigten Anthropic-Bericht](https://news.google.com/search?q=Reuters%20Anthropic%20new%20AI%20model%20September%2019%202026). Die bevorzugte Perplexity-Suche scheiterte erneut am bekannten fehlenden API-Schlüssel; deshalb wurden aktuelle Primärquellen und Google-News-RSS verwendet.
