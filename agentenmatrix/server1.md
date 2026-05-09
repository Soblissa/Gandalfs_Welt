# Agentenmatrix, Server 1

Stand: 2026-05-09 UTC  
Host-Alias: `sarahserver1`

Hinweis: Diese Fassung berücksichtigt nicht nur `~/.openclaw/workspace`, sondern auch alternative Workspace-Pfade wie `~/.openclaw/workspace_hauptagent` und `~/.openclaw/workspace_sebastian`.

## Aktive Agenten

| Linux-Nutzer | Workspace | Agentenname | Besitzer | Einsatzfokus | Seele | Namensquelle | Gateway | Memory | Brave-Zugang | Default-Modell | Zuletzt beobachtet | IDENTITY.md | SOUL.md |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| `sebastian` | `~/.openclaw/workspace_sebastian` | `Bernd` | `Sebastian` | fachliche Unterstützung für Sebastian, aktuell ILA-nah | direkt, kompetent, pragmatisch | Operator plus `IDENTITY.md` | aktiv | ja | teilweise, Brave-Profil vorhanden, aber keine OpenClaw-Brave-Konfiguration gefunden | `anthropic/claude-sonnet-4-6` | Default laut `openclaw status`: `claude-sonnet-4-6` | vorhanden | vorhanden |
| `user1` | `~/.openclaw/workspace_hauptagent` | `Chefkoch` | `Sarah` | Hessisches Kultusministerium | strukturiert, präzise, ruhig, direkt | Operator, Workspace nennt ihn aktuell `Cheko (ILA-Hauptagent)` | aktiv | ja | teilweise, Brave-Profil vorhanden, aber keine aktuelle OpenClaw-Brave-Konfiguration gefunden | `anthropic/claude-sonnet-4-6` | Default laut `openclaw status`: `claude-sonnet-4-6` | vorhanden | vorhanden |
| `user2` | `~/.openclaw/workspace` | `Franks Klaus` | `dto / Soblissa` (Kundenfall `Frank Kammerer`) | Franks Klaus, Alpin Invest, KI-Optimierung, Prozesse | fokussiert, direkt, geschäftstauglich | Operator plus wiederhergestellte Session-/Repo-Historie | aktiv, restauriert | ja | nein, keine Brave-Konfiguration gefunden | `anthropic/claude-sonnet-4-6` | Default laut `openclaw status`: `claude-sonnet-4-6` | vorhanden | vorhanden |

## Details

### `sebastian`
- Linux-Nutzer: `sebastian`
- verwendeter Workspace: `/home/sebastian/.openclaw/workspace_sebastian`
- Gateway: `openclaw-gateway@sebastian`, aktiv und enabled
- Agentenname: `Bernd`
- Besitzer: `Sebastian`
- Einsatzfokus: fachliche Unterstützung für Sebastian, aktuell ILA-nah
- Seele: direkt, kompetent, pragmatisch
- Namensquelle: Operator plus `IDENTITY.md`
- `IDENTITY.md`: vorhanden und ausgefüllt
- `SOUL.md`: vorhanden
- Memory: installiert, `MEMORY.md` vorhanden
- Brave: Brave-Browser-Profil vorhanden, aber in aktueller OpenClaw-Konfiguration kein Brave-Zugang gefunden
- Modelle:
  - aktuelles Default-Modell: `anthropic/claude-sonnet-4-6`
  - Fallbacks: `openai/gpt-5.4`, `openai/gpt-5.1-codex`
  - verifiziert per `openclaw status` am 2026-05-09: Default `claude-sonnet-4-6`
  - Auth-/Provider-Hinweis: `anthropic`, `openai`, `openai-codex`
- Historie: vor der Umstellung scheiterte Claude zeitweise an leerem Anthropic-Billing und fiel auf OpenAI zurück
- Claude-Anbindung: am 2026-05-09 wurde `ANTHROPIC_API_KEY` für `sebastian` aktualisiert und `Bernd` wieder auf Claude als Primary umgestellt
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
- Besitzer: `Sarah`
- Einsatzfokus: Hessisches Kultusministerium
- Seele: strukturiert, präzise, ruhig, direkt
- Namensquelle: Operator, `IDENTITY.md` nennt aktuell `Cheko (ILA-Hauptagent)`
- Operator-Hinweis: Fokus für Chefkoch ist aktuell Hessisches Kultusministerium, nicht allgemein ILA-Koordination
- `IDENTITY.md`: vorhanden und ausgefüllt
- `SOUL.md`: vorhanden
- Memory: installiert, `MEMORY.md` vorhanden
- Brave: Brave-Browser-Profil vorhanden, aber in aktueller OpenClaw-Konfiguration kein Brave-Zugang gefunden
- Modelle:
  - aktuelles Default-Modell: `anthropic/claude-sonnet-4-6`
  - Fallback: `openai/gpt-5.4`
  - verifiziert per `openclaw status` am 2026-05-09: Default `claude-sonnet-4-6`
  - Auth-/Provider-Hinweis: `anthropic`, `openai`
- Hinweis: es gibt eine alte, nicht aktive Datei `openclaw.json.verbastelt` mit Brave-Referenz. Das ist kein belastbarer Nachweis für aktuellen Brave-Zugang.
- Reparatur: alter `openclaw-gateway` blockierte Port `19840`; Altprozess wurde bereinigt und der systemd-Dienst sauber neu gestartet
- Claude-Anbindung: am 2026-05-09 wurde `ANTHROPIC_API_KEY` gesetzt und `Chefkoch` wieder auf Claude als Primary umgestellt

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
- Besitzer: `dto / Soblissa` (Kundenfall `Frank Kammerer`)
- Einsatzfokus: Franks Klaus, Alpin Invest, KI-Optimierung, Prozesse
- Seele: fokussiert, direkt, geschäftstauglich
- Namensquelle: Operator plus wiederhergestellte Session-Historie und Repo `/home/user2/Franks_Klaus`
- `IDENTITY.md`: vorhanden und inzwischen passend gefüllt
- `SOUL.md`: vorhanden und auf Franks-Klaus-Kontext bereinigt
- Memory: installiert, `MEMORY.md` vorhanden
- Brave: keine Brave-Konfiguration gefunden
- Modelle:
  - aktuelles Default-Modell: `anthropic/claude-sonnet-4-6`
  - Fallbacks: keine
  - verifiziert per `openclaw status` am 2026-05-09: Default `claude-sonnet-4-6`
  - Auth-/Provider-Hinweis: eigener `ANTHROPIC_API_KEY` in `/etc/openclaw/users/user2.env`, kein OpenAI-Key sichtbar
- Restore-Quelle:
  - `/root/agent-cleanup-backups/user2-openclaw-20260503T102637Z.tar.gz`
- Reparatur: Linux-User, `.openclaw`-Verzeichnis, Laufzeitdateien und Service wurden aus dem Backup wiederhergestellt; zusätzlich wurde die fehlende `openclaw`-Runtime für `user2` rekonstruiert
- Nachbereinigung 2026-05-09: `IDENTITY.md`, `SOUL.md`, `USER.md`, `MEMORY.md` und `AGENTS.md` wurden auf reinen Frank-/Alpin-Invest-Kontext umgestellt; alte Session-Historie wurde archiviert
- Repo-Zugriff: GitHub-SSH für `user2` eingerichtet, Repo `git@github.com:soblissa/Franks_Klaus.git` nach `/home/user2/Franks_Klaus` geklont und verifiziert
- Claude-Anbindung: am 2026-05-09 wurde `user2` auf `anthropic/claude-sonnet-4-6` als Primary ohne Fallback umgestellt und mit eigenem Anthropic-Key versehen
- Einordnung: `user2` ist jetzt wieder der laufende Agent `Franks Klaus` mit bereinigter Persona, funktionierendem Repo-Zugriff und eigener Claude-Abrechnung
