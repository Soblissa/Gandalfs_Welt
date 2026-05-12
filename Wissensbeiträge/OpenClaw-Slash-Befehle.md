# OpenClaw: Slash-Befehle einfach erklärt

Dieser Beitrag erklärt die Befehle, die mit `/` beginnen.

Wichtig:
- Ein Slash-Befehl ist **kein normaler Satz**.
- Er ist eine **Steueranweisung** für den Agenten.
- Je nach Oberfläche gibt es **nicht immer alle Befehle**.
- Zusätzlich können **Erweiterungen, Skills und Vorlagen** weitere Befehle ergänzen.

Darum trenne ich hier in:
1. **eingebaute Standardbefehle**
2. **häufige Zusatzbefehle in OpenClaw**
3. **dynamische Befehle**, die je nach Setup dazukommen

## Was ist ein Slash-Befehl?
Ein Slash-Befehl beginnt mit einem `/`.

Beispiele:
- `/new`
- `/status`
- `/session`
- `/skills`

Einfach gesagt:
Du sagst dem Agenten damit nicht *was* er inhaltlich tun soll, sondern *wie* er sich verhalten oder was er anzeigen soll.

---

# 1. Eingebaute Standardbefehle

Diese Befehle gehören zum normalen interaktiven OpenClaw-Unterbau.

## `/login`
Meldet dich an, wenn ein Dienst eine Anmeldung braucht.

Einfach gesagt:
Damit verbindest du OpenClaw mit einem Konto oder einem Anbieter.

## `/logout`
Meldet dich wieder ab.

Einfach gesagt:
Damit trennst du eine bestehende Anmeldung sauber.

## `/model`
Wechselt das verwendete Modell.

Einfach gesagt:
Damit sagst du: Nutze bitte ein anderes KI-Modell.

Gut für:
- schnelleres Modell
- gründlicheres Modell
- anderer Anbieter

## `/scoped-models`
Legt fest, welche Modelle für schnelles Wechseln aktiv sein sollen.

Einfach gesagt:
Damit baust du dir eine kleine Auswahl deiner bevorzugten Modelle.

## `/settings`
Öffnet oder ändert wichtige Einstellungen.

Zum Beispiel:
- Denkmodus
- Darstellung
- Transport
- Ausgabeart

Einfach gesagt:
Das ist der Einstellungsbereich.

## `/resume`
Öffnet eine frühere Sitzung wieder.

Einfach gesagt:
Du arbeitest an einem alten Gespräch weiter, statt neu zu beginnen.

## `/new`
Startet eine neue Sitzung.

Einfach gesagt:
Sauber neu anfangen.

Gut für:
- neues Thema
- Neustart ohne Altlasten
- klare Trennung von Aufgaben

## `/name <name>`
Gibt einer Sitzung einen Namen.

Beispiel:
- `/name Turiya-Fehlersuche`

Einfach gesagt:
Damit findest du Gespräche später leichter wieder.

## `/session`
Zeigt Informationen zur aktuellen Sitzung.

Zum Beispiel:
- Pfad
- Tokens
- Kosten
- Sitzungszustand

Einfach gesagt:
Das ist die Infoseite zur aktuellen Unterhaltung.

## `/tree`
Springt zu einem früheren Punkt in der Unterhaltung.

Einfach gesagt:
Du gehst in der Gesprächsgeschichte zurück und arbeitest von dort weiter.

Gut für:
- falsche Richtung korrigieren
- andere Variante ausprobieren
- vor einem Fehler wieder ansetzen

## `/fork`
Erstellt einen neuen Zweig aus dem aktuellen Gespräch.

Einfach gesagt:
Du probierst eine neue Richtung aus, ohne den alten Strang kaputtzumachen.

## `/compact [prompt]`
Verdichtet den bisherigen Kontext.

Einfach gesagt:
Der Agent fasst zusammen, was wichtig ist, damit das Gespräch schlanker weiterlaufen kann.

Gut für:
- lange Sitzungen
- weniger Ballast
- sauberer Weiterlauf

## `/copy`
Kopiert die letzte Antwort.

Einfach gesagt:
Praktisch, wenn du den Text schnell weiterverwenden willst.

## `/export [datei]`
Exportiert die Sitzung.

Einfach gesagt:
Du speicherst das Gespräch nach außen, zum Beispiel als Datei.

## `/share`
Teilt eine Sitzung über einen erzeugten Link.

Einfach gesagt:
Gut, wenn du ein Ergebnis weitergeben willst.

Wichtig:
Nur bewusst nutzen, weil Inhalte damit nach außen gegeben werden.

## `/reload`
Lädt Konfiguration, Skills, Erweiterungen und Kontext neu.

Einfach gesagt:
Wenn sich im Hintergrund etwas geändert hat, holt `/reload` den neuen Stand herein.

## `/hotkeys`
Zeigt Tastenkürzel.

Einfach gesagt:
Das ist die Übersicht für schnelle Bedienung per Tastatur.

## `/changelog`
Zeigt die Versionsänderungen.

Einfach gesagt:
Damit siehst du, was sich an OpenClaw geändert hat.

## `/quit`
Beendet die interaktive Sitzung.

Einfach gesagt:
Sauber schließen.

---

# 2. Häufige Zusatzbefehle in unserer OpenClaw-Nutzung

Diese Befehle sind in unserer Arbeit besonders wichtig, auch wenn sie teils von OpenClaw selbst, teils von Oberfläche oder Erweiterungen kommen.

## `/status`
Zeigt den aktuellen technischen Zustand.

Zum Beispiel:
- welches Modell aktiv ist
- ob Reasoning aktiv ist
- welche Laufzeit gerade genutzt wird
- allgemeiner Session- oder Agentenstatus

Einfach gesagt:
Der schnelle Gesundheitscheck.

## `/reasoning`
Schaltet vertieftes Nachdenken ein oder aus.

Einfach gesagt:
- an = oft gründlicher
- aus = oft direkter und schneller

Gut für:
- Analyse
- Planung
- schwierige Probleme

## `/approve`
Gibt einen sensiblen Schritt frei.

Einfach gesagt:
Wenn OpenClaw für einen riskanteren Befehl eine Freigabe braucht, bestätigst du das damit.

Wichtig:
Das ist kein normaler Alltagsbefehl, sondern eine gezielte Erlaubnis.

## `/skills`
Zeigt verfügbare Skills an, sofern die Oberfläche diesen Befehl direkt anbietet.

Einfach gesagt:
Damit siehst du, welche Spezialfähigkeiten der Agent gerade zusätzlich nutzen kann.

Beispiele für Skills:
- Wetter
- Healthcheck
- TaskFlow
- Skill-Erstellung

---

# 3. Dynamische Befehle, die je nach Setup dazukommen

Hier wird es wichtig: OpenClaw kann durch Skills, Vorlagen und Erweiterungen wachsen.

Das bedeutet: **Nicht alle Slash-Befehle sind fest eingebaut.** Manche entstehen erst durch das Setup.

## `/skill:<name>`
Ruft einen konkreten Skill auf.

Beispiel:
- `/skill:weather`

Einfach gesagt:
Du startest direkt eine Spezialfähigkeit.

## `/<vorlagenname>`
Ruft eine gespeicherte Prompt-Vorlage auf.

Einfach gesagt:
Das ist eine vorbereitete Anweisung, die man mit kurzem Befehl startet.

## Eigene Erweiterungsbefehle
Erweiterungen können eigene Befehle hinzufügen.

Beispiele können sein:
- spezielle Statusanzeigen
- Sitzungsnamen
- Team-spezifische Hilfsbefehle
- eigene Workflows

Einfach gesagt:
OpenClaw kann mit der Zeit neue Slash-Befehle lernen.

---

# Wann nehme ich welchen Befehl?

## Ich will neu anfangen
Nimm:
- `/new`

## Ich will einen alten Stand wieder öffnen
Nimm:
- `/resume`

## Ich will wissen, wie die aktuelle Sitzung steht
Nimm:
- `/session`
- oder oft auch `/status`

## Ich will das Modell wechseln
Nimm:
- `/model`

## Ich will tieferes Nachdenken ein- oder ausschalten
Nimm:
- `/reasoning`

## Ich will die Arbeitsumgebung neu laden
Nimm:
- `/reload`

## Ich will Spezialfähigkeiten sehen
Nimm:
- `/skills`
- oder direkt `/skill:<name>`

## Ich will einen riskanten Schritt freigeben
Nimm:
- `/approve`

---

# Kurze Merkhilfe

- `/new` = neu anfangen
- `/resume` = alte Sitzung öffnen
- `/session` = Sitzungsinfos sehen
- `/status` = Gesundheitscheck
- `/model` = Modell wechseln
- `/reasoning` = tiefer nachdenken
- `/skills` = Spezialfähigkeiten ansehen
- `/approve` = Freigabe geben
- `/reload` = neu laden
- `/quit` = beenden

---

# Wichtig für die Praxis

Nicht jeder Befehl funktioniert in jeder Oberfläche gleich.

Zum Beispiel:
- im Terminal oft mehr
- im Chat oft weniger
- in Bots manchmal nur ein Teil
- Erweiterungen können zusätzliche Befehle einbauen

Darum ist die wichtigste Regel:

**Slash-Befehle sind steuernde Arbeitsbefehle, aber ihr genauer Umfang hängt vom eingesetzten OpenClaw-Setup ab.**

---

# Fazit

Ja, es gibt viele Befehle mit `/`.

Die wichtigsten für den Alltag sind meistens:
- `/new`
- `/resume`
- `/session`
- `/status`
- `/model`
- `/reasoning`
- `/skills`
- `/approve`
- `/reload`

Der Rest ist vor allem für strukturierte Arbeit, Navigation, Export und Feinsteuerung da.

---

Stand dieses Beitrags:
- erstellt für unser Repo `Gandalfs_Welt`
- geprüft gegen den lokal installierten OpenClaw-Stand auf Basis des interaktiven OpenClaw-Unterbaus
