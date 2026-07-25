# Laptops fuer lokale KI-Modelle

**Stand:** 2026-07-25 (korrigierte Fassung nach Sarahs Hinweis auf den
M5). Sarahs Kaufberatung fuer Rechner, die lokal KI-Modelle laufen
lassen sollen.

## Der eine wichtige Satz zuerst

Fuer lokale Modelle zaehlt **Arbeitsspeicher**, nicht CPU-Geschwindigkeit.
Ein Modell laeuft nur, wenn seine Gewichte (die Milliarden von
Zahlenwerten) komplett in den Speicher passen. Alles ueber diese
Groesse hinaus wird zaeh bis unmoeglich.

Deshalb ist die entscheidende Zahl beim Kauf: **wie viel RAM (bei Apple:
"Unified Memory"; bei Windows: RAM + Grafikkarten-VRAM) hat das Geraet?**

## Der Kern in einer Zeile

Es gibt aktuell drei ernstzunehmende Kategorien:

- **MacBook Pro M5 Max mit 128 GB Unified Memory** - der eleganteste
  Weg. Kann sogar 70-Milliarden-Parameter-Modelle komfortabel laufen
  lassen.
- **Windows-Gaming-Laptop mit RTX 5090 (24 GB VRAM)** - mehr Rohleistung
  pro Sekunde, aber weniger Speicher, laut, Akku kurz.
- **MacBook Pro M5 Pro mit 48 GB** - der guenstige Einstieg, der noch
  echt taugt.

Alle drei sind kein Spielzeug, sondern Investitionen zwischen 3000 und
7500 Euro.

## Die vier Empfehlungen im Detail

### 1. MacBook Pro 16", M5 Max, 128 GB Unified Memory - Empfehlung fuer Sarah

**Verfuegbarkeit:** Seit **11.03.2026** regulaer bei Apple im Handel. Die
M5-Pro- und M5-Max-Varianten wurden am 02.03.2026 angekuendigt und sind
seither die aktuellen Verkaufsversionen.

**Was das kann:**

- Modelle bis **Llama 3.3 70B** oder Qwen3 72B laufen komfortabel
  (Apple gibt bis zu 4x schnellere Prompt-Verarbeitung als beim M4 Max
  an; laut Benchmarks aus dem Feld liegen typische Modelle bei
  ~30-40 Token/Sekunde in 4-Bit-Quantisierung).
- Kleinere Modelle wie Mistral Small 3, Qwen3 35B, DeepSeek V3.2 laufen
  weit ueber Gespraechs-Tempo.
- **614 GB/s Speicher-Bandbreite** (M5 Max), plus "Neural
  Accelerators" in jedem GPU-Kern - das macht die Startzeit einer
  Antwort schnell.
- **Wi-Fi 7 und Bluetooth 6** ueber Apples eigenen N1-Chip, doppelt so
  schnelle SSD wie bei der M4-Generation.
- Kuehl und ruhig, weil Apples Silizium mit deutlich weniger Watt
  auskommt als Windows-GPUs.

**Wo der Haken ist:**

- Preis mit 128 GB Unified Memory: rund **6500-7500 Euro** je nach
  Ausbau von SSD und Bildschirm.
- Sehr grosse Modelle (200 Milliarden Parameter und mehr) laufen auch
  damit nicht mehr fluessig.

**Warum das fuer Sarah meist die richtige Wahl ist:**

Bei Alltagsaufgaben (Immobilien suchen, Texte, Code, Recherche) zaehlen
Ruhe, Akkulaufzeit (bis zu 24 Stunden angegeben) und Bildschirmqualitaet.
Das MacBook liefert das neben der KI-Leistung mit.

### 2. MacBook Pro 14", M5 Pro, 48 GB Unified Memory - der Einstieg

**Verfuegbarkeit:** Ebenfalls seit 11.03.2026 im Handel.

**Was das kann:**

- Modelle bis **Mistral Small 3, Qwen3 35B, DeepSeek V3.2, Llama 3.1
  8B/14B** komfortabel.
- 70B-Modelle laufen nicht mehr komfortabel (etwa 5-7 Token/Sekunde
  bei Grenzenausnutzung).
- **307 GB/s Speicher-Bandbreite** (halb so viel wie der M5 Max).

**Wo der Haken ist:**

- Deckelung bei 70B-Modellen. Wenn du auf ein Frontier-Open-Weight wie
  Kimi K3 oder Llama 4 Scout zielst, reicht es nicht.

**Preis:** rund **3000-3500 Euro**.

### 3. MacBook Pro 14", M5 (Basisversion), 24 GB - fuer den ganz kleinen Einstieg

**Verfuegbarkeit:** Seit **15.10.2025** im Handel.

**Was das kann:**

- Modelle bis **etwa 14 Milliarden Parameter** komfortabel
  (Ministral 8B, Qwen3 14B, Mistral Small 3).
- Fuer richtige KI-Arbeit spuerbar zu klein - eher fuer "ein bisschen
  ausprobieren, ohne wirklich zu investieren".

**Preis:** rund **2200-2800 Euro**.

Nicht meine Empfehlung fuer Sarah, wenn ernsthafte KI-Nutzung im Plan
ist. Nur der Vollstaendigkeit halber gelistet.

### 4. Windows-Alternative: Lenovo Legion Pro 7i oder ASUS ROG Strix mit RTX 5090

**Was das kann:**

- Die mobile RTX 5090 bringt **24 GB VRAM**. Das reicht fuer Modelle
  bis rund **32 Milliarden Parameter** in 4-Bit-Quantisierung (Qwen3
  35B, Mistral Small 3).
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

| Modellgroesse                    | M5 24 GB       | M5 Pro 48 GB   | M5 Max 128 GB    | RTX 5090 24 GB    |
|----------------------------------|----------------|----------------|------------------|-------------------|
| 3-8B (Ministral 3B, Llama 3.2 8B)| komfortabel    | komfortabel    | komfortabel      | komfortabel       |
| 14B (Qwen3 14B)                  | komfortabel    | komfortabel    | komfortabel      | komfortabel       |
| 35B (Qwen3 35B, Mistral Small 3) | knapp/nein     | ordentlich     | komfortabel      | knapp             |
| 70B (Llama 3.3 70B, Qwen3 72B)   | nein           | zaeh (5 Tok/s) | komfortabel (30+)| geht nicht komfortabel |
| 100B+ (Llama 4 Scout, gpt-oss 120B)| nein         | nein           | zaeh             | nein              |
| 400B+ (Llama 4 Maverick, Kimi K3)| nein           | nein           | nein             | nein              |

## Software, die du auf jedem dieser Geraete brauchst

Alle Kandidaten laufen auf demselben Software-Stapel:

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

Wenn du heute kaufst: **MacBook Pro 16" mit M5 Max und 128 GB Unified
Memory**. Grund: Du bist nicht Technikerin, du willst dass ein Geraet
leise, lang, kuehl und lange laeuft. Genau das bietet dir dieser Weg.
Und du hast damit **den groessten Modell-Spielraum** unter allen
Laptops am Markt, der Stand Juli 2026 ueberhaupt zu haben ist.

Ein Windows-Laptop mit RTX 5090 wuerde ich dir nur empfehlen, wenn du
zusaetzlich hardware-nahe Bildbearbeitung oder Spiele brauchst - fuer
"nur KI lokal" ist der Mac das rundere Werkzeug.

## Aenderungshistorie dieser Empfehlung

- **2026-07-25**: Korrigiert nach Sarahs Hinweis. Empfehlung von
  M4 Max auf M5 Max umgestellt, weil M5-Pro und M5-Max seit
  11.03.2026 im Handel sind und das M4-Vermerken (Warten bis
  Herbst) hinfaellig ist.
- **2026-07-24**: Erstfassung; empfahl damals faelschlich den M4 Max
  als "aktuell", weil ich die M5-Verfuegbarkeit uebersah.

## Quellen

- Apple Newsroom, 02.03.2026:
  `www.apple.com/newsroom/2026/03/apple-introduces-macbook-pro-with-all-new-m5-pro-and-m5-max/`
- Macworld, MacBook Pro M5 Pro & Max 2026 Guide:
  `macworld.com/article/2942089/macbook-pro-m5-pro-max-release-specs-price.html`
- PhoneArena, MacBook Pro M5 release date & specs:
  `phonearena.com/apple-macbook-pro-m5-release-date-price-features-news`
- `insiderllm.com/guides/apple-m5-pro-max-local-ai/`
- `aiproductivity.ai/blog/apple-m5-max-local-llm-guide/`
- `promptquorum.com/power-local-llm/best-laptops-local-llm-2026`
- `theaitechpulse.com/best-laptop-for-running-ai-models-locally-2026`
- `knightli.com/en/2026/05/08/rtx-5090-5080-ai-inference-benchmark/`
