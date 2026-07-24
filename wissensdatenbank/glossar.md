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
- [Gateway](#gateway)
- [Server / VPS](#server--vps)

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
