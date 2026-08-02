# Bernd (Agent) historisiert (2026-08-02)

**Angeordnet durch:** Sarah, 2026-08-02 17:31 UTC (Telegram)

## Sachstand
- Bernd existiert nicht mehr. Sarah hat das ausdruecklich klargestellt und die Historisierung angeordnet.
- Ich soll Bernd in meinen laufenden Notizen und Berichten kuenftig nicht mehr als aktiven Agenten fuehren.

## Live-Verifikation am 2026-08-02 auf Server 1 (sarahserver1, 147.93.120.51)
- `id sebastian` -> `no such user`.
- `/home/sebastian` existiert nicht.
- Gateway-Unit `openclaw-gateway@sebastian.service`: `inactive (dead)`, `disabled`.
- Aktive Gateways auf Server 1: `chantall`, `user1`, `user2` (also `Chantal`, `Chefkoch`, `Franks Klaus`).
- Kein Backup zu `sebastian`/Bernd im aktuellen `/root/agent-cleanup-backups/`-Bestand sichtbar.

## Historischer Kontext
- Bernd war der Agent auf Server 1 unter dem Linux-User `sebastian`, Owner `Sebastian`, Fokus ILA-nahe fachliche Unterstuetzung.
- Am 2026-06-29 wurde `sebastian` per `agentctl revoke` (botrepo, `agent_revoke_legacy_candidates: [sebastian]`) abgebaut und durch den neuen Linux-User `chantall` (Agent `Chantal`, Sarahs Dienstmaedchen-Agent) ersetzt.
- Der Abbau war zu diesem Zeitpunkt bereits in `Gandalfs_Welt/Agentenmatrix.md`, `agentenmatrix/agenten/chantal.md` und `agentenmatrix/server1.yaml` dokumentiert.
- Neu am 2026-08-02: In `agentenmatrix/server1.md` fuehrte die Aktiv-Tabelle Bernd noch mit. Diese Fassung wurde umgestellt: Bernd steht jetzt in einer eigenen Rubrik "Historisierte Agenten (nicht mehr aktiv)".

## Konsequenzen
- In Wochenberichten, Analogien und Landkarten von Server 1 nenne ich als aktive Agenten nur noch `Chantal`, `Chefkoch` und `Franks Klaus`.
- Bernd wird nur noch in historischen Kontexten erwaehnt, wenn Sarah oder dto danach fragen oder ein Fehler auf alte Bernd-Spuren zurueckfuehrt.
- Notizpflicht-Regel bleibt gewahrt: dieser Beschluss ist zusaetzlich in `MEMORY.md` und der Tagesnotiz vermerkt.
