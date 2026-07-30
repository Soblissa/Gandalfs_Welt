# 2026-07-30 - Server 2 als Agentenserver ausser Dienst

## Entscheidung

Slarti (Bartfass) hat am 2026-07-30 mitgeteilt, dass S2
(sarahserver2, srv1513178, 89.116.39.197, ca. 8 GB RAM) kuenftig
**keine Agenten mehr** halten soll. Grund ist die vergleichsweise
knappe RAM-Ausstattung.

Perspektive: S2 wird spaeter ggf. als **Nextcloud-Server** genutzt.
Der Umbau selbst liegt bei Slarti und ist nicht Teil der
Agentenmatrix.

## Umsetzung

- Testinstanz `egon` (Linux-User `egon`) auf S2 entfernt.
  - Gateway `openclaw-gateway@egon` gestoppt und disabled.
  - Home per `userdel -r` geloescht.
  - Backup vor Loeschung: `/root/agent-cleanup-backups/egon-openclaw-20260730T055846Z.tar.gz`
    (61 MB, auf S2).
- Matrix aktualisiert: `agentenmatrix/server2.md`,
  `agentenmatrix/server2.yaml`.
- Live-Zustand nach Aufraeumung: keine `openclaw-*`-Units, kein
  `agent`-User, kein `egon`-User. Uebrig sind nur die
  System-Linux-User `sarah`, `torsten`, `ubuntu`.

## Konsequenzen fuer den Wochencheck

Der wochentliche Matrix-Check (Sonntag 20:00 UTC) prueft S2 kuenftig
nur noch nachrichtlich: er bestaetigt, dass dort keine Agenten
laufen. Fuer Sarahs Landschaft ist S2 damit ausserhalb der aktiven
Agentenbetreuung.

## Eigentumsprinzip

Die Entscheidung stammt von Slarti, der auf S2 arbeitet. Sarah ist
darueber im Bilde ueber diese Chronik-Notiz und den geaenderten
Matrix-Eintrag.
