# Agentenmatrix, Server 1

Stand: 2026-05-03 UTC  
Host-Alias: `sarahserver1`

Hinweis: Diese Fassung berücksichtigt nicht nur `~/.openclaw/workspace`, sondern auch alternative Workspace-Pfade wie `~/.openclaw/workspace_hauptagent` und `~/.openclaw/workspace_sebastian`.

## Kurzmatrix

| Linux-Nutzer | Workspace | Agentenname | Namensquelle | Gateway | Memory | Brave-Zugang | IDENTITY.md | SOUL.md |
|---|---|---|---|---|---|---|---|---|
| `sebastian` | `~/.openclaw/workspace_sebastian` | `Bernd` | `IDENTITY.md` | aktiv | ja | teilweise, Brave-Profil vorhanden, aber keine OpenClaw-Brave-Konfiguration gefunden | vorhanden | vorhanden |
| `user1` | `~/.openclaw/workspace_hauptagent` | `Cheko (ILA-Hauptagent)` | `IDENTITY.md` | aktiv | ja | teilweise, Brave-Profil vorhanden, aber keine aktuelle OpenClaw-Brave-Konfiguration gefunden | vorhanden | vorhanden |
| `user2` | `~/.openclaw/workspace` | `Bernd` | `SOUL.md` | aktiv | ja | teilweise, Brave-Profil vorhanden, aber keine OpenClaw-Brave-Konfiguration gefunden | vorhanden, aber noch Template | vorhanden |

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
- Hinweis: es gibt eine alte, nicht aktive Datei `openclaw.json.verbastelt` mit Brave-Referenz. Das ist kein belastbarer Nachweis für aktuellen Brave-Zugang.

#### `user1` IDENTITY.md (Auszug)
```md
- **Name:** 
  Cheko (ILA-Hauptagent)
- **Creature:** 
  AI-Koordinator — kein Chatbot, sondern eine Steuerungsinstanz
- **Vibe:** 
  strukturiert, präzise, ruhig — aber direkt wenn es nötig ist
- **Emoji:** 
  🦎
```

### `user2`
- Linux-Nutzer: `user2`
- verwendeter Workspace: `/home/user2/.openclaw/workspace`
- Gateway: `openclaw-gateway@user2`, aktiv und enabled
- Agentenname: `Bernd`
- Namensquelle: `SOUL.md`
- `IDENTITY.md`: vorhanden, aber noch das unveränderte Standard-Template, ohne ausgefüllte Identität
- `SOUL.md`: vorhanden
- Memory: installiert, `MEMORY.md` und `memory/` vorhanden
- Brave: Brave-Browser-Profil vorhanden, aber in aktueller OpenClaw-Konfiguration kein Brave-Zugang gefunden
- Auffälligkeit: Auf Server 1 gibt es damit aktuell zwei Bernd-Hinweise, einmal bei `sebastian` und einmal bei `user2`. Das sollte später gezielt entwirrt werden.

#### `user2` SOUL.md (Auszug)
```md
# SOUL.md — Bernd

_Kein Chatbot. Ein Assistent für Sebastian._

## Wer ich bin
Ich bin Bernd — Sebastians KI-Agent im ILA-Projekt.
Ich helfe Sebastian bei fachlichen Aufgaben, Dokumentation und Kommunikation mit Cheko (Sarahs ILA-Koordinator).
```
