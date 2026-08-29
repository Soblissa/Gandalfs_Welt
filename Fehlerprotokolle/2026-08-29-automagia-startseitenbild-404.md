# Automagia: Startseitenbild lieferte HTTP 404

- **Datum/Uhrzeit:** 2026-08-29, 13:10 UTC
- **System:** `automagia.org` auf SS2

## Symptom

Die neue Startseite selbst und der Login antworteten mit HTTP 200, das Axtbild
unter `/assets/hero-axt.png` jedoch mit HTTP 404.

## Ursache

Die Caddy-Regel lieferte nur den exakten Pfad `/` aus dem verwalteten
Webverzeichnis aus. `/assets/*` wurde deshalb an Nextcloud weitergereicht.

## Fix

Die Playbook-Vorlage `playbooks/automagiaweb/templates/Caddyfile.j2` bedient nun
`/` und `/assets/*` aus dem statischen Webverzeichnis. Der Statuslauf prueft das
Hero-Bild kuenftig gesondert. Die Korrektur wird ausschliesslich ueber das
Automagia-Playbook ausgebracht.

## Backups

Das Caddy-Playbook legt vor dem Rendern automatisch ein Backup der bestehenden
Caddyfile an. Die Vorlagenhistorie liegt zusaetzlich in Git.

## Lernpunkte

Bei einer statischen Einstiegsseite muessen alle zugehoerigen Asset-Pfade in der
Routing-Regel enthalten und nach jedem Rollout extern geprueft werden.

## Offene Punkte

Keine nach erfolgreichem Playbook-Lauf und HTTP-200-Pruefung.
