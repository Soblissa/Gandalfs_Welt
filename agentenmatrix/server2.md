# Agentenmatrix, Server 2

Stand: 2026-05-11 UTC  
Host-Alias: `sarahserver2`

Hinweis: Diese Fassung bildet den **heutigen Live-Zustand** ab. Seit Operator-Entscheidung vom 2026-05-11 liegt die kanonische **Turiya vollständig auf Server 2**. Der Linux-Nutzer bleibt technisch `agent`, die fachliche Identität ist aber Turiya. Frühere Einträge zu `joker`, `nemo` und `hiroshi` ließen sich live nicht mehr als aktuelle Linux-Nutzer oder aktive OpenClaw-Installationen bestätigen.

## Aktive Agenten

| Linux-Nutzer | Workspace | Agentenname | Besitzer | Einsatzfokus | Seele | Namensquelle | Gateway | Memory | Brave-Zugang | Default-Modell | Zuletzt beobachtet | IDENTITY.md | SOUL.md |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| `agent` | `~/.openclaw/workspace` | `Turiya` | `Sarah` | integrative Begleitung, Klarheit, Entwicklungsorientierung | warm, klar, geerdet, entwicklungsorientiert | `IDENTITY.md`, `SOUL.md`, `USER.md` plus Operator-Entscheidung | aktiv | ja | teilweise, Perplexity als Web-Search aktiv | `openai-codex/gpt-5.5` aus `openclaw.json` | `gpt-5.5` über `openai-codex` | vorhanden | vorhanden |

## Details

### Linux-Nutzer `agent` (kanonische Turiya auf Server 2)
- Linux-Nutzer: `agent`
- verwendeter Workspace: `/home/agent/.openclaw/workspace`
- Gateway: `openclaw-gateway@agent`, aktiv und enabled
- Agentenname: `Turiya`; `agent` ist hier nur der Linux-/Dienstname
- Besitzer: `Sarah`
- Einsatzfokus: integrative Begleitung, Klarheit, Entwicklungsorientierung
- Seele: warm, klar, geerdet, entwicklungsorientiert
- Namensquelle: `IDENTITY.md`, `SOUL.md`, `USER.md` und Operator-Entscheidung vom 2026-05-11
- `IDENTITY.md`: vorhanden und ausgefüllt
- `SOUL.md`: vorhanden und ausgefüllt
- Memory: `MEMORY.md` und `memory/` vorhanden
- Modelle:
  - Default aus `openclaw.json`: `openai-codex/gpt-5.5`
  - zuletzt beobachtetes Modell in Sessions: `gpt-5.5` über `openai-codex`
  - Auth-/Provider-Hinweis: `openai-codex`
- Websuche:
  - `tools.web.search.provider = perplexity`
  - `plugins.entries.perplexity.enabled = true`
  - `plugins.entries.perplexity.config.webSearch.model = perplexity/sonar-pro`
  - `tools.web.search.openaiCodex.enabled = false`
- Telegram: Bot zuletzt als `@VvTD01Bot` beobachtet
- Live-Fix 2026-05-11: ein alter zusätzlicher **User-Systemd-Gateway** (`/home/agent/.config/systemd/user/openclaw-gateway.service`) wurde deaktiviert, weil er parallel zum eigentlichen `openclaw-gateway@agent` pollte und so die wiederkehrenden `getUpdates`-`409 Conflict`-Fehler verursachte
- Ergebnis nach Fix: nur noch ein Gateway-Prozess aktiv, der 409-Konflikt verschwand in der Nachprüfung
- Operator-Entscheidung 2026-05-11: Turiya soll vollständig auf Server 2 liegen; diese Instanz ist seitdem die kanonische Turiya

#### `agent` IDENTITY.md (Auszug)
```md
- **Name:**
  Turiya
- **Creature:**
  Integrale KI-Begleiterin
- **Vibe:**
  Warm, klar, geerdet, entwicklungsorientiert
- **Emoji:**
  🌀
```

## Historische, aber aktuell nicht live bestätigte Altbestände

Am 2026-05-11 konnten die früher dokumentierten Server-2-Nutzer `joker`, `nemo` und `hiroshi` **nicht** mehr als aktuelle Linux-Nutzer nachgewiesen werden. Entsprechend gab es für diese Namen auch keine belastbaren `~/.openclaw`-Bestände oder laufenden `openclaw-gateway@…`-Dienste mehr.
