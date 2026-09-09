# Modell-Uebersicht

**Stand:** 2026-09-09 (08:10 UTC). Preise in **US-Dollar je 1 Million
Token** fuer Standard-Echtzeitverarbeitung, angegeben als **Input / Output**.
Cache-, Batch-, Flex-, regionale und Langkontext-Aufschlaege sind nicht
eingerechnet. `—` bedeutet: kein direkter Tokenpreis des Herstellers.

**Status:** **Aktuell** = heutige Hauptgeneration, **Vorgaenger** = noch
verfuegbar, aber nicht mehr erste Wahl, **veraltet/abgekuendigt** = nicht fuer
neue Integrationen einplanen.

## Anthropic (USA)

| Modell | Preis | Status | Lokal | Einordnung |
|---|---:|---|---|---|
| Claude Fable 5.1 | 10 / 50 | Aktuell | Nein | Teure Spezialklasse; Cache-Treffer 0,25 |
| Claude Mythos 5.1 | 10 / 50 | Aktuell, begrenzt verfuegbar | Nein | Spezialmodell mit eingeschraenktem Zugang |
| Claude Opus 5 | 5 / 25 | Aktuell | Nein | Spitzenmodell fuer schwierige Agenten- und Reasoning-Aufgaben |
| Claude Sonnet 5 | 2 / 10 | Aktuell | Nein | Preis-Leistungs-Standard; Einfuehrungspreis wurde dauerhaft gemacht |
| Claude Haiku 4.5 | 1 / 5 | Aktuell | Nein | Schnelle, guenstige Klasse |
| Claude Opus 4.6–4.8 / Sonnet 4.6 | 5 / 25 bzw. 3 / 15 | Vorgaenger | Nein | Weiter nutzbar; nicht mehr Hauptgeneration |
| Claude Opus 4/4.1, Sonnet 4, Haiku 3.5 | 15 / 75, 3 / 15, 0,80 / 4 | **veraltet/abgekuendigt** | Nein | Bei Anthropic retirert; teils noch ueber Cloudpartner |

## OpenAI (USA)

| Modell | Preis | Status | Lokal | Einordnung |
|---|---:|---|---|---|
| GPT-6 Astra | 10 / 50 | Aktuell | Nein | Neues Spitzenmodell; Langkontext 20 / 75 |
| GPT-5.6 Sol | 4 / 20 | Aktuell, Aktionspreis | Nein | Starkes Hauptmodell; Langkontext 8 / 30 |
| GPT-5.6 Terra | 2 / 12 | Aktuell | Nein | Mittlere Preis-/Leistungsklasse |
| GPT-5.6 Luna | 0,20 / 1,20 | Aktuell | Nein | Schnelle Massenverarbeitung |
| GPT-5.5 / GPT-5.5 Pro | 5 / 30 bzw. 30 / 180 | Vorgaenger | Nein | Weiter teuer; durch 5.6/6 ueberholt |
| GPT-5 mini / nano | 0,25 / 2 bzw. 0,05 / 0,40 | Vorgaenger, weiter sinnvoll | Nein | Bewaehrte Niedrigpreisklasse |
| o3 / o4-mini | 2 / 8 bzw. 1,10 / 4,40 | Vorgaenger | Nein | Aeltere explizite Reasoning-Reihe |
| gpt-oss 120B / 20B | Selbstbetrieb | Aktuell offen | Ja | Open-Weight; Infrastruktur statt Tokenpreis |

## Google (USA)

| Modell | Preis | Status | Lokal | Einordnung |
|---|---:|---|---|---|
| Gemini 3.8 Flash | 0,75 / 3,75 | Aktuell, Aktionspreis bis 31.12.2026 | Nein | Neuester Flash; ab 2027 laut Preisseite 1,50 / 7,50 |
| Gemini 3.7 Flash | 0,75 / 3,75 | Vorgaenger | Nein | Durch 3.8 Flash abgeloest |
| Gemini 3.1 Pro Preview | 2 / 12 | Aktuelle Pro-Klasse, Preview | Nein | Ueber 200k Inputtoken: 4 / 18 |
| Gemini 2.5 Pro | 1,25 / 10 | Vorgaenger | Nein | Ueber 200k Inputtoken: 2,50 / 15 |
| Gemini 2.5 Flash | 0,30 / 2,50 | Vorgaenger, guenstig | Nein | Weiter stark fuer grosse Mengen |
| Gemini 2.5 Flash-Lite | 0,10 / 0,40 | Vorgaenger, guenstig | Nein | Niedrigster belegter Google-Standardpreis |
| Gemma 3 | Selbstbetrieb | Offene Familie | Ja | Lokal betreibbar; Infrastruktur statt Tokenpreis |

## Moonshot AI / Kimi (China)

| Modell | Preis | Status | Lokal | Einordnung |
|---|---:|---|---|---|
| Kimi K3 | 3 / 15 | Aktuell | Nein* | Flaggschiff, 1.048.576 Token Kontext; Cache-Treffer 0,30 |
| Kimi K2.7 Code | 0,95 / 4 | Aktuell | Nein* | Coding, multimodal, 262k Kontext; Highspeed kostet 1,90 / 8 |
| Kimi K2.6 | 0,95 / 4 | Aktuell | Nein* | Allgemein, multimodal, 262k Kontext |
| Kimi K2.5 / K2 | — | **Vorgaenger** | Je nach veroeffentlichtem Checkpoint | Nicht mehr auf der aktuellen internationalen Preisseite |

\* `Lokal` bezieht sich hier auf die konkret bepreiste API-Version. Ein
separater offener Checkpoint ist nicht automatisch dieselbe API-Version.

## Alibaba Cloud / Qwen (China)

Alibaba staffelt Preise nach Region und Eingabelaenge. Die Tabelle verwendet
die internationale Region Singapur und die jeweils erste Eingabestufe.

| Modell | Preis | Status | Lokal | Einordnung |
|---|---:|---|---|---|
| Qwen3.8-Max | 2 / 6 | Aktuell | Nein | Neues geschlossenes API-Flaggschiff, bis 1M Kontext |
| Qwen3.7-Max | 2,50 / 7,50 | Vorgaenger | Nein | Durch 3.8-Max ueberholt |
| Qwen3-Max | 1,20 / 6 (bis 32k) | Vorgaenger | Nein | **Korrektur:** API-Max ist nicht Open-Weight; Preis steigt mit Kontext |
| Qwen3-2507 235B-A22B | Selbstbetrieb | Aktuell offen | Ja | Open-Weight-Flaggschiff; 256k, optional bis 1M Kontext |
| Qwen3-2507 30B-A3B / 4B | Selbstbetrieb | Aktuell offen | Ja | Workstation- bzw. kompakte Klasse |
| Qwen3-2504 | Selbstbetrieb | **Vorgaenger** | Ja | Durch die 2507-Checkpoints ersetzt |

## DeepSeek (China)

DeepSeek hat zeitabhaengige Preise. Angegeben ist **Peak / Off-Peak** fuer
Cache-Miss-Input und Output; Cache-Treffer sind nochmals deutlich billiger.

| Modell | Peak (Input/Output) · Off-Peak (Input/Output) | Status | Lokal | Einordnung |
|---|---:|---|---|---|
| DeepSeek V4 Flash | 0,44 / 1,32 · 0,22 / 0,66 | Aktuell | Nein* | 1M Kontext, allgemeines schnelles Modell |
| DeepSeek V4 Pro | 1,32 / 3,96 · 0,66 / 1,98 | Aktuell | Nein* | Hoehere Qualitaetsklasse, 1M Kontext |
| DeepSeek V4 Flash Vision Exp | 0,44 / 1,32 · 0,22 / 0,66 | Experimentell | Nein* | Multimodale Vorschau |
| DeepSeek V3.2 / R2 / V3 | — | **Vorgaenger** | Modellabhaengig | Nicht mehr auf der aktuellen API-Preisseite; alte Schaetzpreise entfernt |

\* Die Tabelle bewertet die angebotene API-Version; fuer Selbstbetrieb
muessen Lizenz und konkret veroeffentlichter Checkpoint getrennt geprueft
werden.

## Meta / Llama (USA)

Meta weist fuer Llama auf der offiziellen Modellseite **keinen direkten
Tokenpreis** aus. Preise fremder Hosts sind Anbieterpreise und werden deshalb
nicht als Meta-Preis dargestellt.

| Modell | Preis | Status | Lokal | Einordnung |
|---|---:|---|---|---|
| Llama 4 Maverick 17B-128E | Selbstbetrieb / Drittanbieter | Aktuell | Ja | Offenes MoE-Modell, bis 1M Kontext |
| Llama 4 Scout 17B-16E | Selbstbetrieb / Drittanbieter | Aktuell | Ja | Offenes MoE-Modell, bis 10M Kontext |
| Llama 4 Behemoth | — | **nicht als Download gelistet** | Nein | Nicht als verfuegbares Modell einpreisen |
| Llama 3.3 70B | Selbstbetrieb / Drittanbieter | Vorgaenger | Ja | 128k Kontext, breit unterstuetzt |
| Llama 3.2 1B/3B und Vision 11B/90B | Selbstbetrieb / Drittanbieter | Vorgaenger | Ja | Kleine bzw. multimodale Varianten |

## Kurze Einordnung

| Bedarf | Erste Wahl aus dieser Preispruefung |
|---|---|
| ausgewogener geschlossener Standardagent | Claude Sonnet 5 |
| schwierigste Aufgaben, Preis zweitrangig | GPT-6 Astra, Claude Opus 5 |
| guenstige Massenverarbeitung | Gemini 2.5 Flash-Lite, GPT-5.6 Luna, DeepSeek V4 Flash |
| Coding | Kimi K2.7 Code, Claude Sonnet 5, GPT-5.6 Sol |
| sehr langer Kontext | Kimi K3, Gemini, DeepSeek V4; lokal Llama 4 Scout |
| lokal und kontrollierbar | Qwen3-2507, Llama 4, Gemma 3, gpt-oss |

Chinesische Anbieter werden gleichrangig nach Eignung, Preis, Offenheit und
Betriebsrisiko beurteilt. Herkunft ersetzt weder technische Pruefung noch
Datenschutzpruefung.

## Primaerquellen (am 2026-09-09 abgerufen)

- [Anthropic: Claude API pricing](https://platform.claude.com/docs/en/about-claude/pricing)
- [OpenAI: API pricing](https://developers.openai.com/api/docs/pricing)
- [Google: Gemini API pricing](https://ai.google.dev/gemini-api/docs/pricing)
- [Moonshot/Kimi: Modellpreise](https://platform.kimi.ai/docs/pricing/chat)
- [Alibaba Cloud: Model Studio pricing](https://www.alibabacloud.com/help/en/model-studio/model-pricing)
- [Qwen: offizielle Qwen3-Modellliste](https://github.com/QwenLM/Qwen3)
- [DeepSeek: Models & Pricing](https://api-docs.deepseek.com/quick_start/pricing/)
- [Meta: offizielle Llama-Modelle](https://github.com/meta-llama/llama-models)

Aktualisierungsrhythmus: **jeden Mittwoch 08:05 UTC**, gekoppelt an das
KI-News-Briefing.
