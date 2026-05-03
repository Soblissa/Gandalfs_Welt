# Agentenmatrix, Server 1

Stand: 2026-05-03 UTC  
Host-Alias: `sarahserver1`

## Kurzmatrix

| Linux-Nutzer | Agentenname | Namensquelle | Gateway | Memory | Brave-Zugang | IDENTITY.md | SOUL.md |
|---|---|---|---|---|---|---|---|
| `sebastian` | unbekannt | keine dokumentierte Zuordnung in `IDENTITY.md`/`SOUL.md` | aktiv | nein | teilweise, Brave-Profil vorhanden, aber keine OpenClaw-Brave-Konfiguration gefunden | fehlt | fehlt |
| `user1` | unbekannt | keine dokumentierte Zuordnung in `IDENTITY.md`/`SOUL.md` | aktiv | nein | teilweise, Brave-Profil vorhanden, aber keine aktuelle OpenClaw-Brave-Konfiguration gefunden | fehlt | fehlt |
| `user2` | `Bernd` | `SOUL.md` | aktiv | ja | teilweise, Brave-Profil vorhanden, aber keine OpenClaw-Brave-Konfiguration gefunden | vorhanden, aber noch Template | vorhanden |

## Details

### `sebastian`
- Linux-Nutzer: `sebastian`
- Gateway: `openclaw-gateway@sebastian`, aktiv und enabled
- Agentenname: nicht über `IDENTITY.md` oder `SOUL.md` dokumentiert
- `IDENTITY.md`: nicht vorhanden
- `SOUL.md`: nicht vorhanden
- Memory: nicht installiert, weder `MEMORY.md` noch `memory/` gefunden
- Brave: Brave-Browser-Profil vorhanden, aber in aktueller OpenClaw-Konfiguration kein Brave-Zugang gefunden

### `user1`
- Linux-Nutzer: `user1`
- Gateway: `openclaw-gateway@user1`, aktiv und enabled
- Agentenname: nicht über `IDENTITY.md` oder `SOUL.md` dokumentiert
- `IDENTITY.md`: nicht vorhanden
- `SOUL.md`: nicht vorhanden
- Memory: nicht installiert, weder `MEMORY.md` noch `memory/` gefunden
- Brave: Brave-Browser-Profil vorhanden, aber in aktueller OpenClaw-Konfiguration kein Brave-Zugang gefunden
- Hinweis: es gibt eine alte, nicht aktive Datei `openclaw.json.verbastelt` mit Brave-Referenz. Das ist kein belastbarer Nachweis für aktuellen Brave-Zugang.

### `user2`
- Linux-Nutzer: `user2`
- Gateway: `openclaw-gateway@user2`, aktiv und enabled
- Agentenname: `Bernd`
- Namensquelle: `SOUL.md`
- `IDENTITY.md`: vorhanden, aber noch das unveränderte Standard-Template, ohne ausgefüllte Identität
- `SOUL.md`: vorhanden
- Memory: installiert, `MEMORY.md` und `memory/` vorhanden
- Brave: Brave-Browser-Profil vorhanden, aber in aktueller OpenClaw-Konfiguration kein Brave-Zugang gefunden

#### `user2` SOUL.md (Auszug)
```md
# SOUL.md — Bernd

_Kein Chatbot. Ein Assistent für Sebastian._

## Wer ich bin
Ich bin Bernd — Sebastians KI-Agent im ILA-Projekt.
Ich helfe Sebastian bei fachlichen Aufgaben, Dokumentation und Kommunikation mit Cheko (Sarahs ILA-Koordinator).
```

#### `user2` IDENTITY.md, Status
Vorhanden, aber noch unbefüllt. Aktuell steht dort nur das Standard-Template (`Name`, `Creature`, `Vibe`, `Emoji`, `Avatar`).
