# Fehlerprotokoll: Chefkoch – unerklärte Anthropic-Kosten

**Datum/Uhrzeit:** 2026-09-12, Meldung 19:47 UTC  
**System:** Chefkoch auf Server 1 (`147.93.120.51`, Linux-User `cheko`)

## Symptom

Sarah meldet einen Verbrauch von 100 US-Dollar, obwohl sie Chefkoch nicht benutzt hat.
Am 2026-09-12 praezisierte sie: Allein am 2026-09-11 wurden 68 US-Dollar verbraucht.
Ein Dashboard-Screenshot vom 2026-09-13 weist fuer September bis heute insgesamt 129,07 US-Dollar aus.

## Gesicherte Befunde

- Chefkochs Gateway `openclaw-gateway@cheko` ist aktiv, PID 43205, gestartet am 2026-09-12 um 06:10:25 UTC, ohne Neustart.
- Am 2026-09-09 lief ein stündlicher isolierter Heartbeat; zugleich meldete Anthropic für einen S1-Aufruf zu wenig Guthaben. Der damals ausgewertete Ausschnitt enthielt verschachtelte Cron-/Heartbeat-Ausführungen.
- Das Lesekonto `gandalf-ro` darf weder Chefkochs Journal noch `/home/cheko/.openclaw/agents/main/sessions/` lesen. Eine verursachergenaue Token- und Sitzungsanalyse ist daher derzeit nicht möglich.
- Aus dem bloßen Guthabenverlust folgt noch nicht, dass Chefkoch die gesamten 100 US-Dollar verbraucht hat. Entscheidend sind Key-Zuordnung und Zeitraum im Anthropic-Dashboard.
- Der nun bekannte Tageswert von 68 US-Dollar grenzt die Abrechnung auf den 2026-09-11 ein, belegt aber ohne API-Key-/Workspace-Aufschluesselung weiterhin nicht, welcher Prozess die Kosten erzeugte.
- Erneute Live-Pruefung am 2026-09-12 um 19:51 UTC: Dienst weiter `active`, PID 43205, Start 06:10:25 UTC, `NRestarts=0`; kein zusaetzlicher Chefkoch-Prozess sichtbar. Das Lesekonto besitzt nur Inspektionsrechte fuer Chantal, nicht fuer Chefkochs Journal oder Sessions.
- Live-Pruefung am 2026-09-13 um 07:27 UTC: weiterhin genau ein Prozess (`openclaw-gateway`, PID 43205), Dienst `active`, `NRestarts=0`. `gandalf-ro` hat weiterhin weder Journal- noch Session-Leserecht; `sudo -l` erlaubt nur Chantal-Inspektion.
- Der Anthropic-Screenshot gruppiert nach Modell: Die gesamten 129,07 US-Dollar sind `Claude Opus 5` zugeordnet. Sichtbare Kosten fallen am 7., 8., 10., 11. und 12. September an; der groesste Ausschlag liegt am 11. September.
- Das ist eine klare Abweichung von Chefkochs zuletzt dokumentiertem Sollmodell `Claude Sonnet 4.6`. Der Screenshot beweist Opus-Nutzung, ordnet sie aber noch keinem API-Key oder Prozess zu.
- Live-Pruefung am 2026-09-13 um 07:32 UTC: weiterhin nur ein stabiler Chefkoch-Gateway-Prozess (PID 43205, `NRestarts=0`); Konfiguration und Sitzungen bleiben fuer `gandalf-ro` unlesbar.
- Ein weiterer Screenshot vom 2026-09-13 um 07:36 UTC zeigt bei `Monat bis heute` und Gruppierung nach `Service-Account` keinerlei Daten (`0,00 USD`). Damit sind die zuvor sichtbaren Opus-Kosten keinem Service-Account zugeordnet. Das spricht dafuer, dass sie ueber einen normalen API-Key oder eine andere Organisations-/Workspace-Zuordnung liefen; es beweist noch nicht, dass Chefkoch der Verursacher ist.
- Sarah bestaetigte um 07:40 UTC, dass die Nutzungsansicht im Gruppierungsmenue keine Option `API-Schluessel` anbietet. Die Zuordnung muss daher ueber den Download-Export oder die Anthropic-Admin-API erfolgen.
- Der Download aus der nach Service-Account gruppierten Nullansicht war leer. Vor einem erneuten Export muss wieder nach `Modell` gruppiert und der kostenbehaftete Zeitraum eingestellt werden; bleibt die Schlüsselzuordnung aus, sind Anthropic-Admin-API oder Chefkochs lokale Logs erforderlich.

## Ursache

Noch offen. Gesichert ist nun, dass `Claude Opus 5` die Kosten erzeugte. Zu prüfen sind ein Opus-Modell-Override in Chefkochs Konfiguration/Sitzungen, automatische Heartbeat-/Cron-Läufe sowie eine mögliche Nutzung desselben Keys außerhalb Chefkochs.

## Fix / Backups

- Noch kein Eingriff; Sarahs Eigentumsprinzip wird gewahrt.
- Keine Backups erforderlich, da ausschließlich lesend geprüft wurde.

## Lernpunkte / offene Punkte

1. Anthropic-Usage fuer den 7. bis 12. September nach API-Key beziehungsweise Dienstkonto aufschluesseln und sichern; die Modellzuordnung `Claude Opus 5` ist bereits belegt.
2. Chefkochs Journal und Session-Usage fuer den 2026-09-11 mit privilegiertem Lesezugang auswerten.
3. Key-Fingerprint der aktiven Quellen prüfen, ohne den Schlüssel offenzulegen.
4. Bis zur Klärung automatische kostenpflichtige Läufe und ein hartes Ausgabenlimit erwägen; Änderungen nur mit Sarahs Kenntnisnahme.
5. Für eine verursachergenaue Analyse zeitlich begrenzten, ausschließlich lesenden Zugriff auf das Journal der Unit und `/home/cheko/.openclaw/agents/main/sessions/` gewähren. Dann Aufrufe des 2026-09-11 nach Uhrzeit, Session, Auslöser, Modell sowie Input-/Output-Tokens gruppieren und mit dem Anthropic-Usage-Export nach API-Key abgleichen.
