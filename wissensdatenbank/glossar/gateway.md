# Gateway

## In einem Satz

Der Gateway ist der **Tuersteher mit Funkgeraet** eines Agenten: er
laesst Nachrichten hinein, gibt sie per Funk an den Agenten weiter und
traegt seine Antworten wieder hinaus.

## Analogie

Stell dir ein grosses Buerohaus vor, in dem viele Angestellte arbeiten
(die Agenten: Chantal, Chefkoch, Turiya, Gandalf ...). Vor jeder
Buerotuer steht **ihr eigener Tuersteher mit Funkgeraet**:

- Er kennt seine Tuer und ihre Adresse (bei uns: eine Portnummer).
- Er prueft, wer klopft (bei uns: ob die Nachricht ueber Telegram und
  von einer berechtigten Person kommt).
- Er funkt die Nachricht an den Agenten drinnen im Buero.
- Er nimmt die Antwort entgegen und traegt sie wieder nach draussen.
- Steht **kein Tuersteher** an der Tuer, hoert niemand das Klopfen -
  auch wenn der Agent drinnen wach ist.

## Was "Gateway aktiv" heisst

Der Tuersteher ist auf seinem Posten. Nachrichten kommen an, der Agent
antwortet.

## Was "Gateway inaktiv" heisst

Der Tuersteher ist nicht da. Der Agent ist nicht ansprechbar, egal
was mit ihm sonst gerade los ist. Das kann drei Gruende haben:

1. Der Agent existiert nicht mehr auf diesem Server (kein Buero, kein
   Tuersteher).
2. Der Tuersteher versucht immer wieder den Dienst anzutreten und
   scheitert dabei (Dauerneustart, wie bei Rocky am 23.07.2026).
3. Der Agent wurde bewusst pausiert (Tuersteher hat Feierabend bekommen).

## Wer richtet Gateways ein

Bei Automagia: Torsten (technisch) mit Vorbereitung durch Gandalf
(Vorlagen im `botrepo`).
