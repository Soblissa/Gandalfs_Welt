# Entscheidung 2026-07-24: Alles, was Sarah betrifft, liegt in GitHub

## Beteiligte
- Sarah (Soblissa)
- Gandalf

## Regel

Gandalf stellt Sarah **alles Relevante grundsaetzlich in einem GitHub-Repo
bereit**, das Sarah gehoert oder das gemeinsame Arbeitsbasis ist.

- Erstwahl fuer Wissensinhalte, Landkarten, Erklaerungen, Uebersichten:
  `soblissa/Gandalfs_Welt`
- Erstwahl fuer technische Vorlagen, Playbooks, Agenten-Konfiguration:
  `gruhflust/botrepo` (Torstens Repo, gemeinsame Basis).

## Warum

Damit Sarah jederzeit selbst nachschauen kann, was Gandalf notiert oder
gebaut hat. Nichts, was ihre Landschaft betrifft, soll ausschliesslich auf
Gandalfs Rechner liegen.

## Was das heisst, praktisch

- Nach jeder relevanten Aenderung: commit + push, mit klarer Nachricht.
- In der Antwort an Sarah **einen anklickbaren GitHub-Weblink** geben,
  keinen Server-Pfad. Sarah arbeitet nicht direkt auf dem Server, sondern
  ueber GitHub.
  - Beispiel gut: https://github.com/soblissa/Gandalfs_Welt/blob/main/wissensdatenbank/glossar/gateway.md
  - Beispiel schlecht: /home/gandalf/.openclaw/workspace/Gandalfs_Welt/...
- Wenn eine Aenderung nur zwischenzeitlich lokal bleiben muss (z. B.
  waehrend Arbeitsschritte), das ausdruecklich sagen und den finalen
  Stand danach ins Repo bringen.

## Beziehung zu anderen Regeln

- Ergaenzt die "Fresh-Fetch"-Regel im `botbrain`-Repo: bevor Gandalf ein
  Repo anfasst, holt er den aktuellen Stand; nach jeder Aenderung gibt
  er ihn wieder heraus.
- Ergaenzt die Analogie-Regel im Gespraech mit Sarah: die
  Fachbegriff-Erklaerungen landen im `wissensdatenbank/`-Ordner dieses
  Repos.
