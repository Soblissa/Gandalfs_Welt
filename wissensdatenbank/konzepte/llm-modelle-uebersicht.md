# LLM-Modelle - Uebersicht und Empfehlungen

Stand: 2026-08-14. Preise beziehen sich auf OpenRouter, Angaben in USD pro
1 Million Tokens (Input / Output). Preise koennen sich schnell aendern;
im Zweifel auf https://openrouter.ai/models pruefen.

Diese Uebersicht bewusst schlank gehalten -- die vollstaendige Modellliste
mit 400+ Eintraegen ist ein Katalog, hier steht Praxis.

## Grundprinzip: Modellklassen und wozu sie taugen

Ein LLM-Anbieter hat meist drei bis vier Groessenklassen der gleichen
Familie -- gleiche Handschrift, unterschiedliches Gewicht. Der Name
verraet in der Regel die Klasse, der Preis bestaetigt sie.

**Faustregel:**
- Kleine Modelle: schnell, guenstig, gut fuer kurze/einfache Aufgaben.
- Mittelgrosse Modelle: der Alltagsbegleiter, deckt 80-90 Prozent aller
  Anfragen sinnvoll ab.
- Grosse Modelle: schweres Reasoning, lange autonome Aufgaben, Marathon-Arbeit.
  Nur einsetzen, wenn die Aufgabe es wirklich verlangt.

Wer immer das grosse Modell nimmt, verbrennt Geld. Wer immer das kleine
nimmt, kriegt schwache Ergebnisse. Also situationsgerecht waehlen.

## Anthropic (Claude-Familie)

Anthropic benennt seine Modelle nach literarischen Formen. Groesse steigt
von Haiku ueber Sonnet zu Opus, Fable liegt darueber.

- **Claude Haiku** -- klein und schnell. Zusammenfassungen, Klassifikation,
  Uebersetzungen, kurze Antworten. Am guenstigsten.
- **Claude Sonnet 4.6** -- der Alltagsbegleiter. Klug genug fuer
  Programmieren, laengere Analysen, mehrstufige Aufgaben. ~3 USD / 15 USD.
  **Empfehlung: 90 Prozent aller Aufgaben.**
- **Claude Opus 5** -- schweres Denkgeraet, tiefes Reasoning, lange
  Ketten, ambige Probleme. ~5 USD / 25 USD. Fuer die schweren Brocken.
- **Claude Fable 5** -- die noch schwerere Variante, seit 09.06.2026.
  1M Kontext, 128k Output, dauerhaft aktives Reasoning. 10 USD / 50 USD.
  Nur, wenn wirklich ein autonomer Marathon-Auftrag ansteht.

## OpenAI (GPT-Familie)

OpenAI hat mit **GPT-5.6** (allgemein verfuegbar seit 09.07.2026) das
Namensschema geaendert: die Zahl markiert die Generation, der
Himmelskoerper-Zusatz die Groessenklasse. Sol > Terra > Luna.

- **GPT-5.6 Sol** -- Flaggschiff. Schweres Reasoning, Coding, Wissenschaft.
  Aktueller State of the Art laut OpenAIs eigenen Benchmarks.
  5 USD / 30 USD. Zusaetzliche Reasoning-Stufen `max` und `ultra`
  (mehrere Sub-Agenten parallel).
- **GPT-5.6 Terra** -- Mittelklasse, guter Alltagsbegleiter mit sehr
  ordentlichem Preis-/Leistungsverhaeltnis. 2,50 USD / 15 USD.
- **GPT-5.6 Luna** -- klein und schnell. 1 USD / 6 USD, seit 30.07.2026
  nochmal um 80 Prozent guenstiger. Fuer kurze/einfache Aufgaben.
- **o3** -- aelteres, aber spezialisiertes Reasoning-Modell, denkt sichtbar
  in Ketten. Noch nuetzlich fuer Mathe/Logik.
- **GPT-5.5 Pro** -- Vorgaengergeneration, hoher Preis, kaum noch noetig
  seit Sol verfuegbar ist.

## Moonshot AI (Kimi-Familie)

- **Kimi K3** (`moonshotai/kimi-k3`) -- Moonshots aktuelles Flaggschiff seit
  16.07.2026. 2,8T Parameter, 1M Kontext, multimodal (Text + Bild + Video),
  starkes Reasoning. 3 USD / 15 USD. **Interessante Alternative zu Sonnet
  und Opus, insbesondere bei sehr langem Kontext.**
- **Kimi K2.x** -- aeltere Generation, deutlich guenstiger, aber schwaecher
  im Reasoning. Fuer den Vergleich noch nuetzlich.

## Google (Gemini-Familie)

- **Gemini 2.5 Pro** -- riesiger Kontext, multimodal, guter Alltagsbegleiter
  mit anderer Handschrift als Claude.

## Offene Modelle (zum Vergleich, meist guenstiger)

- **DeepSeek V3** -- sehr guenstig, ueberraschend stark im Programmieren.
- **Qwen3 (Alibaba)** -- offen, mehrsprachig, gut in asiatischen Sprachen.
- **Llama 4 (Meta)** -- Metas Flaggschiff, breit einsetzbar.
- **Grok 4 (xAI)** -- Musks Modell, eigene Handschrift.

## Spezialisten

- **Perplexity Sonar** -- integriert Web-Suche direkt in die Antwort,
  gut fuer aktuelle Fakten mit Quellenangaben.
- **Mistral Large 2** -- franzoesische Alternative, guenstig.

## Praktische Konsequenz fuer TypingMind

- Standard-Alltag: **Claude Sonnet 4.6**, **GPT-5.6 Terra** oder **Kimi K3**.
- Schwere Denksportaufgaben: **GPT-5.6 Sol**, **Claude Opus 5** oder **o3**.
- Marathon-Auftraege mit autonomer Ausfuehrung: **Claude Fable 5** oder
  **GPT-5.6 Sol** im `ultra`-Modus.
- Aktuelles Wissen mit Quellen: **Perplexity Sonar**.
- Bild-/Video-Verarbeitung mit langem Kontext: **Gemini 2.5 Pro** oder
  **Kimi K3**.
- Sparsam und schnell: **GPT-5.6 Luna** oder **DeepSeek V3**.
- Zum Vergleichen: **Qwen3**, **Llama 4**, **Grok 4**.

Sarah nutzt TypingMind mit OpenRouter als Sammelanschluss, dort sind
alle diese Modelle ueber einen einzigen API-Schluessel erreichbar.
