# Gateway

## In einem Satz

Der Gateway ist der **Empfangstresen** eines Agenten: die Stelle, an der
Nachrichten hereinkommen, an den Agenten weitergereicht werden und an der
seine Antworten wieder hinausgehen.

## Analogie

Stell dir ein grosses Buerohaus vor, in dem viele Mitarbeiter arbeiten
(die Agenten: Chantal, Chefkoch, Turiya, Gandalf ...). Damit man mit
einem bestimmten Mitarbeiter sprechen kann, gibt es fuer jeden **einen
eigenen Empfangstresen** im Erdgeschoss:

- Der Tresen hat eine feste Adresse (bei uns: eine Portnummer).
- Er nimmt Anrufe entgegen (bei uns: Telegram-Nachrichten).
- Er ruft den Mitarbeiter (Agenten), gibt die Nachricht durch,
  wartet auf die Antwort und leitet sie zurueck.
- Ist der Tresen **unbesetzt**, kann man den Mitarbeiter nicht erreichen -
  selbst wenn er im Buero waere.

## Was "Gateway aktiv" heisst

Der Empfangstresen ist besetzt. Nachrichten kommen an, der Agent antwortet.

## Was "Gateway inaktiv" heisst

Der Empfangstresen ist unbesetzt. Der Agent ist nicht ansprechbar,
egal was mit ihm sonst gerade los ist. Das kann drei Gruende haben:

1. Der Agent existiert nicht mehr auf diesem Server (Empfangstresen abgebaut).
2. Der Empfangstresen versucht immer wieder zu oeffnen und scheitert
   (Dauerneustart, wie es bei Rocky am 23.07.2026 passiert ist).
3. Der Agent wurde bewusst pausiert.

## Wer richtet Gateways ein

Bei Automagia: Torsten (technisch) mit Vorbereitung durch Gandalf
(Templates in `botrepo`).
