# S3: Miner-Unit und offene Host-Firewall

## Datum, Uhrzeit und System

- 05.09.2026, 06:03–06:06 UTC
- S3 / Gandalf, 187.124.191.206

## Symptom

- `systemctl --failed` meldet `c3pool_miner.service`.
- Die aktivierte System-Unit bezeichnet sich als „Monero miner service“ und startet `/root/c3pool/xmrig --config=/root/c3pool/config.json`.
- Sie läuft derzeit nicht: seit dem Neustart am 30.08. Fehler `203/EXEC`.
- Die INPUT-Policy ist `ACCEPT`; VNC 5910–5913 und TCP 29950 lauschen auf allen Interfaces.

## Ursache

- Noch ungeklärt. Die Unit-Datei existiert unter `/etc/systemd/system/c3pool_miner.service`; die konfigurierte ausführbare Datei ist nicht startbar oder fehlt.
- Eine absichtlich eingerichtete Nutzung ist ebenso möglich wie ein unerwünschtes Überbleibsel. Ohne Herkunftsnachweis wird der Befund als potenzielle Kompromittierung behandelt.

## Fix

- Noch keiner. Die Prüfung war ausdrücklich lesend; vor einer forensischen Sicherung wurde nichts deaktiviert oder gelöscht.

## Backups

- Keine, da keine Änderung erfolgte.

## Lernpunkte

- Fehlgeschlagene Units wöchentlich prüfen; ein gescheiterter Dienst kann trotzdem einen sicherheitskritischen Persistenzmechanismus darstellen.
- Öffentlich gebundene Dienste stets gemeinsam mit den wirksamen INPUT-Regeln bewerten.

## Offene Punkte

1. Eigentümer/Freigabe, Installationszeit, Paket- und Shellhistorie sowie Dateien unter `/root/c3pool` forensisch sichern und Herkunft klären.
2. Danach Miner-Unit gemäß Freigabe isolieren oder entfernen und Zugangsdaten rotieren, falls Kompromittierung bestätigt wird.
3. Zweck und Zugriffsschutz von VNC 5910–5913 sowie TCP 29950 klären.
4. Restriktive Host-Firewall mit gesichertem SSH-Rückweg planen.
