# Automagia: falsche CLI-Ebene beim Deploy

- **Datum/Uhrzeit:** 2026-08-29, 15:13 UTC
- **System:** Gandalf-Controlhost / `botrepo`
- **Symptom:** `magiactl website deploy` brach mit „invalid choice: website“ ab.
- **Ursache:** `website deploy` ist die Bedienoberflaeche von `nextctl`; `magiactl` erwartet unmittelbar `apply`.
- **Fix:** Vorhandene Fehlerprotokolle und Bedienungsdokumentation geprueft; danach `magiactl apply --check` und `magiactl apply` erfolgreich ausgefuehrt.
- **Backups:** Keine; der fehlgeschlagene Parser-Aufruf nahm keinerlei Aenderung vor. Die Ausbringung erfolgte anschliessend idempotent per Playbook.
- **Lernpunkt:** Entweder `nextctl website deploy` in einer geladenen dto-admin-Shell oder direkt `magiactl apply` verwenden; die beiden Befehlsebenen nicht mischen.
- **Offene Punkte:** Keine.
