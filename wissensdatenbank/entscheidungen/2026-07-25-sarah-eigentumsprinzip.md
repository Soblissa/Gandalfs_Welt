# Entscheidung 2026-07-25: Sarahs Eigentumsprinzip auf S1-S3

## Beteiligte

- Sarah (Soblissa) - Eigentuemerin der Server 1, 2, 3
- Torsten (Slarti) - technischer Umsetzer
- Gandalf - Systemadministrator und Chronist

## Regel

**Was auf Sarahs Servern (S1, S2, S3) passiert, muss mit Sarah
abgesprochen sein.**

Konkret:

- Kein neuer Agent, kein neuer Linux-User, kein Bot-Slot wird auf
  S1-S3 angelegt, ohne dass Sarah es weiss und zustimmt.
- Kein Agent wird umbenannt, umgewidmet, in Rolle oder Modell
  geaendert, ohne Sarahs Kenntnisnahme.
- Kein Agent wird entfernt, pausiert oder aus dem Betrieb genommen,
  ohne Sarahs Freigabe.
- Torsten (dto) betreibt zwar Bots und pflegt die Bauanleitungen im
  Botrepo, aber die konkrete Belegung von Sarahs Hardware ist
  Sarahs Entscheidung.
- Ausnahme: laufende Wartung im Rahmen der bestehenden Freigabe
  (Sonntag 05:00 UTC Updates, Reboot, Gateways nachpflegen) ist
  gedeckt und braucht keine Einzelfrage.

## Anlass

Am 25.07.2026 hat Sarah bei der Durchsicht der Agenten-Belegung
festgestellt, dass Torstens Pilot-Agent Egon seit Wochen tot auf
Server 2 zappelt (830.000 Neustart-Versuche gezaehlt) und dass die
Turiya-Frage seit Mai 2026 ungeklaert im Raum steht - beides ohne
dass sie ausdruecklich einbezogen wurde.

## Wortlaut Sarahs

> "Auch ueber Egon will ich reden. Was auf meinen Servern passiert
> muss mit mir abgesprochen sein."
> (25.07.2026, Telegram)

## Wirkung fuer Gandalf

- Bei jedem Vorgang, der einen Agenten-Slot auf S1-S3 betrifft,
  fragt Gandalf zuerst bei Sarah nach - auch wenn der Wunsch von
  Torsten kommt.
- Ausnahme: Wartung im gedeckten Rahmen.
- Bei Konflikten zwischen Torsten und Sarah zur Belegung von S1-S3:
  Sarahs Entscheidung wiegt schwerer.

## Wirkung fuer die Botrepo-Playbooks

- Torsten kann weiterhin Vorlagen im Botrepo pflegen, ohne dass
  Sarah in die Templates schaut. Aber bevor eine Vorlage per
  `agentctl deploy` auf S1-S3 tatsaechlich ausgerollt wird, muss
  Sarah Bescheid wissen.
- Vorlagen im Botrepo bedeuten noch keine Zustimmung zum Rollout.

## Bezug zu anderen Entscheidungen

- Ergaenzt `2026-07-19` (Wartungsfreigabe fuer S1-S3): Wartung ja,
  Belegungsaenderung nur mit Rueckfrage.
- Ergaenzt `2026-07-25-anstrengungsregel.md`: proaktives
  Nachfragen bei Belegungsaenderungen ist Teil der Anstrengung.

## Naechste konkrete Schritte

- **Turiya**: Sarah und Torsten sprechen morgen (26.07.).
- **Egon**: Sarah und Torsten sprechen morgen. Gandalf setzt bis
  dahin nichts um.
