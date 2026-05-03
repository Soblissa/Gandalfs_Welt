# Agentenmatrix

Zentrale, erweiterbare Übersicht über Agenten, technische Nutzer und Basisfähigkeiten.

## Struktur
- `server1.md`: menschenlesbare Übersicht für Server 1
- `server1.yaml`: strukturierte Datenquelle für spätere Erweiterung und Automatisierung

## Erweiterung
Pro Server weitere Dateien nach demselben Muster anlegen:
- `server2.md`
- `server2.yaml`
- `server3.md`
- `server3.yaml`

## Erfassungsregel für Workspace-Dateien
Nicht nur `~/.openclaw/workspace` prüfen.

Für die Agentenmatrix müssen alle plausiblen Workspace-Pfade berücksichtigt werden, insbesondere:
- `~/.openclaw/workspace`
- `~/.openclaw/workspace_*`

Beispiele:
- `~/.openclaw/workspace_hauptagent`
- `~/.openclaw/workspace_sebastian`

## Regel für Agentennamen und Metadaten
1. Alle `workspace*`-Verzeichnisse unter `~/.openclaw/` suchen.
2. Darin `IDENTITY.md`, `SOUL.md`, `MEMORY.md` und `memory/` prüfen.
3. Agentennamen bevorzugt aus `IDENTITY.md` übernehmen, falls dort sinnvoll ausgefüllt.
4. Falls `IDENTITY.md` leer, generisch oder nur Template ist, `SOUL.md` als Namens- und Rollenquelle verwenden.
5. Wenn mehrere Workspace-Verzeichnisse pro Linux-User existieren, den verwendeten Pfad explizit dokumentieren.
6. Wenn mehrere Hinweise widersprüchlich sind, Konflikt offen notieren statt zu raten.

## Empfohlene Kernfelder je Agent
- Linux-Nutzer
- genutzter Workspace-Pfad
- zugehöriger Agentenname
- Quelle für den Agentennamen (`IDENTITY.md`, `SOUL.md`, sonst unbekannt)
- Gateway-Status
- Memory installiert
- Brave-Zugang
- Pfade zu `IDENTITY.md` und `SOUL.md`
- kurze Notizen / Auffälligkeiten
