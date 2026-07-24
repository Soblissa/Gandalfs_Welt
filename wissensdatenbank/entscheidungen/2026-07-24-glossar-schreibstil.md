# Entscheidung 2026-07-24: Schreibstil im Glossar (praezise + Analogie)

## Beteiligte

- Sarah (Soblissa)
- Gandalf

## Regel

Glossareintraege verbinden **Analogie** und **technischen Kern** in
gleichem Gewicht. Sie duerfen (und sollen) Fachbegriffe verwenden,
solange diese knapp mit erklaert werden.

Konkret gilt fuer jeden Eintrag:

1. **Ein-Satz-Definition** oben, die den Begriff auf einen einzigen
   Satz herunterbricht und dabei Fachbegriff + Alltagsbild vereint.
2. **Abschnitt "Der technische Kern"** direkt darunter mit den
   konkreten technischen Bausteinen, Prozessen, Protokollen oder
   Pfaden. Fachbegriffe werden nicht vermieden, sondern jeweils
   in einem Halbsatz mit erklaert.
3. **Konkrete Beispiele aus Sarahs und Torstens Landschaft**
   (Chantal, S1-S4, Gandalf, spezifische Ports, konkrete Dateipfade)
   statt abstrakter Platzhalter.
4. **Analogie bleibt praesent**, aber begleitet die Fachinformation
   statt sie zu ersetzen.

## Wortlaut Sarahs

> "Also mit deinen Analogien bin ich noch nicht ganz zufrieden. Ein
> bisschen technischer und praeziser koennen sie schon sein."
> (24.07.2026, Telegram)

## Beispiel-Vergleich

**Zu weich (frueherer Stil):**

> Der Gateway ist der Tuersteher mit Funkgeraet eines Agenten: er
> laesst Nachrichten hinein, gibt sie per Funk an den Agenten weiter
> und traegt seine Antworten wieder hinaus.

**Gewuenscht (ab jetzt):**

> Ein Gateway ist ein kleiner Netzwerkdienst, der staendig auf einer
> festen Adresse (dem Port) horcht, Telegram-Nachrichten entgegennimmt,
> sie an den Agenten weitergibt und dessen Antworten zurueck an
> Telegram sendet - technisch ein eigenstaendiger Prozess auf dem
> Server, im Alltagsbild ein "digitaler Tuersteher".

## Wirkung

- Alle bestehenden Glossareintraege werden nach diesem Stil
  ueberarbeitet (erledigt am 24.07.2026).
- Alle kuenftigen Eintraege folgen dieser Regel automatisch.

## Beziehung zu anderen Entscheidungen

- Verfeinert die allgemeine Kommunikationsregel aus `AGENTS.md`
  ("Analogien vor Fachbegriffen"): Fachbegriffe sind nicht verboten,
  sie sollen im Glossar sogar bewusst mit auftauchen.
- Erweitert die Bereitstellungsregel: alle Aenderungen landen weiterhin
  im GitHub-Repo mit anklickbarem Link zur Kontrolle.
