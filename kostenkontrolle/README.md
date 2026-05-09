# Kostenkontrolle für Agenten

Stand: 2026-05-09 UTC

## Ziel

Transparente Kontrolle darüber,

- welcher Agent welchen Provider nutzt,
- wo Claude überhaupt erlaubt ist,
- wo Claude nur Sollbild ist,
- und wo eine Konfigurationsabweichung Kostenrisiko erzeugt.

## Steuerregel

### Claude ist nur für diese Agenten erlaubt
- `sebastian` = `Bernd`
- `user1` = `Chefkoch`

### Für alle anderen Agenten gilt
- kein `anthropic/*` als Primary
- kein `anthropic/*` als Fallback
- Standardpfad nur `openai/*` oder `openai-codex/*`

Diese Regel entspricht der bereits festgehaltenen Operator-Vorgabe, dass `Bernd` und `Chefkoch` die Claude-Agenten sein sollen, während der Notfallbetrieb zuletzt auf OpenAI lief.

## Live-Snapshot über alle aktuell laufenden Gateways

Erfasst per Root-SSH auf `sarahserver1`, `sarahserver2`, `sarahserver3` am 2026-05-09.

| Server | Linux-User | Agent | Status | Primary | Fallbacks | Claude laut Policy erlaubt | Claude in Konfiguration | Anthropic-Key in `/etc/openclaw/users/*.env` | Auffälligkeit |
|---|---|---|---|---|---|---|---|---|---|
| Server 1 | `sebastian` | `Bernd` | aktiv | `openai/gpt-5.4` | `openai/gpt-5.1-codex` | ja | nein | ja | Soll ist Claude, Ist ist OpenAI |
| Server 1 | `user1` | `Chefkoch` | aktiv | `openai/gpt-5.4` | `anthropic/claude-sonnet-4-6` | ja | ja, als Fallback | nein | Claude vorgesehen, aber kein expliziter Anthropic-Key in der Env |
| Server 1 | `user2` | `Franks Klaus` | aktiv | `openai-codex/gpt-5.4` | `anthropic/claude-sonnet-4-6` | nein | **ja** | nein | unerlaubter Claude-Fallback, sollte entfernt werden |
| Server 2 | `agent` | offen, nicht `Turiya` | aktiv | `openai-codex/gpt-5.4` | - | nein | nein | nein | sauber OpenAI-only |
| Server 3 | `gandalf` | `gandalf` | aktiv | `openai/gpt-5.4` | - | nein | nein | nein | sauber OpenAI-only |
| Server 3 | `rocky` | `rocky` | aktiv | `openai/gpt-5.5` | `openai-codex/gpt-5.4`, `openai-codex/gpt-5.5` | nein | nein | nein | sauber ohne Claude |
| Server 3 | `turyia` | `Turiya` | aktiv | `openai-codex/gpt-5.5` | - | nein | nein | nein | sauber OpenAI-only |

## Sofort sichtbare Abweichungen

1. **Nur `Chefkoch` und `Bernd` sollen an Claude.**
   Aktuell ist genau diese Policy noch nicht technisch sauber erzwungen.

2. **`Franks Klaus` hat noch einen Anthropic-Fallback in der Konfiguration.**
   Das ist gegen die gewünschte Trennung und sollte entfernt werden.

3. **`Bernd` ist derzeit nicht auf Claude, obwohl er dort hingehört.**
   Aktuell läuft er rein auf OpenAI.

4. **`Chefkoch` hat Claude nur als Fallback, aber keinen expliziten Anthropic-Key in der Env-Datei.**
   Das ist für transparente Kostenkontrolle und verlässlichen Claude-Betrieb zu unklar.

## Empfohlene Kontrolllogik

### 1. Policy-Ebene
Eine einfache Ja/Nein-Regel pro Agent:

- `Claude erlaubt`: nur `Bernd`, `Chefkoch`
- `Claude verboten`: alle anderen

### 2. Konfigurations-Ebene
Bei jedem Agenten prüfen:

- Primary-Modell
- Fallback-Modelle
- taucht `anthropic/` irgendwo auf
- gibt es einen Anthropic-Key

### 3. Betriebs-Ebene
Regelmäßig festhalten:

- Soll-Modell
- Ist-Modell
- Provider in der Konfiguration
- vorhandene Credentials
- erkennbare Drift

### 4. Kosten-Ebene
Für Claude sauber getrennt überwachen:

- welche Agenten Claude technisch überhaupt erreichen können
- welche Agenten Claude real nutzen sollen
- ob ein Agent Claude nur als Fallback enthält oder wirklich primär nutzt

## Nächste sinnvolle Maßnahmen

1. `user2` / `Franks Klaus`: `anthropic/claude-sonnet-4-6` aus den Fallbacks entfernen
2. `Bernd` und `Chefkoch`: Sollbild für Claude sauber festlegen, inklusive klarer Key-Zuordnung
3. Snapshot regelmäßig neu ziehen und gegen die Policy prüfen
4. Optional: Kostenreport zusätzlich in die Agentenmatrix verlinken

## Relevanter Bezug aus der Memory

- Operator-Zuordnung: `sebastian = Bernd`, `user1 = Chefkoch`, `user2 = Franks Klaus`
- Frühere Klarstellung: `Bernd` und `Chefkoch` sind fachlich als Claude-Agenten gedacht

Quelle: `memory/2026-05-03.md#L116-L122`
