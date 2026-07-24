# Modell-Uebersicht

**Stand:** 2026-07-24. Preise in **US-Dollar je 1 Million Token**
(Input / Output).

## Grosse Vergleichstabelle

| Anbieter | Modell | Preis Input | Preis Output | Kontextfenster | Staerken | Schwaechen |
|---|---|---:|---:|---|---|---|
| **Anthropic** | Claude Sonnet 4.6 | 3 | 15 | 200k | Ausgewogen, sehr sauber im Deutschen, guter Coder. Meist unser Standard. | Kein Bild-Realtime-Video, Preis mittel |
| **Anthropic** | Claude Opus 4.7 | 15 | 75 | 200k | Beste Anthropic-Denke, sehr gut bei komplexen Aufgaben und Argumentation | Deutlich teurer, spuerbar langsamer |
| **Anthropic** | Claude Haiku 4.5 | 1 | 5 | 200k | Sehr schnell, sehr guenstig, ausreichend fuer viele Alltagsaufgaben | Weniger Tiefe bei komplexer Argumentation |
| **Anthropic** | Claude Fable 5 | 2 (bis 31.08.) / danach 3 | 10 (bis 31.08.) / danach 15 | 200k | Neu, Open-Weight-Variante, gute Balance, Einfuehrungspreis | Noch frisch, Toolchain teils weniger ausgereift |
| **OpenAI** | GPT-5.5 | 5 | 15 | 400k | Sehr starkes Reasoning, GPT-Live-Voice, breite Werkzeug-Anbindung | Ueber 272k Tokens verdoppelt sich Input-Preis, teurer als Sonnet |
| **OpenAI** | GPT-5.5 Pro | 30 | 180 | 400k | Spitzenqualitaet, wenn wirklich noetig | Sehr teuer, langsamer |
| **OpenAI** | GPT-5.6 (Sol) | ~5 | ~15 | 400k | Nachfolger von 5.5, aehnliche Preisklasse, mehr Reasoning | Frisch, Rollout laeuft noch |
| **OpenAI** | GPT-5 nano | 0.05 | ca. 0.40 | 128k | Extrem guenstig, gut fuer Massen-Textverarbeitung | Kaum Reasoning, keine grossen Aufgaben |
| **Google** | Gemini 2.5 Pro | 1.25 | 10 | 1M | Sehr grosses Kontextfenster, gut mit Bildern/PDFs, guenstig fuer Grossaufgaben | Deutsch weniger konsistent, weniger "Charakter" |
| **Google** | Gemini 2.5 Flash | 0.30 | 2.50 | 1M | Sehr guenstig und schnell, riesiges Kontextfenster | Weniger Tiefe, gelegentlich holpriges Deutsch |
| **Google** | Gemini 3 Pro | 2 | 12 | 1M | Neuer, mehr Reasoning, weiterhin sehr grosses Kontextfenster | Rollout noch nicht ueberall, wenig Langzeit-Praxis |
| **Moonshot AI** | Kimi K3 | 3 | 15 | 1M | Open-Weight, 2.8 Billionen Parameter, sehr grosses Kontextfenster, gut fuer Agentic + Coding | Frisch (Juli 2026), Toolchain jung, Anbieter chinesisch (Datenschutz-Ueberlegung) |
| **Moonshot AI** | Kimi K2.5 | 1 | 4 | 128k | Multimodal (Text, Code, Bild), guenstig, offen | Kleiner als K3, weniger Reasoning |

Quellen: Anthropic docs (`platform.claude.com/docs/en/about-claude/pricing`),
`aipricing.guru`, `costgoat.com`; OpenAI docs
(`developers.openai.com/api/docs/pricing`), `benchlm.ai`, `modelpricing.ai`;
Google (`ai.google.dev/gemini-api/docs/pricing`), `aicostcheck.com`;
Moonshot (`platform.kimi.ai/docs/pricing/chat-k3`), OpenRouter, `whatllm.org`.

## Kurzempfehlungen fuer typische Situationen

| Wenn du... | Empfehlung |
|---|---|
| einen zuverlaessigen Standardagenten willst | **Claude Sonnet 4.6** |
| ein besonders schwieriges Problem loesen willst | **Claude Opus 4.7** oder **GPT-5.5** |
| Massenverarbeitung von Text willst und Preis knapp halten | **Claude Haiku 4.5** oder **Gemini 2.5 Flash** |
| sehr grosse Dokumente (PDFs, Buecher) verarbeiten willst | **Gemini 2.5 Pro** oder **Kimi K3** (grosses Kontextfenster) |
| ein Sprach-Erlebnis mit natuerlicher Unterhaltung willst | **GPT-Live** (basiert auf GPT-5.5) |
| bewusst ein offenes Modell (Open Weight) verwenden willst | **Kimi K3** oder **Claude Fable 5** |
| Bilder oder Videos verstehen lassen willst | **Gemini 2.5 Pro** oder **GPT-5.5** mit Vision |

## Faustregel fuer Kosten

Ein Chatlauf mit sinnvoller Antwort (etwa 500 Wort Input, 500 Wort Output)
kostet in etwa:

- Claude Haiku 4.5: unter 0.5 Cent
- Claude Sonnet 4.6: ca. 1.5 Cent
- Claude Opus 4.7: ca. 6-7 Cent
- GPT-5.5: ca. 2 Cent
- Gemini 2.5 Flash: unter 0.3 Cent
- Kimi K3: ca. 1.5-2 Cent

Diese Werte gelten fuer normale Alltagsanfragen; bei sehr langen
Konversationen oder mit Dateianhaengen (grosses Kontextfenster) steigt der
Preis entsprechend.
