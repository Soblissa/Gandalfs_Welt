# Collabora-Vorlagen: Verifikation mit falschem Relativpfad

- **Datum/Uhrzeit UTC:** 2026-09-15, 08:48
- **System:** Gandalf / lokaler Workspace
- **Symptom:** Die abschließende Dateiliste meldete `No such file or directory`, obwohl die OTT-Vorlagen bereits korrekt in der Webcloud lagen.
- **Ursache:** Der Prüfpfad `nextcloud-shared/...` wurde relativ zum Unterverzeichnis `Gandalfs_Welt` statt zur Workspace-Wurzel ausgewertet.
- **Fix:** Prüfung aus der Workspace-Wurzel mit absolut aufgelöstem Pfad wiederholt; alle vier OTT-Dateien und die Anleitung sind vorhanden.
- **Backups:** Nicht erforderlich; der fehlgeschlagene Befehl war rein lesend.
- **Lernpunkte:** Webcloud-Prüfungen stets aus der Workspace-Wurzel oder mit absolutem Pfad ausführen.
- **Offene Punkte:** Keine.
