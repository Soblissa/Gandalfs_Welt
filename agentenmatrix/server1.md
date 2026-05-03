# Agentenmatrix, Server 1

Stand: 2026-05-03 UTC  
Host-Alias: `sarahserver1`

Hinweis: Diese Fassung berücksichtigt nicht nur `~/.openclaw/workspace`, sondern auch alternative Workspace-Pfade wie `~/.openclaw/workspace_hauptagent` und `~/.openclaw/workspace_sebastian`.

## Aktive Agenten

| Linux-Nutzer | Workspace | Agentenname | Namensquelle | Gateway | Memory | Brave-Zugang | Default-Modell | Zuletzt beobachtet | IDENTITY.md | SOUL.md |
|---|---|---|---|---|---|---|---|---|---|---|
| `sebastian` | `~/.openclaw/workspace_sebastian` | `Bernd` | Operator plus `IDENTITY.md` | aktiv | ja | teilweise, Brave-Profil vorhanden, aber keine OpenClaw-Brave-Konfiguration gefunden | `openai/gpt-5.4` | `gpt-5.4` über OpenAI | vorhanden | vorhanden |
| `user1` | `~/.openclaw/workspace_hauptagent` | `Chefkoch` | Operator, Workspace nennt ihn aktuell `Cheko (ILA-Hauptagent)` | aktiv | ja | teilweise, Brave-Profil vorhanden, aber keine aktuelle OpenClaw-Brave-Konfiguration gefunden | `openai/gpt-5.4` | `gpt-5.4` über OpenAI | vorhanden | vorhanden |
| `user2` | `~/.openclaw/workspace` | `Franks Klaus` | Operator plus wiederhergestellte Session-/Repo-Historie | aktiv, restauriert | ja | nein, keine Brave-Konfiguration gefunden | `openai-codex/gpt-5.4` | `gpt-5.4` über `openai-codex` | unvollständig | vorhanden, aber Alttext |

## Details

### `sebastian`
- Linux-Nutzer: `sebastian`
- verwendeter Workspace: `/home/sebastian/.openclaw/workspace_sebastian`
- Gateway: `openclaw-gateway@sebastian`, aktiv und enabled
- Agentenname: `Bernd`
- Namensquelle: Operator plus `IDENTITY.md`
- `IDENTITY.md`: vorhanden und ausgefüllt
- `SOUL.md`: vorhanden
- Memory: installiert, `MEMORY.md` vorhanden
- Brave: Brave-Browser-Profil vorhanden, aber in aktueller OpenClaw-Konfiguration kein Brave-Zugang gefunden
- Modelle:
  - aktuelles Default-Modell nach Reparatur: `openai/gpt-5.4`
  - Fallback nach Reparatur: `openai/gpt-5.1-codex`
  - zuletzt beobachtetes Laufzeitmodell nach Neustart: `gpt-5.4` über OpenAI
  - Auth-/Provider-Hinweis: `openai`, `openai-codex`
- Störungsbild vor der Reparatur: Anthropic-Billing leer, danach fehlerhafter Fallback auf `openai/o3-mini` wegen fehlender OpenAI-Org-Verifikation für reasoning summaries
- Einordnung: `sebastian` ist der laufende `Bernd` auf Server 1

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
- Agentenname: `Chefkoch`
- Namensquelle: Operator, `IDENTITY.md` nennt aktuell `Cheko (ILA-Hauptagent)`
- `IDENTITY.md`: vorhanden und ausgefüllt
- `SOUL.md`: vorhanden
- Memory: installiert, `MEMORY.md` vorhanden
- Brave: Brave-Browser-Profil vorhanden, aber in aktueller OpenClaw-Konfiguration kein Brave-Zugang gefunden
- Modelle:
  - aktuelles Default-Modell: `openai/gpt-5.4`
  - zuletzt beobachtetes Laufzeitmodell nach Neustart: `gpt-5.4` über OpenAI
  - Auth-/Provider-Hinweis: `anthropic`, `openai`
- Hinweis: es gibt eine alte, nicht aktive Datei `openclaw.json.verbastelt` mit Brave-Referenz. Das ist kein belastbarer Nachweis für aktuellen Brave-Zugang.
- Reparatur: alter `openclaw-gateway` blockierte Port `19840`; Altprozess wurde bereinigt und der systemd-Dienst sauber neu gestartet

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

### `user2`
- Linux-Nutzer: `user2`
- verwendeter Workspace: `/home/user2/.openclaw/workspace`
- Gateway: `openclaw-gateway@user2`, aktiv und enabled
- Agentenname: `Franks Klaus`
- Namensquelle: Operator plus wiederhergestellte Session-Historie und Repo `/home/user2/Franks_Klaus`
- `IDENTITY.md`: vorhanden, aber noch unvollständig
- `SOUL.md`: vorhanden, enthält noch alten `Bernd`-Text und muss als Legacy-Spur gelesen werden
- Memory: installiert, `MEMORY.md` vorhanden
- Brave: keine Brave-Konfiguration gefunden
- Modelle:
  - aktuelles Default-Modell: `openai-codex/gpt-5.4`
  - Fallback: `anthropic/claude-sonnet-4-6`
  - zuletzt beobachtetes Laufzeitmodell nach Restore: `gpt-5.4` über `openai-codex`
- Restore-Quelle:
  - `/root/agent-cleanup-backups/user2-openclaw-20260503T102637Z.tar.gz`
- Reparatur: Linux-User, `.openclaw`-Verzeichnis, Laufzeitdateien und Service wurden aus dem Backup wiederhergestellt; zusätzlich wurde die fehlende `openclaw`-Runtime für `user2` rekonstruiert
- Einordnung: `user2` ist jetzt wieder der laufende Agent `Franks Klaus`, auch wenn die alten Workspace-Dateien noch nicht sauber umbenannt sind
