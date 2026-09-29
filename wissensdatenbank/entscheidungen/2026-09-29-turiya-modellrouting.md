# Turiya: sparsames Modellrouting fuer Appentwicklung

**Entscheidung von Sarah, 29.09.2026**

Turiya bleibt die zentrale Ansprechpartnerin und entscheidet selbst, welches Modell eine Teilaufgabe bearbeitet.

## Verbindliche Routing-Regel

- Das bestehende OpenAI-/Codex-Modell bleibt Standard fuer Appentwicklung, technische Arbeit, Planung, Recherche, Dateiarbeit und Alltagsfragen.
- Claude Opus 5 darf ausschliesslich fuer echte kreative Aufgaben eingesetzt werden: disruptive Produktideen, Markenstimme, ungewoehnliche UX-Konzepte, Kampagnenideen und kreative Kritik.
- Turiya entscheidet je Aufgabe selbst, ob Opus einen klaren Mehrwert verspricht.
- Opus wird gezielt mit einer kleinen, auf die kreative Frage reduzierten Kontextmenge aufgerufen; keine kompletten Chatverlaeufe oder Repositories.
- Pro Aufgabe grundsaetzlich ein Opus-Aufruf. Eine zweite Runde nur, wenn Turiya einen konkreten Mangel benennt.
- Heartbeats, Hintergrundpruefungen, Routinen und automatische Wiederholungen duerfen Opus nie aufrufen.
- Opus liefert Entwurf oder Gegenperspektive; Turiya prueft, kombiniert und verantwortet das Endergebnis.

## Ziel

Die technische Zuverlaessigkeit und Wirtschaftlichkeit des Standardmodells werden mit der kreativen Staerke von Claude Opus 5 verbunden, ohne Turiya zur blossen Weiterleitungsstelle zu machen oder unkontrollierte Anthropic-Kosten zu erzeugen.

Die Regel beschreibt den gewuenschten Sollzustand. Eine Live-Umsetzung erfolgt erst mit verifiziertem administrativem Zugang und eingerichtetem Anthropic-Anbieterzugang.

## Externe Kreativwerkzeuge

Sarah hat die grundsaetzliche Anbindung von Recraft und Kling an Turiya freigegeben. Turiya soll Recraft fuer Bild- und Designaufgaben und Kling fuer Videoaufgaben selbststaendig, auftragsbezogen und sparsam einsetzen.

Die Live-Anbindung setzt voraus:

- Recraft-API-Token,
- freigeschalteten Kling-Developer-Zugang und die dort ausgegebenen API-Zugangsdaten,
- verifizierten administrativen Zugang zu Turiyas Installation auf S2.

Zugangsdaten duerfen weder per Messenger noch im Git-Repository uebertragen oder gespeichert werden. Sie sind ausschliesslich im geschuetzten Secret-Speicher der Laufzeitumgebung zu hinterlegen.
