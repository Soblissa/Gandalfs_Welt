# Agentenmatrix

Stand: 2026-05-03 UTC

Zentrale Gesamtübersicht über Server, Linux-Nutzer und Agenten.
Die Detaildateien unter `agentenmatrix/` bleiben als technische Quellen erhalten.

## Bernd-Check zuerst

- **Aktiver Bernd:** nur noch `sebastian` auf **Server 1**
- **Workspace:** `/home/sebastian/.openclaw/workspace_sebastian`
- **Status:** Gateway aktiv, Memory vorhanden, `IDENTITY.md` und `SOUL.md` vorhanden
- **Duplikat:** `user2` war ein alter doppelter Bernd-Bestand auf Server 1 und ist **vollständig entfernt**
- **Backup von `user2`:** `/root/agent-cleanup-backups/user2-openclaw-20260503T102637Z.tar.gz`
- **Server 2 / Server 3:** dort ist aktuell **kein Bernd** dokumentiert

## Serverübersicht

| Server | Host | IP | Aktive Agenten | Inaktive / Altbestände | Kurznotiz |
|---|---|---|---:|---:|---|
| Server 1 | `sarahserver1` | `147.93.120.51` | 2 | 1 entfernt | `sebastian` ist der kanonische Bernd, `user1` ist Cheko |
| Server 2 | `sarahserver2` | `89.116.39.197` | 3 | 1 inaktiv | `agent` läuft inhaltlich als Turyia, `joker` hat klaren Brave-Zugang |
| Server 3 | `sarahserver3` | `187.124.191.206` | 3 | 0 | saubere Dreierbelegung mit `gandalf`, `rocky`, `turyia` |

## Gesamtmatrix

| Server | Linux-Nutzer | Agentenname | Status | Workspace | Memory | Brave | Default-Modell | Zuletzt beobachtet | Hinweise |
|---|---|---|---|---|---|---|---|---|---|
| Server 1 | `sebastian` | `Bernd` | aktiv | `~/.openclaw/workspace_sebastian` | ja | teilweise | `gpt-5.1-codex` | `claude-sonnet-4-6` | kanonischer aktiver Bernd |
| Server 1 | `user1` | `Cheko (ILA-Hauptagent)` | aktiv | `~/.openclaw/workspace_hauptagent` | ja | teilweise | `gpt-5.4` | `claude-sonnet-4-6` | Sarahs ILA-Hauptagent |
| Server 1 | `user2` | ehemaliger Bernd-Altbestand | entfernt | gelöscht | nein | nein | - | - | Backup vorhanden |
| Server 2 | `agent` | `Turyia` | aktiv | `~/.openclaw/workspace` | ja | teilweise | `openai-codex/gpt-5.4` | `gpt-5.4` über `openai-codex` | Linux-Username weicht vom Agentennamen ab |
| Server 2 | `joker` | `joker` | aktiv | `~/.openclaw/workspace` | teilweise | ja | `openai-codex/gpt-5.4` | nicht gefunden | klarster Brave-Zugang auf Server 2 |
| Server 2 | `nemo` | `nemo` | instabil / zuletzt `activating` | `~/.openclaw/workspace` | nein | nein | unbekannt | nicht gefunden | Servicezustand wirkte instabil |
| Server 2 | `hiroshi` | `hiroshi` | inaktiv, aber enabled | `~/.openclaw/workspace` | nein | teilweise | unbekannt | nicht gefunden | Altbestand mit vorhandenem Workspace |
| Server 3 | `gandalf` | `gandalf` | aktiv | `~/.openclaw/workspace` | ja | ja | `openai/gpt-5.4` | `gpt-5.4` über OpenAI | lokales Brave-Profil fehlt, OpenClaw-Spuren vorhanden |
| Server 3 | `rocky` | `rocky` | aktiv | `~/.openclaw/workspace` | teilweise | ja | `openai/gpt-5.5` | `gpt-5.4` über OpenAI | Default und beobachtetes Modell weichen ab |
| Server 3 | `turyia` | `Turyia` | aktiv | `~/.openclaw/workspace` | nein | teilweise | `openai-codex/gpt-5.5` | nicht gefunden | starke Identität, aber kein aktuelles Modellsignal |

## Serverdetails in Kurzform

### Server 1
- Aktive Agenten: `sebastian`, `user1`
- Entfernt: `user2`
- Besonderheit: relevante Identitäten lagen nicht nur im Standard-Workspace, sondern auch in `workspace_sebastian` und `workspace_hauptagent`

### Server 2
- Aktive oder zuletzt aktive Agenten: `agent`, `joker`, `nemo`
- Inaktiv: `hiroshi`
- Besonderheit: einzelne SSH-Aufrufe waren während der Erfassung instabil, daher sind einige Modellfelder bewusst konservativ dokumentiert

### Server 3
- Aktive Agenten: `gandalf`, `rocky`, `turyia`
- Besonderheit: keine alternativen Workspace-Namen gefunden, alle drei laufen im Standardpfad

## Detailquellen

- `agentenmatrix/server1.md`
- `agentenmatrix/server1.yaml`
- `agentenmatrix/server2.md`
- `agentenmatrix/server2.yaml`
- `agentenmatrix/server3.md`
- `agentenmatrix/server3.yaml`
