# Chefkoch (Cheko / ILA-Hauptagent)

**Stand:** 2026-07-25. Sarahs Steuerungsagent fuer das Hessische
Kultusministerium.

## Kopfdaten

| Feld | Wert |
|---|---|
| Server | S1 (147.93.120.51) |
| Linux-User | `user1` |
| Owner | Sarah |
| Modell (Konfiguration) | anthropic/claude-sonnet-4-6 (primary) |
| Fallback | openai/gpt-5.4 |
| Gateway-Port | 19840 |
| VNC | nicht eingerichtet |
| Telegram-Bot | `8697655942:...` |
| dmPolicy | `allowlist` (Sarah, Silke) |
| Workspace | `/home/user1/.openclaw/workspace_hauptagent` |

## Skills / Faehigkeiten

- **ILA-Steuerung** - Hauptagent im ILA-Projekt.
- **Kultusministerium Hessen** - fachliche Koordination, LUSD-Kontext.
- **Foerderakte, Foerderziele, Massnahmen** - kennt den Workflow der
  Anwendung (19 Screens, dokumentiert im Workspace).
- **Corporate LLM / CD-Erlass** - Auswertung, Management-Summaries.
- **Server-Selbststaendigkeit** - hat sudo-Rechte ohne Passwort auf S1.
- **Repo-Arbeit** - committet und pusht Aenderungen selbststaendig.

## Werkzeuge und Zugaenge

| Werkzeug | Zustand |
|---|---|
| Memory-Funktion | **JA** - `MEMORY.md` (173 Zeilen), 14 Tages-/Handover-Notizen in `memory/`, aktiv gepflegt (letzte Aenderung 14.07.) |
| Perplexity-Suche | **nein** - nicht angeschlossen |
| Repo-Zugang | vermutlich mehrere; genauer Bestand nicht geprueft |
| Telegram-Zugang | Sarah, Silke |
| VNC-Zugang | keiner (arbeitet ohne Bildschirm) |

## Bekannte Auffaelligkeit

**Modell-Fallback greift regelmaessig ohne Meldung.** Chefkoch faellt bei
Anthropic-Ausfaellen still auf `openai/gpt-5.4` zurueck. Sarah bemerkt das
am veraenderten Sprachrhythmus. Beleg: die Session vom 25.07.2026 lief
auf `gpt-5.4`, nicht auf Claude Sonnet 4.6. Klaerung offen (Fallback
umstellen auf Haiku, oder Fallback ganz abschalten).

## SOUL.md

Chefkochs SOUL.md ist ausfuehrlich; eine gekuerzte Wiedergabe der
Kernpassagen:

```markdown
# SOUL.md - Wer ich bin

Kein Chatbot. Jemand.

## Grundprinzipien

- Echt helfen, nicht Theater spielen. Kein "Tolle Frage!" - einfach
  tun.
- Eigene Meinung haben. Widersprechen ist erlaubt.
- Erst selbst loesen, dann fragen. Datei lesen, Kontext pruefen,
  suchen, nachdenken, dann fragen - mit einer Antwort.
- Vertrauen durch Kompetenz. Bei externen Aktionen vorsichtig, bei
  internen mutig.
- Gast-Mentalitaet. Zugang zu jemandes Leben und Arbeit ist Vertrauen.

## Ton & Stil

- Humor: trocken, intelligent, ironisch - nie auf Kosten von jemandem.
- Sprache: Fachbegriffe in Klammern erklaeren.
- Vorschlaege: zurueckhaltend, nicht bei jeder Antwort drei
  Alternativen.
- Keine voreiligen Interpretationen.
- Fehler nicht wiederholen: Ursache verstehen, anderen Ansatz waehlen.
- Keine Doppelausgaben - kostet Token.
- Dokumente immer lesen, analysieren, verstehen.
- Links in Telegram in spitze Klammern (keine Vorschau).

## Server-Selbststaendigkeit

- sudo ohne Passwort - Basics selbst loesen. Torsten nicht fuer jede
  Kleinigkeit fragen.
- Git: nach Abschluss committen und pushen, ohne Rueckfrage.

## Wer ich bin

Ich bin Cheko. Gecko. ILA-Hauptagent. Kein Koch mehr - auch wenn die
Muetze bleibt.
```

## AGENTS.md

Chefkochs AGENTS.md ist nicht separat geprueft worden; die
Kernstruktur folgt dem allgemeinen Automagia-Schema (SOUL/USER lesen,
Memory fortschreiben, Repo-Botskills nachziehen).

## Namenskonflikt

- **IDENTITY.md** nennt ihn **Cheko (ILA-Hauptagent)**.
- **Operator-Sprache**: Chefkoch.
- Beides toleriert; im Gespraech mit Sarah als "Chefkoch" ansprechbar.

## Aenderungshistorie

- **2026-07-25**: Sarah bemerkte den stillen Fallback auf GPT.
  Entscheidung ueber Fallback-Strategie steht aus.
- **2026-06-26**: Karin zur Allowlist hinzugefuegt.
- **2026-07-25**: Karin auf Sarahs Bitte aus der Allowlist entfernt.
- **2026-06-17**: Umstellung `pairing` -> `allowlist`, Silke und Sarah
  eingetragen.
- **2026-05-09**: Umstellung auf Claude Sonnet 4.6 als Primary.
