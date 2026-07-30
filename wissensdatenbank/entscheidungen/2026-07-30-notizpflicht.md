# Notizpflicht-Regel (2026-07-30)

**Vereinbart mit Sarah, 2026-07-30 11:44 UTC.**

## Regel
- Alles, was Sarah und Gandalf besprechen, muss Gandalf unmittelbar in seinen Notizen ablegen.
- Ort:
  - `memory/YYYY-MM-DD.md` fuer die Tagesnotiz.
  - `MEMORY.md` fuer dauerhaft geltende Punkte.
  - Fachliche Entscheidungen zusaetzlich in `Gandalfs_Welt/wissensdatenbank/entscheidungen/`.
- Zustaende (Modelle, APIs, Fehlerursachen, offene Punkte) klar mit Datum festhalten, nicht aus Erinnerung rekonstruieren.
- Frueher gemachte, spaeter widerlegte Aussagen werden korrigiert, nicht schweigend uebergangen.
- Vor jeder Aussage zu einem Agenten oder Server: erst Notizen und Live-Zustand pruefen, dann sprechen.
- Bereits geltende Regel bleibt in Kraft: relevante Notizen werden nach GitHub gepusht, nicht nur lokal gehalten (siehe `AGENTS.md`, GitHub-Bereitstellungsregel).

## Anlass
- In einer frueheren Session hatte Gandalf zu Chefkoch vermittelt, dieser brauche einen neuen API-Key.
- Beim heutigen Ausfall stellte sich heraus: Ursache war ein falsch platzierter Konfig-Schluessel (`reasoning` unter `openai/o3-mini` statt unter `params`), kein API-Problem.
- Sarah hat daraufhin die Notizpflicht als verbindliche Regel eingefordert, damit solche Fehldiagnosen nicht wiederholt werden koennen.
