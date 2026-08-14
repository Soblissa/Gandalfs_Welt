# TypingMind und OpenRouter -- was ist was, und wie haengt es zusammen?

Stand: 2026-08-14

## Kurz in einem Satz

**TypingMind** ist die Bedienoberflaeche, mit der man mit Sprachmodellen
redet. **OpenRouter** ist der Sammelanschluss, ueber den man Zugang zu
vielen verschiedenen Modellen bekommt. Beides zusammen ergibt: eine
Oberflaeche, viele Modelle.

## Analogie

Stell dir eine gut ausgestattete Kueche vor.

- **TypingMind** ist die Kueche selbst: Arbeitsflaeche, Herd, Werkzeug,
  Regale, Ordnung. Hier stehst du und arbeitest.
- **OpenRouter** ist der Grosshaendler, der die Zutaten liefert.
  Anstatt bei zwanzig einzelnen Bauernhoefen zu bestellen (OpenAI,
  Anthropic, Moonshot, Google, DeepSeek, Meta, xAI...), hast du **einen
  Lieferanten** mit einem einzigen Konto und einer einzigen Rechnung.

Ohne OpenRouter muesstest du bei jedem KI-Anbieter einzeln ein Konto
haben, dort Guthaben einzahlen und einen API-Schluessel pflegen. Mit
OpenRouter reicht ein Konto und ein Schluessel fuer alle.

## Technischer Kern

### TypingMind

- **Was:** ein Web-Frontend fuer Sprachmodelle. Bedient man im Browser
  unter `typingmind.com`, gekauft als Lifetime-Lizenz (einmalig zahlen,
  fuer immer nutzen).
- **Wo laeuft es:** deine Chats bleiben lokal im Browser gespeichert
  (nicht auf einem Server bei TypingMind). Das ist Datenschutz-relevant.
- **Was es nicht ist:** kein KI-Anbieter. TypingMind rechnet keine
  Tokens ab. Fuer jedes Modell brauchst du entweder einen direkten Key
  beim Anbieter oder einen Sammelanschluss wie OpenRouter.
- **Was es leistet:** Chat-Verlauf, Modellauswahl pro Chat, Prompt-Sammlung,
  Agentendefinitionen, Ordnerstruktur, Vergleich verschiedener Modelle
  zur gleichen Frage.

### OpenRouter

- **Was:** ein API-Gateway (Sammelanschluss) fuer LLMs. Bedient man
  unter `openrouter.ai`.
- **Wie:** du zahlst dort Guthaben ein (Kreditkarte oder Krypto, laeuft
  nicht ab), erstellst einen einzigen API-Schluessel, und der Schluessel
  gibt dir Zugang zu aktuell ~400 Modellen von ~60 Anbietern.
- **Wie es abrechnet:** OpenRouter reicht die Anfrage an den echten
  Anbieter (Anthropic, OpenAI, Moonshot etc.) durch und schlaegt einen
  kleinen Aufschlag (ca. 5 Prozent) auf den Anbieterpreis auf.
- **Guthaben:** verfaellt nicht.
- **Wichtige Adressen:**
  - `openrouter.ai/models` -- vollstaendige Modellliste mit Preisen
  - `openrouter.ai/keys` -- Schluessel verwalten
  - `openrouter.ai/settings/credits` -- Guthaben pruefen

## So haengen sie zusammen

```
Sarah tippt eine Frage in TypingMind
        |
        v
TypingMind sendet die Frage an OpenRouter
(mit Sarahs OpenRouter-Schluessel im Kopf)
        |
        v
OpenRouter reicht sie an den echten Anbieter durch
(z. B. Moonshot fuer Kimi K3, Anthropic fuer Sonnet)
        |
        v
Antwort kommt denselben Weg zurueck nach TypingMind
```

In Sarahs Setup ist es sogar noch etwas gemischter: fuer **OpenAI** und
**Anthropic** hat sie direkte Schluessel eingetragen (spart den
OpenRouter-Aufschlag bei diesen beiden Anbietern), und fuer alles andere
laeuft es ueber den OpenRouter-Schluessel.

## Praktische Konsequenz

- Ein neues Modell in TypingMind sichtbar machen heisst: in der Modellliste
  bei OpenRouter (oder direkt bei OpenAI/Anthropic) das entsprechende
  Modell **aktivieren**. Erst danach erscheint es in der Auswahl im Chat.
- Der OpenRouter-Schluessel darf nie oeffentlich sichtbar sein -- damit
  koennte fremde ihn benutzen und dein Guthaben verbrennen.
- Neue Modelle tauchen bei OpenRouter meist am gleichen Tag auf, an dem
  der Anbieter sie veroeffentlicht. Man muss also nicht monatelang
  warten, um ein frisches Modell auszuprobieren.
- Guthaben: Sarah hat aktuell 40 USD auf OpenRouter, das reicht bei
  moderatem Testen fuer Monate.
