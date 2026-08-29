# Fehlerprotokoll: Wochentrigger versenden nur Arbeitsauftraege (2026-08-29)

**Zeit:** 2026-08-29, 07:59 UTC  
**System:** Gandalf, Server 3 (`187.124.191.206`)  
**Betroffen:** `gandalf-ai-briefing.timer`, `gandalf-modelltabelle.timer`, `gandalf-weekly.timer`

## Symptom

Die Mittwochstimer lieferten per Telegram lediglich den Prompt (KI-Lage bzw.
Modellvergleich), nicht die geforderte Arbeit. Der Samstagbericht blieb am
29.08. ganz aus.

## Ursachen

1. `gandalf-ai-briefing.sh` und `gandalf-modelltabelle.sh` verwendeten direkt
   die Telegram-Bot-API (`curl`) und versandten deshalb zwangsläufig nur ihren
   Text. Ein Agentenlauf existierte nicht.
2. Der am 16.08. angelegte Samstag-Wrapper rief zwar `openclaw agent` auf,
   übergab den Prompt aber als nicht exportierte Shell-Variable. Der Lauf
   scheiterte daher mit `Missing message`.
3. Der lokale OpenClaw-Client probiert weiterhin den alten Default-Port
   `18789`, während Gandalfs Gateway auf `19941` lauscht. Der eingebaute
   Embedded-Fallback arbeitet, ist aber kein sauberer Primärpfad.

## Fix

- Alle drei Skripte auf echte, pro Empfaenger isolierte `openclaw agent`
  Aufrufe umgestellt: `--agent main`, eigener `--session-id`, `--message` und
  `--deliver` an Telegram.
- Skripte validiert (`bash -n`).
- Agentenpfad ohne Zustellung getestet; Ergebnis: `SCHEDULE_SMOKE_OK`.
- Fehler je Empfaenger lassen den systemd-Lauf jetzt fehlschlagen und werden
  mit `logger -t gandalf-schedule` protokolliert; sie werden nicht als
  Arbeitsauftrag an Menschen verschickt.

## Backups

Der vorherige Samstag-Wrapper bleibt als
`/usr/local/sbin/gandalf-weekly.sh.bak.20260816T051612Z` erhalten.

## Lernpunkte

- Ein Trigger ist erst dann erledigt, wenn er die Arbeit selbst ausfuehrt und
  das Ergebnis ausliefert; ein Telegram-Prompt ist kein Workflow.
- Den produktiven Codepfad immer mit einer echten Message pruefen, nicht nur
  die Shell-Syntax.

## Offener Punkt

Der Client-Port-Mismatch `18789` gegen `19941` ist separat zu beheben. Der
Fallback macht den neuen Ablauf funktionsfaehig, verdeckt die Abweichung aber.

