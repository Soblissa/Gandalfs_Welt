# Modell-Vergleich

Sarahs Uebersicht ueber die grossen KI-Modelle. Aktuell und knapp.

## Was hier drinsteht

- `uebersicht.md` — grosse Vergleichstabelle in Markdown fuer die
  Anzeige auf GitHub. Anbieter, Modell, Preise, Kontextfenster,
  **lokal betreibbar (ja/nein/teilweise)**, Staerken, Schwaechen.
- `uebersicht.xlsx` — dieselbe Tabelle als **Excel-Datei** zum
  Herunterladen. Enthaelt drei Blaetter: Modelle (Hauptliste mit
  Filterfunktion und Zebrafarben pro Anbieter), Legende, Faustregel
  Kosten.
- Beide Dateien werden im gleichen Rhythmus aktualisiert.
- Chinesische Anbieter (Moonshot, Alibaba/Qwen, DeepSeek, Zhipu, Baidu,
  01.AI) sind gleichrangig einbezogen (Entscheidung Sarahs 24.07.2026).
- Weitere Detaildateien folgen bei Bedarf.

## Wichtige Hinweise vorneweg

- Preise sind in **US-Dollar je 1 Million Token** angegeben. Ein Token
  ist ein Wort-Bruchstueck; eine Seite Text hat ungefaehr 500-800 Token.
- **Input** ist, was du an das Modell schickst. **Output** ist, was es
  zurueckliefert. Output ist immer teurer.
- Preise sind Stand **Juli 2026** und aendern sich stetig. Bei
  Ungewissheit auf die Anbieter-Seite schauen; Quellen stehen in der
  Detaildatei.

## Wie ich diese Datei aktualisiere

- **Wochenrhythmus, mittwochs 08:00 UTC**, gekoppelt an das KI-News-
  Briefing: Gandalf prueft frische Preisdaten und Modellneuheiten und
  spielt Aenderungen ein, wenn sich etwas Substanzielles bewegt hat.
  Der Wochenrhythmus laeuft auch dann, wenn kein Themenwechsel
  ansteht, damit die Zeile "Stand" immer aktuell ist.
- Neue Modelle werden in `uebersicht.md` einsortiert (nach Anbieter,
  innerhalb alphabetisch).
- Preisaenderungen bekommen einen "Stand" -Vermerk pro Zeile.
- Alle Aenderungen kommen als sichtbarer Commit in dieses Repo, damit
  Sarah die Historie nachvollziehen kann.
