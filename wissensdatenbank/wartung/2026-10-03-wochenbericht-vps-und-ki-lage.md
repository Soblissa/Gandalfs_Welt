# Wochenbericht VPS und KI-Lage – 03.10.2026, 06:01–06:03 UTC

## Fakten

### S1 – 147.93.120.51

- Per SSH als `gandalf-ro` erreichbar; Laufzeit 6 Tage 23 Stunden. Last `0,22 / 0,07 / 0,02`, RAM 2,7 von 15 GiB, Root-Platte 35 von 193 GiB (19 %).
- SSH, Docker sowie die OpenClaw-Gateways `chantall`, `cheko` und `user2` laufen. `lightdm.service` ist fehlgeschlagen.
- 16 Updates sind unmittelbar installierbar, 15 weitere werden zurückgehalten bzw. gestaffelt angeboten; kein Neustart ist derzeit angefordert.
- Im einsehbaren Wochenjournal erscheinen nur wiederholte PipeWire/JACK-DBus-Warnungen. Die Journal- und Firewall-Sicht des Read-only-Kontos bleibt eingeschränkt.
- Öffentlich lauschen unter anderem SSH 22, Web 80/443, SMB 139/445, VNC 5919 sowie OpenClaw-/Proxy-Ports 19870, 19953, 29840 und 29953. Ohne lesbare Firewallregeln ist die äußere Erreichbarkeit nicht abschließend bewertbar.

### S2 – 89.116.39.197

- TCP 22 ist von S3 aus erreichbar.
- Es besteht derzeit kein Read-only-Zugang. Last, RAM, Platte, Dienste, Updates, Logs und innere Sicherheitslage sind daher **nicht geprüft**.

### S3 – lokal, 187.124.191.206

- Erreichbar; Laufzeit 26 Tage. Last `0,49 / 0,15 / 0,05`, RAM 3,3 von 15 GiB, Root-Platte 40 von 197 GiB (21 %). Keine fehlgeschlagenen Units.
- SSH, Docker sowie die Gateways `gandalf`, `konfuzius` und `turyia` laufen.
- Ein Update ist offen; ein Neustart ist erforderlich. Das für `gandalf` einsehbare Wochenjournal enthält keine Warnungen, ist jedoch wegen fehlender Journalgruppen unvollständig.
- Öffentlich lauschen unter anderem SSH 22, OpenClaw-/Proxy-Ports 29941, 29942 und 29951 sowie TCP 11435. `nft` ist nicht installiert; eine wirksame lokale Host-Firewall war daher nicht belegbar.
- OpenClaw-Audit: 0 kritisch, 5 Warnungen. Wesentlich sind gemeinsame Telegram-/Nextcloud-DM-Sitzungen, möglicher Mehrbenutzerbetrieb ohne vollständige Isolation und das falsche Gateway-Prüfziel `127.0.0.1:18789` statt des laufenden Ports 19941.
- S3 bleibt wegen der dokumentierten Root-Kompromittierung vom 05.09. **nicht vertrauenswürdig**. Unauffällige Ressourcen und Dienste heben diesen Befund nicht auf.

### S4 – 167.235.129.145

- TCP 22 ist von S3 aus erreichbar.
- Es besteht derzeit kein Read-only-Zugang. Last, RAM, Platte, Dienste, Updates, Logs und innere Sicherheitslage sind daher **nicht geprüft**. Der am 19.09. festgestellte geänderte SSH-Hostschlüssel ist weiterhin nicht unabhängig verifiziert.

## Vermutung

- Die öffentlich gebundenen Listener auf S1 und S3 können durch Providerregeln begrenzt sein; belegt ist das nicht.
- Die Erreichbarkeit von TCP 22 auf S2 und S4 beweist weder die Identität noch einen gesunden Systemzustand.

## Rat

1. S3 sauber neu installieren und alle dort vorhandenen Geheimnisse von einem sauberen System rotieren; bis dahin keine neuen Secrets hinterlegen und einen Neustart nur kontrolliert durchführen.
2. S1 im bestehenden Wartungsfenster patchen; anschließend `lightdm`, SMB, VNC und die öffentlich gebundenen OpenClaw-/Proxy-Ports prüfen.
3. Den S4-Hostschlüssel unabhängig abgleichen und für S2/S4 einen Read-only-Zugang einrichten.

## KI-Lage der Woche, 27.09.–03.10.2026

- **OpenAI, 29.09.:** GPT-6.1 Sol wurde für agentische Programmierung, Computerbedienung und Wissensarbeit veröffentlicht. Der Hersteller nennt 2/10 US-Dollar je Million Input-/Output-Tokens und deutlich geringere Kosten als GPT-6 Astra.
- **OpenAI, 30.09.:** OpenAI meldete eine koordinierte Kampagne zur Extraktion geschützter Reasoning-Inhalte: über 15.000 Konten im untersuchten Cluster; ein Kerncluster wurde Personen mit Verbindung zu Moonshot AI zugeschrieben. Laut OpenAI wurden weder Datenbanken noch gespeicherte Nutzergespräche direkt kompromittiert.
- **Frontier-Sicherheit, 28.09.:** OpenAI fordert strukturierte, evidenzbasierte Sicherheitsnachweise vor weiteren Frontier-RL-Trainingsläufen, einschließlich Containment, Monitoring, Vetorechten und automatischem Pausieren.

Quellen, frisch abgerufen am 03.10.2026: [OpenAI – GPT-6.1 Sol](https://openai.com/index/introducing-gpt-6-1-sol/), [OpenAI – Distillation Campaign](https://openai.com/index/disrupting-a-coordinated-model-distillation-campaign/), [OpenAI – Safety Cases](https://openai.com/index/towards-safety-cases-for-frontier-ai-training/). Die bevorzugte Perplexity-Suche scheiterte am bekannten fehlenden API-Schlüssel; die Angaben wurden deshalb direkt an Primärquellen geprüft.
