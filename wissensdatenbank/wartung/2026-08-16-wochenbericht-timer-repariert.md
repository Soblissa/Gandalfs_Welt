# 2026-08-16 - Wochenbericht-Timer repariert

## Problem

Der systemd-Timer `gandalf-weekly.timer` (Samstag 06:00 UTC) rief das
Skript `/usr/local/sbin/gandalf-weekly.sh` auf. Das Skript hat aber
nur den **Prompt-Text** ("Wochenbericht bitte: ...") per Telegram-Bot-API
an Sarah geschickt -- kein echter Agent-Lauf, kein Bericht.

Sarah hat mehrfach klargestellt (2026-08-15): sie will den Bericht,
nicht den Auftrag.

## Reparatur

Das Skript wurde am 2026-08-16 05:16 UTC ersetzt. Backup des alten
Skripts liegt als
`/usr/local/sbin/gandalf-weekly.sh.bak.20260816T051612Z`.

Neuer Ablauf:
1. Skript liest `/etc/gandalf-weekly.env` (Bot-Token und Chat-IDs).
2. Fuer jede Chat-ID startet es einen One-Shot-Agent-Lauf:
   ```
   openclaw agent \
     --session-id weekly-<TS>-<chat> \
     --message "<Prompt>" \
     --deliver \
     --reply-channel telegram \
     --reply-to <chat>
   ```
3. `--deliver` sorgt dafuer, dass OpenClaw die generierte Antwort
   selbst per Telegram an den Chat ausliefert -- kein manueller
   Bot-API-Call mehr.
4. Eigene `--session-id` pro Lauf verhindert Session-File-Locks mit
   der laufenden Sarah-Session.

Logs unter `/var/log/gandalf-weekly/run-<TS>.log`. Nur die letzten
acht Laeufe bleiben aufgehoben.

## Test

Trockentest mit einer Kurzfrage lief durch (2026-08-16 05:18 UTC):

- Gateway-Zugriff schlug fehl (Port-Mismatch 18789 vs. 19941 aus
  meiner aktuellen Config), Embedded-Fallback sprang ein.
- `--thinking medium` fuer Opus 4.7 nicht unterstuetzt (Modell verlangt
  `thinking.type.adaptive`); OpenClaw faellt automatisch auf `off`
  zurueck. Habe das Flag deshalb aus dem Skript entfernt.
- Antwort kam korrekt zurueck.

## Naechster Lauf

Samstag 2026-08-22 06:00 UTC. Dann bekommt Sarah einen echten Bericht,
nicht den Prompt.

## Randbaustellen (nicht durch diese Reparatur behoben)

- **`openai-codex` OAuth-Refresh-Token abgelaufen** ("refresh_token_reused").
  Kein akuter Fehler, da Opus 4.7 als Primary laeuft. Muss irgendwann
  reauthentifiziert werden.
- **Gateway-URL im Client-Cache falsch:** Meine `openclaw`-CLI versucht
  Port 18789 statt der tatsaechlichen 19941. Kein sichtbares Problem
  dank Embedded-Fallback, aber unsauber.
