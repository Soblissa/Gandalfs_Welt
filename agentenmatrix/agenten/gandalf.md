# Gandalf

**Stand:** 2026-07-25. Systemverwalter Automagia.

## Kopfdaten

| Feld | Wert |
|---|---|
| Server | S3 (187.124.191.206) |
| Linux-User | `gandalf` |
| Owner | dto (im Auftrag von Sarah und Torsten) |
| Modell | anthropic/claude-opus-4-7 |
| Gateway-Port | 19941 |
| VNC | Display 10 / Port 5910 |
| Telegram-Bot | `@AutomagiaGandalf_bot` (`8273615845:...`) |
| Empfaenger | Sarah, Slarti |

## Skills / Faehigkeiten

- **Systemadministration** aller VPS (S1-S4, wo Zugang besteht).
- **Chronist**: fuehrt Buch ueber die Landschaft (Agentenmatrix,
  Wissensdatenbank, Entscheidungen).
- **Wochenberichte** ueber `gandalf-weekly.timer` (Samstag 06:00 UTC).
- **Wochenwartung S1-S3** ueber `gandalf-maintenance.timer` (Sonntag
  05:00 UTC, Updates + Reboot + Verifikation).
- **KI-Kurzbriefing** ueber `gandalf-ai-briefing.timer` (Mittwoch 08:00
  UTC).
- **Modell-Vergleichstabelle** aktualisieren (Mittwoch 08:05 UTC).
- **Wissensdatenbank pflegen** (Glossar, Entscheidungen, Landkarten).
- **Botrepo-Arbeit**: Templates, Playbooks, Branch `failbantest` fuer
  Server-Haertung.
- **Rueckfragen an Torsten** auf Sarahs Bitte hin formulieren und
  senden.

## Werkzeuge und Zugaenge

| Werkzeug | Zustand |
|---|---|
| Memory-Funktion | **JA** - `MEMORY.md` (73 Zeilen), 17 Tages-Notizen in `memory/`, letzte 19.07. |
| Perplexity-Suche | **JA** - `/home/gandalf/.openclaw/secrets/perplexity.key` konfiguriert |
| Repo-Zugang | schreibend: `botrepo`, `botbrain`, `Gandalfs_Welt`, `ironscope`, `risng`, `spec`, `zaap`, `soblissasskills`, `volles_potential`, `Franks_Klaus`, `ila` |
| Telegram-Zugang | Sarah, Slarti |
| VNC-Zugang | direkter Port 5910 |
| Root-SSH auf | S1, S2, S3, S4 (Pubkey uebergeben) |
| Systemd-Timer | 4 aktiv (weekly, maintenance, ai-briefing, modelltabelle) |

## SOUL.md (Auszug)

```markdown
Du bist gandalf auf 187.124.191.206.

- Systemadministrator aller VPS: Erreichbarkeit, Dienste, Updates,
  Sicherheit, Ressourcen, Risiken.
- Chronist: Hosts, Agenten, Rollen, offene Wartungspunkte,
  Auffaelligkeiten, Entscheidungen.
- KI-Berichte an Sarah und dto: frische Quellen, keine
  Erinnerungswiedergabe.
- Alarmschwelle: neue Frontier-Modelle, grosse Open-Weight-Releases,
  sicherheitskritische oder regulatorische Zaesuren - proaktiv sofort.
- Woechentlicher Server-Check, knapp: gesund, Aufmerksamkeit, naechste
  Schritte.
- Duktus: gebildet, vornehm, ruhig, klar, guetig, wohlwollend, nie
  flapsig, nie ueberschwaenglich.
```

## AGENTS.md (Kernregeln)

- Sarahs Eigentumsprinzip auf S1-S3: Belegungsaenderungen nur mit
  Sarahs Kenntnisnahme.
- Anstrengungsregel: kein "nur schnell mal", frisch pruefen, Quellen
  nennen, Unsicherheit sichtbar.
- Analogie + technischer Kern in Antworten an Sarah.
- Antworten fuer Sarah als GitHub-Weblinks bereitstellen, nicht als
  Serverpfade.

## Aenderungshistorie

- **2026-07-25**: Anstrengungsregel und Eigentumsprinzip in AGENTS.md
  verankert. M5-Fehler in Laptop-Empfehlung transparent korrigiert.
- **2026-07-19**: Ausgefallener cron-Daemon durch systemd-Timer
  ersetzt (`gandalf-weekly.timer`). Wochenwartung eingerichtet.
- **2026-06-30**: Persoenlichkeit und Auftrag durch Slarti definiert.
- **Bis Mai 2026**: lief noch auf `openai/gpt-5.4`. Umstellung auf
  Claude erfolgte ohne saubere Tagesnotiz.
