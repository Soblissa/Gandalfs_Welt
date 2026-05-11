# Agentenmatrix, Server 2

Stand: 2026-05-11 UTC  
Host-Alias: `sarahserver2`

Hinweis: Diese Fassung bildet den **heutigen Live-Zustand** ab. Am 2026-05-11 war auf Server 2 nur noch **eine** laufende OpenClaw-Instanz unter dem Linux-Nutzer `agent` belastbar vorhanden. Nach Operator-Klarstellung ist das **kein echter Agentenname**, sondern nur ein technischer Nutzer-/Dienstname. Frühere Einträge zu `joker`, `nemo` und `hiroshi` ließen sich live nicht mehr als aktuelle Linux-Nutzer oder aktive OpenClaw-Installationen bestätigen.

## Aktive Agenten

| Linux-Nutzer | Workspace | Agentenname | Besitzer | Einsatzfokus | Seele | Namensquelle | Gateway | Memory | Brave-Zugang | Default-Modell | Zuletzt beobachtet | IDENTITY.md | SOUL.md |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| `agent` | `~/.openclaw/workspace` | kein gültiger Agentenname, nur technischer Nutzer | `Sarah` | Struktur, Orientierung, entwicklungsorientierte Begleitung | warm, klar, geerdet, integrativ | alte `IDENTITY.md`, frühere Turiya-Zuordnung verworfen | aktiv | ja | teilweise, Brave-Profil vorhanden, aber keine belastbare aktive OpenClaw-Brave-Nutzung belegt | `openai-codex/gpt-5.4` aus `openclaw.json` | `gpt-5.4` über `openai-codex` | vorhanden | vorhanden |

## Details

### Linux-Nutzer `agent` (technische Restinstanz, kein Agentenname)
- Linux-Nutzer: `agent`
- verwendeter Workspace: `/home/agent/.openclaw/workspace`
- Gateway: `openclaw-gateway@agent`, aktiv und enabled
- Agentenname: **kein gültiger Agentenname**; `agent` ist hier nur der Linux-/Dienstname
- Besitzer: `Sarah`
- Einsatzfokus: Struktur, Orientierung, entwicklungsorientierte Begleitung
- Seele: warm, klar, geerdet, integrativ
- Namensquelle: `IDENTITY.md` enthält historisch `Turyia`, diese Zuordnung ist aber verworfen
- `IDENTITY.md`: vorhanden und ausgefüllt
- `SOUL.md`: vorhanden und ausgefüllt
- Memory: `MEMORY.md` und `memory/` vorhanden
- Modelle:
  - Default aus `openclaw.json`: `openai-codex/gpt-5.4`
  - zuletzt beobachtetes Modell in Sessions: `gpt-5.4` über `openai-codex`
  - Auth-/Provider-Hinweis: `openai-codex`
- Telegram: Bot zuletzt als `@VvTD01Bot` beobachtet
- Live-Fix 2026-05-11: ein alter zusätzlicher **User-Systemd-Gateway** (`/home/agent/.config/systemd/user/openclaw-gateway.service`) wurde deaktiviert, weil er parallel zum eigentlichen `openclaw-gateway@agent` pollte und so die wiederkehrenden `getUpdates`-`409 Conflict`-Fehler verursachte
- Ergebnis nach Fix: nur noch ein Gateway-Prozess aktiv, der 409-Konflikt verschwand in der Nachprüfung
- Zusatz: Es darf laut Operator nur eine kanonische `Turiya` geben, diese liegt nicht auf Server 2
- Operator-Klarstellung 2026-05-11: **„es gibt keinen Agent“**. Entsprechend wird `agent` nur noch als technischer Restname behandelt, nicht als fachlicher Agenteneintrag

#### `agent` IDENTITY.md (Auszug)
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

## Historische, aber aktuell nicht live bestätigte Altbestände

Am 2026-05-11 konnten die früher dokumentierten Server-2-Nutzer `joker`, `nemo` und `hiroshi` **nicht** mehr als aktuelle Linux-Nutzer nachgewiesen werden. Entsprechend gab es für diese Namen auch keine belastbaren `~/.openclaw`-Bestände oder laufenden `openclaw-gateway@…`-Dienste mehr.
