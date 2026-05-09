# Kostenkontrolle für Agenten

Stand: 2026-05-09 UTC

## Ziel

Transparente Kontrolle darüber,

- welcher Agent welchen Provider nutzt,
- wo Claude überhaupt erlaubt ist,
- wo Claude nur Sollbild ist,
- wo eine Konfigurationsabweichung Kostenrisiko erzeugt,
- was ein Agent im Abrechnungszeitraum **tatsächlich** gekostet hat,
- und ob wirklich **jeder Agent eine eigene API / eigene Credentials** für getrennte Dashboard-Abrechnung hat.

## Steuerregel

### Jeder Agent bekommt eigene API-Credentials
- keine gemeinsamen Provider-Keys über mehrere Agenten
- getrennte Abrechnung soll über die jeweilige API im Provider-Dashboard möglich sein
- vorhandene Shared- oder Host-weite Keys sind als Migrationsziel zu behandeln und nach Agenten zu trennen


### Claude ist aktuell für diese Agenten erlaubt
- `sebastian` = `Bernd`
- `user1` = `Chefkoch`
- `user2` = `Franks Klaus`

### Für alle anderen Agenten gilt
- kein `anthropic/*` als Primary
- kein `anthropic/*` als Fallback
- Standardpfad nur `openai/*` oder `openai-codex/*`

Diese Regel entspricht der aktuellen Operator-Vorgabe. Seit 2026-05-09 laufen `Bernd`, `Chefkoch` und `Franks Klaus` jeweils mit eigenem Claude-Key.

## Exakte Abrechnungsgrundlage pro Agent

Für **exakte** Agentenabrechnung reicht die Modell-Konfiguration nicht.
Die belastbare Quelle sind die OpenClaw-Sessionlogs, konkret pro Antwort das Feld:

- `message.usage.cost.total`

Dafür gibt es jetzt zusätzlich:

- `kostenkontrolle/collect_costs.sh`
- `kostenkontrolle/audit_api_separation.sh`

Beispiele:

```bash
./kostenkontrolle/collect_costs.sh
./kostenkontrolle/collect_costs.sh --date 2026-05-09
./kostenkontrolle/collect_costs.sh --from 2026-05-01 --to 2026-05-31
./kostenkontrolle/audit_api_separation.sh
```

Der Kostenreport summiert die in den Session-JSONL-Dateien protokollierten Kosten je Linux-User bzw. Agent und ist damit die bessere Grundlage für interne Verrechnung als ein reiner Modell-Snapshot.

Der API-Separations-Audit prüft zusätzlich, ob pro Agent eigene env-basierte Provider-Credentials sichtbar sind, ohne Secrets offenzulegen.

## Live-Snapshot über alle aktuell laufenden Gateways

Erfasst per Root-SSH auf `sarahserver1`, `sarahserver2`, `sarahserver3` am 2026-05-09.

| Server | Linux-User | Agent | Status | Primary | Fallbacks | Claude laut Policy erlaubt | Claude in Konfiguration | Anthropic-Key in `/etc/openclaw/users/*.env` | Auffälligkeit |
|---|---|---|---|---|---|---|---|---|---|
| Server 1 | `sebastian` | `Bernd` | aktiv | `anthropic/claude-sonnet-4-6` | `openai/gpt-5.4`, `openai/gpt-5.1-codex` | ja | ja, als Primary | ja | Claude-Anbindung am 2026-05-09 erneuert |
| Server 1 | `user1` | `Chefkoch` | aktiv | `anthropic/claude-sonnet-4-6` | `openai/gpt-5.4` | ja | ja, als Primary | ja | Claude-Anbindung am 2026-05-09 erneuert |
| Server 1 | `user2` | `Franks Klaus` | aktiv | `anthropic/claude-sonnet-4-6` | - | ja | ja, als Primary | ja | eigener Claude-Key gesetzt, eindeutige Anthropic-Abrechnung |
| Server 2 | `agent` | offen, nicht `Turiya` | aktiv | `openai-codex/gpt-5.4` | - | nein | nein | nein | sauber OpenAI-only |
| Server 3 | `gandalf` | `gandalf` | aktiv | `openai/gpt-5.4` | - | nein | nein | nein | sauber OpenAI-only |
| Server 3 | `rocky` | `rocky` | aktiv | `openai/gpt-5.5` | `openai-codex/gpt-5.4`, `openai-codex/gpt-5.5` | nein | nein | nein | sauber ohne Claude |
| Server 3 | `turyia` | `Turiya` | aktiv | `openai-codex/gpt-5.5` | - | nein | nein | nein | sauber OpenAI-only |

## Sofort sichtbare Abweichungen

1. **`Bernd`, `Chefkoch` und `Franks Klaus` sollen aktuell an Claude.**
   Dieser Sollzustand ist jetzt technisch für alle drei als Primary umgesetzt.

2. **Separate API pro Agent ist aktuell noch nicht überall sauber umgesetzt.**
   Sichtbar eigene env-Credentials gibt es derzeit bei `sebastian`, `user1`, `user2` und `agent`.

3. **Bei `gandalf`, `rocky` und `turyia` ist aktuell kein agentenspezifischer env-Key sichtbar.**
   Dort muss für saubere Dashboard-Abrechnung entweder ein eigener Key hinterlegt oder der aktuelle Credential-Pfad erst sauber offengelegt werden.

## Empfohlene Kontrolllogik

### 1. Policy-Ebene
Eine einfache Ja/Nein-Regel pro Agent:

- `Claude erlaubt`: `Bernd`, `Chefkoch`, `Franks Klaus`
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
- welche **real protokollierten USD-Kosten** pro Agent im Zeitraum angefallen sind

## Nächste sinnvolle Maßnahmen

1. `audit_api_separation.sh` laufen lassen, bis für jeden Agent ein eigener Credential-Pfad sauber nachgewiesen ist
2. `collect_costs.sh` regelmäßig für Tages- oder Monatsabrechnung laufen lassen
3. Snapshot regelmäßig neu ziehen und gegen die Policy prüfen
4. Optional: Kostenreport zusätzlich in die Agentenmatrix verlinken
5. Optional: Soll-/Ist-Spalte zusätzlich in der Hauptmatrix sichtbar machen

## Relevanter Bezug aus der Memory

- Operator-Zuordnung: `sebastian = Bernd`, `user1 = Chefkoch`, `user2 = Franks Klaus`
- Frühere Klarstellung: `Bernd` und `Chefkoch` sind fachlich als Claude-Agenten gedacht

Quelle: `memory/2026-05-03.md#L116-L122`
