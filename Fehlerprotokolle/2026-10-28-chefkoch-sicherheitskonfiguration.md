# Fehlerprotokoll: Chefkoch – drei offene Sicherheitskorrekturen

**Datum/Uhrzeit:** 2026-10-28, 08:25–08:29 UTC  
**System:** Chefkoch auf Server 1 (`147.93.120.51`, Benutzer `cheko`)

## Symptom

Chefkoch meldete drei nicht blockierende Befunde: Telegram-Token in der
Hauptkonfiguration, fehlende Gateway-Authentifizierung und gemeinsam genutzten
Direktnachrichten-Kontext bei Nextcloud Talk. Telegram selbst ist verbunden;
zwei Dokumentzustellungen wurden als erfolgreich gemeldet.

## Live-Befund

- `openclaw-gateway@cheko` ist `active/running`, PID 1078, `NRestarts=0`.
- Der Gateway lauscht auf `127.0.0.1:19840`; damit ist die fehlende
  Gateway-Authentifizierung derzeit nicht aus dem Netz ausnutzbar.
- Das reine Lesekonto `gandalf-ro` darf weder Chekos Konfiguration noch Journal
  lesen. Die drei Konfigurationsaussagen konnten daher nicht unabhängig am
  Live-System verifiziert oder korrigiert werden.
- Der dokumentierte administrative Benutzer `admin` ist mit den auf Gandalfs
  Host vorhandenen SSH-Schlüsseln nicht erreichbar.

## Ursache(n)

Die Verzögerung im Telegram-Chat war laut Chefkochs eigener Diagnose durch
abgebrochene Agentläufe verursacht, nicht durch einen Gateway- oder
Telegram-Ausfall. Die Sicherheitsbefunde sind davon getrennte Altlasten.

## Fix

Noch nicht live ausgeführt: Der erforderliche privilegierte Wartungszugang zu
Chekos Konfiguration fehlt. Zielzustand nach Freigabe des Zugangs:

1. Telegram-Token aus `openclaw.json` in den geschützten Secret-Pfad überführen.
2. `gateway.auth.mode=token` mit zufälligem, geschützt gespeichertem Token setzen.
3. `session.dmScope=per-channel-peer` setzen, damit Telegram- und Talk-DMs je
   Kanal und Absender getrennte Sitzungen erhalten.

## Backups

Keine Änderung und daher kein neues Backup. Vor dem späteren Apply ist eine
zeitgestempelte Sicherung von `/home/cheko/.openclaw/openclaw.json` Pflicht.

## Lernpunkte

- Dienstgesundheit und Sicherheitskonfiguration getrennt bewerten.
- Für Chefkoch reicht der Statuszugang von `gandalf-ro` nicht für Reparaturen.
- Ein lokal gebundener Gateway mindert das Risiko fehlender Authentifizierung,
  ersetzt sie aber nicht.

## Offene Punkte

- Privilegierten, revisionsfähigen Wartungszugang für `cheko` wiederherstellen.
- Danach Sicherung, drei Korrekturen, validierter Neustart sowie Telegram- und
  Talk-Funktionstest ausführen.
