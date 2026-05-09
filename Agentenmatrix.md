# Agentenmatrix

Stand: 2026-05-09 UTC

Zentrale Gesamtübersicht über Server, Linux-Nutzer und Agenten.
Die Detaildateien unter `agentenmatrix/` bleiben als technische Quellen erhalten.

## Namenscheck zuerst

- **Server 1 ist jetzt operatorisch geklärt:** `sebastian` läuft als `Bernd`, `user1` als `Chefkoch`, `user2` als `Franks Klaus`.
- **Wichtig für Server 1:** Die Workspaces tragen teils ältere oder abweichende Selbstbeschreibungen (`Cheko`, leere `IDENTITY.md`, altes `Bernd` in `SOUL.md`). Für diese Matrix gilt die aktuelle Operator-Zuordnung plus der verifizierte Live-Betrieb.
- **Turiya-Regel:** Es darf nur eine kanonische `Turiya` geben. Diese Zuordnung liegt auf `turyia` (Server 3). Der frühere Server-2-Eintrag `agent` ist damit ausdrücklich **nicht** `Turiya`.
- **Restore-Historie Server 1:** `user2` war zwischenzeitlich entfernt und wurde aus `/root/agent-cleanup-backups/user2-openclaw-20260503T102637Z.tar.gz` wieder als laufender Agent restauriert.
- **Live-Update 2026-05-09:** `Chefkoch` läuft jetzt wieder mit Claude als Primary, `Franks Klaus` wurde im Workspace auf reinen Frank-/Alpin-Invest-Kontext bereinigt.
- **Spaltenlogik:** `Besitzer` meint den primären menschlichen Owner laut `USER.md` oder klarer Operator-Zuordnung. `Seele` ist eine knappe Verdichtung aus `SOUL.md` und, falls nötig, `IDENTITY.md`.

## Serverübersicht

| Server | Host | IP | Aktive Agenten | Inaktive / Altbestände | Kurznotiz |
|---|---|---|---:|---:|---|
| Server 1 | `sarahserver1` | `147.93.120.51` | 3 | 0 | `Bernd` und `Chefkoch` auf Claude, `Franks Klaus` fachlich bereinigt |
| Server 2 | `sarahserver2` | `89.116.39.197` | 3 | 1 inaktiv | `agent` ist ausdrücklich nicht `Turiya`, `joker` hat den klarsten Brave-Zugang |
| Server 3 | `sarahserver3` | `187.124.191.206` | 3 | 0 | saubere Dreierbelegung mit `gandalf`, `rocky`, `Turiya` |

## Gesamtmatrix

| Server | Linux-Nutzer | Agentenname | Status | Besitzer | Einsatzfokus | Seele | Workspace | Memory | Brave | Default-Modell | Zuletzt beobachtet | Hinweise |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
| Server 1 | `sebastian` | `Bernd` | aktiv | `Sebastian` | fachliche Unterstützung für Sebastian, aktuell ILA-nah | direkt, kompetent, pragmatisch | `~/.openclaw/workspace_sebastian` | ja | teilweise | `anthropic/claude-sonnet-4-6` | Default laut `openclaw status`: `claude-sonnet-4-6` | Claude-Anbindung am 2026-05-09 erneuert |
| Server 1 | `user1` | `Chefkoch` | aktiv | `Sarah` | Hessisches Kultusministerium | strukturiert, präzise, ruhig, direkt | `~/.openclaw/workspace_hauptagent` | ja | teilweise | `anthropic/claude-sonnet-4-6` | Default laut `openclaw status`: `claude-sonnet-4-6` | Workspace nennt ihn aktuell `Cheko`, Operator-Fokus jetzt Hessisches Kultusministerium, Claude-Anbindung am 2026-05-09 erneuert |
| Server 1 | `user2` | `Franks Klaus` | aktiv, am 2026-05-03 restauriert | `dto / Soblissa` (Kundenfall `Frank Kammerer`) | Franks Klaus, Alpin Invest, KI-Optimierung, Prozesse | fokussiert, direkt, geschäftstauglich | `~/.openclaw/workspace` | ja | nein | `openai-codex/gpt-5.4` | `gpt-5.4` über `openai-codex` | Persona am 2026-05-09 bereinigt, Repo-Zugriff aktiv |
| Server 2 | `agent` | offen, nicht `Turiya` | aktiv | `Sarah` | Struktur, Orientierung, entwicklungsorientierte Begleitung | warm, klar, geerdet, integrativ | `~/.openclaw/workspace` | ja | teilweise | `openai-codex/gpt-5.4` | `gpt-5.4` über `openai-codex` | früherer Turiya-Bezug ist verworfen |
| Server 2 | `joker` | `joker` | aktiv | offen / nicht belastbar | offen / nicht belastbar | nicht belastbar aus Live-Daten | `~/.openclaw/workspace` | teilweise | ja | `openai-codex/gpt-5.4` | nicht gefunden | klarster Brave-Zugang auf Server 2 |
| Server 2 | `nemo` | `nemo` | instabil / zuletzt `activating` | offen / nicht belastbar | offen / nicht belastbar | nicht belastbar aus Live-Daten | `~/.openclaw/workspace` | nein | nein | unbekannt | nicht gefunden | Servicezustand wirkte instabil |
| Server 2 | `hiroshi` | `hiroshi` | inaktiv, aber enabled | offen / nicht belastbar | offen / nicht belastbar | nicht belastbar aus Live-Daten | `~/.openclaw/workspace` | nein | teilweise | unbekannt | nicht gefunden | Altbestand mit vorhandenem Workspace |
| Server 3 | `gandalf` | `gandalf` | aktiv | `dto` | technische Assistenz, Server- und Repoarbeit | technisch präzise, direkt, ruhig | `~/.openclaw/workspace` | ja | ja | `openai/gpt-5.4` | `gpt-5.4` über OpenAI | lokales Brave-Profil fehlt, OpenClaw-Spuren vorhanden |
| Server 3 | `rocky` | `rocky` | aktiv | `dto` | allgemeine technische Assistenz im Slot 1 | technisch präzise, direkt, ruhig | `~/.openclaw/workspace` | teilweise | ja | `openai/gpt-5.5` | `gpt-5.4` über OpenAI | Default und beobachtetes Modell weichen ab |
| Server 3 | `turyia` | `Turiya` | aktiv | `dto` | integrative Begleitung, Klarheit, Entwicklungsorientierung | warm, direkt, klar, integrativ | `~/.openclaw/workspace` | nein | teilweise | `openai-codex/gpt-5.5` | nicht gefunden | einzige kanonische Turiya |

## Serverdetails in Kurzform

### Server 1
- Aktive Agenten: `sebastian` (`Bernd`), `user1` (`Chefkoch`), `user2` (`Franks Klaus`)
- Besonderheit: relevante Identitäten lagen nicht nur im Standard-Workspace, sondern auch in `workspace_sebastian` und `workspace_hauptagent`
- Betriebsnotiz: `Bernd` und `Chefkoch` laufen seit 2026-05-09 wieder mit Claude als Primary, `Franks Klaus` wurde fachlich bereinigt und aus dem erhaltenen Backup aktiviert

### Server 2
- Aktive oder zuletzt aktive Agenten: `agent`, `joker`, `nemo`
- Inaktiv: `hiroshi`
- Besonderheit: einzelne SSH-Aufrufe waren während der Erfassung instabil, daher sind einige Modell- und Owner-Felder auf Server 2 bewusst konservativ dokumentiert

### Server 3
- Aktive Agenten: `gandalf`, `rocky`, `turyia`
- Besonderheit: keine alternativen Workspace-Namen gefunden, alle drei laufen im Standardpfad; `Turiya` auf Server 3 bleibt die einzige kanonische Turiya

## Detailquellen

- `agentenmatrix/server1.md`
- `agentenmatrix/server1.yaml`
- `agentenmatrix/server2.md`
- `agentenmatrix/server2.yaml`
- `agentenmatrix/server3.md`
- `agentenmatrix/server3.yaml`
