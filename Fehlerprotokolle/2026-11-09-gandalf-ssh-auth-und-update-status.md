# Gandalf: SSH-Authentifizierung und Update-Status der VPS

- **Datum/Uhrzeit (UTC):** 2026-11-09, 15:04–15:08
- **Betroffene Systeme:** S1 `147.93.120.51`, S2 `89.116.39.197`, S3 `187.124.191.206`, S4 `167.235.129.145`

## Symptom

Die angeforderte Live-Prüfung der offenen Updates und der administrativen Zugänge war nur auf S3 vollständig möglich. S1 und S2 lehnten die dokumentierten SSH-Benutzer ab; S4 wurde wegen eines abweichenden Hostschlüssels nicht kontaktiert.

## Ursachen / Befunde

1. S1 als `admin` und S2 als `torsten`: `Permission denied (publickey,password)` mit den vorhandenen lokalen SSH-Identitäten.
2. S4: Hostschlüssel weicht vom bekannten Eintrag ab. Das Muster war bereits am 2026-09-19 dokumentiert; keine automatische Entfernung des bekannten Schlüssels.
3. S3: lokales sudo funktioniert mit dem hinterlegten Passwort. APT meldet keine offenen Updates und keinen erforderlichen Neustart.

## Fix

Keiner. Es wurden ausschließlich lesende Prüfungen und eine harmlose sudo-Identitätsprüfung ausgeführt. Keine Pakete, SSH-Konfigurationen oder Hostschlüssel wurden verändert.

## Backups

Keine neuen Backups erforderlich, da keine Zustandsänderung erfolgte.

## Lernpunkte

- Vor einer automatisierten Wartung müssen SSH-Anmeldung und privilegierter Zugriff je Zielhost separat live bestätigt werden.
- Ein geänderter SSH-Hostschlüssel darf nicht automatisiert akzeptiert werden.
- S3 besitzt bereits aktive `apt-daily`-/`apt-daily-upgrade`-Timer und benötigt derzeit keine Paketaktualisierung.

## Offene Punkte

- SSH-/sudo-Zugang für S1 und S2 mit dem Betreiber klären und anschließend nur lesend erneut prüfen.
- S4-Hostschlüssel out-of-band verifizieren.
- Erst danach entscheiden, ob zentral gesteuerte Updates zusätzlich zu `unattended-upgrades` sinnvoll und freigegeben sind.
