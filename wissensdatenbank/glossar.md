# Glossar

Sammelband der Erklaerungen fuer Sarah. Ein Begriff pro Abschnitt,
alphabetisch sortiert. Jeder Eintrag verbindet eine Analogie mit dem
technischen Kern - also nicht nur "wie ein Tuersteher", sondern auch
was der Tuersteher technisch wirklich ist.

Neue Begriffe werden alphabetisch einsortiert. Suche mit der Textsuche
deines Browsers (Strg-F / Cmd-F) oder ueber die GitHub-Suchleiste.

---

## Inhaltsverzeichnis

- [Agent](#agent)
- [Botrepo](#botrepo)
- [Gateway](#gateway)
- [Gateway-Port](#gateway-port)
- [Open Weight](#open-weight)
- [Server / VPS](#server--vps)
- [Vault-Struktur](#vault-struktur)
- [VNC-Units](#vnc-units)

---

## Agent

### In einem Satz

Ein Agent ist ein dauerhaft laufendes KI-System mit eigenem
Arbeitsverzeichnis, eigener Konfiguration und eigenem Kommunikationskanal
- vergleichbar mit einer festen Angestellten, die immer im gleichen
Buero sitzt, denselben Namen traegt und mit der Zeit ihr eigenes
Aktenwissen und ihren eigenen Stil aufbaut.

### Der technische Kern

Ein Agent bei Automagia besteht aus vier klar getrennten Bausteinen:

1. **Workspace** - ein Verzeichnis auf einem Server (z. B.
   `/home/chantall/.openclaw/workspace`). Dort liegen seine
   Konfigurationsdateien, Notizen und Aufgabenprotokolle. Das ist sein
   "Buero".
2. **Gateway** - ein Programm, das auf einem festen Netzwerk-Port
   horcht, Nachrichten (typisch Telegram) entgegennimmt und an den
   Agenten weiterreicht. Sein "Tuersteher".
3. **KI-Modell** - das eigentliche Sprachmodell, mit dem er antwortet
   (z. B. Claude Sonnet 4.6, GPT-5.5, Fable 5). Sein "Gehirn". Das
   Modell wird bei jeder Anfrage frisch ueber eine API angesprochen.
4. **Persona-Dateien** - `SOUL.md`, `IDENTITY.md`, `AGENTS.md`, `USER.md`,
   `MEMORY.md`. Sie legen fest, wer der Agent ist, wie er spricht,
   fuer wen er arbeitet und was er sich merken soll.

Der Agent ist also nicht ein einzelnes Programm, sondern ein
Zusammenspiel aus Prozess, Konfiguration und Modell-API. Erst diese
vier Sachen zusammen machen aus einem Aufruf gegen ein KI-Modell einen
"Agenten", der ansprechbar ist und ueber die Zeit hinweg dieselbe
Identitaet behaelt.

### Unsere Agenten in Kurzform

- **Chantal** (S1) - Sarahs Sekretariat, Reise- und Terminmanagerin.
- **Chefkoch** (S1) - Sarahs Ansprechpartnerin fuer das Hessische
  Kultusministerium.
- **Franks Klaus** (S1) - fuer den Kunden Frank Kammerer, Alpin Invest.
- **Turiya** - integrative Begleiterin fuer Sarah; aktueller Standort
  in Klaerung.
- **Gandalf** (S3) - Systemverwalter, der diese Zeilen schreibt.
- **Rocky, Sloar** (S3) - technische Assistenz-Slots.
- **Dolly, Eve, Joker, Lilli** (S4) - Torstens Bots.
- **Egon** (S2) - Torstens Bot, Gateway-Prozess laeuft aktuell in einer
  Neustart-Schleife (Stand 24.07.2026).

---

## Botrepo

### In einem Satz

Das Botrepo ist ein zentrales Git-Repository auf GitHub
(`gruhflust/botrepo`), in dem alle Bauanleitungen, Vorlagen und
Werkzeuge fuer die Einrichtung von Agenten und Servern verwaltet
werden - vergleichbar mit der Werkstattwand einer Handwerkerfirma, an
der alle Bauplaene und Rezepte hängen.

### Der technische Kern

Ein "Repository" ist ein versionierter Ordner: jede Aenderung wird mit
Datum, Autor und Grund festgehalten, sodass jederzeit nachvollziehbar
ist, was wann warum geaendert wurde.

Im Botrepo liegen:

- **Ansible-Playbooks** - kleine Programme, die auf einen frischen
  Server geschickt werden und dort automatisch Nutzer anlegen, Dienste
  einrichten, Konfigurationsdateien schreiben.
- **Vorlagen (Templates)** pro Agent und Host, z. B. Chantals
  `SOUL.md.j2`, aus der beim Rollout die echte Datei erzeugt wird.
- **`agentctl`** - ein Python-Programm, das alle Ablaeufe unter
  einheitlichen Kommandos zusammenfasst (`agentctl deploy`, `agentctl
  vault backup`, `agentctl kvm apply` ...).
- **Inventar-Dateien** - Listen aller Hosts (S1-S4), welcher Agent wo
  laeuft, welche Ports belegt sind.

Wer einen Agenten bauen oder haerten will, aendert die passende Vorlage
im Botrepo und fuehrt anschliessend das passende `agentctl`-Kommando
aus. So laeuft jede Neueinrichtung nach demselben Muster ab.

### Wer arbeitet daran

- **Torsten** - baut und pflegt die technischen Bauanleitungen.
- **Gandalf** - ergaenzt inhaltlich, insbesondere in der Wartungs- und
  Sicherheitsschiene (Branch `failbantest`).
- **Sarah** - bekommt die Ergebnisse als fertige Agenten oder Berichte,
  arbeitet nicht direkt im Repo.

### Warum das wichtig ist

Ohne diese zentrale, versionierte Ablage muesste jede Neueinrichtung
handgeschrieben werden. Mit dem Botrepo laeuft jede Server- oder
Agenten-Aktion **reproduzierbar** ab - und laesst sich, falls sie
schiefgeht, rueckgaengig machen.

---

## Gateway

### In einem Satz

Ein Gateway ist ein kleiner Netzwerkdienst, der staendig auf einer
festen Adresse (dem Port) horcht, Telegram-Nachrichten entgegennimmt,
sie an den Agenten weitergibt und dessen Antworten zurueck an Telegram
sendet - technisch ein eigenstaendiger Prozess auf dem Server, im
Alltagsbild ein "digitaler Tuersteher".

### Der technische Kern

Bei uns laeuft pro Agent **eine eigene systemd-Unit** namens
`openclaw-gateway@<username>.service`. Was diese Unit tut:

1. **Startet einen Openclaw-Prozess** unter dem jeweiligen Linux-User
   (Chantall, Chefkoch, Gandalf ...).
2. **Oeffnet einen Netzwerk-Port** (die "Adresse", siehe eigener
   Eintrag *Gateway-Port*).
3. **Meldet sich bei Telegram an** mit dem passenden Bot-Token und
   pollt permanent auf neue Nachrichten (`getUpdates`).
4. **Reicht empfangene Nachrichten weiter** an das konfigurierte
   KI-Modell (Anthropic, OpenAI, ...).
5. **Sendet die Antwort zurueck** ueber die Telegram-API.

Weil jeder Agent seine eigene Gateway-Unit hat, sind sie voneinander
unabhaengig: Wenn Rockys Gateway haengt, laufen Gandalf, Sloar und
Turyia weiter.

### Was "aktiv" / "inaktiv" heisst

- **`active running`** - Prozess laeuft, Netzwerk-Port ist offen,
  Telegram-Polling arbeitet. Der Agent ist ansprechbar.
- **`activating auto-restart`** - der Prozess bricht wiederholt weg
  und wird von systemd automatisch neu gestartet. Der Agent ist nicht
  erreichbar. Ursache liegt in der Regel im Modell-Zugang, im
  Token oder im Netzwerk.
- **`inactive`** - der Dienst ist bewusst pausiert oder existiert
  nicht (mehr).

### Wer richtet Gateways ein

Torsten (technisch) auf Basis der Vorlagen aus dem Botrepo. Der Rollout
laeuft ueber `agentctl deploy`.

---

## Gateway-Port

### In einem Satz

Ein Gateway-Port ist eine feste Nummer zwischen 1 und 65535, unter der
das Gateway eines Agenten im Netzwerk erreichbar ist - technisch die
Adresse eines TCP-Sockets, im Alltagsbild die Schalter-Nummer des
Tuerstehers.

### Der technische Kern

Ein Netzwerk-Port ist die zweite Adresskomponente neben der IP.

- **IP** = welcher Rechner (z. B. `147.93.120.51`).
- **Port** = welcher Dienst auf diesem Rechner (z. B. `19953` fuer
  Chantals Gateway).

Zwei Programme koennen nicht denselben Port auf demselben Rechner
belegen, sonst gibt es eine Kollision. Deshalb hat jeder Agent seine
eigene, konfliktfreie Nummer, die zentral im Botrepo in der Datei
`gateway-ports.yml` gepflegt wird.

### Unsere Vergabe (Stand 24.07.2026)

- **Chantal** (S1): Port 19953
- **Chefkoch** (S1): Port 19840
- **Franks Klaus** (S1): Port 19870
- **Gandalf** (S3): Port 19941
- **Rocky** (S3): Port 18990
- **Sloar** (S3): Port 19950
- **Turyia-Slot** (S3): Port 19951
- **Egon** (S2): Port 19952

### Warum die Zahlen so aussehen

Bei uns liegen die meisten Gateway-Ports in der Region 18900-19999.
Diese Region ist "hoch genug", um nicht mit Standarddiensten wie SSH
(22), HTTP (80) oder HTTPS (443) zu kollidieren, und "regelbar genug",
dass sich Agenten einer Automagia-Firma innerhalb einer eigenen
Nummernserie bewegen.

### Warum das wichtig ist

Ohne stabile, kollisionsfreie Portvergabe koennten mehrere Agenten auf
demselben Server nicht nebeneinander leben. Der Port ist die einzige
technische Adresse, unter der Telegram (und Torsten) einen bestimmten
Agenten von aussen erreichen.

---

## Open Weight

### In einem Satz

Open Weight bedeutet, dass die trainierten Parameter eines KI-Modells
(die eigentlichen Zahlenwerte, aus denen sich sein Verhalten ergibt)
oeffentlich zum Download bereitstehen - im Alltagsbild vergleichbar mit
einem Rezeptbuch, das der Sternekoch offen herausgibt, statt es nur im
eigenen Restaurant zu benutzen.

### Der technische Kern

Ein KI-Modell besteht aus **Milliarden bis Billionen von
Zahlenwerten** (den "Gewichten" oder "Weights"). Diese Zahlen wurden
in einem sehr aufwendigen Trainingslauf ermittelt. Ohne sie funktioniert
das Modell nicht.

- **Closed-Weight** - der Anbieter behaelt diese Zahlen fuer sich.
  Zugriff nur ueber eine API. Beispiele: Claude, GPT-5, Gemini, Grok.
- **Open-Weight** - der Anbieter veroeffentlicht die Zahlen zum
  Download (typisch auf `huggingface.co`). Jeder mit passender Hardware
  kann das Modell selbst laufen lassen. Beispiele: Llama, Mistral,
  Qwen, DeepSeek, Kimi, Gemma, gpt-oss.

Wichtig: Open Weight heisst nicht automatisch "Open Source". Der
Trainingscode, die Trainingsdaten und die Trainingsprozeduren werden
in der Regel nicht mitgeliefert. Man bekommt das fertige Modell, aber
nicht "das Kochbuch, wie es entstanden ist".

### Was man dafuer braucht

- **Hardware**: kleine Modelle (bis 15 Milliarden Parameter) laufen auf
  einem starken Laptop mit dedizierter Grafikkarte. Mittelgrosse (30-70
  Milliarden) verlangen eine Workstation. Grosse (100 Milliarden+)
  brauchen Rechenzentren-Hardware.
- **Software-Stack**: Programme wie `ollama`, `vllm` oder `llama.cpp`
  laden die Modelldatei und stellen sie ueber eine lokale API bereit.

### Vor- und Nachteile

**Vorteile:**
- Kein Anbieter-Lock-in (der Anbieter kann den Zugang nicht mehr
  entziehen).
- Keine laufenden API-Kosten (nur Strom und Hardware).
- Datenhoheit (keine Anfrage verlaesst den eigenen Rechner).

**Nachteile:**
- Anschaffungs- und Betriebskosten der Hardware.
- Wartung, Updates und Absicherung liegen bei dir.
- Grosse offene Modelle sind zwar konkurrenzfaehig, aber selten
  wirklich besser als die geschlossenen Frontier-Modelle.

Details je Modell stehen in `modell-vergleich/uebersicht.md` in der
Spalte **Lokal**.

---

## Server / VPS

### In einem Satz

Ein VPS (Virtual Private Server) ist ein Anteil an einem grossen
Rechner in einem Rechenzentrum, den man mietet und wie einen eigenen
Rechner betreiben kann - im Alltagsbild eine Wohnung in einem grossen
Wohnblock, immer geheizt, immer online, mit fester Adresse.

### Der technische Kern

Auf einer physischen Hardware (mehrere CPUs, viel RAM, grosse
Festplatten) laeuft ein Virtualisierungssystem. Dieses teilt die
Hardware in viele **virtuelle Maschinen** auf. Jede virtuelle Maschine
verhaelt sich fuer den Mieter wie ein eigener Rechner mit:

- **eigenem Betriebssystem** (bei uns: Debian 13 auf S3, Ubuntu auf S1/S2)
- **eigener IP-Adresse** (z. B. `147.93.120.51`)
- **eigenen Nutzern, Diensten, Konfigurationsdateien**
- **einem festen Anteil an CPU, RAM und Festplatte**

Der Mieter (wir) merkt in der Regel nichts davon, dass er die Hardware
mit anderen teilt. Er kann Software installieren, Dienste starten,
Neustarts durchfuehren - alles wie auf einem eigenen Rechner.

### Kenngroessen unserer vier VPS

| Kuerzel | IP              | Betreiber | RAM  | Disk | Rolle |
|---------|-----------------|-----------|------|------|-------|
| **S1**  | 147.93.120.51   | Sarah     | 15 GiB | 193 GB | Chantal, Chefkoch, Franks Klaus |
| **S2**  | 89.116.39.197   | Sarah     | 7,8 GiB | 96 GB | derzeit umgeraeumt, Egon |
| **S3**  | 187.124.191.206 | Sarah     | 15 GiB | 197 GB | Gandalf, Rocky, Sloar, Turyia |
| **S4**  | 159.195.75.193  | Torsten   | 7,8 GiB | 251 GB | Dolly, Eve, Joker, Lilli |

### Warum VPS statt eigener Rechner

- **Verfuegbarkeit**: laeuft 24/7 in klimatisierten Rechenzentren mit
  Notstrom und redundanter Netzanbindung.
- **Skalierbarkeit**: RAM oder CPU laesst sich beim Anbieter meist per
  Klick vergroessern.
- **Kosten**: eine kleine VPS (7,8 GiB RAM) kostet 5-15 EUR/Monat -
  eigene Hardware und Strom waere teurer.

---

## Vault-Struktur

### In einem Satz

Der Vault ist ein zentraler, verschluesselter Speicher fuer
Zugangsdaten (API-Schluessel, Bot-Token, Passwoerter) - technisch eine
Datenbank, in der jeder Eintrag einen eindeutigen Pfad besitzt, im
Alltagsbild ein Bank-Tresorraum mit klar beschrifteten Schliessfaechern.

### Der technische Kern

Bei uns kommt als Vault-Werkzeug **`gopass`** zum Einsatz - ein
kommandozeilenbasierter Passwortmanager, dessen Eintraege in Git
versioniert und mit GPG verschluesselt liegen.

Jeder Eintrag hat einen **Pfad**, der sich hierarchisch aufbaut:

```
groups/<gruppe>/tokens/hosts/<ip>/users/<agent>/<zweck>
```

Konkretes Beispiel fuer Egons ElevenLabs-Zugang:

```
groups/HomeLab/tokens/hosts/89.116.39.197/users/egon/elevenlabs_api_key
```

Diese Pfad-Konvention wird von `agentctl` beim Deployment automatisch
verwendet: Wenn Torsten `agentctl deploy --host 89.116.39.197`
aufruft, holt das Playbook fuer Egon genau die Eintraege ab, die unter
seinem Pfad liegen.

### Warum diese Struktur

- **Rollentrennung**: jedes Playbook greift nur auf den Pfad zu, den
  es wirklich braucht - Chantal sieht keine Schluessel von Egon.
- **Rotation**: wenn ein Token ausgetauscht werden muss, wird nur ein
  Blatt in der Baumstruktur veraendert, nicht die halbe Konfiguration.
- **Nachvollziehbarkeit**: `agentctl vault backup` speichert
  regelmaessig einen verschluesselten Snapshot in
  `botrepo/vault-backups/`. So laesst sich der Zustand jederzeit
  rekonstruieren.
- **Kein Klartext im Repo**: die Klartext-Werte tauchen nie im
  Repository auf - nur die verschluesselten Bloecke.

### Wer verwaltet den Vault

Torsten betreibt und rotiert die Eintraege. Gandalf ergaenzt bei
Neueinrichtungen (z. B. beim `automage`-Rollout auf S1-S3), fasst
aber niemals fremde Zugangsdaten an.

---

## VNC-Units

### In einem Satz

VNC-Units sind systemd-Dienste, die auf einem Server einen virtuellen
Bildschirm-Server (`Xtigervnc`) starten, damit sich der grafische
Arbeitsplatz eines Agenten aus der Ferne betrachten und bedienen laesst
- im Alltagsbild ein Fernrohr, das auf den Monitor des Agenten
gerichtet ist.

### Der technische Kern

Ein VPS hat keinen echten Monitor. Um trotzdem grafische Programme
(Browser, Textprogramme, Buchhaltungssoftware) laufen zu lassen, wird
ein **virtueller Bildschirm** erzeugt:

- **TigerVNC** erzeugt in Software einen X11-Displayserver, dessen
  Ausgabe nicht auf einen physischen Monitor geht, sondern in einen
  Puffer.
- **VNC (Virtual Network Computing)** ist das Protokoll, ueber das ein
  entfernter Betrachter (der VNC-Client auf Torstens oder Sarahs
  Rechner) diesen Puffer live sehen und Maus-/Tastatureingaben senden
  kann.
- **systemd-Unit** sorgt dafuer, dass dieser TigerVNC-Server
  automatisch startet, nach einem Neustart wieder da ist und einen
  festen Port belegt.

### Aufbau je Slot

Fuer jeden Agenten mit grafischem Arbeitsplatz gibt es:

- eine **Display-Nummer** (z. B. `:10`, `:11`, `:12`, `:13`, `:18`)
- einen **RFB-Port** (die Netzwerk-Adresse, ueblich `5900 +
  Display-Nummer`)
- eine **systemd-Unit** `agentkvm-vnc-<user>.service`

Die Vorlage dafuer liegt im Botrepo unter `agentkvm.yml`.

### Aktuelle Belegung Server 3

| Agent | Display | Port | Unit |
|-------|---------|------|------|
| gandalf | :10 | 5910 | `agentkvm-vnc-gandalf.service` |
| rocky   | :11 | 5911 | `agentkvm-vnc-rocky.service`   |
| sloar   | :12 | 5912 | `agentkvm-vnc-sloar.service`   |
| turyia  | :13 | 5913 | `agentkvm-vnc-turyia.service`  |

Chantal auf S1 hat Display `:18` und Port `5918`.

### Zugriff

Ueblich per SSH-Tunnel:

```
ssh -L 5911:127.0.0.1:5911 root@187.124.191.206
```

Dann im VNC-Client `localhost:5911` mit dem Passwort aus
`~<agent>/.config/tigervnc/passwd`.

### Warum das wichtig ist

- Agenten koennen so **echte Anwendungen** benutzen, die einen
  grafischen Kontext brauchen.
- Sarah oder Torsten koennen ihnen **live ueber die Schulter schauen**
  und bei Bedarf eingreifen.
- Jeder Agent hat seinen eigenen Bildschirm - keine Kollision mit den
  anderen.
