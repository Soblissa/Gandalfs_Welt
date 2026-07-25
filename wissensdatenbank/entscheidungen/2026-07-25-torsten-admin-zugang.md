# Entscheidung 2026-07-25: Torsten behaelt Administrationszugang zu allen Agenten

## Beteiligte

- Sarah (Soblissa) - Eigentuemerin S1-S3
- Torsten (Slarti) - technischer Umsetzer, Administrator
- Gandalf - Systemverwalter

## Regel

Torsten behaelt **administrativen SSH-Zugang zu allen Agenten** auf
Sarahs Servern S1-S3.

Konkret:

- Der Public Key des Linux-Users `torsten` (bzw. der zugehoerige
  Deploy-Key aus dem Botrepo) wird auf jedem Agenten-Slot in der
  `authorized_keys`-Datei hinterlegt.
- Dies laeuft in der Botrepo-Bauanleitung ueber
  `copy_authorized_keys_from: torsten` und bleibt aktive Vorgabe.
- Gilt fuer bestehende Agenten (Chantal, Chefkoch, Franks Klaus,
  Gandalf, Rocky, Sloar, Turyia-Slot) und fuer alle zukuenftigen
  Neuanlagen.

## Anlass

Bei Chantals Aufraeumen am 25.07.2026 fiel die Zeile
`copy_authorized_keys_from: torsten` in der Bauanleitung auf. Sarah
hatte diese Zeile bis dahin nicht bewusst gesehen und wollte klaeren,
wozu sie dient. Nach Ruecksprache: bewusst gewollt.

## Wortlaut Sarahs

> "Torsten soll fuer alle Agenten administrativen Zugriff behalten."
> (25.07.2026, Telegram)

## Was das praktisch bedeutet

- Torsten kann sich als root oder als Slot-User (`chantall`, `user1`,
  `user2`, `gandalf`, `rocky`, `sloar`, `turyia`) auf jedem der
  Agenten-Slots einloggen, ohne dass Sarah etwas dazu tun muss.
- Er nutzt das fuer Wartung, Fehlersuche, Provisionierung.
- Sarahs Eigentumsprinzip (Entscheidung 2026-07-25) bleibt trotzdem
  gueltig: Belegungsaenderungen (neuer Agent, Umbenennung,
  Ausserdienststellung) sind auch dann mit Sarah abzustimmen, wenn
  Torsten sie technisch durchfuehren koennte.

## Bezug zu anderen Entscheidungen

- Ergaenzt `2026-07-25-sarah-eigentumsprinzip.md`: technische
  Zugriffsrechte fuer Torsten sind ausdruecklich okay,
  Entscheidungshoheit ueber Belegung bleibt bei Sarah.
- Wirkt auf alle `templates/agentprofiles/<ip>/<user>/`-Vorlagen im
  Botrepo, in denen `copy_authorized_keys_from: torsten` bereits steht.

## Wirkung fuer Gandalf

- Bei Neuanlagen: die Zeile `copy_authorized_keys_from: torsten` in
  der jeweiligen Vorlage nicht entfernen.
- Bei bestehenden Agenten: Torstens Key nicht aus den
  `authorized_keys` entfernen.
- Falls Torsten in Zukunft einen neuen Key rotiert, wird dieser
  automatisch mit den Vorlagen weiterverteilt.
