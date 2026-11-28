# Wochenbericht VPS und KI-Lage – 28. November 2026

Prüfzeit: 28.11.2026, 06:01–06:04 UTC. S1 ausschließlich per SSH als `gandalf-ro`, S3 lokal und lesend. Für S2 und S4 besteht kein Read-only-Zugang; dort sind nur ICMP und ausgewählte TCP-Ports geprüft.

## Fakten – VPS

| VPS | Erreichbarkeit und Ressourcen | Dienste und Logs | Updates | Sicherheitslage |
|---|---|---|---|---|
| S1 `147.93.120.51` | ICMP 0 % Verlust, Ø 0,9 ms; SSH als `gandalf-ro`; Load 0,32/0,07/0,02; RAM 2,6/15 GiB; `/` 37/193 GB (19 %), Inodes 4 % | SSH, Docker, Tailscale, unattended-upgrades sowie Gateways Chantall/Cheko/user2 aktiv. `lightdm` fehlgeschlagen. Im sichtbaren Wochenjournal nur sechs PipeWire/JACK-Warnungen; vollständige fremde System-/Auth-Logs nicht lesbar. | 51 Pakete, davon 13 mit Security-Ursprung; Neustart erforderlich. | Extern TCP 22 und VNC 5919 offen. Lokal zusätzlich u. a. Samba 139/445 und Gateways gebunden, vom S3-Prüfpunkt gefiltert. Firewallregeln und OpenClaw-Audit nicht lesbar. |
| S2 `89.116.39.197` | ICMP 0 % Verlust, Ø 1,1 ms; TCP 22/80/443 offen | **Nicht prüfbar** | **Nicht prüfbar** | Kein Read-only-Zugang; innere System- und Schutzlage unbekannt. |
| S3 lokal `187.124.191.206` | Load 1,66/0,48/0,17; RAM 3,9/15 GiB; `/` 41/197 GB (22 %), Inodes 4 % | SSH, Docker, Tailscale, unattended-upgrades und Gandalf-Gateway aktiv. `c3pool_miner.service` seit 22.11. fehlgeschlagen; sichtbares Journal nur mit X/DBus-Meldungen zum Neustart. | 1 Paket (`docker-compose-plugin`), kein Security-Paket; kein Neustartmarker. | OpenClaw-Audit: 0 kritisch, 6 Warnungen. Wesentlich: gemeinsame DM-Hauptsitzung für Telegram/Nextcloud, Klartext-Secrets in der Konfiguration, unvollständig isoliertes Mehrnutzer-Modell, ungepinnte Codex-NPM-Quelle. Port 29941 und VNC 5910 binden öffentlich; Firewallstatus mangels Root-Recht nicht prüfbar. Der CLI-Check auf Port 18789 trifft eine veraltete/falsche Dienstkonfiguration, während der echte Gateway-Dienst auf 19941 aktiv ist. |
| S4 `167.235.129.145` | ICMP 0 % Verlust, Ø 4,5 ms; TCP 22 offen, 80/443 und weitere Stichproben gefiltert | **Nicht prüfbar** | **Nicht prüfbar** | Kein Read-only-Zugang. Der seit September ungeklärt geänderte SSH-Hostschlüssel wurde nicht akzeptiert; innere Lage unbekannt. |

## Vermutung

- S1: Die externe Filterung der lokal gebundenen Samba-/Gateway-Ports spricht für einen vorgeschalteten Paketfilter; dessen Regelbestand ist nicht belegt.
- S3: Der Miner-Ausfall ist sehr wahrscheinlich ein verbliebenes Artefakt der bekannten Kompromittierung vom September, nicht ein aktiver Miner; belegt ist nur `203/EXEC` seit dem letzten Neustart.
- S2/S4: Aus Erreichbarkeit und offenen Ports lässt sich keine Aussage über Last, Plattenplatz, Dienstgesundheit, Updates oder Logs ableiten.

## Rat

1. S1 zeitnah regulär aktualisieren und neu starten; danach Gateways prüfen. VNC 5919 nur freigeben, wenn öffentlich wirklich benötigt.
2. S3 zuerst DM-Sitzungen pro Absender trennen und Secrets in SecretRefs überführen; anschließend öffentliche Bindungen 29941/5910 und die veraltete Gateway-CLI-Konfiguration prüfen. Die Miner-Unit nach Freigabe endgültig entfernen.
3. Für S2 und S4 einen beschränkten `gandalf-ro`-Zugang einrichten; bis dahin bleibt der Wochencheck dort äußerlich.

## KI-Lage der Woche – Fakten

- 24.11.: Axios berichtet unter Berufung auf Beschäftigte bei OpenAI und Anthropic, dass unveröffentlichte Frontier-Modelle intern als möglicherweise nicht sicher veröffentlichbar gelten. Das ist ein Bericht über interne Einschätzungen, kein bestätigter Modellrelease. [Google-News-Index/Axios](https://news.google.com/search?q=Axios+Anthropic+OpenAI+employees+unreleased+models+unsafe+November+24+2026&hl=en-US&gl=US&ceid=US%3Aen)
- 26.11.: Reuters berichtet über geplante verschärfte US-Chipkontrollen und Maßnahmen gegen Modelldestillation, die besonders chinesische Modellentwicklung treffen könnten. [Google-News-Index/Reuters](https://news.google.com/search?q=Reuters+US+chip+curbs+distillation+crackdown+Chinese+AI+November+26+2026&hl=en-US&gl=US&ceid=US%3Aen)
- 23.11.: Google DeepMind veröffentlichte Forschung zu Agententeams plus formaler Verifikation, die schnellere Quantenalgorithmen fanden; dies ist ein Forschungsergebnis, kein neues Basismodell. [Google-News-Index/DeepMind](https://news.google.com/search?q=Google+DeepMind+Finding+faster+quantum+algorithms+agents+formal+verification+November+23+2026&hl=en-US&gl=US&ceid=US%3Aen)
- In den frisch geprüften Wochenquellen fand sich **kein belastbar bestätigter neuer Frontier- oder großer Open-Weight-Release**. Perplexity war wegen des bekannten fehlenden API-Schlüssels nicht nutzbar; Recherche-Fallback war Google News mit Abgleich nach Herausgeber und Datum.

## KI-Lage – Vermutung und Rat

- **Vermutung:** Sicherheitsbewertungen und Exportkontrollen werden kurzfristig wichtiger als reine Benchmark-Sprünge; beide Themen können Modellverfügbarkeit und Anbieterwahl beeinflussen.
- **Rat:** Keine Umstellung der Agentenmodelle allein aufgrund dieser Meldungen. Releases und Richtlinien weiterhin anhand offizieller Modellkarten beziehungsweise Primärdokumente prüfen.
