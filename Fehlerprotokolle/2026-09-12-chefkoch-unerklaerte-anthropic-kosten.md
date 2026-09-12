# Fehlerprotokoll: Chefkoch – unerklärte Anthropic-Kosten

**Datum/Uhrzeit:** 2026-09-12, Meldung 19:47 UTC  
**System:** Chefkoch auf Server 1 (`147.93.120.51`, Linux-User `cheko`)

## Symptom

Sarah meldet einen Verbrauch von 100 US-Dollar, obwohl sie Chefkoch nicht benutzt hat.
Am 2026-09-12 praezisierte sie: Allein am 2026-09-11 wurden 68 US-Dollar verbraucht.

## Gesicherte Befunde

- Chefkochs Gateway `openclaw-gateway@cheko` ist aktiv, PID 43205, gestartet am 2026-09-12 um 06:10:25 UTC, ohne Neustart.
- Am 2026-09-09 lief ein stündlicher isolierter Heartbeat; zugleich meldete Anthropic für einen S1-Aufruf zu wenig Guthaben. Der damals ausgewertete Ausschnitt enthielt verschachtelte Cron-/Heartbeat-Ausführungen.
- Das Lesekonto `gandalf-ro` darf weder Chefkochs Journal noch `/home/cheko/.openclaw/agents/main/sessions/` lesen. Eine verursachergenaue Token- und Sitzungsanalyse ist daher derzeit nicht möglich.
- Aus dem bloßen Guthabenverlust folgt noch nicht, dass Chefkoch die gesamten 100 US-Dollar verbraucht hat. Entscheidend sind Key-Zuordnung und Zeitraum im Anthropic-Dashboard.
- Der nun bekannte Tageswert von 68 US-Dollar grenzt die Abrechnung auf den 2026-09-11 ein, belegt aber ohne API-Key-/Workspace-Aufschluesselung weiterhin nicht, welcher Prozess die Kosten erzeugte.
- Erneute Live-Pruefung am 2026-09-12 um 19:51 UTC: Dienst weiter `active`, PID 43205, Start 06:10:25 UTC, `NRestarts=0`; kein zusaetzlicher Chefkoch-Prozess sichtbar. Das Lesekonto besitzt nur Inspektionsrechte fuer Chantal, nicht fuer Chefkochs Journal oder Sessions.

## Ursache

Noch offen. Zu prüfen sind automatische Heartbeat-/Cron-Läufe, weitere Sitzungen unter Chefkochs eigenem API-Key und eine mögliche Nutzung desselben Keys außerhalb Chefkochs.

## Fix / Backups

- Noch kein Eingriff; Sarahs Eigentumsprinzip wird gewahrt.
- Keine Backups erforderlich, da ausschließlich lesend geprüft wurde.

## Lernpunkte / offene Punkte

1. Anthropic-Usage fuer den 2026-09-11 nach API-Key und Modell aufschluesseln und sichern.
2. Chefkochs Journal und Session-Usage fuer den 2026-09-11 mit privilegiertem Lesezugang auswerten.
3. Key-Fingerprint der aktiven Quellen prüfen, ohne den Schlüssel offenzulegen.
4. Bis zur Klärung automatische kostenpflichtige Läufe und ein hartes Ausgabenlimit erwägen; Änderungen nur mit Sarahs Kenntnisnahme.
