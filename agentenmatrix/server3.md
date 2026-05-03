# Agentenmatrix, Server 3

Stand: 2026-05-03 UTC  
Host-Alias: `sarahserver3`

Hinweis: Diese Fassung berücksichtigt `~/.openclaw/workspace` und `~/.openclaw/workspace_*`.

## Aktive Agenten

| Linux-Nutzer | Workspace | Agentenname | Namensquelle | Gateway | Memory | Brave-Zugang | Default-Modell | Zuletzt beobachtet | IDENTITY.md | SOUL.md |
|---|---|---|---|---|---|---|---|---|---|---|
| `gandalf` | `~/.openclaw/workspace` | `gandalf` | `IDENTITY.md` | aktiv | ja | ja, OpenClaw-Brave konfiguriert, aber kein lokales Brave-Profil gefunden | `openai/gpt-5.4` | `gpt-5.4` über OpenAI | vorhanden | vorhanden |
| `rocky` | `~/.openclaw/workspace` | `rocky` | `IDENTITY.md` | aktiv | ja, nur `memory/` | ja, Brave in OpenClaw konfiguriert, kein lokales Brave-Profil gefunden | `openai/gpt-5.5` | `gpt-5.4` über OpenAI | vorhanden | vorhanden |
| `turyia` | `~/.openclaw/workspace` | offen, bisher `Turyia` | `IDENTITY.md`, aber vom Operator verworfen | aktiv | nein | teilweise, OpenClaw-Brave-Spuren vorhanden, aber kein lokales Brave-Profil gefunden | `openai-codex/gpt-5.5` | kein aktuelles Session-Modell gefunden | vorhanden | vorhanden |

## Details

### `gandalf`
- Linux-Nutzer: `gandalf`
- verwendeter Workspace: `/home/gandalf/.openclaw/workspace`
- Gateway: `openclaw-gateway@gandalf`, aktiv und enabled
- Agentenname: `gandalf`
- Namensquelle: `IDENTITY.md`
- `IDENTITY.md`: vorhanden und ausgefüllt
- `SOUL.md`: vorhanden
- Memory: installiert, `MEMORY.md` und `memory/` vorhanden
- Brave: kein lokales Brave-Profil gefunden, aber OpenClaw-Konfiguration mit Brave-Spuren vorhanden
- Modelle:
  - Default aus `openclaw.json`: `openai/gpt-5.4`
  - zuletzt beobachtetes Modell in Sessions: `gpt-5.4` über OpenAI
  - Auth-/Provider-Hinweis: `openai`, `openai-codex`

#### `gandalf` IDENTITY.md (Auszug)
```md
- Name: gandalf
- Typ: OpenClaw Agent
- Host: 187.124.191.206
- Gateway-Port: 19941
- Rolle: isolierter Multi-Agent Slot 3
```

### `rocky`
- Linux-Nutzer: `rocky`
- verwendeter Workspace: `/home/rocky/.openclaw/workspace`
- Gateway: `openclaw-gateway@rocky`, aktiv und enabled
- Agentenname: `rocky`
- Namensquelle: `IDENTITY.md`
- `IDENTITY.md`: vorhanden und ausgefüllt
- `SOUL.md`: vorhanden
- Memory: `memory/` vorhanden, `MEMORY.md` wurde bei der Erfassung nicht gefunden
- Brave: kein lokales Brave-Profil gefunden, aber Brave ist in `openclaw.json` aktiviert
- Modelle:
  - Default aus `openclaw.json`: `openai/gpt-5.5`
  - zuletzt beobachtetes Modell in Sessions: `gpt-5.4` über OpenAI
  - Auth-/Provider-Hinweis: `openai`, `openai-codex`
- Hinweis: Default-Modell und zuletzt beobachtetes Modell weichen voneinander ab

#### `rocky` IDENTITY.md (Auszug)
```md
- Name: rocky
- Typ: OpenClaw Agent
- Host: 187.124.191.206
- Gateway-Port: 18990
- Rolle: isolierter Multi-Agent Slot 1
```

### `turyia`
- Linux-Nutzer: `turyia`
- verwendeter Workspace: `/home/turyia/.openclaw/workspace`
- Gateway: `openclaw-gateway@turyia`, aktiv und enabled
- Agentenname: vorläufig offen, `IDENTITY.md` enthält derzeit `Turyia`
- Namensquelle: `IDENTITY.md`, aber die Bezeichnung wurde vom Operator verworfen
- `IDENTITY.md`: vorhanden und ausgefüllt
- `SOUL.md`: vorhanden und stark ausformuliert
- Memory: kein `MEMORY.md`, kein `memory/` gefunden
- Brave: kein lokales Brave-Profil gefunden, aber OpenClaw-Konfiguration enthält Brave-Spuren; belastbarer aktiver Brave-Zugang ist nicht klar
- Modelle:
  - Default aus `openclaw.json`: `openai-codex/gpt-5.5`
  - zuletzt beobachtetes Modell in Sessions: nicht gefunden
  - Auth-/Provider-Hinweis: `openai-codex`
- Hinweis: Die Identität ist deutlich ausgeprägt, aber Sessions lieferten zuletzt kein verwertbares Modellsignal

#### `turyia` IDENTITY.md (Auszug)
```md
- **Name:**
  Turyia
- **Creature:**
  Integrale KI-Begleiterin
- **Vibe:**
  Warm, klar, geerdet, entwicklungsorientiert
- **Emoji:**
  🌀
```
