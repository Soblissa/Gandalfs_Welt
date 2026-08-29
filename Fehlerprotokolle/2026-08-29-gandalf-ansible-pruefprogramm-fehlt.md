# Gandalf: lokales Ansible-Pruefprogramm fehlt

- **Datum/Uhrzeit:** 2026-08-29, 12:24 UTC
- **System:** Gandalf, lokaler `botrepo`-Workspace

## Symptom

Die beabsichtigte Syntaxpruefung von `magia01-content.yml` brach mit
`ansible-playbook: command not found` ab.

## Ursache

Auf Gandalfs aktuellem Controlhost ist die Ansible-CLI nicht installiert oder
nicht im `PATH` verfuegbar.

## Fix

Die geaenderten YAML-Dateien wurden ersatzweise mit PyYAML geparst; beide sind
syntaktisch gueltig. Zusaetzlich lief `git diff --check` fehlerfrei. Am Zielsystem
wurde nichts veraendert.

## Backups

Keine erforderlich; es erfolgte keine Zustandsaenderung ausserhalb des Git-Branches.

## Lernpunkte

Vor lokalen Ansible-Syntaxchecks zuerst die Verfuegbarkeit von `ansible-playbook`
pruefen. Die vollstaendige Ansible-Pruefung bleibt vor einer spaeteren Ausbringung
nachzuholen.

## Offene Punkte

- Vor dem ersten Deploy `magiactl apply --check` auf einem Controlhost mit Ansible ausfuehren.
