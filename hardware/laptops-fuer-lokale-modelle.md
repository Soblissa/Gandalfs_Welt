# Laptops fuer lokale KI-Modelle

**Stand:** 2026-07-24. Sarahs Kaufberatung fuer Rechner, die lokal
KI-Modelle laufen lassen sollen.

## Der eine wichtige Satz zuerst

Fuer lokale Modelle zaehlt **Arbeitsspeicher**, nicht CPU-Geschwindigkeit.
Ein Modell laeuft nur, wenn seine Gewichte (die Milliarden von
Zahlenwerten) komplett in den Speicher passen. Alles ueber diese
Groesse hinaus wird zaehe bis unmoeglich.

Deshalb ist die entscheidende Zahl beim Kauf: **wie viel RAM (bei Apple:
'Unified Memory'; bei Windows: RAM + Grafikkarten-VRAM) hat das Geraet?**

## Der Kern in einer Zeile

Es gibt aktuell drei ernstzunehmende Kategorien:

- **MacBook Pro M4/M5 Max mit 128 GB Unified Memory** - der eleganteste
  Weg. Kann sogar 70-Milliarden-Parameter-Modelle laufen lassen.
- **Windows-Gaming-Laptop mit RTX 5090 (24 GB VRAM)** - mehr Rohleistung
  pro Sekunde, aber weniger Speicher, laut, Akku kurz.
- **MacBook Pro M4 Pro mit 48 GB** - der guenstige Einstieg, der noch
  echt taugt.

Alle drei sind kein Spielzeug, sondern Investitionen zwischen 3000 und
7000 Euro.

## Die vier Empfehlungen im Detail

### 1. MacBook Pro 16", M4 Max, 128 GB Unified Memory - Empfehlung fuer dich

**Was das kann:**

- Modelle bis **Llama 70B** oder Qwen3 72B laufen fluessig
  (~20-28 Token/Sekunde bei 4-Bit-Quantisierung).
- Kleinere Modelle wie Mistral Small 3, Qwen3 35B, DeepSeek V3.2 laufen
  weit ueber Gespraechs-Tempo.
- Der M4 Max hat 546 GB/s Speicher-Bandbreite und "Neural Accelerators"
  in jedem GPU-Kern; das macht die Startzeit einer Antwort schnell.
- Kuehl und ruhig, weil Apples Silizium mit deutlich weniger Watt
  auskommt als Windows-GPUs.

**Wo der Haken ist:**

- Preis mit 128 GB: rund **6000-7000 Euro** je nach Speicher-Ausbau.
- Sehr grosse Modelle (200B+) laufen auch damit nicht mehr fluessig.

**Warum das fuer dich meist die richtige Wahl ist:**

Bei Alltagsaufgaben (Immobilien suchen, Texte, Code, Recherche) zaehlen
Ruhe, Akkulaufzeit und Bildschirmqualitaet. Das MacBook liefert das
neben der KI-Leistung mit.

### 2. MacBook Pro 16", M5 Max, 128 GB Unified Memory - falls du 6-9 Monate warten kannst

**Was das kann:**

- Alles was der M4 Max kann, plus **~4x schnellere Prompt-Verarbeitung**
  laut Apple (Neural Accelerators in allen 40 GPU-Kernen).
- Speicherbandbreite steigt auf **614 GB/s**.

**Wo der Haken ist:**

- Verfuegbarkeit und tatsaechliche Praxiswerte muss die Zeit noch
  bestaetigen (Rollout gerade).
- Preis vermutlich ~7000-7500 Euro Vollausstattung.

### 3. MacBook Pro 14", M4 Pro, 48 GB Unified Memory - der Einstieg

**Was das kann:**

- Modelle bis **Mistral Small 3, Qwen3 35B, DeepSeek V3.2, Llama 3.1
  8B/14B** komfortabel.
- 70B-Modelle laufen nicht mehr komfortabel (etwa 5 Token/Sekunde bei
  Grenzenausnutzung).

**Wo der Haken ist:**

- Deckelung bei 70B-Modellen. Wenn du auf ein Frontier-Open-Weight wie
  Kimi K3 oder Llama 4 Scout zielst, reicht es nicht.

**Preis:** rund **3000-3500 Euro**.

### 4. Windows-Alternative: Lenovo Legion Pro 7i oder ASUS ROG Strix mit RTX 5090

**Was das kann:**

- Die mobile RTX 5090 bringt **24 GB VRAM**. Das reicht fuer Modelle
  bis rund **32B Parameter** in 4-Bit-Quantisierung (Qwen3 35B, Mistral
  Small 3).
- 70B-Modelle laufen nicht auf einer Karte, sondern muessen aufgeteilt
  werden. Das ist auf Laptops unpraktisch.
- Rohleistung pro Sekunde (bei Modellen, die passen) meist hoeher als
  MacBook, weil GPU-Rechenwerke spezialisierter sind.

**Wo die Haken sind:**

- **Speicher ist die Bremse**, nicht Rechenleistung. VRAM 24 GB ist
  auch bei besten Laptops die Obergrenze; Apple hat da 5x mehr.
- **Akkulaufzeit knapp**: unter KI-Last 1-2 Stunden.
- **Lautstaerke**: unter Volllast wie ein kleiner Staubsauger.
- **Software-Aufwand**: Treiber, CUDA, Umgang mit `ollama`/`vllm` unter
  Windows braucht mehr Handarbeit als auf macOS.

**Preis:** rund **3500-5500 Euro** je nach Ausbau.

## Was du damit tatsaechlich laufen lassen kannst

Kurze Uebersicht, welche Modelle in welche Kategorie passen:

| Modellgroesse                    | 48 GB Mac       | 128 GB Mac       | 24 GB Windows-GPU |
|----------------------------------|-----------------|------------------|-------------------|
| 3-8B (Ministral 3B, Llama 3.2 8B)| komfortabel     | komfortabel      | komfortabel       |
| 14B (Qwen3 14B)                  | komfortabel     | komfortabel      | komfortabel       |
| 35B (Qwen3 35B, Mistral Small 3) | ordentlich      | komfortabel      | knapp             |
| 70B (Llama 3.3 70B, Qwen3 72B)   | zaeh (5 Tok/s)  | komfortabel (20+)| geht nicht komfortabel |
| 100B+ (Llama 4 Scout, gpt-oss 120B)| nein          | zaeh             | nein              |
| 400B+ (Llama 4 Maverick, Kimi K3)| nein            | nein             | nein              |

## Software, die du auf jedem dieser Geraete brauchst

Alle vier laufen auf demselben Software-Stapel:

- **`ollama`** - einfachste Variante. Ein Befehl (`ollama run llama3.3`)
  laedt und startet ein Modell.
- **`LM Studio`** - grafische Anwendung, wenn dir eine Kommandozeile zu
  technisch ist.
- **`llama.cpp`** oder **`vllm`** - fuer Fortgeschrittene, mit mehr
  Kontrolle.

Auf macOS haben all diese Werkzeuge eine besonders reibungslose
Anbindung an Apples "Metal"-Grafikschnittstelle. Auf Windows/Linux ist
CUDA von Nvidia der Standardpfad; auch stabil, aber etwas mehr
Einrichtungsarbeit.

## Meine Empfehlung fuer dich, Sarah

Wenn du heute kaufen wolltest: **MacBook Pro 16" mit M4 Max und 128 GB
Unified Memory**. Grund: Du bist nicht Technikerin, du willst dass ein
Geraet leise, lang, kuehl und lange laeuft. Genau das bietet dir dieser
Weg. Und du hast damit **den groessten Modell-Spielraum** unter allen
Laptops am Markt, der Stand Juli 2026 ueberhaupt zu haben ist.

Falls du bis fruehen Herbst 2026 warten kannst und dich fuer 4x schnellere
Antworten interessierst: dann M5 Max mit 128 GB. Der Aufpreis lohnt sich
nur, wenn du sehr viel und sehr regelmaessig mit lokalen Modellen
arbeiten willst.

Ein Windows-Laptop mit RTX 5090 wuerde ich dir nur empfehlen, wenn du
zusaetzlich hardware-nahe Bildbearbeitung oder Spiele brauchst - fuer
"nur KI lokal" ist der Mac das rundere Werkzeug.

## Quellen

- `insiderllm.com/guides/apple-m5-pro-max-local-ai/`
- `llmhardware.io/guides/apple-silicon-for-llms`
- `mljourney.com/mac-m1-vs-m2-vs-m3-vs-m4-for-running-llms-real-tests/`
- `aiproductivity.ai/blog/apple-m5-max-local-llm-guide/`
- `promptquorum.com/power-local-llm/best-laptops-local-llm-2026`
- `theaitechpulse.com/best-laptop-for-running-ai-models-locally-2026`
- `blog.imseankim.com/apple-m4-max-macbook-pro-ai-inference-benchmarks/`
- `knightli.com/en/2026/05/08/rtx-5090-5080-ai-inference-benchmark/`
