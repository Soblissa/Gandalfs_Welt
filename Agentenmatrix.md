# Agentenmatrix

Stand: 2026-05-03 UTC

Zentrale Gesamtübersicht über Server, Linux-Nutzer und Agenten.
Die Detaildateien unter `agentenmatrix/` bleiben als technische Quellen erhalten.

## Namenscheck zuerst

- **Server 1 ist jetzt operatorisch geklärt:** `sebastian` läuft als `Bernd`, `user1` als `Chefkoch`, `user2` als `Franks Klaus`.
- **Wichtig für Server 1:** Die Workspaces tragen teils ältere oder abweichende Selbstbeschreibungen (`Cheko`, leere `IDENTITY.md`, altes `Bernd` in `SOUL.md`). Für diese Matrix gilt die aktuelle Operator-Zuordnung plus der verifizierte Live-Betrieb.
- **Turiya-Regel:** Es darf nur eine kanonische `Turiya` geben. Diese Zuordnung liegt auf `turyia` (Server 3). Der frühere Server-2-Eintrag `agent` ist damit ausdrücklich **nicht** `Turiya`.
- **Restore-Historie Server 1:** `user2` war zwischenzeitlich entfernt und wurde aus `/root/agent-cleanup-backups/user2-openclaw-20260503T102637Z.tar.gz` wieder als laufender Agent restauriert.

## Serverübersicht

| Server | Host | IP | Aktive Agenten | Inaktive / Altbestände | Kurznotiz |
|---|---|---|---:|---:|---|
| Server 1 | `sarahserver1` | `147.93.120.51` | 3 | 0 | `Bernd` repariert, `Chefkoch` bereinigt, `Franks Klaus` aus Backup restauriert |
| Server 2 | `sarahserver2` | `89.116.39.197` | 3 | 1 inaktiv | `agent` hat eine zu prüfende Altbezeichnung, `joker` hat klaren Brave-Zugang |
| Server 3 | `sarahserver3` | `187.124.191.206` | 3 | 0 | saubere Dreierbelegung mit `gandalf`, `rocky`, `turyia` |

## Gesamtmatrix

| Server | Linux-Nutzer | Agentenname | Status | Workspace | Memory | Brave | Default-Modell | Zuletzt beobachtet | Hinweise |
|---|---|---|---|---|---|---|---|---|---|
| Server 1 | `sebastian` | `Bernd` | aktiv | `~/.openclaw/workspace_sebastian` | ja | teilweise | `openai/gpt-5.4` | `gpt-5.4` über OpenAI | Anthropic-Billing und `o3-mini`-Fallback aus dem Laufweg entfernt |
| Server 1 | `user1` | `Chefkoch` | aktiv | `~/.openclaw/workspace_hauptagent` | ja | teilweise | `openai/gpt-5.4` | `gpt-5.4` über OpenAI | Workspace nennt ihn aktuell `Cheko (ILA-Hauptagent)`, Portkonflikt auf `19840` bereinigt |
| Server 1 | `user2` | `Franks Klaus` | aktiv, am 2026-05-03 restauriert | `~/.openclaw/workspace` | ja | nein | `openai-codex/gpt-5.4` | `gpt-5.4` über `openai-codex` | aus Backup restauriert, Name folgt Operator + wiederhergestellter Frank-Historie |
| Server 2 | `agent` | offen, nicht `Turiya` | aktiv | `~/.openclaw/workspace` | ja | teilweise | `openai-codex/gpt-5.4` | `gpt-5.4` über `openai-codex` | früherer Turiya-Bezug ist verworfen |
| Server 2 | `joker` | `joker` | aktiv | `~/.openclaw/workspace` | teilweise | ja | `openai-codex/gpt-5.4` | nicht gefunden | klarster Brave-Zugang auf Server 2 |
| Server 2 | `nemo` | `nemo` | instabil / zuletzt `activating` | `~/.openclaw/workspace` | nein | nein | unbekannt | nicht gefunden | Servicezustand wirkte instabil |
| Server 2 | `hiroshi` | `hiroshi` | inaktiv, aber enabled | `~/.openclaw/workspace` | nein | teilweise | unbekannt | nicht gefunden | Altbestand mit vorhandenem Workspace |
| Server 3 | `gandalf` | `gandalf` | aktiv | `~/.openclaw/workspace` | ja | ja | `openai/gpt-5.4` | `gpt-5.4` über OpenAI | lokales Brave-Profil fehlt, OpenClaw-Spuren vorhanden |
| Server 3 | `rocky` | `rocky` | aktiv | `~/.openclaw/workspace` | teilweise | ja | `openai/gpt-5.5` | `gpt-5.4` über OpenAI | Default und beobachtetes Modell weichen ab |
| Server 3 | `turyia` | `Turiya` | aktiv | `~/.openclaw/workspace` | nein | teilweise | `openai-codex/gpt-5.5` | nicht gefunden | einzige kanonische Turiya |

## Serverdetails in Kurzform

### Server 1
- Aktive Agenten: `sebastian` (`Bernd`), `user1` (`Chefkoch`), `user2` (`Franks Klaus`)
- Besonderheit: relevante Identitäten lagen nicht nur im Standard-Workspace, sondern auch in `workspace_sebastian` und `workspace_hauptagent`
- Betriebsnotiz: `Bernd` wurde auf einen funktionierenden OpenAI-Modellpfad umgestellt, `Chefkoch` hatte einen bereinigten Gateway-Portkonflikt, `Franks Klaus` wurde aus dem erhaltenen Backup wieder aktiviert

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
