# Modell-Uebersicht

**Stand: 2026-09-02 (08:10 UTC).** Preise in **US-Dollar je 1 Million
Token** (Input / Output), sofern nicht anders angegeben. Genannt ist der
regulaere Echtzeit-API-Listenpreis ohne Cache-, Batch-, Fast- oder
Regionalaufschlaege. Bei gestaffelten Preisen gilt die erste Preisstufe.

## Leseschluessel

- **Aktuell** = Teil der gegenwaertigen Modellfamilie des Anbieters.
- **Legacy** = noch verfuegbar, aber nicht mehr erste Wahl fuer neue Systeme.
- **Retired** = beim Erstanbieter eingestellt oder nur noch auf einzelnen
  Partnerplattformen vorhanden.
- **Lokal: Ja** = Gewichte sind herunterladbar; API-Preise fremder Hoster sind
  deshalb nicht mit einem Herstellerpreis gleichzusetzen.

## Anthropic (USA)

| Modell | Status | Input | Output | Kontext | Lokal | Einordnung |
|---|---|---:|---:|---:|---|---|
| Claude Fable 5.1 | Aktuell | 10 | 50 | 1M | Nein | Staerkstes Langzeit-Reasoning, langsam und teuer |
| Claude Opus 5 | Aktuell | 5 | 25 | 1M | Nein | Standard fuer komplexe Agenten- und Coding-Arbeit |
| Claude Sonnet 5 | Aktuell | 2 | 10 | 1M | Nein | Beste Balance aus Tempo, Qualitaet und Preis |
| Claude Haiku 4.5 | Aktuell | 1 | 5 | 200k | Nein | Schnellstes aktuelles Claude-Modell |
| Claude Fable 5 | Legacy | 10 | 50 | 1M | Nein | Durch Fable 5.1 abgeloest |
| Claude Opus 4.8 / 4.7 / 4.6 / 4.5 | Legacy | 5 | 25 | 1M | Nein | Alte Opus-Generation |
| Claude Sonnet 4.6 / 4.5 | Legacy | 3 | 15 | 200k | Nein | Sonnet 5 ist neuer und zugleich billiger |
| Claude Opus 4.1 / 4 | Retired* | 15 | 75 | 200k | Nein | *Nur noch auf einzelnen Cloud-Plattformen |

Wichtige Korrektur: Der fruehere Eintrag gab Fable 5 mit 2/10 und Opus 4.7
mit 15/75 an. Anthropic nennt aktuell 10/50 beziehungsweise 5/25.

## OpenAI (USA)

| Modell | Status | Input | Output | Kontextpreis | Lokal | Einordnung |
|---|---|---:|---:|---|---|---|
| GPT-5.6 Sol | Aktuell | 4 | 20 | kurz; 8/30 lang | Nein | Flaggschiff fuer schwieriges Reasoning und Coding; Aktionspreis bis mindestens 21.11.2026 |
| GPT-5.6 Terra | Aktuell | 2 | 12 | kurz; 4/18 lang | Nein | Ausgewogene Standardwahl |
| GPT-5.6 Luna | Aktuell | 0.20 | 1.20 | kurz; 0.40/1.80 lang | Nein | Hoher Durchsatz und niedrige Kosten |
| GPT-5.5 | Legacy | 5 | 30 | unter 272k; 10/45 lang | Nein | Durch GPT-5.6 ersetzt |
| GPT-5.5 Pro | Legacy | 30 | 180 | unter 272k; 60/270 lang | Nein | Sehr teuer; fuer neue Systeme nicht erste Wahl |
| GPT-5.4 | Legacy | 2.50 | 15 | unter 272k; 5/22.50 lang | Nein | Alte Hauptgeneration |
| GPT-5 mini / nano | Legacy | 0.25 / 0.05 | 2 / 0.40 | Standard | Nein | Weiterhin guenstige API-Basismodelle |
| o3 / o4-mini | Legacy | 2 / 1.10 | 8 / 4.40 | Standard | Nein | Aeltere separate Reasoning-Linie |
| gpt-oss-120b / 20b | Aktuell offen | Selbstbetrieb | - | 128k | Ja | Open-Weight fuer eigene Infrastruktur |

OpenAI berechnet bei den 5.6-Modellen lange Kontexte separat. Die fruehere
Zeile „GPT-5.6 (Sol) ~5/~15, im Rollout“ war daher zugleich ungenau und
veraltet.

## Google (USA)

| Modell | Status | Input | Output | Kontext | Lokal | Einordnung |
|---|---|---:|---:|---:|---|---|
| Gemini 3.7 Flash | Aktuell | 0.75 | 3.75 | 1M | Nein | Aktuelles Flash-Spitzenmodell; Aktionspreis bis 31.12.2026, danach 1.50/7.50 |
| Gemini 3.1 Pro Preview | Aktuell/Preview | 2 | 12 | bis 200k; darueber 4/18 | Nein | Pro-Modell fuer komplexes multimodales Reasoning |
| Gemini 3.5 Flash-Lite | Aktuell | 0.30 | 2.50 | 1M | Nein | Preisoptimiert fuer hohe Last |
| Gemini 2.5 Pro | Legacy | 1.25 | 10 | bis 200k; darueber 2.50/15 | Nein | Weiter verfuegbar, aber alte Generation |
| Gemini 2.5 Flash | Legacy | 0.30 | 2.50 | 1M | Nein | Durch die 3.x-Flash-Linie abgeloest |
| Gemini 2.5 Flash-Lite | Legacy | 0.10 | 0.40 | 1M | Nein | Sehr billig, jedoch alte Generation |
| Gemma 3 (1B-27B) | Aktuell offen | Selbstbetrieb | - | 128k | Ja | Lokale Google-Familie; kein Google-API-Tokenpreis |

## Moonshot AI / Kimi (China)

| Modell | Status | Input | Output | Cache-Hit | Kontext | Lokal | Einordnung |
|---|---|---:|---:|---:|---:|---|---|
| Kimi K3 | Aktuell | 3 | 15 | 0.30 | 1M | Nein** | Flaggschiff fuer langlaufende Agenten- und Wissensarbeit |
| Kimi K2.7 Code | Aktuell | 0.95 | 4 | 0.19 | 256k | Nein** | Coding, Text-, Bild- und Videoeingabe |
| Kimi K2.7 Code HighSpeed | Aktuell | 1.90 | 8 | 0.38 | 256k | Nein** | Gleiches Modell mit hoeherem Durchsatz |
| Kimi K2.6 | Aktuell | 0.95 | 4 | 0.16 | 256k | Nein** | Allgemeines multimodales Agentenmodell |
| Kimi K2.5 / K2 | Legacy | - | - | - | 128k | Ja | Alte Generation; nicht mehr in der aktuellen internationalen Preisliste |

**„Nein“ bezieht sich auf die hier bepreiste internationale API-Variante;
eine etwaige separate Open-Weight-Veroeffentlichung ist nicht mit dieser
API-Leistung gleichzusetzen.

## Alibaba Cloud / Qwen (China)

Internationale Model-Studio-Preise (Region Singapur), erste Preisstufe:

| Modell | Status | Input | Output | Kontext | Lokal | Einordnung |
|---|---|---:|---:|---:|---|---|
| Qwen3.8-Max | Aktuell | 2 | 6 | 1M | Nein | Neues geschlossenes API-Flaggschiff |
| Qwen3.7-Max | Legacy | 2.50 | 7.50 | 1M | Nein | Durch Qwen3.8-Max ersetzt |
| Qwen3-Max | Legacy | 1.20 | 6 | bis 32k; gestaffelt bis 256k | Nein | Geschlossenes API-Modell, nicht Open-Weight |
| Qwen3 Open-Weight-Familie | Aktuell offen | Selbstbetrieb | - | modellabhaengig | Ja | Eigene Gewichte fuer lokale Inferenz; getrennt von Qwen-Max |

Qwen3-Max war zuvor faelschlich als Open-Weight und mit 0.78/3.90
eingetragen. Alibaba weist es als Model-Studio-API mit 1.20/6 in der ersten
internationalen Stufe aus; Qwen3.8-Max ist nun die aktuelle Max-Generation.

## DeepSeek (China)

DeepSeek unterscheidet Werk- und Nebenzeiten. Nachstehend stehen
**Peak / Off-Peak** fuer nicht gecachten Input und Output:

| Modell | Status | Input | Output | Kontext | Lokal | Einordnung |
|---|---|---:|---:|---:|---|---|
| DeepSeek V4 Pro | Aktuell | 1.32 / 0.66 | 3.96 / 1.98 | 1M | Nein** | Leistungsstaerkere V4-API-Variante |
| DeepSeek V4 Flash | Aktuell | 0.44 / 0.22 | 1.32 / 0.66 | 1M | Nein** | Sehr guenstiges allgemeines Modell |
| DeepSeek V4 Flash Vision Exp | Aktuell/experimentell | 0.44 / 0.22 | 1.32 / 0.66 | 1M | Nein** | Experimentelle visuelle Variante |
| DeepSeek V3.2 / V3 | Legacy | - | - | 128k | Ja | Durch V4 in der offiziellen API abgeloest |
| DeepSeek R2 | Nicht belegt | - | - | - | - | Kein aktueller offizieller API-Eintrag; aus der Empfehlung entfernt |

Peak-Zeiten sind laut DeepSeek Montag bis Freitag 01:00-04:00 und
06:00-10:00 UTC; alle anderen Zeiten sind Off-Peak. Cache-Hits sind nochmals
deutlich billiger. **Der API-Status belegt keine frei herunterladbaren
Gewichte der jeweiligen V4-Variante.

## Meta / Llama (USA)

Meta verkauft fuer Llama keinen einheitlichen direkten Token-API-Tarif.
Preise von Groq, Together, Fireworks oder anderen Hostern sind deren Preise
und werden hier nicht als „Meta-Preis“ ausgegeben.

| Modell | Status | Herstellerpreis | Kontext | Lokal | Einordnung |
|---|---|---|---:|---|---|
| Llama 4 Maverick 17B-128E | Aktuell offen | Selbstbetrieb / Hosterpreis | 1M | Ja | Groessere offene Llama-4-Variante |
| Llama 4 Scout 17B-16E | Aktuell offen | Selbstbetrieb / Hosterpreis | 10M | Ja | Sehr langes Kontextfenster; volle BF16-Inferenz verlangt mehrere GPUs |
| Llama 4 Behemoth | Nicht veroeffentlicht | - | - | Nein | Nicht in Metas aktuellem offiziellen Modell-Repository; aus Empfehlungen entfernt |
| Llama 3.3 70B und aelter | Legacy offen | Selbstbetrieb / Hosterpreis | 128k | Ja | Breit unterstuetzt, aber alte Generation |

Die alten Groq-Zahlen wurden entfernt: Sie waren weder frische
Herstellerpreise noch auf einen einzigen Anbieter uebertragbar.

## Kurzempfehlungen

| Bedarf | Erste Wahl |
|---|---|
| Schwieriges Reasoning und Coding | GPT-5.6 Sol oder Claude Opus 5 |
| Ausgewogener Standardagent | Claude Sonnet 5 oder GPT-5.6 Terra |
| Sehr grosser Kontext | Claude Sonnet 5, Kimi K3 oder Gemini 3.7 Flash |
| Niedrige API-Kosten | GPT-5.6 Luna, DeepSeek V4 Flash oder Gemini 3.5 Flash-Lite |
| Coding mit chinesischem Anbieter | Kimi K2.7 Code |
| Lokal und kontrollierbar | Qwen3 Open-Weight, gpt-oss oder Llama 4 |

## Quellen (am Stand-Datum frisch abgerufen)

- [Anthropic: Modelle](https://platform.claude.com/docs/en/models/overview)
  und [Preise](https://platform.claude.com/docs/en/about-claude/pricing)
- [OpenAI: Modelle](https://developers.openai.com/api/docs/models) und
  [API-Preise](https://developers.openai.com/api/docs/pricing)
- [Google Gemini API: Preise](https://ai.google.dev/gemini-api/docs/pricing)
- [Moonshot/Kimi: Preisindex](https://platform.kimi.ai/docs/pricing/chat),
  [K3](https://platform.kimi.ai/docs/pricing/chat-k3),
  [K2.7 Code](https://platform.kimi.ai/docs/pricing/chat-k27-code) und
  [K2.6](https://platform.kimi.ai/docs/pricing/chat-k26)
- [Alibaba Cloud Model Studio: Qwen-Preise](https://www.alibabacloud.com/help/en/model-studio/model-pricing)
- [DeepSeek: Modelle und Preise](https://api-docs.deepseek.com/quick_start/pricing)
- [Meta: offizielles Llama-Modell-Repository](https://github.com/meta-llama/llama-models)

Aktualisierungsrhythmus: **jeden Mittwoch 08:05 UTC**, gekoppelt an das
KI-News-Briefing.
