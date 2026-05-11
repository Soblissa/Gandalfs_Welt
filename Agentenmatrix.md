# Agentenmatrix

Stand: 2026-05-11 UTC

Zentrale Gesamtübersicht über Server, Linux-Nutzer und Agenten.
Die Detaildateien unter `agentenmatrix/` bleiben als technische Quellen erhalten.

## Namenscheck zuerst

- **Server 1 ist jetzt operatorisch geklärt:** `sebastian` läuft als `Bernd`, `user1` als `Chefkoch`, `user2` als `Franks Klaus`.
- **Wichtig für Server 1:** Die Workspaces tragen teils ältere oder abweichende Selbstbeschreibungen (`Cheko`, leere `IDENTITY.md`, altes `Bernd` in `SOUL.md`). Für diese Matrix gilt die aktuelle Operator-Zuordnung plus der verifizierte Live-Betrieb.
- **Turiya-Regel:** Es gibt genau eine kanonische `Turiya`. Seit Operator-Entscheidung vom 2026-05-11 liegt diese auf **Server 2** unter dem Linux-Nutzer `agent`.
- **Restore-Historie Server 1:** `user2` war zwischenzeitlich entfernt und wurde aus `/root/agent-cleanup-backups/user2-openclaw-20260503T102637Z.tar.gz` wieder als laufender Agent restauriert.
- **Live-Update 2026-05-09:** `Chefkoch` und `Franks Klaus` laufen jetzt mit Claude als Primary, `Franks Klaus` wurde im Workspace auf reinen Frank-/Alpin-Invest-Kontext bereinigt.
- **Live-Update 2026-05-11:** Server 2 wurde auf einen einzelnen Gateway unter dem Linux-Nutzer `agent` bereinigt, wodurch der Telegram-`409 getUpdates`-Konflikt verschwand. Danach wurde die kanonische **Turiya vollständig auf Server 2 gelegt**, inklusive Perplexity-Websuche und Modellangleichung auf `openai-codex/gpt-5.5`. Der frühere Turiya-Slot auf Server 3 wurde deaktiviert und als Archivslot markiert.
- **Spaltenlogik:** `Besitzer` meint den primären menschlichen Owner laut `USER.md` oder klarer Operator-Zuordnung. `Seele` ist eine knappe Verdichtung aus `SOUL.md` und, falls nötig, `IDENTITY.md`.

## Serverübersicht

| Server | Host | IP | Aktive Agenten | Inaktive / Altbestände | Kurznotiz |
|---|---|---|---:|---:|---|
| Server 1 | `sarahserver1` | `147.93.120.51` | 3 | 0 | `Bernd`, `Chefkoch` und `Franks Klaus` auf Claude, `Franks Klaus` fachlich bereinigt |
| Server 2 | `sarahserver2` | `89.116.39.197` | 1 | 0 live | kanonische `Turiya` läuft hier unter dem Linux-Nutzer `agent`, inklusive Perplexity als Recherche-Layer |
| Server 3 | `sarahserver3` | `187.124.191.206` | 2 | 1 Archivslot | `gandalf` und `rocky` aktiv; der frühere `turyia`-Slot ist deaktiviert und nicht mehr kanonisch |

## Gesamtmatrix

| Server | Linux-Nutzer | Agentenname | Status | Besitzer | Einsatzfokus | Seele | Workspace | Memory | Brave | Default-Modell | Zuletzt beobachtet | Hinweise |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
| Server 1 | `sebastian` | `Bernd` | aktiv | `Sebastian` | fachliche Unterstützung für Sebastian, aktuell ILA-nah | direkt, kompetent, pragmatisch | `~/.openclaw/workspace_sebastian` | ja | teilweise | `anthropic/claude-sonnet-4-6` | Default laut `openclaw status`: `claude-sonnet-4-6` | Claude-Anbindung am 2026-05-09 erneuert |
| Server 1 | `user1` | `Chefkoch` | aktiv | `Sarah` | Hessisches Kultusministerium | strukturiert, präzise, ruhig, direkt | `~/.openclaw/workspace_hauptagent` | ja | teilweise | `anthropic/claude-sonnet-4-6` | Default laut `openclaw status`: `claude-sonnet-4-6` | Workspace nennt ihn aktuell `Cheko`, Operator-Fokus jetzt Hessisches Kultusministerium, Claude-Anbindung am 2026-05-09 erneuert |
| Server 1 | `user2` | `Franks Klaus` | aktiv, am 2026-05-03 restauriert | `dto / Soblissa` (Kundenfall `Frank Kammerer`) | Franks Klaus, Alpin Invest, KI-Optimierung, Prozesse | fokussiert, direkt, geschäftstauglich | `~/.openclaw/workspace` | ja | nein | `anthropic/claude-sonnet-4-6` | Default laut `openclaw status`: `claude-sonnet-4-6` | Persona am 2026-05-09 bereinigt, Repo-Zugriff aktiv, eigener Claude-Key seit 2026-05-09 |
| Server 2 | `agent` | `Turiya` | aktiv | `Sarah` | integrative Begleitung, Klarheit, Entwicklungsorientierung | warm, klar, geerdet, entwicklungsorientiert | `~/.openclaw/workspace` | ja | teilweise | `openai-codex/gpt-5.5` | `gpt-5.5` über `openai-codex` | Linux-Nutzer heißt technisch `agent`, kanonische Turiya liegt seit 2026-05-11 hier, Perplexity-Websuche aktiv |
| Server 3 | `gandalf` | `gandalf` | aktiv | `dto` | technische Assistenz, Server- und Repoarbeit | technisch präzise, direkt, ruhig | `~/.openclaw/workspace` | ja | ja | `openai/gpt-5.4` | `gpt-5.4` über OpenAI | lokales Brave-Profil fehlt, OpenClaw-Spuren vorhanden |
| Server 3 | `rocky` | `rocky` | aktiv | `dto` | allgemeine technische Assistenz im Slot 1 | technisch präzise, direkt, ruhig | `~/.openclaw/workspace` | teilweise | ja | `openai/gpt-5.5` | `gpt-5.4` über OpenAI | Default und beobachtetes Modell weichen ab |
| Server 3 | `turyia` | Archivslot Server 3 | deaktiviert | `dto` | Reserve- bzw. Umwidmungsslot | neutral, nicht Turiya | `~/.openclaw/workspace` | nein | nein | `openai-codex/gpt-5.5` | zuletzt `gpt-5.5` über `openai-codex` | Dienst deaktiviert, Perplexity-Key entfernt, nicht mehr kanonisch |

## Serverdetails in Kurzform

### Server 1
- Aktive Agenten: `sebastian` (`Bernd`), `user1` (`Chefkoch`), `user2` (`Franks Klaus`)
- Besonderheit: relevante Identitäten lagen nicht nur im Standard-Workspace, sondern auch in `workspace_sebastian` und `workspace_hauptagent`
- Betriebsnotiz: `Bernd`, `Chefkoch` und `Franks Klaus` laufen seit 2026-05-09 mit Claude als Primary, `Franks Klaus` wurde fachlich bereinigt und aus dem erhaltenen Backup aktiviert

### Server 2
- Aktive Agentin: `Turiya` unter dem Linux-Nutzer `agent`
- Besonderheit: Ein zusätzlicher alter User-Systemd-Gateway für `agent` wurde am 2026-05-11 deaktiviert; damit verschwand der wiederkehrende Telegram-`409 getUpdates`-Konflikt
- Betriebsnotiz 2026-05-11: Turiya wurde vollständig nach Server 2 gelegt, inklusive Perplexity-Websuche und Modell auf `openai-codex/gpt-5.5`
- Live-Hinweis: Die früher dokumentierten Nutzer `joker`, `nemo` und `hiroshi` waren am 2026-05-11 nicht mehr als aktuelle Linux-Nutzer vorhanden

### Server 3
- Aktive Agenten: `gandalf`, `rocky`
- Archivslot: `turyia`
- Besonderheit: keine alternativen Workspace-Namen gefunden, alle drei laufen im Standardpfad
- Betriebsnotiz 2026-05-11: Der frühere Turiya-Slot auf Server 3 wurde deaktiviert, Perplexity dort entfernt und die Identität als nicht kanonischer Archivslot markiert

## Detailquellen

- `agentenmatrix/server1.md`
- `agentenmatrix/server1.yaml`
- `agentenmatrix/server2.md`
- `agentenmatrix/server2.yaml`
- `agentenmatrix/server3.md`
- `agentenmatrix/server3.yaml`
