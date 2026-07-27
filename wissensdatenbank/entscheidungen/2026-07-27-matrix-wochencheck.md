# 2026-07-27 - Woechentliche Matrix-Pruefung

Sarah hat gruenes Licht gegeben, dass Gandalf die Agentenmatrix
proaktiv einmal pro Woche gegen den Live-Zustand prueft und
selbststaendig anpasst.

## Setup

- Read-Only-User `gandalf-ro` auf S1 (147.93.120.51), SSH-Key von
  gandalf@srv1577995 hinterlegt.
- Sudoers-Regel erlaubt nur ein Read-Only-Wrapper-Skript:
  `/usr/local/sbin/chantall-inspect` (root:root, 755), das
  Identity, Plugin-Status, Perplexity-Keyfile, MEMORY-Zeilen,
  Modell und dmPolicy meldet.
- Zusaetzlich: `systemctl is-active openclaw-gateway@chantall`
  ueber sudo(root) erlaubt.
- Auf gandalf-Host: systemd-Timer `matrix-weekly-check.timer`,
  Sonntag 20:00 UTC, laeuft als user `gandalf`.
- Report landet unter `memory/YYYY-MM-DD-matrix-check.md`.

## Regeln

- Offensichtliche Faktenkorrekturen (Portnummer, Plugin an/aus,
  Modellname) darf Gandalf selbststaendig in Matrix eintragen,
  commit + push.
- Rollen-, Skill- oder Aussagen-Aenderungen bleiben Sarahs
  Freigabe vorbehalten (Eigentumsprinzip S1-S3).
- Am Montag folgt eine kurze Meldung an Sarah:
  "Matrix geprueft, X selbststaendig korrigiert, Y zur Freigabe".

## Anlass

Am 2026-07-27 Feststellung, dass Chantals Matrix-Eintrag
"Perplexity nicht angeschlossen" falsch war. Plugin ist seit
2026-07-05 aktiv, Key gueltig. Gandalfs Notiz war veraltet -
genau der Fall, den ein Wochencheck fangen soll.
