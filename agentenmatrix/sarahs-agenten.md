# Sarahs Agenten - Gesamtliste

**Stand:** 2026-07-25, live geprueft.

Kompakte Uebersicht ueber alle Agenten, die Sarah gehoeren oder in ihrem
Verantwortungsbereich laufen. Sortiert nach Server, innerhalb alphabetisch.

Owner-Zuordnung: Sarah besitzt Server 1-3. Server 4 (Torstens VPS)
steht nicht in dieser Uebersicht.

---

## Aktive Agenten

| Agent | Server | Linux-User | Rolle | Modell | Gateway-Port | VNC | Owner-Zugang | Zustand |
|---|---|---|---|---|---:|---|---|---|
| **Chantal** | S1 (147.93.120.51) | `chantall` | Sarahs Sekretariat, Reise- und Terminmanagerin | openai/gpt-5.5 | 19953 | Display 18 / Port 5918 | Telegram, dmPolicy `allowlist` | aktiv |
| **Chefkoch** (Cheko / ILA-Hauptagent) | S1 (147.93.120.51) | `user1` | Hessisches Kultusministerium, ILA-Steuerung | anthropic/claude-sonnet-4-6 | 19840 | nicht eingerichtet | Telegram, dmPolicy `allowlist` (Sarah, Silke) | aktiv |
| **Franks Klaus** | S1 (147.93.120.51) | `user2` | Kunde Frank Kammerer / Alpin Invest | anthropic/claude-sonnet-4-6 | 19870 | nicht eingerichtet | Telegram, dmPolicy `pairing` | aktiv |
| **Gandalf** | S3 (187.124.191.206) | `gandalf` | Systemverwalter Automagia (dieser Agent) | anthropic/claude-opus-4-7 | 19941 | Display 10 / Port 5910 | Telegram (Sarah, Slarti) | aktiv |
| **Rocky** | S3 (187.124.191.206) | `rocky` | technische Assistenz (Slot 1) | openai/gpt-5.5 | 18990 | Display 11 / Port 5911 | Telegram, dmPolicy `allowlist` (Torsten) | aktiv, hatte am 22.-24.07. eine Telegram-Neustart-Schleife (Details siehe Notizen) |
| **Sloar** | S3 (187.124.191.206) | `sloar` | technische Assistenz (Slot 2) | openai/gpt-5.5 | 19950 | Display 12 / Port 5912 | Telegram, dmPolicy `allowlist` | aktiv |
| **Turyia** (Slot) | S3 (187.124.191.206) | `turyia` | Slot-Reserve; kanonische Turiya-Instanz aktuell zu klaeren | openai/gpt-5.5 | 19951 | Display 13 / Port 5913 | Telegram, dmPolicy `allowlist` | aktiv als Slot; Rolle offen |

## Offene Punkte

- **Chefkochs Anzeigename** in `IDENTITY.md` steht als `Cheko (ILA-Hauptagent)`. Operator-Zuordnung ist `Chefkoch`. Beides tolerieren, aber im Wochenbericht sichtbar halten.
- **Franks Klaus**: `dmPolicy: pairing` statt `allowlist` - Zugang laueft ueber ein Kopplungsverfahren. Wenn das absichtlich ist, so belassen. Sonst auf `allowlist` umstellen.
- **Chantal** hat weder USER.md-Namen fuer die Owner-Zeile noch eine dokumentierte Allowlist-ID-Liste. Empfehlung: Sarahs ID hinzufuegen (`6171498156`).
- **Turyia**: kanonische Turiya-Instanz war zeitweise auf S2 unter Linux-User `agent`, ist dort nicht mehr vorhanden. Der Slot auf S3 (`turyia`) existiert weiter, hat aber keine klare Rolle mehr.

## Nicht mehr aktiv / historisch

- **Bernd** - war auf S1 unter Linux-User `sebastian` fuer Sebastian. **Am 2026-06-29 durch Chantal ersetzt.** Der Linux-User `sebastian` wurde entfernt.
- Auf S2 lebt derzeit nur ein Bot: **Egon** (`egon`), aber der gehoert **Torsten**, nicht Sarah. Er steht bewusst nicht in dieser Liste.

## Wo mehr Details liegen

- Vollstaendige Bestandsuebersicht ueber alle vier Server: `../Agentenmatrix.md`
- Server-spezifische YAML-Dateien: `server1.yaml`, `server2.yaml`, `server3.yaml`
- Anzeigenamen und Charakter: jeweils in `IDENTITY.md` und `SOUL.md` im Workspace des Agenten
- Modell- und Telegram-Konfiguration: `openclaw.json` im jeweiligen `~/.openclaw/`

## Aktualisierung

Diese Liste wird bei jeder Agenten-Aenderung (Neu, Umzug, Umbenennung,
Modellwechsel, Ausserdienststellung) direkt hier nachgezogen. Sarah bekommt
den Aenderungshinweis im Wochenbericht.
