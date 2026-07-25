# Slash-Befehle

Befehle, die mit `/` beginnen, sind **Steueranweisungen** an den Agenten -
kein normales Gespraech, sondern ein Knopfdruck.

## Die wichtigsten fuer den Alltag

| Befehl | Wozu | Wann sinnvoll |
|---|---|---|
| `/new` oder `/reset` | Neue Session starten, Gedaechtnis der laufenden Sitzung leeren | Themenwechsel; Agent verwickelt sich in alte Sachen; sehr langes Gespraech wird traege |
| `/status` | Zeigt aktuelle Session-Info (Modell, Kosten, Zeit) | Wenn du wissen willst, was du gerade verbrauchst oder auf welchem Modell du bist |
| `/model` | Modell fuer diese Session wechseln | Zwischendurch kurz auf ein staerkeres oder guenstigeres Modell wechseln |
| `/help` | Zeigt alle verfuegbaren Befehle | Wenn du nicht mehr weisst, was moeglich ist |
| `/login`, `/logout` | An- und Abmelden bei einem Dienst | Wenn ein Dienst neu verknuepft werden soll |

## Weitere, seltener genutzt

| Befehl | Wozu |
|---|---|
| `/session` | Session-Verwaltung, mehrere parallele Sitzungen |
| `/skills` | Zeigt, welche Faehigkeiten der Agent gerade hat |
| `/history` | Zeigt Verlauf der aktuellen Sitzung |
| `/clear` | Bildschirm leeren, ohne Sitzung neu zu starten |
| `/thinking` | Denkschritte anzeigen oder verbergen |
| `/verbose` | Ausfuehrliche Antworten an/aus |

## Wichtig zu wissen

- **Nicht jeder Agent kann alles.** Manche Befehle gibt es nur in
  bestimmten Umgebungen (Web-Chat, Terminal, App).
- **Der Slash muss ganz vorne stehen.** `/new` funktioniert, `mach /new`
  nicht.
- **Klein schreiben.** `/Status` funktioniert meist auch, aber `/status`
  ist die sichere Variante.
- **Nicht bei jedem Agenten gleich.** Chantal, Chefkoch, Turiya und
  Gandalf hoeren dieselben Grundbefehle. Rocky oder Sloar koennen
  Sonderkommandos haben, die die anderen nicht kennen.

## Wenn nichts passiert

Manche Agenten reagieren nicht sichtbar auf Slash-Befehle - sie fuehren
den Befehl intern aus, ohne dir etwas zu antworten. Wenn du unsicher
bist, ob `/new` geklappt hat: schreib danach einen einfachen Test wie
"Woran hast du dich gerade erinnert?" - wenn der Agent nichts vom
vorherigen Gespraech weiss, war der Neustart erfolgreich.

## Woher der Befehl kommt

Slash-Befehle sind kein Gimmick von OpenClaw, sondern eine Konvention
aus vielen Chat-Systemen (IRC, Slack, Discord, ChatGPT). Der Slash war
schon immer das Signal "Achtung, das ist keine normale Nachricht".
