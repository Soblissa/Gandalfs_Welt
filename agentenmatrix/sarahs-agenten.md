# Alle Agenten auf Sarahs Servern

**Stand:** 2026-07-25, live geprueft auf allen drei Servern.

Kompakte Uebersicht ueber **alle** Agenten, die auf Sarahs Servern
(S1-S3) laufen - unabhaengig davon, wer sie besitzt.

Sortiert nach Server, innerhalb alphabetisch.

Owner-Zuordnung: Sarah besitzt die Server 1-3 als Infrastruktur. Die
darauf laufenden Agenten haben teils Sarah, teils Torsten (dto) oder
Kundenkontexte als Owner. Server 4 (Torstens eigener VPS
`159.195.75.193`) steht nicht in dieser Uebersicht.

Fuer jeden Agenten gibt es eine eigene Detailseite mit Skills,
vollstaendiger SOUL.md, AGENTS.md und Aenderungshistorie - Link jeweils
in der ersten Spalte.

---

## S1 (147.93.120.51) - drei Agenten aktiv

| Agent | Linux-User | Owner | Rolle | Modell | Port | VNC | Memory | Perplexity | Zustand |
|---|---|---|---|---|---:|---|---|---|---|
| **[Chantal](agenten/chantal.md)** | `chantall` | Sarah | Sekretariat, Reise, Termine, Recherche | openai/gpt-5.5 | 19953 | 5918 | ja (23 Zeilen + 8 Tages-Notizen) | nein | aktiv |
| **[Chefkoch](agenten/chefkoch.md)** (Cheko / ILA-Hauptagent) | `user1` | Sarah | Hessisches Kultusministerium, ILA-Steuerung | anthropic/claude-sonnet-4-6 (Fallback: gpt-5.4) | 19840 | - | ja (173 Zeilen + 14 Handover-Notizen) | nein | aktiv, Fallback stellt sich still um |
| **[Franks Klaus](agenten/franks-klaus.md)** | `user2` | dto (Kunde Frank Kammerer) | Alpin Invest, KI-Optimierung | anthropic/claude-sonnet-4-6 | 19870 | - | teilweise (nur 2 Tages-Notizen) | nein | aktiv |

## S2 (89.116.39.197) - ein Slot, aktuell tot

| Agent | Linux-User | Owner | Rolle | Modell | Port | VNC | Memory | Perplexity | Zustand |
|---|---|---|---|---|---:|---|---|---|---|
| **Egon** | `egon` | Torsten (dto) | agentctl Pilot-Agent | keine Konfiguration | 19952 | - | - | - | **tot: 830.000 Neustart-Versuche, Klaerung mit Torsten fuer 26.07. geplant** |

## S3 (187.124.191.206) - vier Agenten aktiv

| Agent | Linux-User | Owner | Rolle | Modell | Port | VNC | Memory | Perplexity | Zustand |
|---|---|---|---|---|---:|---|---|---|---|
| **[Gandalf](agenten/gandalf.md)** | `gandalf` | dto (fuer Sarah + Torsten) | Systemverwalter Automagia | anthropic/claude-opus-4-7 | 19941 | 5910 | ja (73 Zeilen + 17 Tages-Notizen) | **ja** | aktiv |
| **[Rocky](agenten/rocky.md)** | `rocky` | dto | technische Assistenz (Slot 1) | openai/gpt-5.5 | 18990 | 5911 | ja + 9 Tages-Notizen | nein | aktiv; Poller-Schleife am 22.-24.07. behoben |
| **[Sloar](agenten/sloar.md)** | `sloar` | dto | technische Assistenz (Slot 2) | openai/gpt-5.5 | 19950 | 5912 | teilweise (nur `memory/`, 20 Notizen) | nein | aktiv |
| **[Turyia](agenten/turyia.md)** (Slot) | `turyia` | dto | integrative Praesenz (Rolle offen seit Verschwinden der S2-Instanz) | openai/gpt-5.5 | 19951 | 5913 | ja + 20 Tages-Notizen | nein | aktiv als Slot; Klaerung fuer 26.07. geplant |

## Gesamtzahl

- **8 Agenten-Slots** auf den drei Servern.
- **7 aktiv**, **1 tot** (Egon).
- **6 gehoeren Sarahs direktem Kontext**: Chantal, Chefkoch, Franks Klaus
  auf S1; Gandalf/Rocky/Sloar/Turyia auf S3 als Systemadministration und
  technische Assistenz.
- **1 gehoert Torsten** und liegt auf Sarahs Hardware (Egon).

## Offene Punkte fuer den Rundgang

1. ~~Chantal auf GPT-5.5, nicht Claude~~ **Absicht, bleibt so (25.07.).**
2. **Chefkochs stiller Fallback** auf GPT-5.4. Entscheidung offen:
   Fallback ganz abschalten, auf Claude Haiku 4.5 umleiten, oder laut
   melden lassen.
3. **Franks Klaus** mit `dmPolicy: pairing` statt `allowlist`. Klaerung.
4. **Chefkochs Anzeigename** in IDENTITY.md steht als "Cheko
   (ILA-Hauptagent)". Operator-Sprache: Chefkoch. Angleichen?
5. **Egon (S2)**: Torstens Rueckmeldung offen, Klaerung fuer 26.07.
6. **Turyia (S3)**: Rolle seit dem Verschwinden der S2-Instanz offen.
   Klaerung fuer 26.07.

## Historisch (nicht mehr aktiv)

- **Bernd** - war auf S1 unter `sebastian` fuer Sebastian. Am 2026-06-29
  durch Chantal ersetzt. Der Linux-User `sebastian` wurde entfernt.
- **Kanonische Turyia auf S2** unter Linux-User `agent` - verschwand
  um Mai/Juni 2026, ohne saubere Tagesnotiz. Der S3-Slot `turyia`
  existiert weiter, hat aber seither keine klare Rolle.

## Wo mehr Details liegen

- Vollstaendige Detailseiten je Agent: `agenten/<name>.md` (siehe
  Verlinkung oben).
- Server-spezifische YAML-Dateien: `server1.yaml`, `server2.yaml`,
  `server3.yaml`.
- Konfiguration je Agent live: `openclaw.json` im jeweiligen
  `~/.openclaw/`.
- Botrepo-Bauanleitungen: `gruhflust/botrepo` unter
  `playbooks/domains/homelab/active/templates/agentprofiles/<ip>/<user>/`.

## Aktualisierung

Diese Liste und die Detailseiten werden bei jeder Aenderung an einem
Agenten (Neu, Umzug, Umbenennung, Modellwechsel, Ausserdienststellung,
Persoenlichkeitsanpassung) nachgezogen. Sarah bekommt den
Aenderungshinweis im naechsten Wochenbericht.
