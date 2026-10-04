# Konfuzius: Websuche ohne Provider

- **Datum/Uhrzeit:** 2026-10-04, 06:41 UTC
- **System:** S3 (187.124.191.206), Agent `konfuzius`, Gateway-Port 19952

## Symptom

`web_search` antwortet mit `disabled or no provider is available`. `web_fetch`
und allgemeiner Netzzugang funktionieren.

## Ursache

In Konfuzius' Konfiguration fehlt laut Agenten-Selbstpruefung der Block
`tools.web`; daher ist kein Suchprovider ausgewaehlt. Der Gateway-Prozess hat
bereits `OPENROUTER_API_KEY` fuer Kimi K3. Laut lokal installierter
OpenClaw-Dokumentation kann derselbe Schluessel auch Perplexity Search ueber
OpenRouter versorgen. Ein neuer Brave-Zugang ist daher technisch nicht noetig.

## Fix

Am 04.10. um 16:15 UTC stellte Slarti Gandalf den lokalen Sudo-Zugang wieder
bereit. Anschliessend wurde der vorhandene OpenRouter-Zugang als
Perplexity-Suchprovider verwendet:

```sh
runuser -u konfuzius -- /home/konfuzius/.npm-global/bin/openclaw config set tools.web.search.enabled true
runuser -u konfuzius -- /home/konfuzius/.npm-global/bin/openclaw config set tools.web.search.provider perplexity
systemctl restart openclaw-gateway@konfuzius
```

Danach eine echte `web_search`-Anfrage pruefen. Der vorhandene
`OPENROUTER_API_KEY` bleibt in `/etc/openclaw/users/konfuzius.env`; kein Secret
wird kopiert oder ausgegeben.

Die Konfiguration wurde validiert und `openclaw-gateway@konfuzius` neu
gestartet. Der Live-Test als Konfuzius rief `web_search` genau einmal und ohne
Fehler auf; Ergebnis war die offizielle OpenClaw-Seite
`https://docs.openclaw.ai/tools/web`.

## Backups

- `/home/konfuzius/.openclaw/openclaw.json.bak.20261004T161558Z`

## Lernpunkte

- Modellzugang ueber OpenRouter bedeutet nicht automatisch aktivierte Websuche.
- Vor Anlage eines neuen Brave-Kontos zuerst vorhandene, unterstuetzte
  Provider-Zugaenge verwenden.
- Historische, exponierte Brave-Schluessel duerfen nicht wiederverwendet werden.

## Offene Punkte

- Keine offenen Punkte zur Websuche. Der separate Root-SSH-Zugang bleibt
  abgewiesen; lokale Administration ist wieder per Sudo moeglich.
