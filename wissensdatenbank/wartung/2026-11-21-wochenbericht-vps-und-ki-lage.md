# Wochenbericht VPS und KI-Lage – 21. November 2026

Prüfzeit: 21.11.2026, 06:02–06:05 UTC. Alle Systemprüfungen waren lesend.

## Fakten

| VPS | Erreichbarkeit | Last / Platte | Dienste und Logs | Updates | Sicherheitslage |
|---|---|---|---|---|---|
| S1 `147.93.120.51` | ICMP 0 % Verlust, Ø 0,8 ms; SSH als `gandalf-ro` erfolgreich | Load 0,32 / 0,09 / 0,02; RAM 2,7/15 GiB; `/` 36/193 GB (19 %) | SSH, Docker, Tailscale und Gateways für Chantall, Cheko und user2 aktiv. `lightdm` seit 17.11. fehlgeschlagen. Im sichtbaren 7-Tage-Journal nur eine PipeWire/JACK-Warnung; vollständige System- und Auth-Logs fehlen dem Read-only-Nutzer. | 38 Pakete, darunter Kernel-, systemd-, WebKit- und Mesa-Aktualisierungen; derzeit kein Neustart angefordert. `unattended-upgrades` aktiv. | Vom S3-Prüfpunkt waren TCP 22 und VNC 5919 offen; die ebenfalls lokal gebundenen geprüften SMB-/Gateway-Ports waren extern gefiltert. Firewallregeln und OpenClaw-Audit sind für `gandalf-ro` nicht einsehbar. |
| S2 `89.116.39.197` | ICMP 0 % Verlust, Ø 0,8 ms; TCP 22, 80 und 443 offen | **Nicht prüfbar** | **Nicht prüfbar** | **Nicht prüfbar** | Kein Read-only-Zugang. Belegt sind nur Netz-Erreichbarkeit und die drei offenen Ports; Systemgesundheit und Hostschutz bleiben unbekannt. |
| S3 lokal `187.124.191.206` | Lokal erreichbar; Laufzeit 11 Tage 19 Stunden | Load 0,72 / 0,31 / 0,11; RAM 3,6/15 GiB; `/` 41/197 GB (22 %) | SSH, Docker, Tailscale und Gateways für Gandalf, Konfuzius und Turyia aktiv. Bekannter `c3pool_miner.service` weiterhin aktiviert/fehlgeschlagen (`203/EXEC`). Sichtbare Fehler der Woche sind fehlgeschlagene, nicht privilegierte `sudo`-Aufrufe; vollständiges Journal fehlt dem Nutzer. | 5 Pakete, davon drei Security-Updates (`libgd3`, `libgpgme11t64`, `libgpgmepp6t64`); Neustart erforderlich. `unattended-upgrades` aktiv. | OpenClaw-Audit: 0 kritisch, 6 Warnungen. Wesentlich: gemeinsame DM-Sitzungen, ungesandboxte Werkzeuge im Mehrnutzerkontext, ungepinnte Plugin-Spezifikation und fehlgeschlagene Gateway-Probe auf Port 18789. Öffentlich gebunden sind u. a. SSH/22, VNC/5910 sowie OpenClaw-/Modellports 11435, 29941 und 29951. Host-Firewall mangels sudo nicht verifiziert. |
| S4 `167.235.129.145` | ICMP 0 % Verlust, Ø 5,4 ms; TCP 22 offen, 80/443 gefiltert | **Nicht prüfbar** | **Nicht prüfbar** | **Nicht prüfbar** | Kein Read-only-Zugang. Der seit September ungeklärt geänderte SSH-Hostschlüssel wurde nicht akzeptiert; Systemgesundheit und Hostschutz bleiben unbekannt. |

## Vermutung

- S1: Der LightDM-Ausfall betrifft wahrscheinlich nur die grafische Anmeldung; die Agenten-Gateways laufen. Ursache und Auswirkung sind ohne vollständiges Journal nicht abschließend belegbar.
- S1: Die externe Filterung mehrerer lokal gebundener Ports spricht für eine vorgeschaltete Firewall. Ihre Beständigkeit und genaue Regelbasis sind mit `gandalf-ro` nicht prüfbar.
- S3: Der Miner-Dienst ist nicht aktiv, bleibt aber ein ungeklärter Altbestand. Die wieder öffentlich gebundene VNC-Sitzung vergrößert nach der früheren Kompromittierung die reale Angriffsfläche.

## Rat

1. S3 im freigegebenen Wartungsfenster zuerst aktualisieren und neu starten; danach Gateways prüfen. VNC/5910 und die öffentlichen Gateway-/Modellports auf Tailscale oder Loopback begrenzen, Firewall verifizieren, Miner-Altbestand nach Beweissicherung beseitigen und DM-Sitzungen isolieren.
2. S1 zeitnah aktualisieren, danach Kernelstand, Gateways und LightDM prüfen. VNC/5919 nur über Tailscale zugänglich machen.
3. Für S2 und S4 Read-only-Zugänge herstellen; bei S4 zuvor den SSH-Fingerabdruck unabhängig verifizieren. Bis dahin sind Last, Platte, Dienste, Updates, Logs und Host-Sicherheit unbekannt.

Änderungen auf S1–S3 bedürfen außerhalb der bestehenden Sonntagswartung Sarahs Kenntnisnahme oder Freigabe.

## KI-Lage der Woche

- **Frontier-Release (17.11.):** OpenAI veröffentlichte GPT-6.2 Astra für anspruchsvolle professionelle und wissenschaftliche Arbeit sowie GPT-6.2 Sol als günstigeres Alltagsmodell. OpenAI nennt für Astra API-Preise von 8/40 US-Dollar je Million Input-/Output-Token und stuft beide Modelle bei Cyberfähigkeiten als „Critical“ ein; Astra erreicht erstmals bei einem extern veröffentlichten OpenAI-Modell „High“ für KI-Selbstverbesserung. Quelle: [OpenAI](https://openai.com/index/introducing-gpt-6-2-astra-sol/)
- **Frontier-Sicherheit (18.11.):** OpenAI beschreibt nach einem internen Sicherheitsvorfall verschärfte Stufenprüfungen von Forschung bis Außeneinsatz: kein Live-Internet im Training, Sandboxes und VMs, kontinuierliches Monitoring sowie ein zentraler Stoppmechanismus. Die Angaben stammen vom Anbieter und sind keine unabhängige Prüfung. Quelle: [OpenAI](https://openai.com/index/managing-frontier-ai-risk/)
- **Marktverschiebung (18.–19.11.):** Anthropics Börsengang wurde von mehreren großen Medien als Rekordemission und Belastungsprobe für KI-Bewertungen berichtet. Da die offizielle Anthropic-Newsseite dazu keinen belastbaren Beitrag lieferte, wird dies hier nur als Marktbeobachtung, nicht als verifizierte Unternehmenskennzahl geführt. Quellenübersicht: [Google News](https://news.google.com/search?q=Anthropic%20after%3A2026-11-13%20before%3A2026-11-22&hl=en-US&gl=US&ceid=US%3Aen)

Die bevorzugte Perplexity-Websuche war wegen des fehlenden API-Schlüssels nicht verfügbar. Ersatzweise wurden am 21.11. die aktuellen offiziellen OpenAI-Seiten sowie frische Google-News-RSS-Ergebnisse geprüft.
