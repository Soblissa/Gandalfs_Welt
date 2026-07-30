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

## Dritter Vorfall am selben Tag: Anthropic-Key war ungueltig, o3-mini-Formatfehler
- Nach dem Prozess-Fix meldete Chefkoch im Chat weiter "Something went wrong".
- Live-Log:
  1. Primary `openai/o3-mini` wurde mit `reasoning: 'none'` aufgerufen und antwortete mit HTTP 400 (`Unsupported value: 'none' is not supported`).
  2. Fallback `anthropic/claude-sonnet-4-6` schlug fehl mit HTTP 401 (`authentication_error: API key is invalid`).
  3. Konsequenz: "All models failed".
- Fix am 2026-07-30 gegen 12:08 UTC: neuer Anthropic-API-Key von Sarah, eingesetzt in `/etc/openclaw/users/user1.env`, Env-Backup neben der Datei mit `.bak.<UTC>`. Verifikation direkt gegen Anthropic (`HTTP 200`, Antwort `pong` mit Modell `claude-sonnet-4-5-20250929`). Danach `systemctl restart openclaw-gateway@user1` -> `active`, Log meldet Modell `anthropic/claude-sonnet-4-6`.
- Wichtige Klarstellung: Sarahs frueherer Hinweis "Chefkoch braucht einen neuen API-Key" war im Kern korrekt. Die kurzfristige Aussage 'nicht das API-Problem, sondern nur Konfig' war unvollstaendig.

## Vierter Vorfall am selben Tag: Key im Auth-Profil und Session-Model-Override
- Auch nach dem Setzen des neuen Anthropic-Keys in `/etc/openclaw/users/user1.env` bekam Sarah weiter "Something went wrong".
- Zwei zusaetzliche Ursachen:
  1. **Auth-Profil ueberschreibt Env.**
     - Datei: `/home/user1/.openclaw/agents/main/agent/auth-profiles.json`
     - Enthielt den alten Anthropic-Key. OpenClaw bevorzugt das Auth-Profil vor `ANTHROPIC_API_KEY` aus der Env.
     - Fix: neuen Key auch hier eingetragen, `.bak.<UTC>` daneben.
  2. **Session-Model-Override.**
     - Datei: `/home/user1/.openclaw/agents/main/sessions/sessions.json`
     - Session `agent:main:main` hatte `modelOverride: "o3-mini"` und rief deshalb `openai/o3-mini` statt Claude auf, was zum Formatfehler `reasoning: 'none'` fuehrte.
     - Fix: `modelOverride` aus allen Sessions entfernt, `.bak.<UTC>` daneben.
- Nach `systemctl restart openclaw-gateway@user1`: `agent model: anthropic/claude-sonnet-4-6`, `@ila_chefkoch_bot` verbunden, keine Fehler mehr im Log.

## Merksatz: die vier Kontrollpunkte bei OpenClaw-API-Fehlern
1. `/etc/openclaw/users/<user>.env` -- Env-Variablen fuer den systemd-Service.
2. `~/.openclaw/openclaw.json` -- nur Auth-Profildeklaration.
3. `~/.openclaw/agents/main/agent/auth-profiles.json` -- **echter Key liegt hier**, hat Vorrang vor Env.
4. `~/.openclaw/agents/main/sessions/sessions.json` -- pro-Session-`modelOverride` kann die Primary aus der Config aussticheln.

## Sarahs Ablauf-Erinnerung fuer den neuen Key
- Sarah hat angegeben: der neue Anthropic-Key laeuft in 29 Tagen ab -> 2026-08-28.
- Auf gandalf (Server 3, `srv1577995` / `187.124.191.206`) wurde als User-Systemd-Timer eingerichtet:
  - `~/.config/systemd/user/chefkoch-key-reminder.timer` (`OnCalendar=2026-08-28 08:00:00 UTC`, `Persistent=true`)
  - `~/.config/systemd/user/chefkoch-key-reminder.service`
  - `~/.openclaw/workspace/reminders/scripts/2026-08-28-chefkoch-key.sh`
- Beim Trigger sendet gandalf Sarah eine Telegram-Erinnerung und markiert sich über Stampfile als erledigt.

## Fallback-Regelung (offen, 2026-07-30)
- `openai/o3-mini` als Fallback ist ungeeignet, weil Chefkochs Runtime `reasoning: 'none'` schickt und o3-mini das ablehnt.
- Sarah und Gandalf haben verabredet, die neue Fallback-Regelung separat neu zu definieren. Bis dahin sollte kein automatischer o3-mini-Fallback konfiguriert bleiben.

## Empfehlung
- Bei einem stillen Chefkoch-Ausfall kuenftig immer **beides** pruefen:
  1. `systemctl status openclaw-gateway@user1` (systemweit)
  2. `sudo -u user1 XDG_RUNTIME_DIR=/run/user/$(id -u user1) systemctl --user list-units | grep openclaw`
- Bei einem weiteren aehnlichen Fehler zuerst `journalctl -u openclaw-gateway@user1` konsultieren, dann Konfig gegen Schema pruefen.
- `openclaw-gateway@user1` beim naechsten Wochenkurzcheck mitbeobachten.
