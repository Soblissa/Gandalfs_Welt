# Fehlerprotokoll: Cheko – Telegram-Dashboard-Befehl doppelt

**Datum/Uhrzeit:** 2026-09-13, 12:03 UTC  
**System:** Cheko auf Server 1 (`147.93.120.51`)

## Symptom

Nach dem erfolgreichen OpenClaw-Update meldet das Gateway beim Start:
`Plugin command "/dashboard" conflicts with an existing Telegram command.`

## Ursache

Noch offen. Mindestens zwei geladene Komponenten registrieren denselben
Telegram-Befehl `/dashboard`.

## Fix / Backups

Noch kein Eingriff. Das Gateway und der Telegram-Provider starten dennoch
erfolgreich; die Warnung blockiert Chekos Antworten nicht.

## Lernpunkte / offene Punkte

- Registrierende Plugins ermitteln und genau eine `/dashboard`-Registrierung
  beibehalten.
- Vor einer Aenderung Config sichern und Telegram nach Neustart pruefen.
