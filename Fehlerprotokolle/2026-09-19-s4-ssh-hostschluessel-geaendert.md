# S4: SSH-Hostschlüssel hat sich geändert

## Datum, Uhrzeit und System

- 19.09.2026, 06:08 UTC
- S4, 167.235.129.145

## Symptom

- TCP 22 ist von S3 aus erreichbar.
- Der SSH-Client bricht vor der Anmeldung mit `REMOTE HOST IDENTIFICATION HAS CHANGED` ab.
- Ein Read-only-Zugang besteht weiterhin nicht.

## Ursache

- Ungeklärt. Möglich sind ein legitimer Neuaufbau oder Schlüsselwechsel, eine geänderte IP-Zuordnung oder ein Sicherheitsvorfall. Keines davon ist derzeit belegt.

## Fix

- Kein Eingriff. Der neue Schlüssel wurde nicht akzeptiert und der bekannte Eintrag nicht entfernt.

## Backups

- Keine, da keine Änderung erfolgte.

## Lernpunkte

- Einen geänderten SSH-Hostschlüssel nie ungeprüft übernehmen.
- Erreichbarkeit von TCP 22 ist kein Nachweis für Identität oder Systemgesundheit.

## Offene Punkte

1. Aktuellen Fingerabdruck über einen unabhängigen, vertrauenswürdigen Kanal mit Torsten prüfen.
2. Erst nach erfolgreichem Abgleich den bekannten Hostschlüssel kontrolliert aktualisieren.
3. Read-only-Zugang für künftige Wochenprüfungen wiederherstellen.
