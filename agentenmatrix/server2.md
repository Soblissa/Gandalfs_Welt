# Agentenmatrix, Server 2

Stand: 2026-07-30 UTC
Host-Alias: `sarahserver2` (srv1513178, 89.116.39.197)

## Status

**Server 2 hält seit 2026-07-30 keine Agenten mehr.**

Operator-Entscheidung Slarti, 2026-07-30: S2 wird künftig nicht mehr als
Agentenserver betrieben. Grund ist der verhältnismäßig kleine RAM (ca.
8 GB). Vorgesehen ist eine spätere Nutzung als Nextcloud-Server.

## Live-Zustand 2026-07-30

- Linux-User mit `/home`: `sarah`, `torsten`, `ubuntu`
- Keine `openclaw-*`-Systemd-Units aktiv oder installiert
- Kein `agent`-User, keine kanonische Turyia mehr auf S2
- Kein `egon` mehr (siehe unten)

## Historie

- **2026-07-30**: Testinstanz `egon` (Linux-User `egon`, uid 1003) auf
  Slartis Freigabe entfernt. Gateway-Unit `openclaw-gateway@egon`
  gestoppt und disabled, `egon`-Home gelöscht (`userdel -r`). Backup
  vor Löschung unter `/root/agent-cleanup-backups/egon-openclaw-20260730T055846Z.tar.gz`
  (61 MB). Slartis eigentliche Testarbeit läuft inzwischen auf einem
  anderen Testserver.
- **Mai/Juni 2026**: kanonische Turyia auf S2 verschwand ohne
  dokumentierten Umzug; siehe `agenten/turyia.md`.
- **2026-05-11**: Operator-Entscheidung, die kanonische Turyia auf S2
  zu führen (Linux-User `agent`). Diese Instanz existiert live nicht
  mehr.
- **Frühere Bestände** `joker`, `nemo`, `hiroshi` waren bereits am
  2026-05-11 nicht mehr nachweisbar.

## Nächste Schritte

- Keine agentenbezogenen Wartungen mehr auf S2.
- Wochencheck (Sonntag 20:00 UTC) prüft S2 nur noch nachrichtlich:
  bestätigt, dass keine Agenten mehr laufen.
- Ein späterer Nextcloud-Umbau ist Slartis Vorhaben und liegt außerhalb
  der Agentenmatrix.
