# Cheko: Doctor erkennt extern verwaltete Gateway-Unit nicht

## Datum, Uhrzeit und System

- 2026-09-13, 12:02–12:13 UTC
- Server 1 (`147.93.120.51`), Benutzer `cheko`, OpenClaw `2026.9.4`

## Symptom

`agentctl update` brach bei `Apply safe OpenClaw workspace migrations after an update` ab. `openclaw doctor --fix` meldete, Eigentum oder Stillstand des Gateway-Dienstes könne nicht verifiziert werden.

## Ursache

Der Bootstrap startet `openclaw-gateway@cheko` erneut. Zudem betrachtet OpenClaw 2026.9.4 die von `agentctl` als System-Unit verwaltete Instanz ohne Kennzeichnung als externen Supervisor als nicht verifizierbar.

## Fix

- Gateway vor der Migration erneut stoppen.
- Doctor mit `OPENCLAW_SERVICE_REPAIR_POLICY=external` ausführen.
- Gateway anschließend durch `agentctl` neu starten und prüfen.
- Botrepo-Playbook `agentdeployment_core.yml` entsprechend korrigiert.

Die Migration wurde anschließend live erfolgreich ausgeführt; Gateway, Sol→Luna-Modellkette, Sonnet-Subagent und Telegram-Allowlist wurden geprüft.

## Backups

OpenClaw legte automatisch `/home/cheko/.openclaw/openclaw.json.bak` an. Keine Geheimnisse wurden kopiert.

## Lernpunkte

Bei extern verwalteten OpenClaw-Systemdiensten muss Doctor ausdrücklich auf externe Service-Verwaltung gestellt werden. Ein Stop vor dem Bootstrap genügt nicht, da dieser den Dienst wieder startet.

## Offene Punkte

Keine für diesen Fehler. Die von Doctor gemeldeten allgemeinen Sicherheits- und Backup-Hinweise werden getrennt behandelt.
