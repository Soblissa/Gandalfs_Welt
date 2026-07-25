# Alle Agenten auf Sarahs Servern

**Stand:** 2026-07-25, live geprueft auf allen drei Servern.

Kompakte Uebersicht ueber **alle** Agenten, die auf Sarahs Servern
(S1-S3) laufen - unabhaengig davon, wer sie besitzt.

Sortiert nach Server, innerhalb alphabetisch.

Owner-Zuordnung: Sarah besitzt die Server 1-3 als Infrastruktur. Die
darauf laufenden Agenten haben teils Sarah, teils Torsten (dto) oder
Sebastian als Owner. Server 4 (Torstens eigener VPS `159.195.75.193`)
steht nicht in dieser Uebersicht.

---

## S1 (147.93.120.51) - drei Agenten aktiv

| Agent | Linux-User | Owner | Rolle | Modell | Gateway-Port | VNC | Telegram | Zustand |
|---|---|---|---|---|---:|---|---|---|
| **Chantal** | `chantall` | Sarah | Sekretariat, Reise- und Terminmanagerin | openai/gpt-5.5 | 19953 | Display 18 / Port 5918 | dmPolicy `allowlist` | aktiv |
| **Chefkoch** (Cheko / ILA-Hauptagent) | `user1` | Sarah | Hessisches Kultusministerium, ILA-Steuerung | anthropic/claude-sonnet-4-6 | 19840 | nicht eingerichtet | dmPolicy `allowlist` (Sarah, Silke) | aktiv |
| **Franks Klaus** | `user2` | dto / Soblissa (Kunde Frank Kammerer) | Alpin Invest, KI-Optimierung | anthropic/claude-sonnet-4-6 | 19870 | nicht eingerichtet | dmPolicy `pairing` | aktiv |

## S2 (89.116.39.197) - ein Slot, aktuell tot

| Agent | Linux-User | Owner | Rolle | Modell | Gateway-Port | VNC | Telegram | Zustand |
|---|---|---|---|---|---:|---|---|---|
| **Egon** | `egon` | Torsten (dto) | agentctl Pilot-Agent | keine Konfiguration | 19952 (im Botrepo) | nicht eingerichtet | keine Konfiguration | **tot: Gateway seit Wochen in `activating auto-restart`, 830.000 Neustart-Versuche gezaehlt** |

## S3 (187.124.191.206) - vier Agenten aktiv

| Agent | Linux-User | Owner | Rolle | Modell | Gateway-Port | VNC | Telegram | Zustand |
|---|---|---|---|---|---:|---|---|---|
| **Gandalf** | `gandalf` | dto (Sarah + Torsten als Auftraggeber) | Systemverwalter Automagia (dieser Agent) | anthropic/claude-opus-4-7 | 19941 | Display 10 / Port 5910 | Sarah + Slarti | aktiv |
| **Rocky** | `rocky` | dto | technische Assistenz (Slot 1) | openai/gpt-5.5 | 18990 | Display 11 / Port 5911 | dmPolicy `allowlist` (Torsten) | aktiv; hatte 22.-24.07. eine Telegram-Neustart-Schleife |
| **Sloar** | `sloar` | dto | technische Assistenz (Slot 2) | openai/gpt-5.5 | 19950 | Display 12 / Port 5912 | dmPolicy `allowlist` | aktiv |
| **Turyia** (Slot) | `turyia` | dto | Slot-Reserve; kanonische Turiya-Instanz aktuell zu klaeren | openai/gpt-5.5 | 19951 | Display 13 / Port 5913 | dmPolicy `allowlist` | aktiv als Slot; Rolle offen |

## Gesamtzahl

- **8 Agenten-Slots** auf den drei Servern.
- **7 aktiv**, **1 tot** (Egon).
- **6 gehoeren Sarahs direktem Kontext** (Chantal, Chefkoch, Franks Klaus als ihrer Kunden-Agent, plus Gandalf/Rocky/Sloar/Turyia auf S3 die Systemadministration und technische Assistenz).
- **1 gehoert Torsten** und liegt auf Sarahs Hardware (Egon).

## Offene Punkte fuer den heutigen Rundgang

1. **Chantal (S1)** laueft auf GPT-5.5, nicht auf Claude. War das Absicht oder Ueberbleibsel?
2. **Franks Klaus (S1)** hat `dmPolicy: pairing` statt `allowlist`. Ist das noch aktuell gewollt?
3. **Chefkoch (S1)** heisst in `IDENTITY.md` "Cheko (ILA-Hauptagent)", operatorisch aber "Chefkoch". Angleichen?
4. **Egon (S2)**: Torstens Rueckmeldung von heute Vormittag liegt noch nicht vor. Aktuell zappelt der Gateway seit Wochen sinnlos. Sollen wir ihn stillstellen, bis Torsten sich meldet?
5. **Turyia-Slot (S3)**: laueft leer. Soll die kanonische Turiya hierher zurueck, an einen anderen Ort, oder wird der Slot umgewidmet?

## Historisch (nicht mehr aktiv)

- **Bernd** - war auf S1 unter `sebastian` fuer Sebastian. Am 2026-06-29 durch Chantal ersetzt. Der Linux-User `sebastian` wurde entfernt.
- Vor Mai 2026 lief `turyia` auf S2 unter Linux-User `agent` als kanonische Turiya. Dieser Slot ist von S2 verschwunden.

## Wo mehr Details liegen

- Vollstaendige Server-Detaildateien: `server1.yaml`, `server2.yaml`, `server3.yaml`
- Anzeigenamen und Charakter: jeweils in `IDENTITY.md` und `SOUL.md` im Workspace des Agenten
- Modell- und Telegram-Konfiguration: `openclaw.json` im jeweiligen `~/.openclaw/`
- Botrepo-Bauanleitungen: `gruhflust/botrepo` unter
  `playbooks/domains/homelab/active/templates/agentprofiles/<ip>/<user>/`

## Aktualisierung

Diese Liste wird bei jeder Agenten-Aenderung (Neu, Umzug, Umbenennung,
Modellwechsel, Ausserdienststellung) direkt hier nachgezogen. Sarah bekommt
den Aenderungshinweis im naechsten Wochenbericht.
