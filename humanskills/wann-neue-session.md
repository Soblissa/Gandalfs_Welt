# Wann eine neue Session starten?

Eine Session ist ein Gespraech mit dem Agenten - so wie ein Anruf.
Manche Anrufe koennen ewig gehen, andere sollten neu beginnen.

## Die vier Gruende fuer `/new`

**1. Themenwechsel.**
Du hast eine Stunde ueber Kultusministerium gesprochen und willst jetzt
Reiseplanung machen. Neue Session. Der Agent verwirrt sich sonst, weil
er beides gleichzeitig im Kopf haelt.

**2. Der Agent klemmt.**
Er wiederholt sich, missversteht dich staendig, greift auf alte falsche
Informationen zurueck. Meist sammelt sich in einer langen Sitzung zu
viel Kontext an. Ein `/new` ist wie einmal frische Luft.

**3. Die Sitzung wird langsam oder teuer.**
Je laenger die Sitzung, desto mehr Text muss der Agent bei jeder
Antwort mitverarbeiten - das kostet Zeit und Geld. Wenn du merkst, dass
Antworten langsamer werden: `/new`.

**4. Sensibles vs. Unsensibles.**
Wenn du gerade etwas Vertrauliches besprochen hast und danach zu etwas
Offentlichem wechseln willst (zum Beispiel eine E-Mail formulieren, die
er zurueckliefern soll): sicherer, eine neue Session zu oeffnen.

## Wann *nicht* neu starten

**Du willst, dass der Agent sich erinnert.**
Wenn du vor 10 Minuten Sitzung X erzaehlt hast und daran gleich
weiterarbeiten willst - bleib drin. Ein Neustart wirft das weg.

**Das Thema entwickelt sich natuerlich weiter.**
Sekretariatsaufgaben, die sich aufeinander beziehen - Terminplanung,
dann Vorbereitung des Termins, dann Nachbereitung - passen in eine
Sitzung.

**Der Agent laeuft gut.**
Never touch a running system.

## Praktisches Muster

- **Am Morgen**: `/new` einmal, klare Absicht formulieren.
- **Bei Themenwechsel**: `/new`.
- **Wenn dir was komisch vorkommt**: `/new` und einmal neu erklaeren
  ist meist schneller als lange erklaeren, was der Agent gerade falsch
  macht.

## Was ein Agent zwischen Sessions behaelt

- **Seine Persoenlichkeit** (`SOUL.md`) bleibt.
- **Seine Regeln** (`AGENTS.md`) bleiben.
- **Sein Langzeit-Gedaechtnis** (`MEMORY.md`, `memory/`) bleibt.
- **Alles, was ihr in der Sitzung besprochen habt** - **weg**, wenn er
  es nicht ausdruecklich in seine Notizen aufgenommen hat.

## Faustregel

Wenn du zoegerst, ob es Zeit fuer eine neue Session ist - meistens ist
sie schon ueberfaellig.
