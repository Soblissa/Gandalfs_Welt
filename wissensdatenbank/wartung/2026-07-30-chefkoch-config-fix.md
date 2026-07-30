# Chefkoch-Vorfall und Fix, 2026-07-30

**Server:** Server 1 / `sarahserver1` / `147.93.120.51`  
**Agent:** `Chefkoch` (Linux-User `user1`)  
**Zeitpunkt:** 2026-07-30, gegen 11:43 UTC

## Symptom
- Sarah meldete: "Chefkoch laeuft aktuell nicht."
- `openclaw-gateway@user1` war in einer Endlosschleife aus Start und Absturz.
- Systemd-Restart-Counter stand bei 11.441.

## Ursache
- Konfigurationsfehler in `/home/user1/.openclaw/openclaw.json`.
- Unter `agents.defaults.models["openai/o3-mini"]` lag der Schluessel `reasoning: "low"` direkt am Objekt.
- Gueltig ist er nur unter `params`.
- Journal-Meldung:
  ```
  Config invalid
  File: ~/.openclaw/openclaw.json
  Problem:
    - agents.defaults.models.openai/o3-mini: Unrecognized key: "reasoning"
  ```

## Fix
- Backup der Konfig neben der Datei: `openclaw.json.bak.<UTC>`.
- Umstellung auf gueltiges Schema:
  ```json
  "openai/o3-mini": {
    "params": { "reasoning": "low" }
  }
  ```
- `systemctl restart openclaw-gateway@user1`
- Ergebnis: Dienst `active`, `NRestarts=0`.

## Modelle nach dem Fix
- Primary: `anthropic/claude-sonnet-4-6`
- Fallback: `anthropic/claude-haiku-4-5`
- Kein API-Key- oder Billing-Problem.

## Korrektur frueherer Aussage
- Aussage aus einer frueheren Session, Chefkoch brauche einen neuen API-Key, gilt fuer diesen Vorfall nicht.
- Tatsaechlich war es ein Schema-Fehler in der Konfiguration.

## Empfehlung
- `openclaw-gateway@user1` beim naechsten Wochenkurzcheck mitbeobachten.
- Bei einem weiteren aehnlichen Fehler zuerst `journalctl -u openclaw-gateway@user1` konsultieren, dann Konfig gegen Schema pruefen.
