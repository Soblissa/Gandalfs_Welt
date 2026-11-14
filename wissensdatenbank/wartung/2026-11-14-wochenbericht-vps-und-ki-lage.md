# Wochenbericht VPS und KI-Lage – 14. November 2026

Prüfzeit: 14.11.2026, 06:01–06:08 UTC. Alle Prüfungen waren lesend.

## Fakten

| VPS | Erreichbarkeit | Last / Platte | Dienste und Logs | Updates | Sicherheitslage |
|---|---|---|---|---|---|
| S1 `147.93.120.51` | ICMP 0 % Verlust, Ø 1,0 ms; SSH als `gandalf-ro` erfolgreich | Load 0,04 / 0,03 / 0,00; `/` 34/193 GB (18 %) | SSH, Tailscale und Gateways für Chantall, Cheko und user2 aktiv. `lightdm` seit 17.10. fehlgeschlagen. Drei harmlose PipeWire/JACK-Warnungen, keine Fehler im 7-Tage-Journal. | 9 Pakete, laut APT keine Security-Pakete; Neustart wegen Kernel/libc/gnome-shell erforderlich. `unattended-upgrades` aktiv. | Öffentliche Listener u. a. 22, 80, 139/445, 5919, 19870, 19953, 29840, 29953. Firewallstatus ist für `gandalf-ro` nicht sichtbar. Keine fehlgeschlagenen SSH-Anmeldungen im sichtbaren Journal. |
| S2 `89.116.39.197` | ICMP 0 % Verlust, Ø 0,9 ms; TCP/22, 80 und 443 offen | **Nicht prüfbar** | **Nicht prüfbar** | **Nicht prüfbar** | Kein Read-only-Zugang; aus Netzsicht nur Erreichbarkeit sowie offenes SSH/HTTP/HTTPS belegt. |
| S3 lokal `187.124.191.206` | Lokal erreichbar | Load 0,65 / 0,38 / 0,14; `/` 40/197 GB (22 %) | SSH, Tailscale und Gateways für Gandalf, Konfuzius und Turyia aktiv. Acht Journalfehler: sieben erwartbare fehlgeschlagene `sudo`-Aufrufe vom 09.11., einmal Desktop-Portal-Konfiguration. Bekannter `c3pool_miner.service` bleibt aktiviert/fehlgeschlagen; Binärdatei fehlt. | 4 Pakete (Docker-Plugins, Node.js, Tailscale), keine als Security markiert; kein Neustart erforderlich; `unattended-upgrades` aktiv. | Nach bestätigter Root-Kompromittierung vom 05.09. weiterhin **nicht vertrauenswürdig**. OpenClaw-Audit: 0 kritisch, 6 Warnungen. Wesentlich: gemeinsame DM-Sitzungen, ungesandboxte Werkzeuge im Mehrnutzerkontext, ungepinnte Plugins und Gateway-Probe auf falschem CLI-Port fehlgeschlagen. System-Gateway läuft. Öffentlich gebunden: 22, 5910, 11435, 29941, 29951. `ufw`/`nft` fehlen im Nutzerpfad; Host-Firewall daher nicht verifiziert. |
| S4 `167.235.129.145` | ICMP 0 % Verlust, Ø 4,4 ms; TCP/22 offen | **Nicht prüfbar** | **Nicht prüfbar** | **Nicht prüfbar** | Kein Read-only-Zugang; aus Netzsicht nur Erreichbarkeit und offenes SSH belegt. |

## Vermutung

- S1: Der alte LightDM-Ausfall dürfte für die laufenden Agenten ohne Wirkung sein; ohne privilegiertes Journal ist die Ursache nicht belegbar.
- S3: Der Miner-Dienst ist nach heutigem Stand kein laufender Miner, sondern ein ungeklärter Altbestand. Dies ist keine Entwarnung: Eine frühere Root-Kompromittierung lässt sich nur durch sauberen Neuaufbau zuverlässig beseitigen. Die öffentliche Bindung von VNC und Gateways bleibt eine reale Angriffsfläche.

## Rat

1. S1 im freigegebenen Wartungsfenster aktualisieren und neu starten; danach Gateways und LightDM prüfen. Öffentliche SMB-, VNC- und Gateway-Ports auf Notwendigkeit und Firewallbegrenzung prüfen.
2. S3 priorisiert sauber neu aufsetzen; bis dahin als nicht vertrauenswürdig behandeln. Ergänzend Port 5910 und Gateways auf Loopback/Tailscale begrenzen, Default-Deny-Firewall verifizieren, `c3pool_miner.service` nach Beweissicherung entfernen und OpenClaw-DM-Sitzungen isolieren. Dies sind Änderungen und bedürfen bei S1–S3 Sarahs Kenntnisnahme/Freigabe.
3. Für S2 und S4 Read-only-Zugänge bereitstellen; bis dahin sind Last, Platte, Dienste, Updates, Logs und Host-Sicherheit unbekannt.

## KI-Lage der Woche

- **Frontier-Release (09.11.):** Anthropic veröffentlichte Claude Fable 5.2 und Mythos 5.2 für besonders anspruchsvolle technische Aufgaben. Anthropic nennt Verbesserungen bei Coding, Reasoning und Vision, bis zu 30 % schnellere Ausgabe und Preise ab 8/40 US-Dollar je Million Input-/Output-Token. Quelle: [Anthropic](https://www.anthropic.com/claude-fable-and-mythos-5-2)
- **Agentischer Handel (13.11.):** OpenAI stellte ChatGPT Wallet vor: Agenten in ChatGPT Work, Codex und dots sollen Käufe mit ausdrücklicher Nutzerfreigabe und bestehenden Kartenschutzmechanismen abschließen können. Quelle: [OpenAI](https://openai.com/index/introducing-chatgpt-wallet)
- **Sicherheitsbetrieb (09.11.):** OpenAI beschrieb „Control Room“, ein zentrales System zum Erfassen und schnellen Stoppen von Modell-Workloads in der Forschungsinfrastruktur. Quelle: [OpenAI](https://openai.com/index/control-room)
- **Produktintegration (10.11.):** Google und Adobe kündigten die engere Integration von Adobe-Werkzeugen und Adobe AI in Drive/Gemini an. Quelle: [Google](https://blog.google/company-news/inside-google/company-announcements/adobe-google-partnership-integration/)

Die bevorzugte Perplexity-Websuche war wegen eines fehlenden API-Schlüssels nicht verfügbar. Die Lage wurde deshalb direkt aus den frischen offiziellen Newsseiten/RSS-Feeds von Anthropic, OpenAI und Google geprüft.
