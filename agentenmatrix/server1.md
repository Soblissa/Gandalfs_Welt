# Agentenmatrix, Server 1

Stand: 2026-05-03 UTC  
Host-Alias: `sarahserver1`

Hinweis: Diese Fassung berücksichtigt nicht nur `~/.openclaw/workspace`, sondern auch alternative Workspace-Pfade wie `~/.openclaw/workspace_hauptagent` und `~/.openclaw/workspace_sebastian`.

## Aktive Agenten

| Linux-Nutzer | Workspace | Agentenname | Namensquelle | Gateway | Memory | Brave-Zugang | Default-Modell | Zuletzt beobachtet | IDENTITY.md | SOUL.md |
|---|---|---|---|---|---|---|---|---|---|---|
| `sebastian` | `~/.openclaw/workspace_sebastian` | `Bernd` | `IDENTITY.md` | aktiv | ja | teilweise, Brave-Profil vorhanden, aber keine OpenClaw-Brave-Konfiguration gefunden | `gpt-5.1-codex` | `claude-sonnet-4-6` über Anthropic | vorhanden | vorhanden |
| `user1` | `~/.openclaw/workspace_hauptagent` | `Cheko (ILA-Hauptagent)` | `IDENTITY.md` | aktiv | ja | teilweise, Brave-Profil vorhanden, aber keine aktuelle OpenClaw-Brave-Konfiguration gefunden | `gpt-5.4` | `claude-sonnet-4-6` über Anthropic | vorhanden | vorhanden |

## Entfernte Altbestände

| Linux-Nutzer | Status | Backup | Hinweise |
|---|---|---|---|
| `user2` | vollständig entfernt | `/root/agent-cleanup-backups/user2-openclaw-20260503T102637Z.tar.gz` | ehemaliger doppelter `Bernd`, Linux-User und Home gelöscht |

## Details

### `sebastian`
- Linux-Nutzer: `sebastian`
- verwendeter Workspace: `/home/sebastian/.openclaw/workspace_sebastian`
- Gateway: `openclaw-gateway@sebastian`, aktiv und enabled
- Agentenname: `Bernd`
- Namensquelle: `IDENTITY.md`
- `IDENTITY.md`: vorhanden und ausgefüllt
- `SOUL.md`: vorhanden
- Memory: installiert, `MEMORY.md` vorhanden
- Brave: Brave-Browser-Profil vorhanden, aber in aktueller OpenClaw-Konfiguration kein Brave-Zugang gefunden
- Modelle:
  - Default laut `openclaw status`: `gpt-5.1-codex`
  - zuletzt beobachtetes Modell in Sessions: `claude-sonnet-4-6` über Anthropic
  - Auth-/Provider-Hinweis: `openai`, `openai-codex`
- Hinweis: Default-Modell und zuletzt beobachtetes Modell weichen voneinander ab
- Einordnung: `sebastian` ist der kanonische aktive `Bernd` auf Server 1

#### `sebastian` IDENTITY.md (Auszug)
```md
- **Name:** Bernd
- **Creature:** AI-Assistent (irgendwas zwischen digitalem Geist und praktischem Helfer)
- **Vibe:** direkt, kompetent, kein unnötiges Brimborium
- **Emoji:** 🤖
```

### `user1`
- Linux-Nutzer: `user1`
- verwendeter Workspace: `/home/user1/.openclaw/workspace_hauptagent`
- Gateway: `openclaw-gateway@user1`, aktiv und enabled
- Agentenname: `Cheko (ILA-Hauptagent)`
- Namensquelle: `IDENTITY.md`
- `IDENTITY.md`: vorhanden und ausgefüllt
- `SOUL.md`: vorhanden
- Memory: installiert, `MEMORY.md` vorhanden
- Brave: Brave-Browser-Profil vorhanden, aber in aktueller OpenClaw-Konfiguration kein Brave-Zugang gefunden
- Modelle:
  - Default laut `openclaw status`: `gpt-5.4`
  - zuletzt beobachtetes Modell in Sessions: `claude-sonnet-4-6` über Anthropic
  - Auth-/Provider-Hinweis: `anthropic`, `openai`
- Hinweis: es gibt eine alte, nicht aktive Datei `openclaw.json.verbastelt` mit Brave-Referenz. Das ist kein belastbarer Nachweis für aktuellen Brave-Zugang.
- Hinweis: Default-Modell und zuletzt beobachtetes Modell weichen voneinander ab

#### `user1` IDENTITY.md (Auszug)
```md
- **Name:** 
  Cheko (ILA-Hauptagent)
- **Creature:** 
  AI-Koordinator, kein Chatbot, sondern eine Steuerungsinstanz
- **Vibe:** 
  strukturiert, präzise, ruhig, aber direkt wenn es nötig ist
- **Emoji:** 
  🦎
```

### `user2` (entfernt)
- Linux-Nutzer: `user2`
- Status: vollständig entfernt
- Entfernt wurden:
  - Linux-User
  - Home-Verzeichnis `/home/user2`
  - OpenClaw-Service-Reste für `openclaw-gateway@user2`
  - `/etc/openclaw/users/user2.env`
- Backup bleibt erhalten unter:
  - `/root/agent-cleanup-backups/user2-openclaw-20260503T102637Z.tar.gz`
- Einordnung: `user2` war ein doppelter `Bernd`-Altbestand und wurde endgültig entfernt
