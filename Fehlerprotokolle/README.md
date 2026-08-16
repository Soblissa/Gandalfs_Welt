# Fehlerprotokolle

Zentrale Ablage fuer dokumentierte Stoerungen an Sarahs und dtos Infrastruktur.

## Zweck
- Jede nennenswerte Stoerung an Servern, Gateways, Agenten oder Diensten wird hier festgehalten.
- Ziel: bei einem erneuten Vorfall zuerst hier nachsehen, ob wir das Muster schon kennen. Kein Fehler soll zweimal aus dem Nichts diagnostiziert werden muessen.

## Regel (verbindlich, Sarah, 2026-07-30)
- Gandalf schaut bei jedem neuen Vorfall **zuerst** in diesem Ordner nach, bevor er ins Blaue diagnostiziert.
- Neue Vorfaelle werden hier abgelegt, nicht mehr in `wissensdatenbank/wartung/`.
- Ausnahme: geplante Wartung (Routine) bleibt weiterhin in `wissensdatenbank/wartung/`.

## Namenskonvention
- Dateiname: `YYYY-MM-DD-<system>-<kurzbeschreibung>.md`
- Beispiel: `2026-07-30-chefkoch-config-und-key.md`

## Was gehoert in jeden Eintrag
1. **Datum, Uhrzeit (UTC), betroffenes System**
2. **Symptom** wie es sich fuer den Nutzer gezeigt hat.
3. **Ursache(n)** klar getrennt aufgezaehlt, wenn es mehrere Schichten gab.
4. **Fix** mit konkreten Kommandos oder Dateipfaden.
5. **Backups** die vor dem Eingriff angelegt wurden.
6. **Lernpunkte** und Merkregeln fuer den naechsten Vorfall.
7. **Offene Punkte** die nach dem Fix noch zu klaeren sind.

## Index

| Datum | System | Titel | Datei |
|---|---|---|---|
| 2026-07-30 | Chefkoch (Server 1, `user1`) | Konfig-Schema, Prozess-Doppelung, alter Anthropic-Key an mehreren Stellen, Session-Model-Override auf `o3-mini` | [2026-07-30-chefkoch-config-und-key.md](2026-07-30-chefkoch-config-und-key.md) |
| 2026-08-16 | Gandalf (Server 3), Wochenbericht-Timer und OpenClaw-Gateway | Wochenbericht-Skript schickte nur den Prompt statt des Berichts; zusaetzlich leakte ein Tool-Fehler an Sarahs Chat | [2026-08-16-wochenbericht-timer-und-tool-error-leak.md](2026-08-16-wochenbericht-timer-und-tool-error-leak.md) |
