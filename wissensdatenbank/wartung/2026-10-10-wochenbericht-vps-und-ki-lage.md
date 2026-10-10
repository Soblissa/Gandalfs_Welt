# Wochenbericht VPS und KI-Lage – 10.10.2026, 06:01–06:04 UTC

## Fakten

### S1 – 147.93.120.51

- Per SSH als `gandalf-ro` erreichbar; Laufzeit 13 Tage 23 Stunden. Last `0,16 / 0,04 / 0,01`, RAM 2,8 von 15 GiB, Root-Platte 35 von 193 GiB (19 %).
- SSH, Docker und die OpenClaw-Gateways `chantall`, `cheko` und `user2` laufen. `lightdm.service` ist fehlgeschlagen.
- 29 Updates sind installierbar, 18 weitere werden zurückgehalten bzw. gestaffelt angeboten. Ein Neustart ist wegen Kernel-/Basisupdates erforderlich.
- Im für `gandalf-ro` sichtbaren Wochenjournal erscheinen nur drei PipeWire/JACK-Warnungen; fremde Journale und Firewallregeln darf das Konto nicht lesen.
- Öffentlich gebunden sind unter anderem SSH 22, Web 80/443, SMB 139/445, VNC 5919 sowie OpenClaw-/Proxy-Ports 19870, 19953, 29840 und 29953. Die tatsächliche äußere Erreichbarkeit hinter Providerregeln ist nicht abschließend geprüft.

### S2 – 89.116.39.197

- ICMP antwortet und TCP 22 ist offen.
- Kein Read-only-Zugang: Last, RAM, Platte, Dienste, Updates, Logs und innere Sicherheitslage sind **nicht geprüft**.

### S3 – lokal, 187.124.191.206

- Erreichbar; Laufzeit 6 Tage. Last `0,76 / 0,29 / 0,09`, RAM 2,8 von 15 GiB, Root-Platte 40 von 197 GiB (21 %).
- SSH, Docker sowie die Gateways `gandalf`, `konfuzius` und `turyia` laufen. Die generische Unit `openclaw-gateway.service` ist nicht maßgeblich und inaktiv.
- Zwei Updates sind offen; kein Neustart angefordert. Im einsehbaren Wochenjournal stehen keine Warnungen.
- `c3pool_miner.service` ist weiterhin aktiviert und fehlgeschlagen; die Binärdatei `ssshd` und `myservices.service` sind nicht mehr vorhanden. Wegen der Root-Kompromittierung vom 05.09. bleibt S3 dennoch **nicht vertrauenswürdig**.
- Öffentlich gebunden sind unter anderem SSH 22, OpenClaw-/Proxy-Ports 29941 und 29951 sowie TCP 11435. Firewallregeln waren ohne erhöhte Rechte nicht lesbar.
- OpenClaw-Audit: 0 kritisch, 5 Warnungen. Wesentlich: gemeinsame Telegram-/Nextcloud-DM-Sitzungen, Mehrbenutzerbetrieb ohne vollständige Isolation und ein falsches Gateway-Prüfziel (`127.0.0.1:18789`).

### S4 – 167.235.129.145

- ICMP antwortet und TCP 22 ist offen.
- Kein Read-only-Zugang: Last, RAM, Platte, Dienste, Updates, Logs und innere Sicherheitslage sind **nicht geprüft**. Der am 19.09. festgestellte geänderte SSH-Hostschlüssel ist weiterhin nicht unabhängig verifiziert.

## Vermutung

- Provider-Firewalls könnten öffentlich gebundene Listener auf S1/S3 begrenzen; belegt ist das nicht.
- Offenes TCP 22 auf S2/S4 beweist weder Hostidentität noch Systemgesundheit.

## Rat

1. S3 sauber neu installieren und Secrets von einem sauberen System rotieren; bis dahin keine neuen Geheimnisse hinterlegen.
2. S1 im freigegebenen Wartungsfenster aktualisieren und neu starten; danach `lightdm`, SMB, VNC und die öffentlichen Proxy-Ports prüfen.
3. S4-Hostschlüssel unabhängig abgleichen und für S2/S4 Read-only-Zugänge einrichten.

## KI-Lage der Woche, 03.–10.10.2026

- **OpenAI, 07.10.:** GPT-6 und eine neue „Intelligent UI“ wurden angekündigt; zusätzlich veröffentlichte OpenAI am 06.10. Ergebnisse zu KI-gestützter mathematischer Forschung.
- **Anthropic, 07.10.:** Anthropic stellte laut eigener News-Seite sein bislang schnellstes, günstigstes und leistungsfähigstes kleines Modell vor; Berichte benennen es als Claude Haiku 5.5 mit 1 Mio. Kontext.
- **Open Weight, 05.–06.10.:** Reflection veröffentlichte Beam mit 501 Mrd. Parametern; Mistral stellte Mistral Large 4 vor. Beides sind bedeutende offene Modellveröffentlichungen dieser Woche.
- **Sicherheitslage, 09.10.:** Reuters berichtet, dass chinesische Entwickler nur für 3,6 % untersuchter Modellveröffentlichungen Sicherheitstests publizierten; das ist ein Transparenzbefund, kein Beweis fehlender interner Tests.

Quellen, frisch abgerufen am 10.10.2026: [OpenAI News](https://openai.com/news/), [Anthropic News](https://www.anthropic.com/news), [Mistral News](https://mistral.ai/news/), [Reflection](https://reflection.ai/), [Google-News-RSS](https://news.google.com/rss/search?q=AI+model+release+when%3A7d&hl=en-US&gl=US&ceid=US%3Aen). Die bevorzugte Perplexity-Suche scheiterte am bekannten fehlenden API-Schlüssel; direkte Primärseiten und Google-News-RSS dienten als Ausweichquellen.
