# Wochenbericht VPS und KI-Lage – 26.09.2026, 06:01–06:04 UTC

## Fakten

### S1 – 147.93.120.51

- Per SSH als `gandalf-ro` erreichbar; Ubuntu 24.04.5 LTS, Laufzeit 15 Tage 19 Stunden. Last `0,12 / 0,06 / 0,01`, RAM 2,5 von 15 GiB, Root-Platte 33 von 193 GiB (17 %).
- SSH sowie die OpenClaw-Gateways `chantall`, `cheko` und `user2` laufen. `lightdm.service` ist fehlgeschlagen.
- 23 Pakete sind aktualisierbar, darunter sechs aus Security-Repositories; ein Neustart ist erforderlich. `unattended-upgrades` ist aktiv und aktiviert.
- Im einsehbaren Wochenjournal erscheinen fünf JACK/DBus-Warnungen. Die Journal- und Firewall-Sicht des Read-only-Kontos ist eingeschränkt.
- Öffentlich lauschen unter anderem SSH 22, Web 80/443, SMB 139/445, VNC 5919 sowie OpenClaw-/Proxy-Ports 19870, 19953, 29840 und 29953. Ohne lesbare Firewallregeln ist die tatsächliche Erreichbarkeit nicht abschließend bewertbar.

### S2 – 89.116.39.197

- Von S3 aus antworten ICMP sowie TCP 22, 80 und 443.
- Es besteht kein Read-only-Zugang. Last, RAM, Platte, Dienste, Updates, Logs und innere Sicherheitslage sind daher **nicht geprüft**.

### S3 – lokal, 187.124.191.206

- Erreichbar; Debian 13, Laufzeit 19 Tage. Last `2,30 / 0,85 / 0,30`, RAM 3,2 von 15 GiB, Root-Platte 40 von 197 GiB (21 %). Keine fehlgeschlagenen Units.
- SSH, Docker sowie die Gateways `gandalf`, `konfuzius` und `turyia` laufen. `unattended-upgrades` ist aktiv und aktiviert.
- Ein Node.js-Update ist offen; kein Neustart ist erforderlich. Im einsehbaren Wochenjournal gab es keine Warnungen oder Fehler.
- Öffentlich lauschen unter anderem SSH 22, OpenClaw-/Proxy-Ports 29941 und 29951 sowie TCP 11435. Eine lokale Firewallverwaltung war nicht feststellbar.
- OpenClaw-Audit: 0 kritisch, 5 Warnungen. Wesentlich sind gemeinsame Telegram-/Nextcloud-DM-Sitzungen, möglicher Mehrbenutzerbetrieb ohne vollständige Isolation und das bekannte falsche Gateway-Prüfziel `127.0.0.1:18789` statt des laufenden Ports 19941.
- S3 bleibt wegen der dokumentierten Root-Kompromittierung vom 05.09. nicht vertrauenswürdig; unauffällige Last und Logs heben diesen Befund nicht auf.

### S4 – 167.235.129.145

- Aktuell keine Antwort auf ICMP sowie TCP 22, 80 und 443. Das beweist keine Abschaltung, weil Filterung möglich ist; von S3 aus ist der Host jedoch nicht als erreichbar bestätigt.
- Es besteht kein Read-only-Zugang. Last, RAM, Platte, Dienste, Updates, Logs und innere Sicherheitslage sind daher **nicht geprüft**.

## Vermutung

- S4 kann ausgefallen sein oder sämtlichen Verkehr von S3 filtern; ohne Providerkonsole oder Read-only-Zugang ist keine Unterscheidung möglich.
- Die öffentlichen Listener auf S1 und S3 können durch vorgeschaltete Providerregeln begrenzt sein. Das ist ohne lesbare Firewallregeln nicht belegt.

## Rat

1. S1 im freigegebenen Wartungsfenster patchen und neu starten; danach `lightdm` sowie SMB, VNC und öffentliche OpenClaw-/Proxy-Ports prüfen.
2. S4 über Providerkonsole bzw. unabhängigen Zugang prüfen; danach für S2 und S4 Read-only-Zugriff einrichten.
3. S3 weiterhin neu aufsetzen und Geheimnisse von einem sauberen System rotieren; bis dahin keine neuen Secrets hinterlegen. Die DM-Sitzungen anschließend pro Gegenstelle isolieren.

## KI-Lage der Woche, 20.–26.09.2026

- **OpenAI, 22.09.:** GPT-6 Sol und Luna wurden als günstigere GPT-6-Varianten veröffentlicht; laut Hersteller halbieren sie die API-Preise gegenüber GPT-5.6 Sol/Luna.
- **Anthropic, 22.09.:** Claude Opus 5.5 erschien als neues Spitzenmodell. Anthropic nennt 4/20 US-Dollar je Million Input-/Output-Tokens und rund 40 % geringere typische Laufkosten gegenüber Opus 5.
- **Open Weight, 22.09.:** Xiaomi veröffentlichte MiMo-V2.6-Pro-RL und Flash-RL. Das multimodale MoE-Modell besitzt 1,02 Billionen Gesamtparameter, 42 Milliarden aktive Parameter und ein Kontextfenster von einer Million Tokens.
- **Regulatorik, 21.09.:** New York kündigte weitere Schritte zur Regulierung großer KI-Entwickler an. Die Woche war damit sowohl durch neue Frontier-/Open-Weight-Modelle als auch verschärfte einzelstaatliche Aufsicht geprägt.

Quellen, frisch abgerufen am 26.09.2026: [OpenAI – GPT-6 Sol und Luna](https://openai.com/index/introducing-gpt-6-sol-and-luna/), [Anthropic – Claude Opus 5.5](https://www.anthropic.com/claude-opus-5-5), [Hugging Face – Xiaomi MiMo-V2.6-Pro-RL](https://huggingface.co/XiaomiMiMo/MiMo-V2.6-Pro-RL), [Google News / New York](https://news.google.com/search?q=New%20York%20AI%20Safety%20Governor%20Hochul%20September%2021%202026). Die bevorzugte Perplexity-Suche scheiterte am bereits protokollierten fehlenden API-Schlüssel; die drei Modellmeldungen wurden deshalb direkt an den Primärquellen verifiziert.
