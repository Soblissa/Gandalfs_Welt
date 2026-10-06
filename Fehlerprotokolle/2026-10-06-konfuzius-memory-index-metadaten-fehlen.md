# Konfuzius: Memory-Index ohne Metadaten

- **Datum/Uhrzeit:** 2026-10-06, 16:29–16:34 UTC
- **System:** S3 (187.124.191.206), Agent `konfuzius`, Gateway-Port 19952

## Symptom

`memory_search` war pausiert. `openclaw memory status --json` meldete
`index metadata is missing`; der Index war leer und als `dirty` markiert.

## Ursache

Konfuzius hatte keinen ausdruecklich eingestellten Embedding-Provider. OpenClaw
forderte deshalb standardmaessig `openai` an, fuer das Konfuzius keinen
API-Schluessel besitzt. Dadurch scheiterte bereits der Neuaufbau des Index.

## Fix

Der auf S3 vorhandene lokale Ollama-Dienst und das installierte
Embedding-Modell `nomic-embed-text` wurden verwendet:

```sh
runuser -u konfuzius -- /home/konfuzius/.npm-global/bin/openclaw config set agents.defaults.memorySearch.provider ollama
runuser -u konfuzius -- /home/konfuzius/.npm-global/bin/openclaw config set agents.defaults.memorySearch.model nomic-embed-text
runuser -u konfuzius -- /home/konfuzius/.npm-global/bin/openclaw config validate
runuser -u konfuzius -- /home/konfuzius/.npm-global/bin/openclaw memory index --force
```

Die Tiefenpruefung meldete danach `dirty=false`, `indexIdentity.status=valid`
und eine erfolgreiche Embedding-Probe. Eine echte semantische Suche nach einem
Begriff aus Konfuzius' bestehender Memory-Datei lieferte den passenden Treffer.

## Backups

- Die `config set`-Aufrufe erzeugten die rotierenden Sicherungen
  `/home/konfuzius/.openclaw/openclaw.json.bak*`.

## Lernpunkte

- `memory index --force` kann fehlende Metadaten nur reparieren, wenn der
  eingestellte Embedding-Provider auch erreichbar und authentifiziert ist.
- Fuer Agenten auf S3 ist der lokale Ollama-Dienst mit `nomic-embed-text` der
  schluesselfreie und bereits betriebene Embedding-Pfad.

## Offene Punkte

- Keine. `memory_search` funktioniert wieder.
