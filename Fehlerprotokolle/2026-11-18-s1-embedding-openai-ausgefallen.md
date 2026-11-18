# S1: Agenten-Embeddings wegen OpenAI-Zugang ausgefallen

- **Datum/Uhrzeit UTC:** 2026-11-18, 09:30–10:05
- **System:** S1 / `147.93.120.51` / `srv1492182`
- **Betroffene Agenten:** Chantall und user2
- **Symptom:** Semantische Vektorsuche funktionierte nicht.
- **Ursache:** Chantall erhielt von OpenAI `429 insufficient_quota`; user2 erhielt `401 invalid_api_key`. Die lokalen SQLite-Vektorindizes waren vorhanden, konnten aber keine neuen Embeddings erzeugen.
- **Cheko:** Nicht betroffen; Cheko verwendete bereits erfolgreich Ollama mit `nomic-embed-text` auf S3 nach der Einrichtung.
- **Fix:** Ollama auf S1 als localhost-only-systemd-Dienst installiert, `nomic-embed-text` geladen, Chantall und user2 auf Provider `ollama`/Modell `nomic-embed-text` umgestellt und die Gateways neu gestartet.
- **Indexierung:** Beide Indizes mit `openclaw memory index --force --agent main` neu aufgebaut. Chantall: 15 Dateien/26 Chunks; user2: 2 Dateien/5 Chunks. Beide Indizes `dirty=false`, 768 Dimensionen, sqlite-vec verfügbar.
- **Verifikation:** Ollama-Embedding-Probe erfolgreich; semantische Suche bei Chantall und user2 erfolgreich. Gateways aktiv.
- **Backups:** Vor den Konfigurationsänderungen wurden `openclaw.json.before-s1-ollama-<UTC-Zeitstempel>`-Kopien unter den jeweiligen Agenten-State-Verzeichnissen angelegt; OpenClaw erzeugte zusätzlich ein user2-Konfigurationsbackup.
- **Lernpunkte:** Vektorsuche nicht nur über Gateway-/Prozesszustand beurteilen; `openclaw memory status --deep --json` und eine echte Embedding-/Suchprobe sind erforderlich. Ein fehlender oder erschöpfter Remote-Embedding-Zugang kann den Index intakt lassen, aber neue semantische Suche blockieren.
- **Offene Punkte:** OpenAI-Zugänge von Chantall und user2 bleiben ungenutzt/defekt; keine Rotation oder Löschung von Secrets vorgenommen.
