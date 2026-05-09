# Agentenmatrix, Server 2

Stand: 2026-05-09 UTC  
Host-Alias: `sarahserver2`

Hinweis: Diese Fassung berücksichtigt `~/.openclaw/workspace` und `~/.openclaw/workspace_*`. Auf Server 2 waren zum Erfassungszeitpunkt einzelne SSH-Aufrufe instabil. Wo Live-Daten nicht belastbar waren, ist das offen markiert statt geraten. Das betrifft auf Server 2 besonders `Besitzer`, `Einsatzfokus` und `Seele` bei mehreren Alt- oder Randfällen.

## Aktive oder zuletzt aktive Agenten

| Linux-Nutzer | Workspace | Agentenname | Besitzer | Einsatzfokus | Seele | Namensquelle | Gateway | Memory | Brave-Zugang | Default-Modell | Zuletzt beobachtet | IDENTITY.md | SOUL.md |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| `agent` | `~/.openclaw/workspace` | offen, nicht `Turiya` | `Sarah` | Struktur, Orientierung, entwicklungsorientierte Begleitung | warm, klar, geerdet, integrativ | `IDENTITY.md`, aber die frühere Turiya-Zuordnung ist verworfen | aktiv | ja | teilweise, Brave-Profil vorhanden, aber keine OpenClaw-Brave-Konfiguration gefunden | `openai-codex/gpt-5.4` aus `openclaw.json` | `gpt-5.4` über `openai-codex` | vorhanden | vorhanden |
| `joker` | `~/.openclaw/workspace` | `joker` | offen / nicht belastbar | offen / nicht belastbar | nicht belastbar aus Live-Daten | `IDENTITY.md` | aktiv | teilweise, `memory/` vorhanden, kein `MEMORY.md` gefunden | ja, Brave in OpenClaw konfiguriert | `openai-codex/gpt-5.4` aus `openclaw.json` | kein aktuelles Session-Modell gefunden | vorhanden | vorhanden |
| `nemo` | `~/.openclaw/workspace` | `nemo` | offen / nicht belastbar | offen / nicht belastbar | nicht belastbar aus Live-Daten | `IDENTITY.md` | zuletzt `activating`, enabled | nein | nein | unbekannt | kein aktuelles Session-Modell gefunden | vorhanden | vorhanden |

## Inaktive Altbestände

| Linux-Nutzer | Status | Besitzer | Einsatzfokus | Seele | Hinweise |
|---|---|---|---|---|---|
| `hiroshi` | inaktiv, aber enabled | offen / nicht belastbar | offen / nicht belastbar | nicht belastbar aus Live-Daten | Workspace und Identitätsdateien vorhanden, derzeit kein belastbares Modell sichtbar |

## Details

### `agent`
- Linux-Nutzer: `agent`
- verwendeter Workspace: `/home/agent/.openclaw/workspace`
- Gateway: `openclaw-gateway@agent`, aktiv und enabled
- Agentenname: offen, ausdrücklich **nicht** `Turiya`
- Besitzer: `Sarah`
- Einsatzfokus: Struktur, Orientierung, entwicklungsorientierte Begleitung
- Seele: warm, klar, geerdet, integrativ
- Namensquelle: `IDENTITY.md` enthält zwar `Turyia`, die frühere Zuordnung ist aber verworfen
- `IDENTITY.md`: vorhanden und ausgefüllt
- `SOUL.md`: vorhanden und ausgefüllt
- Memory: installiert, `MEMORY.md` und `memory/` vorhanden
- Brave: Brave-Browser-Profil vorhanden, aber in aktueller OpenClaw-Konfiguration kein Brave-Zugang gefunden
- Modelle:
  - Default aus `openclaw.json`: `openai-codex/gpt-5.4`
  - zuletzt beobachtetes Modell in Sessions: `gpt-5.4` über `openai-codex`
  - Auth-/Provider-Hinweis: `openai-codex`
- Hinweis: Linux-Nutzername und bisherige Bezeichnung wichen voneinander ab; der Name ist jetzt bewusst als offen markiert
- Zusatz: Es darf laut Operator nur eine `Turiya` geben, diese liegt nicht auf Server 2

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

### `joker`
- Linux-Nutzer: `joker`
- verwendeter Workspace: `/home/joker/.openclaw/workspace`
- Gateway: `openclaw-gateway@joker`, aktiv und enabled
- Agentenname: `joker`
- Besitzer: aktuell nicht belastbar live ermittelbar
- Einsatzfokus: aktuell nicht belastbar live ermittelbar
- Seele: aktuell nicht belastbar live ermittelbar
- Namensquelle: `IDENTITY.md`
- `IDENTITY.md`: vorhanden und ausgefüllt
- `SOUL.md`: vorhanden
- Memory: `memory/` vorhanden, `MEMORY.md` wurde bei der Erfassung nicht gefunden
- Brave: Brave-Browser-Profil vorhanden und Brave ist in `openclaw.json` als Web-Suche aktiviert
- Modelle:
  - Default aus `openclaw.json`: `openai-codex/gpt-5.4`
  - zuletzt beobachtetes Modell in Sessions: nicht gefunden
  - Auth-/Provider-Hinweis: `openai`, `openai-codex`
- Hinweis: Hier ist Brave als echter OpenClaw-Zugang konfiguriert, anders als bei mehreren anderen Agenten

#### `joker` IDENTITY.md (Auszug)
```md
- Name: joker
- Typ: OpenClaw Agent
- Host: 89.116.39.197
- Gateway-Port: 19949
- Rolle: isolierter Single-Agent Slot 3
```

### `nemo`
- Linux-Nutzer: `nemo`
- verwendeter Workspace: `/home/nemo/.openclaw/workspace`
- Gateway: `openclaw-gateway@nemo`, enabled; bei Direktprüfung zuletzt `activating`
- Agentenname: `nemo`
- Besitzer: aktuell nicht belastbar live ermittelbar
- Einsatzfokus: aktuell nicht belastbar live ermittelbar
- Seele: aktuell nicht belastbar live ermittelbar
- Namensquelle: `IDENTITY.md`
- `IDENTITY.md`: vorhanden und ausgefüllt
- `SOUL.md`: vorhanden
- Memory: kein `MEMORY.md`, kein `memory/` gefunden
- Brave: kein Brave-Profil und keine OpenClaw-Brave-Konfiguration gefunden
- Modelle:
  - Default-Modell: aktuell nicht belastbar ermittelbar
  - zuletzt beobachtetes Modell in Sessions: nicht gefunden
  - Auth-/Provider-Hinweis: keine belastbaren Hinweise gefunden
- Hinweis: Servicezustand wirkte instabil, deshalb bewusst konservativ dokumentiert

#### `nemo` IDENTITY.md (Auszug)
```md
- Name: nemo
- Typ: OpenClaw Agent
- Host: 89.116.39.197
- Gateway-Port: 19948
- Rolle: isolierter Single-Agent Slot 2
```

### `hiroshi` (inaktiv)
- Linux-Nutzer: `hiroshi`
- verwendeter Workspace: `/home/hiroshi/.openclaw/workspace`
- Gateway: `openclaw-gateway@hiroshi`, inactive und enabled
- Agentenname: `hiroshi`
- Besitzer: aktuell nicht belastbar live ermittelbar
- Einsatzfokus: aktuell nicht belastbar live ermittelbar
- Seele: aktuell nicht belastbar live ermittelbar
- Namensquelle: `IDENTITY.md`
- `IDENTITY.md`: vorhanden und ausgefüllt
- `SOUL.md`: vorhanden
- Memory: kein `MEMORY.md`, kein `memory/` gefunden
- Brave: Brave-Browser-Profil vorhanden, aber keine OpenClaw-Brave-Konfiguration gefunden
- Modelle:
  - Default-Modell: aktuell nicht belastbar ermittelbar
  - zuletzt beobachtetes Modell in Sessions: nicht gefunden
  - Auth-/Provider-Hinweis: keine belastbaren Hinweise gefunden

#### `hiroshi` IDENTITY.md (Auszug)
```md
- Name: hiroshi
- Typ: OpenClaw Agent
- Host: 89.116.39.197
- Gateway-Port: 19940
- Rolle: isolierter Single-Agent Slot 1
```

## Zusätzliche Beobachtung
- Unter `/root/.openclaw/agents/main` liegen auf Server 2 zusätzliche Agent-Artefakte ohne klaren eigenen Workspace-Eintrag. Diese sind hier nicht als eigener Agent erfasst.
