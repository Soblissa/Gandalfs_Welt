# Nextcloud Automagia Prod - 89.116.39.197

Stand: 2026-08-13. Bisher als "sarahserver2" gefuehrt, jetzt produktiver Nextcloud-Host.

## Umsetzung
- Aufgesetzt von Slarti via `nextctl` aus dem botrepo-Branch `nextcloud-suite` (Commit `b2c3177b`).
- Playbook-Suite: `playbooks/nextcloud-suite/` (preflight, storage, vault-prepare, vault-backup, deploy, config, users, verify, password).
- Host-Template: `playbooks/nextcloud-suite/templates/89.116.39.197.yml`.

## Layout
- Storage: `/srv/nextcloud`
- Compose: `/opt/nextcloud`
- Secret-Namespace (gopass): `orgs/automagia/nextcloud/instances/automagia-prod`
- Master-Admins (Recipient-Datei `vault-recipients/nextcloud-suite/automagia-master-admins.pub`): `dto`, `dto-surface`, `dto-macbook`
- Seed-User: `torsten`, `sarah`, `michael`
- App-Baseline fuer `openclaw`: Apps/Groupfolder/Talk (siehe `playbooks/nextcloud-suite/NOTES.md`, Eintrag 2026-08-09)

## Standard-Bedienweg
```
nextctl target 89.116.39.197
nextctl preflight -e nextcloud_preflight_docker_fix=true
nextctl vault-prepare
nextctl vault-backup
nextctl storage
nextctl deploy-dryrun
nextctl deploy
nextctl apply
nextctl password-check dto
```

## Offene Punkte
- URL/Domain fuer die produktive Instanz noch zu klaeren.
- Backup-/Snapshot-Rhythmus (`vault-backup`, `nextcloud02-vault-backup.yml`) noch zu terminieren.
- Zusammenspiel mit Tailscale/Reverse-Proxy noch zu dokumentieren.
