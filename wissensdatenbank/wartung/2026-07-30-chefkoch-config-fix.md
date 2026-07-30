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

## Zweiter Vorfall am selben Tag: konkurrierender User-Service
- Nach dem Konfig-Fix war der Dienst `active`, aber Chefkoch antwortete im Chat weiter mit "Something went wrong".
- Ursache: unter `user1` lief zusaetzlich ein **User-Service** `openclaw-gateway.service` (via `systemctl --user`), der parallel einen zweiten Gateway startete.
- Beide Prozesse rangelten um Port 19840. Journal-Meldung: `already running under systemd; waiting 5000ms before retrying startup`, gefolgt von SIGTERM auf den systemweiten Prozess.
- Fix:
  ```bash
  sudo -u user1 XDG_RUNTIME_DIR=/run/user/$(id -u user1) \
    systemctl --user stop openclaw-gateway.service
  sudo -u user1 XDG_RUNTIME_DIR=/run/user/$(id -u user1) \
    systemctl --user disable openclaw-gateway.service
  pkill -u user1 -f openclaw
  systemctl restart openclaw-gateway@user1
  ```
- Zusaetzlich `loginctl enable-linger user1` gesetzt.
- Ergebnis: nur noch ein Prozessbaum, Modell `claude-sonnet-4-6` geladen.

## Empfehlung
- Bei einem stillen Chefkoch-Ausfall kuenftig immer **beides** pruefen:
  1. `systemctl status openclaw-gateway@user1` (systemweit)
  2. `sudo -u user1 XDG_RUNTIME_DIR=/run/user/$(id -u user1) systemctl --user list-units | grep openclaw`
- Bei einem weiteren aehnlichen Fehler zuerst `journalctl -u openclaw-gateway@user1` konsultieren, dann Konfig gegen Schema pruefen.
- `openclaw-gateway@user1` beim naechsten Wochenkurzcheck mitbeobachten.
