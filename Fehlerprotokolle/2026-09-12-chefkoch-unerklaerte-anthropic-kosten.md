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
- Der Screenshot vom 2026-09-13 um 07:43 UTC liefert die eindeutige Key-Zuordnung: Bei aktivem Filter `API-Schlüssel Chefkoch` erscheinen die gesamten Monatskosten von 129,07 USD. Damit ist Chefkochs API-Key als Abrechnungsquelle belegt; eine Nutzung dieses Keys durch Chefkochs Prozess oder durch eine andere Stelle mit demselben Key ist noch zu unterscheiden.
- Die Gruppierung nach Token-Typ zeigt, dass fast alle Kosten aus `Prompt caching write (5m)` stammen; Input, Cache-Lesezugriffe und Output sind dagegen klein. Das spricht fuer wiederholte sehr grosse Prompt-/Kontext-Schreibvorgaenge, nicht fuer lange sichtbare Antworten.
- Live-Pruefung am 2026-09-13 um 07:46 UTC: SSH als `gandalf-ro` funktioniert, doch `journalctl -u openclaw-gateway@cheko` liefert wegen fehlender Mitgliedschaft in `adm`/`systemd-journal` keine Eintraege; `/home/cheko/.openclaw/agents/main/sessions/` bleibt mit `Permission denied` gesperrt. Direkter Root-SSH ist mit dem vorhandenen Schluessel nicht zugelassen.
- Nach Einrichtung des schluesselbasierten Kontos `gandalfadmin` am 2026-09-13 funktionierten um 10:00 UTC sowohl SSH als auch `sudo -n`; ein Passwort wurde nicht gespeichert oder uebermittelt.
- Das Journal belegt automatische, verschachtelte Cron-Laeufe (`lane=cron-nested`) mit `anthropic/claude-opus-5`. Sie liefen stundenweise auch ohne sichtbare Nutzerinteraktion weiter.
- Die aktive Konfiguration setzt `agents.entries.main.model.primary` ausdruecklich auf `anthropic/claude-opus-5`. Der aktive Job `heartbeat-main` laeuft alle 1.800.000 ms, also alle 30 Minuten, im Ziel `main` und erbt damit Opus 5.
- Aus den Transport-Logs gezaehlte Anthropic-Aufrufe: 07.09. 60 (60 erfolgreich), 08.09. 102 (101 erfolgreich), 09.09. 28 (alle fehlgeschlagen), 10.09. 40 (19 erfolgreich), 11.09. 112 (alle erfolgreich), 12.09. 46 (38 erfolgreich), 13.09. bis 08:00 UTC 9 (alle fehlgeschlagen). Saemtliche 397 erfassten Starts verlangten Opus 5.
- Slartis Hypothese einer Verstaerkung durch die Workspace-/Memory-Neuindizierung ist teilweise belegt: Am 11.09. um etwa 07:08-07:35 UTC trat ein dichter Zusatzblock von Opus-Aufrufen gemeinsam mit wiederholten `Memory reindex lock`-Meldungen auf. Die Vektorsuche selbst ist jedoch auf `nomic-embed-text` konfiguriert und war nicht der Anthropic-Verbraucher. Der Grundverbrauch kam bereits rund um die Uhr im 30-Minuten-Takt vom Heartbeat; die Neuindizierung beziehungsweise dadurch ausgeloeste Sitzungsarbeit verstaerkte ihn nur.
- Im aktuellen Profil `cheko` ist weder in der Dienst-Environment noch in der aktiven Konfiguration eine OpenAI-Authentifizierung nachweisbar; die Modell-Allowlist und Fallback-Kette bestehen derzeit ausschliesslich aus Anthropic-Modellen.

## Ursache

Bestaetigt: Chefkochs Hauptagent war entgegen dem dokumentierten Sollmodell ausdruecklich auf `Claude Opus 5` konfiguriert. Der aktive 30-Minuten-Heartbeat loeste im Hauptkontext automatische verschachtelte Cron-Laeufe aus. Diese wiederholten Opus-Aufrufe schrieben den grossen Hauptkontext jeweils in den 5-Minuten-Prompt-Cache und verursachten den Verbrauch ohne sichtbare Chat-Nutzung. Die zeitliche Dichte und die 112 erfolgreichen Aufrufe am teuersten Tag 11.09. stimmen mit dem Anthropic-Dashboard ueberein.

## Fix / Backups

- Noch kein Eingriff; Sarahs Eigentumsprinzip wird gewahrt.
- Keine Backups erforderlich, da ausschließlich lesend geprüft wurde.

## Lernpunkte / offene Punkte

1. Vor erneutem Aufladen des Anthropic-Guthabens den Heartbeat deaktivieren oder auf ein deutlich guenstigeres Modell mit kleinem, isoliertem Kontext umstellen; nur nach Sarahs Kenntnisnahme.
2. Chefkochs Hauptmodell wieder auf das fachlich gewollte Sollmodell setzen und die lange Fallback-Kette bereinigen; nur nach Sarahs Kenntnisnahme.
3. Anthropic-Ausgabenlimit und Alarmierung einrichten.
4. Den dauerhaften Umfang des neuen Volladministrator-Kontos mit Sarah und Slarti festlegen; das Break-glass-Passwort bleibt ausschliesslich bei Slarti.
5. Fuer eine harte Kostentrennung Claude nicht nur per Skill auswaehlen: Anthropic in ein getrenntes Profil ohne Heartbeat/Cron und mit isolierten Sitzungen legen; OpenAI fuer Hauptagent und Hausmeisterlaeufe verwenden. Providerseitiges Budget und Alarmierung bleiben die letzte Schranke.
6. Slarti stellte klar, dass mit dem vorgeschlagenen Gateway `OpenRouter` gemeint ist. Laut aktueller OpenRouter-Dokumentation koennen API-Keys eigene Credit-Limits und Reset-Regeln besitzen; bei Erreichen folgt HTTP 402. Das eignet sich als harte 10-Dollar-Testgrenze. OpenRouter waehlt jedoch nicht selbst anhand von Sarahs Absender das Modell: Diese Trennung muss OpenClaw durch getrennte Profile/Modellaufrufe erzwingen. Fuer Claude einen eigenen OpenRouter-Key mit festem, nicht automatisch zurueckgesetztem Limit verwenden und keine Provider-Fallbacks erlauben.
