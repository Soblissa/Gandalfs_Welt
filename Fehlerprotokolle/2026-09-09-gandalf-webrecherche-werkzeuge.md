# Webrecherche-Werkzeuge nicht verfuegbar

- **Datum/Uhrzeit UTC:** 2026-09-09, 08:02
- **System:** Gandalf / OpenClaw-Gateway
- **Symptom:** `web_search` meldete `missing_perplexity_api_key`; die Browser-Steuerung brach mit WebSocket-Code 1006 ab.
- **Ursache:** Der Gateway-Prozess erhielt keinen Perplexity- bzw. OpenRouter-Schluessel; die Browser-Control-Verbindung zu `127.0.0.1:18789` wurde unerwartet geschlossen. Die tieferliegende Browser-Ursache ist noch ungeprueft.
- **Fix/Umgehung:** Recherche ueber direkte Herstellerseiten (`web_fetch`) und Google-News-RSS per HTTPS fortgesetzt.
- **Backups:** Keine Konfiguration veraendert, daher kein Backup erforderlich.
- **Lernpunkte:** Vor zeitkritischen Briefings Suchanbieter und Browser-Gateway pruefen; bei Ausfall auf direkte Primaerquellen und RSS ausweichen.
- **Offene Punkte:** API-Key-Injektion in den Gateway-Dienst und Browser-Control-Gesundheit separat pruefen.
