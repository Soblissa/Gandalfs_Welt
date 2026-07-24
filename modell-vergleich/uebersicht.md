# Modell-Uebersicht

**Stand:** 2026-07-24. Preise in **US-Dollar je 1 Million Token**
(Input / Output).

## Was "lokal nutzbar" heisst

Die Spalte **Lokal** zeigt, ob du das Modell theoretisch **selbst auf
einem eigenen Rechner betreiben** koenntest, statt es beim Anbieter zu
kaufen.

- **Ja** = Open-Weight, du kannst die Modelldateien herunterladen und
  auf einem starken Rechner (viel Arbeitsspeicher, gute Grafikkarte)
  betreiben. In der Praxis brauchen die grossen Varianten
  Rechenzentren-Hardware; nur die kleineren Grossen laufen auf einem
  normalen Laptop.
- **Nein** = geschlossen. Du kannst nur ueber die API des Anbieters
  darauf zugreifen.
- **Teilweise** = kleine Varianten offen, die grosse nicht (typisch bei
  Google und Alibaba).

## Grosse Vergleichstabelle

| Anbieter | Modell | Preis Input | Preis Output | Kontextfenster | Lokal | Staerken | Schwaechen |
|---|---|---:|---:|---|---|---|---|
| **Anthropic** | Claude Sonnet 4.6 | 3 | 15 | 200k | Nein | Ausgewogen, sehr sauber im Deutschen, guter Coder. Unser Standard. | Kein Realtime-Video, Preis mittel |
| **Anthropic** | Claude Opus 4.7 | 15 | 75 | 200k | Nein | Beste Anthropic-Denke, sehr gut bei komplexer Argumentation | Deutlich teurer, spuerbar langsamer |
| **Anthropic** | Claude Haiku 4.5 | 1 | 5 | 200k | Nein | Sehr schnell, sehr guenstig, gut fuer viele Alltagsaufgaben | Weniger Tiefe bei komplexen Argumenten |
| **Anthropic** | Claude Fable 5 | 2 (bis 31.08.) / 3 | 10 (bis 31.08.) / 15 | 200k | Nein | Neu, gute Balance, Einfuehrungspreis bis Ende August | Frisch, Toolchain teils weniger ausgereift |
| **OpenAI** | GPT-5.5 | 5 | 15 | 400k | Nein | Sehr starkes Reasoning, GPT-Live-Voice, breite Werkzeug-Anbindung | Ueber 272k Tokens verdoppelt sich Input-Preis, teurer als Sonnet |
| **OpenAI** | GPT-5.5 Pro | 30 | 180 | 400k | Nein | Spitzenqualitaet, wenn wirklich noetig | Sehr teuer, langsamer |
| **OpenAI** | GPT-5.6 (Sol) | ~5 | ~15 | 400k | Nein | Nachfolger von 5.5, aehnlicher Preis, mehr Reasoning | Rollout laeuft noch |
| **OpenAI** | GPT-5 nano | 0.05 | ~0.40 | 128k | Nein | Extrem guenstig, gut fuer Massen-Textverarbeitung | Kaum Reasoning, keine grossen Aufgaben |
| **Google** | Gemini 2.5 Pro | 1.25 | 10 | 1M | Nein | Sehr grosses Kontextfenster, gut mit Bildern/PDFs, guenstig fuer Grossaufgaben | Deutsch weniger konsistent |
| **Google** | Gemini 2.5 Flash | 0.30 | 2.50 | 1M | Nein | Sehr guenstig und schnell, riesiges Kontextfenster | Weniger Tiefe, gelegentlich holpriges Deutsch |
| **Google** | Gemini 3 Pro | 2 | 12 | 1M | Nein | Neuer, mehr Reasoning, weiter 1M-Kontextfenster | Rollout noch nicht ueberall, wenig Langzeit-Praxis |
| **Google** | Gemma 3 (klein) | frei bei Selbstbetrieb | – | 128k | Ja | Kleine offene Familie, laeuft auf gutem Laptop, gute Deutschkenntnisse | Weit unter Gemini 3 Pro, nur fuer eng umrissene Aufgaben |
| **Moonshot AI** (CN) | Kimi K3 | 3 | 15 | 1M | Ja (angekuendigt) | Open-Weight, 2.8 Bio Parameter, riesiges Kontextfenster, stark bei Agentic und Coding | Sehr gross, Betrieb braucht ernste Hardware; Anbieter chinesisch |
| **Moonshot AI** (CN) | Kimi K2.5 | 1 | 4 | 128k | Ja | Multimodal (Text, Code, Bild), guenstig, offen | Kleiner als K3, weniger Reasoning |
| **Alibaba** (CN) | Qwen3-Max | 0.78 | 3.90 | 262k | Ja | Open-Weight-Flaggschiff, 100+ Sprachen, permissive Lizenz, sehr guenstig | Chinesisch (Datenschutz), Toolchain im Aufbau |
| **Alibaba** (CN) | Qwen3.7-Max (Preview) | ~1.20 | ~2.50 | 262k | Nein | Frontier-Klasse, guenstiger als westliche Frontier-Modelle | Closed-Weight seit April 2026 |
| **Alibaba** (CN) | Qwen 35B (Open) | 0.15 (via Groq) | ~0.60 | 128k | Ja | Sehr guenstig, laeuft auf einer starken Grafikkarte | Klein, nicht Frontier-Level |
| **DeepSeek** (CN) | DeepSeek V3.2 | 0.27 | 1.10 | 128k | Ja | **Extrem guenstig**, offen, oft in der Top-Region der Benchmarks | Chinesisch, gelegentlich politische Filterung |
| **DeepSeek** (CN) | DeepSeek R2 (Reasoning) | ~0.55 | ~2.20 | 128k | Ja | Starkes Reasoning zu Bruchteil des westlichen Preises | Wie oben, plus laengere Antwortzeiten |
| **Meta** (US) | Llama 3.3 70B | 0.35 (via Groq) | ~0.80 | 128k | Ja | Klassiker der offenen Welt, breit unterstuetzt, gut fuer Selbstbetrieb | Wird zunehmend von neueren offenen Modellen ueberholt |

Quellen: Anthropic docs (`platform.claude.com/docs/en/about-claude/pricing`),
`aipricing.guru`, `costgoat.com`; OpenAI docs
(`developers.openai.com/api/docs/pricing`), `benchlm.ai`, `modelpricing.ai`;
Google (`ai.google.dev/gemini-api/docs/pricing`), `aicostcheck.com`;
Moonshot (`platform.kimi.ai/docs/pricing/chat-k3`), OpenRouter, `whatllm.org`;
Alibaba (`tokenmix.ai`, `cloudprice.net`, `aitooltier.com`);
DeepSeek (`abstractapi.com`, `margindash.com`, `ecomcalctools.com`).

## Kurzempfehlungen fuer typische Situationen

| Wenn du... | Empfehlung |
|---|---|
| einen zuverlaessigen Standardagenten willst | **Claude Sonnet 4.6** |
| ein besonders schwieriges Problem loesen willst | **Claude Opus 4.7** oder **GPT-5.5** |
| Massenverarbeitung von Text willst und Preis knapp halten | **Claude Haiku 4.5**, **Gemini 2.5 Flash**, oder **DeepSeek V3.2** |
| sehr grosse Dokumente (PDFs, Buecher) verarbeiten willst | **Gemini 2.5 Pro** oder **Kimi K3** (grosses Kontextfenster) |
| ein Sprach-Erlebnis mit natuerlicher Unterhaltung willst | **GPT-Live** (basiert auf GPT-5.5) |
| ein offenes Modell verwenden willst | **Kimi K3** (gross), **Qwen3-Max** oder **DeepSeek V3.2** (sehr guenstig), **Llama 3.3 70B** (Klassiker) |
| ein Modell **auf eigener Hardware** betreiben willst | **Qwen 35B**, **Llama 3.3 70B**, **DeepSeek V3.2**, **Gemma 3** je nach Rechnergroesse |
| Bilder oder Videos verstehen lassen willst | **Gemini 2.5 Pro** oder **GPT-5.5** mit Vision |

## Faustregel fuer Kosten

Ein Chatlauf mit sinnvoller Antwort (etwa 500 Wort Input, 500 Wort Output)
kostet in etwa:

- **DeepSeek V3.2**: unter 0.1 Cent
- **Qwen 35B / Llama 3.3 70B**: unter 0.2 Cent
- **Gemini 2.5 Flash**: unter 0.3 Cent
- **Claude Haiku 4.5**: unter 0.5 Cent
- **Qwen3-Max**: ca. 0.5 Cent
- **Claude Sonnet 4.6 / Kimi K3**: ca. 1.5 Cent
- **GPT-5.5**: ca. 2 Cent
- **Claude Opus 4.7**: ca. 6-7 Cent
- **GPT-5.5 Pro**: ca. 20 Cent

## Erklaerung "Chinesische Modelle"

Auf Sarahs ausdruecklichen Wunsch stehen chinesische Modelle in dieser
Tabelle drin (Moonshot AI, Alibaba/Qwen, DeepSeek). Sie sind meist:

- **guenstiger** als westliche Vergleichsmodelle
- oft **offen** (Open-Weight, also lokal betreibbar)
- **technisch konkurrenzfaehig**, teils fuehrend bei bestimmten Aufgaben

Zu bedenken:

- **Datenschutz und Politik**: Anbieter mit chinesischem Sitz oder Servern
  unterliegen anderen Rechtsraeumen. Bei sensiblen Daten (Kundendaten,
  Behoerdenkontext, Personenbezogenes) besser bei Anthropic oder OpenAI
  bleiben, oder das offene Modell **selbst hosten**.
- **Themenfilter**: Manche chinesischen Modelle vermeiden politisch
  heikle Fragen. Fuer Fachthemen meist irrelevant.
