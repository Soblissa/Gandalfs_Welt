# botrepo: Automagia-Rebase-Konflikt

- **Datum/Uhrzeit:** 2026-08-29, 12:42 UTC
- **System:** `botrepo`, Branch `GandalfsWebadministration`

## Symptom

`git rebase origin/main` stoppte in drei dto-Admin-Profilvorlagen. `main` hatte
zwischenzeitlich `nextctl info` ergaenzt, waehrend der Arbeitsbranch an denselben
Stellen `nextctl website` eingefuegt hatte.

## Ursache

Beide Branches erweiterten dieselben Hilfetexte und `case`-Bloecke in den Bash-
und Zsh-Profilen. Git konnte die parallelen Einfuegungen nicht automatisch ordnen.

## Fix

In folgenden Dateien wurden beide Funktionen erhalten:

- `templates/bashrc/dto_admin.bashrc.j2`
- `templates/bashrc/dto_admin_macos.bashrc.j2`
- `templates/bashrc/dto_admin_macos.zshrc.j2`

Danach wurde der Rebase fortgesetzt. Konfliktmarker, `git diff --check`, beide
Kommandopfade und alle Automagia-YAML-Dateien wurden geprueft. Der Branch wurde
mit `git push --force-with-lease` aktualisiert und liegt null Commits hinter
`origin/main`.

## Backups

Keine separate Sicherung erforderlich: alter Remote-Branchstand und Commit-IDs
bleiben ueber Git erreichbar; der Push nutzte `--force-with-lease`.

## Lernpunkte

- Regelmaessiges Rebasen haelt Konflikte klein und frueh sichtbar.
- Bei gemeinsam erweiterten Dispatcher-Bloecken nie pauschal eine Seite waehlen;
  alle unabhaengigen Unterbefehle muessen erhalten und einzeln geprueft werden.
- Nach umgeschriebener Historie niemals blind force-pushen.

## Offene Punkte

Keine. Der Rebase ist abgeschlossen und der Arbeitsbranch sauber.
