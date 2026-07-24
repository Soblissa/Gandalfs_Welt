# Modell-Uebersicht

**Stand:** 2026-07-24. Preise in **US-Dollar je 1 Million Token**
(Input / Output). Angaben, wo nicht der Anbieter selbst zitiert wird,
stammen von seriösen Preis-Aggregatoren (Quellen unten).

## Was "Lokal" bedeutet

- **Ja** = Open-Weight. Modelldateien sind frei herunterladbar; du kannst
  das Modell prinzipiell selbst betreiben. Nicht jede Groesse laeuft auf
  jedem Rechner. Faustregel:
  - unter 15B Parameter: guter Laptop mit starker Grafikkarte
  - 30-70B: Workstation, mehrere Grafikkarten
  - ueber 100B: Rechenzentrum
- **Nein** = closed, nur ueber die API des Anbieters.
- **Teilweise** = kleine Varianten offen, die grosse nicht.

---

## Anthropic (USA)

| Modell | Preis Input | Preis Output | Kontext | Lokal | Kurzcharakter |
|---|---:|---:|---|---|---|
| Claude Opus 4.7 | 15 | 75 | 200k | Nein | Top-Reasoning, teuer, langsam |
| Claude Sonnet 4.6 | 3 | 15 | 200k | Nein | Unser Standardpferd, ausgewogen, sehr gutes Deutsch |
| Claude Haiku 4.5 | 1 | 5 | 200k | Nein | Schnell, guenstig, Alltagsklein |
| Claude Fable 5 | 2 (bis 31.08.) / 3 | 10 / 15 | 200k | Nein | Neue Familie, Einfuehrungspreis, gute Balance |

## OpenAI (USA)

| Modell | Preis Input | Preis Output | Kontext | Lokal | Kurzcharakter |
|---|---:|---:|---|---|---|
| GPT-5.5 Pro | 30 | 180 | 400k | Nein | Spitzenklasse, sehr teuer |
| GPT-5.5 | 5 | 15 | 400k | Nein | Frontier, GPT-Live-Basis, starkes Reasoning |
| GPT-5.6 (Sol) | ~5 | ~15 | 400k | Nein | Nachfolger, im Rollout |
| GPT-5.4 | ~2 | ~8 | 400k | Nein | Vorgaenger, wird abgeloest |
| GPT-5 mini | ~0.30 | ~1.20 | 128k | Nein | Guenstig, gute Balance |
| GPT-5 nano | 0.05 | ~0.40 | 128k | Nein | Massenware, kaum Reasoning |
| o3 / o4 (Reasoning) | 15 / 20 | 60 / 80 | 200k | Nein | Explizite Reasoning-Modelle, teuer |
| gpt-oss 120B | selbstbetrieb | – | 128k | Ja | OpenAIs erstes Open-Weight seit Jahren |
| gpt-oss 20B | selbstbetrieb | – | 128k | Ja | Laeuft auf einer starken Grafikkarte |

## Google (USA)

| Modell | Preis Input | Preis Output | Kontext | Lokal | Kurzcharakter |
|---|---:|---:|---|---|---|
| Gemini 3 Pro | 2 | 12 | 1M | Nein | Neuer, mehr Reasoning |
| Gemini 2.5 Pro | 1.25 | 10 | 1M | Nein | Sehr grosses Kontextfenster, gut mit Medien |
| Gemini 2.5 Flash | 0.30 | 2.50 | 1M | Nein | Guenstiger Schnellarbeiter |
| Gemini 2.5 Flash-Lite | 0.10 | 0.40 | 1M | Nein | Massentauglich, sehr billig |
| Gemma 3 27B | selbstbetrieb | – | 128k | Ja | Offene Google-Familie, gut auf Workstation |
| Gemma 3 12B / 4B / 1B | selbstbetrieb | – | 128k | Ja | Immer kleinere Varianten, bis Laptop |

## xAI (USA)

| Modell | Preis Input | Preis Output | Kontext | Lokal | Kurzcharakter |
|---|---:|---:|---|---|---|
| Grok 4.5 | ~3 | ~15 | 256k-2M | Nein | Frontier, sehr grosses Kontextfenster, X-Anbindung |
| Grok 4.3 | 1.25 | ~5 | 256k | Nein | Mittelklasse, ordentlich |
| Grok 4.1 Fast | 0.20 | ~1 | 256k | Nein | Guenstig, schnell, kein Tiefdenker |
| Grok 4 | 3 | 15 | 256k | Nein | Vorgaenger, weiterhin verfuegbar |

## Meta (USA)

| Modell | Preis Input | Preis Output | Kontext | Lokal | Kurzcharakter |
|---|---:|---:|---|---|---|
| Llama 4 Behemoth | – (nur Meta-Angebot) | – | 1M | Nein bisher | Frontier-Anspruch |
| Llama 4 Maverick 400B | ~0.50 (via Groq) | ~1.50 | 1M | Ja | MoE, starke Konkurrenz zu GPT-4o-Klasse |
| Llama 4 Scout 109B | ~0.35 (via Groq) | ~1.20 | **10M** | Ja | Groesstes Kontextfenster ueberhaupt |
| Llama 3.3 70B | 0.35 (via Groq) | ~0.80 | 128k | Ja | Klassiker der offenen Welt, breit unterstuetzt |
| Llama 3.2 8B | selbstbetrieb | – | 128k | Ja | Handlich, Laptop-tauglich |

## Mistral (Frankreich)

| Modell | Preis Input | Preis Output | Kontext | Lokal | Kurzcharakter |
|---|---:|---:|---|---|---|
| Mistral Large 2 | 2 | 6 | 128k | Nein | Europas Frontier-Kandidat, guenstiger als US-Frontier |
| Mistral Small 3 | 0.10 | 0.30 | 128k | Ja | Sehr guenstig, offen, deutschsprachlich brauchbar |
| Codestral | 0.20 | 0.60 | 32k | Ja | Speziell fuer Code |
| Devstral 2 | 0.30 | 0.90 | 128k | Ja | Neuere Coding-Variante |
| Ministral 3B | 0.04 | 0.10 | 128k | Ja | Winzig, laeuft auf Laptop |
| Ministral 8B | 0.10 | 0.30 | 128k | Ja | Etwas groesser, Laptop-tauglich |
| Pixtral 12B | 0.15 | 0.45 | 128k | Ja | Multimodal (Bilder) |
| Mistral Nemo 12B | 0.15 | 0.15 | 128k | Ja | Von Nvidia mitgebaut, offen, sehr guenstig |

## Cohere (Kanada)

| Modell | Preis Input | Preis Output | Kontext | Lokal | Kurzcharakter |
|---|---:|---:|---|---|---|
| Command R+ | 2.50 | 10 | 128k | Teilweise (aeltere Version offen) | Enterprise, sehr gut mit Suchdaten |
| Command R | 0.15 | 0.60 | 128k | Teilweise | Guenstig, retrieval-stark |
| Embed v4 | 0.10 | – | – | Nein | Nur Embeddings, kein Chat |
| Rerank 3.5 | pro 1000 Suchen: ~1 USD | – | – | Nein | Zusatzbaustein fuer Suche |

## Moonshot AI (China)

| Modell | Preis Input | Preis Output | Kontext | Lokal | Kurzcharakter |
|---|---:|---:|---|---|---|
| Kimi K3 | 3 | 15 | 1M | Ja (angekuendigt) | 2.8 Bio Parameter, Frontier-Anspruch, Agentic |
| Kimi K2.5 | 1 | 4 | 128k | Ja | Multimodal, guenstig |
| Kimi K2 | 0.60 | 2.50 | 128k | Ja | Aeltere Generation, gut fuer Code |

## Alibaba (China) — Qwen-Familie

| Modell | Preis Input | Preis Output | Kontext | Lokal | Kurzcharakter |
|---|---:|---:|---|---|---|
| Qwen3.7-Max (Preview) | ~1.20 | ~2.50 | 262k | Nein | Frontier-Anspruch, aber geschlossen |
| Qwen3-Max | 0.78 | 3.90 | 262k | Ja | Open-Weight-Flaggschiff, 100+ Sprachen |
| Qwen3 72B | 0.15 (via Groq) | ~0.60 | 128k | Ja | Klassenprimus im Open-Weight-Bereich |
| Qwen3 35B | 0.10 | ~0.40 | 128k | Ja | Sehr guenstig, laeuft auf Workstation |
| Qwen3 14B | selbstbetrieb | – | 128k | Ja | Laptop-tauglich |
| Qwen3 VL | 0.20 | 0.80 | 128k | Ja | Multimodal (Bilder) |
| Qwen3 Coder | 0.15 | 0.60 | 128k | Ja | Fuer Programmieraufgaben |

## DeepSeek (China)

| Modell | Preis Input | Preis Output | Kontext | Lokal | Kurzcharakter |
|---|---:|---:|---|---|---|
| DeepSeek V3.2 | 0.27 | 1.10 | 128k | Ja | Extrem guenstig, im Preis-Leistungs-Zenit |
| DeepSeek R2 (Reasoning) | ~0.55 | ~2.20 | 128k | Ja | Reasoning zu westlichem Bruchteil |
| DeepSeek V3 | 0.14 | 0.28 | 128k | Ja | Aeltere Version, immer noch stark |
| DeepSeek OCR 2 | 0.10 | 0.30 | 32k | Ja | Text aus Bildern extrahieren |
| DeepSeek Coder V3 | 0.14 | 0.28 | 128k | Ja | Fuer Programmieraufgaben |

## Weitere fundierte Familien (Kurzblick)

| Anbieter | Modell | Preis (grob) | Lokal | Kurzcharakter |
|---|---|---|---|---|
| Zhipu (China) | GLM-4.6 | 0.50 / 2 | Ja | Chinesische Open-Weight-Familie, ordentliche Qualitaet |
| Baidu (China) | Ernie 4.5 | 0.30 / 1 | Nein | Baidus Flaggschiff |
| 01.AI (China) | Yi-34B | selbstbetrieb | Ja | Open-Weight, gut fuer Deutsch/Englisch |
| Reka (USA) | Reka Flash 3 | 0.40 / 1 | Nein | Multimodal, kleines Team |
| AI21 (Israel) | Jamba 1.6 | 0.50 / 0.70 | Ja | Hybrid-Architektur, sehr grosses Kontextfenster |
| Nvidia | Nemotron 4 340B | selbstbetrieb | Ja | Grosser Trainingsdatenset-Baustein, oft als Grundlage genutzt |
| Snowflake | Arctic-2 | selbstbetrieb | Ja | Datenbanknahe Aufgaben |
| Databricks | DBRX-2 | 0.75 / 2.25 | Ja | Enterprise-orientiert, MoE-Architektur |

---

## Kurzempfehlungen fuer typische Situationen

| Wenn du... | Empfehlung |
|---|---|
| einen zuverlaessigen Standardagenten willst | **Claude Sonnet 4.6** |
| ein besonders schwieriges Problem loesen willst | **Claude Opus 4.7**, **GPT-5.5**, oder **Grok 4.5** |
| Massentext-Verarbeitung, Preis knapp | **Gemini 2.5 Flash-Lite**, **DeepSeek V3.2**, **Ministral 3B** |
| sehr grosse Dokumente (Buecher, PDFs) | **Gemini 2.5 Pro**, **Llama 4 Scout** (10M!), **Kimi K3** (1M) |
| Sprach-Erlebnis (Voice) | **GPT-Live** (basiert auf GPT-5.5) |
| Coding und Programmieren | **Claude Sonnet 4.6**, **Codestral / Devstral 2**, **Qwen3 Coder**, **DeepSeek Coder V3** |
| Multimodal (Bilder, PDFs verstehen) | **Gemini 2.5 Pro**, **GPT-5.5**, **Pixtral 12B**, **Qwen3 VL** |
| **auf eigener Hardware** (Datenschutz, Kontrolle) | **Llama 3.3 70B**, **Qwen3 72B**, **Mistral Small 3**, **DeepSeek V3.2**, **Gemma 3** je nach Rechnergroesse |
| Sensible Kundendaten oder Behoerdenkontext | **Anthropic** oder **OpenAI**, oder **offenes Modell selbst hosten** — nicht ueber chinesische API |
| Suche und Wissensdatenbanken (Retrieval) | **Cohere Command R+** oder **Command R** |

## Faustregel Kosten pro Chat

Ein Chatlauf mit 500 Woertern Input und 500 Woertern Output kostet grob:

- **Ministral 3B**: unter 0.05 Cent
- **DeepSeek V3.2 / Gemini 2.5 Flash-Lite**: ~0.1 Cent
- **Qwen 35B / Llama 3.3 70B / GPT-5 nano**: ~0.15-0.20 Cent
- **Command R**: ~0.4 Cent
- **Qwen3-Max**: ~0.5 Cent
- **Mistral Large 2**: ~0.7 Cent
- **Claude Sonnet 4.6 / Kimi K3 / Grok 4.5**: ~1.5 Cent
- **GPT-5.5**: ~2 Cent
- **Claude Opus 4.7**: ~6-7 Cent
- **GPT-5.5 Pro**: ~20 Cent

---

## Hinweise zu chinesischen Modellen

Auf Sarahs ausdruecklichen Wunsch stehen chinesische Modelle in dieser
Tabelle drin (Moonshot AI, Alibaba/Qwen, DeepSeek, Zhipu, Baidu, 01.AI).
Sie sind meist:

- **guenstiger** als westliche Vergleichsmodelle
- oft **offen** (Open-Weight, lokal betreibbar)
- **technisch konkurrenzfaehig**, teils fuehrend in einzelnen Disziplinen
  (Reasoning, Coding, lange Kontexte)

Zu bedenken:

- **Datenschutz und Politik**: Anbieter mit chinesischem Sitz oder
  Servern unterliegen anderen Rechtsraeumen. Bei sensiblen Daten (Kunden,
  Behoerden, Personenbezogenes) besser bei Anthropic oder OpenAI bleiben,
  oder das offene Modell **selbst hosten**.
- **Themenfilter**: Manche chinesischen Modelle vermeiden politisch
  heikle Fragen. Fuer Fachaufgaben meist irrelevant.

---

## Quellen

- Anthropic: `platform.claude.com/docs/en/about-claude/pricing`,
  `aipricing.guru`, `costgoat.com`, `aicostcheck.com`
- OpenAI: `developers.openai.com/api/docs/pricing`, `benchlm.ai`,
  `modelpricing.ai`
- Google: `ai.google.dev/gemini-api/docs/pricing`, `aicostcheck.com`,
  `getapipulse.com`
- xAI: `aipricing.guru/xai-pricing`, `pricepertoken.com`, `costbench.com`
- Meta / Llama: `codersera.com`, `explainx.ai`, `aimadetools.com`,
  `royfactory.net`
- Mistral: `mistral.ai/pricing`, `aimadetools.com`, `aipricing.guru`,
  `stackcompare.net`
- Cohere: `cohere.com/pricing`, `aicostcheck.com`, `metacto.com`,
  `pecollective.com`
- Moonshot: `platform.kimi.ai/docs/pricing/chat-k3`, OpenRouter,
  `whatllm.org`
- Alibaba/Qwen: `tokenmix.ai`, `cloudprice.net`, `aitooltier.com`,
  `techjacksolutions.com`
- DeepSeek: `abstractapi.com`, `margindash.com`, `ecomcalctools.com`,
  `lmmarketcap.com`

Aktualisierungsrhythmus: **jeden Mittwoch 08:05 UTC**, gekoppelt an das
KI-News-Briefing.
