# Nextcloud-Kapazitaetspruefung – S2

Stand: 2026-09-28 17:28 UTC

- Ziel: Automagia-Nextcloud auf S2 (`89.116.39.197`), Datenpfad `/srv/nextcloud`.
- Frisch extern geprueft: HTTPS erreichbar; `/status.php` meldet Nextcloud 29.0.16, `maintenance=false`, `needsDbUpgrade=false`.
- Eine heutige Innenmessung von Platte, Datenbestand, RAM und Wachstum war nicht moeglich: Der hinterlegte SSH-Schluessel wird abgewiesen. Dieses Zugriffsmuster besteht seit August 2026.
- Letzter belegter Live-Wert vom 2026-08-29: 78 GiB Plattenplatz frei, 7,8 GiB RAM, 2 vCPU, kein Swap.

## Bewertung

Eine Speichererweiterung ist anhand des letzten belegten Werts noch nicht begruendbar. Vor einer Bestellung muss der Read-only-Zugang wiederhergestellt und mindestens `df -hT /srv/nextcloud`, `du -xsh /srv/nextcloud` sowie das Wachstum ueber mehrere Messpunkte erhoben werden. Als konservative Schwelle gilt: Erweiterung planen, sobald weniger als 20 % beziehungsweise weniger als 20 GiB frei sind.
