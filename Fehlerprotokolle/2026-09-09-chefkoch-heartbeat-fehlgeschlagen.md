# Fehlerprotokoll: Chefkoch-Heartbeat fehlgeschlagen (2026-09-09)

**Datum/Zeit:** 2026-09-09, beobachtet bis 08:34 UTC  
**System:** Server 1 (`147.93.120.51`), Chefkoch (`cheko`)  
**Symptom:** Telegram meldet stuendlich: `Heartbeat check failed before it could produce an update. The main chat session remains available.`

## Gesicherte Befunde

- Der aktuelle Dienst ist `openclaw-gateway@cheko`, nicht der historische Slot `openclaw-gateway@user1`.
- `openclaw-gateway@cheko` lief bei der Live-Pruefung aktiv; Start am 2026-09-09 um 07:06:21 UTC, `NRestarts=0`.
- Der Heartbeat scheiterte laut Telegram auch nach diesem Neustart um 07:34 und 08:34 UTC weiter.
- Port `127.0.0.1:19840` antwortete mit HTTP 200.
- Hauptchat und Heartbeat sind getrennte Ausfuehrungen. Der Fehler liegt daher nach aktuellem Stand in der Heartbeat-Ausfuehrung oder deren Modell-/Tool-Aufruf, nicht im Gateway-Prozess selbst.

## Ursache

Noch offen. Fuer den Linux-User `cheko` fehlen Gandalf derzeit SSH- und Journal-Leserechte. Eine API-Key-, Modell- oder Timeout-Ursache ist ohne die konkrete Logzeile nicht belegt.

## Naechster Diagnoseschritt

Auf S1 mit privilegiertem Zugang:

```bash
journalctl -u openclaw-gateway@cheko --since "2026-09-09 07:25:00 UTC" --until "2026-09-09 08:36:00 UTC" --no-pager -o short-iso | grep -Ei 'heartbeat|error|failed|timeout|auth|401|429|tool'
```

Danach Heartbeat-Konfiguration und die isolierte Heartbeat-Session unter `/home/cheko/.openclaw/` pruefen. Keine Konfiguration veraendern, bevor die konkrete Fehlerzeile vorliegt.

## Fix / Backups

- Noch kein Fix vorgenommen.
- Keine Dateien auf S1 veraendert; daher keine Backups erforderlich.

## Lernpunkte / offene Punkte

- Bei Chefkoch stets den aktuellen Linux-User und Unit-Namen pruefen; alte Notizen nennen noch `user1`.
- Ein Gateway-Neustart hilft nicht, wenn ausschliesslich die isolierte Heartbeat-Ausfuehrung scheitert.
- Lesezugang fuer `gandalf-ro` um Status/Journal von `openclaw-gateway@cheko` erweitern, sofern Sarah dies freigibt.
