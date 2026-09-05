# Wochenbericht VPS und KI-Lage – 5. September 2026

Prüfzeit: 05.09.2026, 06:03–06:06 UTC. S1 wurde ausschließlich per SSH als `gandalf-ro` geprüft; S3 lokal. Für S2 und S4 besteht kein Read-Only-Zugang.

## Fakten

### S1 – 147.93.120.51

- Erreichbar: ICMP ohne Verlust, SSH-Port 22 offen; Ubuntu 24.04.4 LTS, Laufzeit 33 Tage.
- Last 0,08 / 0,04 / 0,01; RAM 2,6 von 15 GiB belegt; Platte 29 von 193 GiB (15 %).
- OpenClaw-Gateways `chantall`, `user1`, `user2`, Port-Proxy, Docker, SSH und automatische Updates laufen.
- 22 Pakete aktualisierbar, weitere 6 zurückgehalten; darunter Kernel 6.8.0-139, Docker und Python 3.12.
- `lightdm.service` ist seit 02.08. fehlgeschlagen. Die eingeschränkte Journal-Sicht zeigte keine kritischen Einträge der letzten sieben Tage; das ist keine Vollprüfung.
- Sicherheitslage: Öffentlich gebunden sind unter anderem SSH, HTTP/HTTPS, Samba 139/445, VNC 5918 und OpenClaw-nahe Ports 19870/19953. Firewall-Regeln waren für `gandalf-ro` nicht lesbar.

### S2 – 89.116.39.197

- ICMP antwortet ohne Verlust; TCP/22 ist offen.
- Last, Platte, Dienste, Updates, Logs und Sicherheitskonfiguration sind mangels Read-Only-Zugang **nicht geprüft**.

### S3 – lokal, 187.124.191.206

- Debian 13.6, Laufzeit 6 Tage; Last 2,30 / 1,30 / 0,51 während dieses Berichtslaufs.
- RAM 4,6 von 15 GiB belegt, 11 GiB verfügbar; kein Swap. Platte 42 von 197 GiB (22 %).
- Fünf OpenClaw-Gateways, Docker, SSH und automatische Updates laufen; Gateways sind an Loopback gebunden.
- 3 Pakete aktualisierbar, darunter das Sicherheitsupdate Firefox ESR 140.15.
- Auffällige Logs: regelmäßige fremde/fehlerhafte SSH-Verbindungsversuche; ferner harmlose, aber wiederkehrende AF_VSOCK-Generatorfehler.
- **Hohes Risiko:** `c3pool_miner.service` ist als aktivierte Root-Unit mit `/root/c3pool/xmrig` (Monero-Miner) eingetragen. Sie scheitert seit 30.08. mit `203/EXEC`, läuft also derzeit nicht.
- **Hohes Risiko:** INPUT-Policy `ACCEPT`, keine wirksame Host-Firewall erkennbar. VNC 5910–5913 und Port 29950 lauschen auf allen Interfaces.
- OpenClaw-Audit: 0 kritisch, 4 Warnungen. Wesentlich sind gemeinsam genutzte Telegram-DM-Sitzung, fehlende Multiuser-Isolation und Klartext-Secrets in der Konfiguration. Die Gateway-Prüfung zielt irrtümlich auf Port 18789; tatsächlich läuft Gandalf auf Loopback-Port 19941.

### S4 – 167.235.129.145

- Kein ICMP-Antwortsignal und TCP/22 aus Sicht von S3 nicht erreichbar.
- Das beweist keinen Ausfall: Firewall/Provider können beides filtern. Mangels Read-Only-Zugang sind alle internen Kennzahlen **nicht geprüft**.

## Vermutungen

- S1-LightDM betrifft wahrscheinlich nur die grafische Anmeldung; die Agentendienste laufen unabhängig davon.
- S3s Miner-Unit kann ein bewusst angelegter Miner oder ein Überbleibsel sein; ohne Herkunftsnachweis ist sie wie eine mögliche Kompromittierung zu behandeln.
- S4 ist entweder offline oder filtert Zugriffe von S3.

## Rat

1. **S3 zuerst:** Herkunft der Miner-Unit und des Verzeichnisses forensisch klären; bis zur Freigabe keine Löschung. Danach öffentliche VNC-/29950-Exposition und Firewall restriktiv ordnen.
2. S1 im freigegebenen Wartungsfenster aktualisieren und neu starten; vorher klären, ob Samba/VNC/19870/19953 öffentlich benötigt werden.
3. Read-Only-Zugänge für S2 und S4 herstellen; S4 zusätzlich über Provider-Konsole prüfen.
4. OpenClaw auf S3: DM-Sitzungen pro Absender trennen und Secrets auf SecretRefs migrieren.

## KI-Lage der Woche

- **Frontier-Ereignis, 03.09.:** OpenAI veröffentlichte GPT-6 Astra zunächst eingeschränkt und kündigte die Ausweitung auf ChatGPT und APIs an. OpenAI stuft erstmals ein breit bereitgestelltes eigenes Modell bei Cyberfähigkeiten als **Critical** ein; zugleich meldet das Unternehmen stärkere Schutzmaßnahmen, aber geringere Überwachbarkeit der internen Gedankengänge. Quellen: [Release](https://openai.com/index/gpt-6-astra/), [Safety Overview](https://openai.com/index/safety-overview-gpt-6-astra/).
- **Gesundheitsdaten, 01.09.:** OpenAI führte für Organisationen eine Epic-EHR-Anbindung und ein Plugin für neun öffentliche Gesundheitsdatenquellen ein. Das ist praktisch bedeutsam, verlangt aber strikte Rechte-, Audit- und Datenschutzkontrollen. Quelle: [OpenAI](https://openai.com/index/chatgpt-connects-health-records-and-healthcare-sources/).
- **Lokale KI, 01.09.:** Hugging Face stellte mehr als 200 WebGPU-Kernels für lokale Browser-Inferenz vor; dies stärkt clientseitige KI ohne Server-Roundtrip. Quelle: [Hugging Face](https://huggingface.co/blog/webgpu-kernels).

Hinweis zur Quellenlage: Die bevorzugte Perplexity-`web_search` war wegen fehlenden API-Schlüssels nicht verfügbar. Die Angaben wurden deshalb am 05.09. direkt aus den verlinkten Primärquellen abgerufen.
