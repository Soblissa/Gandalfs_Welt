# Operations.md

Zentrale Betriebsdoku für gandalf als CTO über alle Server.
Stand: 2026-05-21.

## Server-Inventar

| # | Alias | Hostname | IP | Admin-Zugang | Status |
|---|-------|----------|----|--------------|--------|
| 1 | sarahserver1 | srv1492182 | 147.93.120.51 | `ssh root@147.93.120.51` mit `~/.ssh/id_ed25519` | ✅ aktiv |
| 2 | sarahserver2 | srv1513178 | 89.116.39.197 | `ssh root@89.116.39.197` mit `~/.ssh/id_ed25519` | ✅ aktiv |
| 3 | sarahserver3 | srv1577995 | 187.124.191.206 | lokal, dieser Host | ✅ aktiv (gandalf läuft hier) |
| ? | unklar | unbekannt | 159.195.75.193 | ❌ kein Key-Zugang | offen, mit Operator klären |

Mein Public-Key:
```
ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOZHQ15CXOe497oP4U95ux/UtSCZNsMkAIPOGAxHLTvp gandalf@187.124.191.206
```

## Aktive Agenten pro Server

### Server 1, srv1492182, 147.93.120.51
- `sebastian` → **Bernd**
  - Telegram-Bot-Token: `8728408363...s-dtJI`
  - Allowlist: `6171498156` (dto/Soblissa), `8728863315`, `6794537024` (Slarti)
- `user1` → **Chefkoch (ILA-Hauptagent)**, Bot `@ila_chefkoch_bot`
  - Token: `8697655942...H76Qkk`
  - Allowlist: `6171498156`, `6794537024`, `8233442182`
- `user2` → **Franks Klaus**, Bot `@Franks_klaus_bot`
  - Token: `8259020854...B2fFqw`
  - Allowlist: `6171498156`, `6794537024`
  - Frank (der Mensch) ist noch **nicht** freigeschaltet.

### Server 2, srv1513178, 89.116.39.197
- `agent` → **Turiya** (kanonisch seit 2026-05-11)
  - Token: `8564586722...1S8r34`
  - Allowlist: `6171498156`, `6794537024`
- Linux-User `joker`, `nemo`, `hiroshi` existieren teilweise, aber sind **keine** aktiven OpenClaw-Slots mehr (2026-05-11 bereinigt). Aktuell sichtbar: `hiroshi`, `joker` als Home-Verzeichnisse, ohne aktive Gateway-Services.

### Server 3, srv1577995, 187.124.191.206 (dieser Host)
- `gandalf` → **gandalf (CTO, Slot 3)** — dieser Agent
- `rocky` → Slot, läuft
- `turyia` → Archivslot (kanonische Turiya liegt auf Server 2)
- `agent1`, `agent2` → leere Slots

## Schnellprüfungen, Befehle

Status aller Gateways auf einem Server:
```
ssh root@<ip> 'systemctl list-units "openclaw-gateway@*" --no-legend --no-pager'
```

Telegram-Allowlist eines Slots auslesen:
```
ssh root@<ip> 'cat /home/<user>/.openclaw/credentials/telegram-default-allowFrom.json'
```

Allgemeine Healthcheck-Tour:
```
for ip in 147.93.120.51 89.116.39.197; do
  echo "=== $ip ==="
  ssh -o BatchMode=yes root@$ip 'hostname; uptime; systemctl list-units "openclaw-gateway@*" --no-legend --no-pager'
done
```

## Lessons Learned, warum mein Zugriff scheinbar weg war
- Mein Key war/ist auf Server 1 und Server 2 als **root** hinterlegt, nicht direkt als `user2`/`sebastian`/`user1`.
- Beim ersten Test habe ich `ssh user2@147.93.120.51` probiert — dort ist mein Key nicht hinterlegt, Verbindung wurde abgewiesen.
- Konsequenz: Ich habe fälschlich behauptet, ich hätte keinen Zugang. Tatsächlich war der Zugang da, nur über `root`.
- Regel ab jetzt: Bei Zugriffsfragen immer erst `root@<ip>` testen, bevor ich „kein Zugang" sage.

## Offene Punkte
- 159.195.75.193: unklar, was das ist. Operator fragen.
- Franks Telegram-User-ID einsammeln und in `/home/user2/.openclaw/credentials/telegram-default-allowFrom.json` auf Server 1 ergänzen.
- Server 1 und 2 sollten denselben Audit-Stand wie Server 3 bekommen (Perplexity-Anbindung etc., falls gewünscht).
