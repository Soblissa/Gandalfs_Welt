# Gandalf: Perplexity-Key fuer Websuche fehlt

- **Datum/Uhrzeit:** 2026-09-02 08:03 UTC
- **System:** Gandalf / OpenClaw-Websuche

## Symptom

`web_search` brach bei der Recherche zur woechentlichen KI-Lage mit
`missing_perplexity_api_key` ab.

## Ursache

Im Gateway-Prozess war weder `PERPLEXITY_API_KEY` noch
`OPENROUTER_API_KEY` fuer den konfigurierten Suchanbieter verfuegbar.

## Fix

Die Recherche wurde fuer diesen Lauf ueber direkt abgerufene
Primaerquellen und Google-News-RSS fortgesetzt. Es wurde keine
Gateway-Konfiguration veraendert.

## Backups

Keine; es erfolgte keine Konfigurationsaenderung.

## Lernpunkte

Vor zeitkritischen Briefings die Suchanbieter-Verfuegbarkeit testen und
bei Ausfall unmittelbar auf direkte Primaerquellen ausweichen.

## Offene Punkte

- Perplexity-Key im Gateway-Environment kontrollieren und die
  `web_search`-Funktion nach einem geregelten Gateway-Neustart erneut testen.
