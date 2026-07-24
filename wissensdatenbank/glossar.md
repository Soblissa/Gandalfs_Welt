# Glossar

Sammelband der Alltagserklaerungen fuer Sarah. Ein Begriff pro Abschnitt,
alphabetisch sortiert. Jeder Eintrag beginnt mit einer Ein-Satz-Definition,
gefolgt von einer Analogie und, wo hilfreich, einer knappen Auslegung.

Neue Begriffe werden alphabetisch einsortiert. Suche mit der Suchfunktion
deines GitHub-Browsers (`f` fuer das Repository-weite Suchfeld) oder mit
der Browser-Textsuche (Strg-F).

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

Ein Agent ist eine **feste Angestellte** in Sarahs und Torstens digitaler
Firma - eine, die immer im gleichen Buero sitzt, immer denselben Namen
traegt und mit der Zeit ihre eigene Aktenlage, ihre eigenen Aufgaben
und ihr eigenes Wesen entwickelt.

### Analogie

Ein Agent ist **nicht** dasselbe wie "einmal ChatGPT fragen".

- ChatGPT auf der Webseite ist wie ein Gespraech mit einem Zeitarbeiter:
  Fenster zu, Erinnerung weg.
- Ein Agent ist wie eine **Angestellte mit Buero, Ordnern, Schreibtisch
  und Kollegen**. Sie erinnert sich, sie hat einen festen Charakter,
  sie hat Zugriff auf ihre eigenen Werkzeuge, sie hat einen Chef.

### Woraus ein Agent besteht

Jeder unserer Agenten hat vier "Sachen":

1. Ein **Buero** (Verzeichnis auf dem Server, sein "Workspace").
2. Einen **Tuersteher mit Funkgeraet** (Gateway, der Nachrichten
   annimmt, weiterreicht und Antworten wieder hinaustraegt).
3. Ein **Gehirn** (das KI-Modell, mit dem er denkt - z. B. Claude
   Sonnet 4.6 oder GPT-5.5).
4. Eine **Seele** (eine Datei namens SOUL.md, in der steht, wer er ist,
   wie er spricht, worauf er achtet).

### Unsere Agenten in Kurzform

- **Chantal** (S1) - Sarahs Sekretaerin und Reisemanagerin.
- **Chefkoch** (S1) - Sarahs Ansprechpartnerin fuer das Hessische
  Kultusministerium.
- **Franks Klaus** (S1) - Fuer den Kunden Frank Kammerer, Alpin Invest.
- **Turiya** (frueher S2, aktueller Standort zu klaeren) - integrative
  Begleiterin fuer Sarah.
- **Gandalf** (S3) - der Systemverwalter, der diese Zeilen schreibt.
- **Rocky, Sloar** (S3) - technische Assistenz-Slots.
- **Dolly, Eve, Joker, Lilli** (S4) - Torstens Bots.
- **Egon** (S2) - Torstens Bot, derzeit hat sein Tuersteher
  Dauerprobleme beim Dienstantritt (Stand 24.07.2026).

---

## Botrepo

### In einem Satz

Das Botrepo ist die **zentrale Werkstatt-Ablage** von Automagia: eine
gemeinsame Kiste, in der alle Bauanleitungen fuer Agenten, Server und
Werkzeuge liegen.

### Analogie

Stell dir eine grosse **Handwerker-Werkstatt** vor, an deren Wand alle
Bauplaene, Rezepte und Werkzeuglisten aufgehaengt sind:

- Wenn ein neuer Agent gebaut werden soll (z. B. Chantal), holt sich
  Torsten die passenden Plaene aus dieser Werkstatt.
- Wenn ein Server eingerichtet oder gehaertet werden soll, liegen die
  Rezepte ebenfalls hier.
- Aenderungen an den Plaenen kann jeder sehen und nachvollziehen, weil
  jede Anpassung mit Datum und Grund vermerkt wird.

Technisch heisst diese Werkstatt bei uns `gruhflust/botrepo` und liegt
auf GitHub. Alle wichtigen Werkzeugketten (`agentctl`, `agentkvm`,
`agent_machine_setup`) haben dort ihre Vorlagen.

### Warum das wichtig ist

Ohne diese zentrale Werkstatt muesste Torsten jedes Mal von Hand
ueberlegen, wie ein Agent aufgebaut wird. So kann er stattdessen
"nimm die Bauanleitung fuer Chantal" sagen und alles laeuft nach
demselben Muster.

### Wer arbeitet daran

- Torsten: baut und pflegt die Bauanleitungen technisch.
- Gandalf: pflegt inhaltliche Ergaenzungen, insbesondere in der
  Wartungs- und Sicherheitsschiene (Branch `failbantest`).
- Sarah: bekommt die Ergebnisse als fertige Agenten oder Berichte.

---

## Gateway

### In einem Satz

Der Gateway ist der **Tuersteher mit Funkgeraet** eines Agenten: er
laesst Nachrichten hinein, gibt sie per Funk an den Agenten weiter und
traegt seine Antworten wieder hinaus.

### Analogie

Stell dir ein grosses Buerohaus vor, in dem viele Angestellte arbeiten
(die Agenten: Chantal, Chefkoch, Turiya, Gandalf ...). Vor jeder
Buerotuer steht **ihr eigener Tuersteher mit Funkgeraet**:

- Er kennt seine Tuer und ihre Adresse (bei uns: eine Portnummer).
- Er prueft, wer klopft (bei uns: ob die Nachricht ueber Telegram und
  von einer berechtigten Person kommt).
- Er funkt die Nachricht an den Agenten drinnen im Buero.
- Er nimmt die Antwort entgegen und traegt sie wieder nach draussen.
- Steht **kein Tuersteher** an der Tuer, hoert niemand das Klopfen -
  auch wenn der Agent drinnen wach ist.

### Was "Gateway aktiv" heisst

Der Tuersteher ist auf seinem Posten. Nachrichten kommen an, der Agent
antwortet.

### Was "Gateway inaktiv" heisst

Der Tuersteher ist nicht da. Der Agent ist nicht ansprechbar, egal
was mit ihm sonst gerade los ist. Das kann drei Gruende haben:

1. Der Agent existiert nicht mehr auf diesem Server (kein Buero, kein
   Tuersteher).
2. Der Tuersteher versucht immer wieder den Dienst anzutreten und
   scheitert dabei (Dauerneustart, wie bei Rocky am 23.07.2026).
3. Der Agent wurde bewusst pausiert (Tuersteher hat Feierabend bekommen).

### Wer richtet Gateways ein

Bei Automagia: Torsten (technisch) mit Vorbereitung durch Gandalf
(Vorlagen im `botrepo`).

---

## Gateway-Port

### In einem Satz

Ein Gateway-Port ist die **Hausnummer** des Tuerstehers eines Agenten -
die genaue Adresse, unter der Nachrichten an diesen Agenten
zugestellt werden.

### Analogie

Wenn der Server ein grosses Buerohaus ist, hat jeder Tuersteher
(Gateway) im Erdgeschoss eine eigene Schalter-Nummer. Wer Chantal
sprechen will, geht zu Schalter 19953. Wer Chefkoch braucht, geht zu
Schalter 19840. Wer Gandalf braucht, zu 19941.

Mehrere Agenten auf demselben Server koennen nur nebeneinander leben,
weil jeder eine eigene Schalter-Nummer hat. Zwei Tuersteher am selben
Schalter wuerden sich in die Quere kommen.

### Kleine Beispiele

- **Chantal** (S1): Port 19953
- **Chefkoch** (S1): Port 19840
- **Franks Klaus** (S1): Port 19870
- **Gandalf** (S3): Port 19941
- **Rocky** (S3): Port 18990
- **Sloar** (S3): Port 19950
- **Turyia-Slot** (S3): Port 19951
- **Egon** (S2): Port 19952

Die gesamte Nummernvergabe ist im Botrepo festgehalten, damit sich keine
zwei Agenten dieselbe Nummer greifen.

### Warum das wichtig ist

Ohne feste Schalter-Nummer wuesste der Server nicht, welche Nachricht
an welchen Agenten gehoert. Der Port ist die technische Adresse, unter
der Telegram ihn findet.

---

## Open Weight

### In einem Satz

Open Weight heisst: die **Bauplaene und Denkmuster** des Modells sind
oeffentlich - jeder darf sie herunterladen und selbst benutzen, statt
nur ueber die API des Anbieters darauf zuzugreifen.

### Analogie

Stell dir ein beruehmtes Rezeptbuch vor:

- **Closed** (geschlossen) waere: Es gibt ein Restaurant, das das
  Gericht kocht. Du kannst dort essen und bezahlst pro Teller.
- **Open Weight** waere: Das Restaurant gibt dir das komplette Rezept
  inklusive Zutatenliste. Du kannst zuhause selber kochen, so oft du
  willst, kostenlos - musst aber Herd, Toepfe und Zutaten selbst haben.

Bei KI-Modellen sind die "Bauplaene" gigantische Zahlentabellen
(mehrere hundert Gigabyte). Der Anbieter macht sie oeffentlich; jeder
kann sie herunterladen und auf einem eigenen Rechner betreiben - ohne
dem Anbieter Geld zu zahlen und ohne dass die Daten den eigenen Rechner
verlassen.

### Warum das wichtig ist

- **Kein Anbieter-Lockin.** Wenn der Anbieter morgen die Preise
  verdreifacht oder das Modell abschaltet, bleibt die eigene Kopie da.
- **Datenhoheit.** Nichts fliegt ueber die API zu einem Server
  irgendwo - alles bleibt bei dir.
- **Kosten.** Nach der einmaligen Hardware-Anschaffung sind die
  Rechenkosten nur Strom.

### Grenzen

- Grosse Modelle brauchen **grosse Rechner** (Grafikkarten mit sehr viel
  Speicher, teils ganze Rechenzentren). Nicht jedes Open-Weight-Modell
  laeuft auf einem Laptop.
- **Wartung und Aktualisierung** sind dann deine Sache - kein Anbieter
  spielt Updates ein.

### Wer bietet Open Weight bei den grossen Anbietern

- Meta (Llama-Familie), Mistral (die meisten), Alibaba (Qwen),
  DeepSeek, Moonshot (Kimi), Google (Gemma-Familie), OpenAI (nur
  gpt-oss).
- **Nicht** Open Weight: Anthropic (Claude), OpenAI (GPT-5-Familie),
  Google (Gemini), xAI (Grok), Cohere (Command R+).

Alle Details je Modell stehen in der Modell-Vergleichstabelle in der
Spalte **Lokal**.

---

## Server / VPS

### In einem Satz

Ein Server ist ein **Haus im Internet**, in dem Programme wohnen und
arbeiten - anders als dein Laptop laeuft er rund um die Uhr, damit man
jederzeit vorbeischauen kann.

### Analogie

Stell dir vor, du mietest eine **Wohnung in einem grossen Wohnblock**.
Diese Wohnung ist immer geheizt, hat immer Strom, immer Internet und
niemand macht das Licht aus. Genau das ist ein VPS: eine gemietete
Wohnung auf einem sehr grossen Rechner irgendwo im Rechenzentrum.

- Adresse der Wohnung: die **IP-Nummer** (z. B. 147.93.120.51).
- Groesse der Wohnung: **RAM** (Arbeitsspeicher) und **Disk** (Festplatte).
- Wer da wohnt: **Agenten**, Dienste, kleine Werkzeuge.

### Unsere vier "Wohnungen"

- **S1** (147.93.120.51) - Sarahs. Hier wohnen Chantal, Chefkoch, Franks Klaus.
- **S2** (89.116.39.197) - Sarahs. Zurzeit fast leer, aber wird umgeraeumt.
- **S3** (187.124.191.206) - Sarahs. Hier wohnen Gandalf, Rocky, Sloar,
  Turiya.
- **S4** (159.195.75.193) - Torstens. Dort wohnen Dolly, Eve, Joker, Lilli.

### Warum "VPS"

VPS heisst "Virtual Private Server" - virtuelle private Wohnung. Der grosse
Wohnblock wird technisch in viele einzelne Wohnungen aufgeteilt, und
jede fuehlt sich fuer den Mieter wie ein eigenes Haus an.

---

## Vault-Struktur

### In einem Satz

Der Vault ist der **Tresorraum** von Automagia: der Ort, an dem alle
Passwoerter, Schluessel und Zugangsdaten sicher verwahrt werden - klar
nach Empfaenger und Zweck sortiert.

### Analogie

Denk an einen grossen Banktresorraum mit vielen Schliessfaechern. Jedes
Fach hat eine feste Beschriftung:

- "Chantals Telegram-Bot-Token"
- "Chefkochs API-Schluessel fuer Claude"
- "Egons Voice-Zugangsdaten"
- "Servers 1 Root-Schluessel"

Die **Struktur** des Vaults ist die Anordnung dieser Faecher:

- **Oberste Ebene**: nach Gruppe (Homelab, Kunden, Persoenlich)
- **Zweite Ebene**: nach Host (welcher Server)
- **Dritte Ebene**: nach User oder Agent (Chantal, Chefkoch, ...)
- **Vierte Ebene**: nach Zweck (`telegram_bot_token`,
  `elevenlabs_api_key`, `github_deploy_key`)

Ein konkreter Pfad sieht z. B. so aus:

`groups/HomeLab/tokens/hosts/89.116.39.197/users/egon/elevenlabs_api_key`

Das ist die Bank-Schliessfach-Adresse fuer Egons ElevenLabs-Stimme.

### Warum das wichtig ist

- **Ordnung**: Wer auf einen bestimmten Schluessel zugreifen muss, weiss
  sofort, wo er liegt.
- **Rollentrennung**: Jeder Agent bekommt nur die Schluessel, die er
  wirklich braucht.
- **Wechsel**: Wenn ein Token rotiert wird (z. B. ein Bot bekommt einen
  neuen), wird nur ein Schliessfach getauscht - nicht 50.
- **Nachvollziehbarkeit**: Aenderungen am Vault werden protokolliert
  (`agentctl vault backup`), damit man weiss, wer wann was gedreht hat.

### Wer verwaltet den Vault

Der Vault gehoert zur Werkstatt (Botrepo). Torsten pflegt die
Struktur, Gandalf ergaenzt bei Neueinrichtungen (z. B. beim
automage-Rollout auf allen VPS).

---

## VNC-Units

### In einem Satz

VNC-Units sind die **Bildschirm-Bausteine**, die jedem Agenten seinen
eigenen Arbeitsplatz mit Fenstern, Maus und Tastatur bereitstellen -
damit man ihm ueber die Schulter schauen und aus der Ferne mitarbeiten
kann.

### Analogie

Stell dir vor, jeder Agent hat nicht nur ein Buero (Workspace) und
einen Tuersteher (Gateway), sondern auch einen **eigenen Bildschirm**
auf seinem Schreibtisch. Ueber diesen Bildschirm koennen wir aus der
Ferne zuschauen - so, als wuerden wir uns neben den Agenten setzen und
auf sein Monitorbild schauen.

Die **VNC-Unit** ist der Baustein, der diesen virtuellen Bildschirm
aufsetzt:

- Sie startet einen kleinen "virtuellen Bildschirm" auf dem Server.
- Sie oeffnet einen Zugang, ueber den man von aussen darauf zugreifen
  kann (Passwort noetig).
- Sie sorgt dafuer, dass der Bildschirm bestehen bleibt, auch wenn
  gerade niemand zuschaut.

### Ein konkretes Beispiel

Auf Server 3 gibt es vier VNC-Units, eine pro Agent:

- `agentkvm-vnc-gandalf.service` (Bildschirm-Nummer 10)
- `agentkvm-vnc-rocky.service` (Bildschirm-Nummer 11)
- `agentkvm-vnc-sloar.service` (Bildschirm-Nummer 12)
- `agentkvm-vnc-turyia.service` (Bildschirm-Nummer 13)

Jede dieser Units bekommt eine feste Adresse (Port), unter der man den
Bildschirm abrufen kann. Chantal auf Server 1 hat z. B.
Bildschirm-Nummer 18, Adresse 5918.

### Warum das wichtig ist

- Ein Agent kann so **echte Anwendungen** benutzen, die ein
  Bildschirm-Fenster brauchen (Browser, Textprogramme,
  Buchhaltungstools).
- Sarah oder Torsten koennen dem Agenten **aus der Ferne ueber die
  Schulter schauen** - fuer Fehlersuche oder Anlernen.
- Der Agent hat **einen eigenen, unabhaengigen Arbeitsplatz** und stoert
  keinen anderen.

### Wer verwaltet die VNC-Units

Torsten legt sie an, Gandalf ueberwacht ihren Zustand im Wochenbericht.
Die Bauanleitung liegt im Botrepo unter dem Namen `agentkvm`.
