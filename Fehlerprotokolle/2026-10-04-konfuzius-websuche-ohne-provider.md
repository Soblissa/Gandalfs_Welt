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

Noch offen, weil der Systembenutzer `gandalf` weder Leserechte auf
`/home/konfuzius/.openclaw/openclaw.json` noch administrative Rechte fuer den
Gateway-Neustart besitzt. Vorgesehener minimaler Fix durch root:

```sh
runuser -u konfuzius -- /home/konfuzius/.npm-global/bin/openclaw config set tools.web.search.enabled true
runuser -u konfuzius -- /home/konfuzius/.npm-global/bin/openclaw config set tools.web.search.provider perplexity
systemctl restart openclaw-gateway@konfuzius
```

Danach eine echte `web_search`-Anfrage pruefen. Der vorhandene
`OPENROUTER_API_KEY` bleibt in `/etc/openclaw/users/konfuzius.env`; kein Secret
wird kopiert oder ausgegeben.

## Backups

Noch keines, da mangels Berechtigung keine Konfigurationsaenderung erfolgte.
Vor Umsetzung `openclaw.json` mit UTC-Zeitstempel sichern.

## Lernpunkte

- Modellzugang ueber OpenRouter bedeutet nicht automatisch aktivierte Websuche.
- Vor Anlage eines neuen Brave-Kontos zuerst vorhandene, unterstuetzte
  Provider-Zugaenge verwenden.
- Historische, exponierte Brave-Schluessel duerfen nicht wiederverwendet werden.

## Offene Punkte

- Fix mit root-Rechten anwenden, Gateway neu starten und Live-Suche bestaetigen.

