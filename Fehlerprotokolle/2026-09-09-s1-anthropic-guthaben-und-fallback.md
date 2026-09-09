# Fehlerprotokoll: S1-Anthropic-Guthaben und wirkungsloser Fallback

**Datum/Uhrzeit:** 2026-09-09, 08:05-08:35 UTC (Logs), Diagnose 11:00 UTC  
**System:** Server 1 / `srv1492182` / `147.93.120.51`, betroffener OpenClaw-Agent noch nicht sicher zugeordnet

## Symptom
- Telegram-Nachrichten und ein verschachtelter Cron-Lauf endeten vor der Antwort.
- Ein Gateway-Neustart brachte keine Besserung.

## Ursache
- Anthropic antwortet auf `claude-opus-5` mit HTTP 400: `credit balance is too low`.
- OpenClaw markiert daraufhin das einzige Profil `anthropic:default` wegen `billing` als nicht verfuegbar.
- Alle konfigurierten Fallbacks verwenden dasselbe Anthropic-Profil. Daher fallen auch Fable, Sonnet, Mythos, Opus und Haiku sofort aus.
- Dies ist kein Gateway-, Netzwerk- oder Lastproblem. Die API ist erreichbar; `eventLoopMax` lag nur bei 13,7-18,0 ms.

## Fix
Noch nicht ausgefuehrt, weil S1 Sarah gehoert und ein Modell-/Providerwechsel ihrer Kenntnisnahme bedarf.

1. Anthropic-Guthaben fuer den aktiven Key auffuellen oder einen gedeckten Anthropic-Key einsetzen.
2. Dauerhaft mindestens einen providerunabhaengigen Fallback mit eigener funktionierender Authentifizierung konfigurieren.
3. Vor Aenderung Backups von `openclaw.json`, `auth-profiles.json` und gegebenenfalls der Env-Datei anlegen; danach gezielt testen.

## Backups
- Keine: Diagnose war rein lesend; SSH-Zugriff von Gandalf auf S1 wurde fuer `root` und `torsten` abgewiesen.

## Lernpunkte
- Ein Neustart behebt weder fehlendes API-Guthaben noch eine Fallback-Kette, die vollstaendig dasselbe gesperrte Auth-Profil nutzt.
- Provider-Fallback ist nur belastbar, wenn Provider und Authentifizierung vom Primaerpfad unabhaengig sind.

## Offene Punkte
- Betroffenen Linux-User/Agenten anhand PID `1338359` lokal auf S1 bestimmen.
- Mit Sarah Guthabenauffuellung oder providerunabhaengigen Notbetrieb abstimmen.
- Anschliessend Testnachricht und Cron-Lauf verifizieren.
