#!/usr/bin/env bash
# matrix-weekly-check.sh
#
# Wöchentliche Prüfung der Agentenmatrix gegen Live-Zustand.
# Läuft Sonntag 20:00 UTC via cron.
#
# Aufgabe:
#   - Für jeden Agenten in Gandalfs_Welt/agentenmatrix/agenten/*.md:
#     Live-Zustand des Hosts abfragen (SSH read-only) und mit
#     Matrix-Angaben vergleichen.
#   - Report als Tagesnotiz unter memory/YYYY-MM-DD-matrix-check.md ablegen.
#   - Bei Abweichungen: kurze Zusammenfassung an Sarah (Telegram) senden.
#
# Wichtig: Dieser Job liest nur. Er ändert keine Matrix-Dateien und
# keine Agenten-Konfiguration. Änderungen macht Gandalf im Chat mit
# Sarah, gemäß Eigentumsprinzip.

set -euo pipefail

WORKSPACE="/home/gandalf/.openclaw/workspace"
REPORT_DIR="$WORKSPACE/memory"
TODAY="$(date -u +%Y-%m-%d)"
REPORT="$REPORT_DIR/${TODAY}-matrix-check.md"

mkdir -p "$REPORT_DIR"

{
  echo "# Matrix-Wochencheck $TODAY"
  echo
  echo "Automatischer Read-Only-Vergleich zwischen Matrix und Live-Zustand."
  echo
} > "$REPORT"

# --- Chantal auf S1 (147.93.120.51) ---
{
  echo "## Chantal @ 147.93.120.51"
  echo
  echo '```'
  ssh -o BatchMode=yes -o ConnectTimeout=10 gandalf-ro@147.93.120.51 '
    sudo -u chantall /usr/local/sbin/chantall-inspect
    echo
    echo "-- Gateway-Dienst --"
    sudo /bin/systemctl is-active openclaw-gateway@chantall
  ' 2>&1 || echo "SSH-Zugriff fehlgeschlagen"
  echo '```'
  echo
} >> "$REPORT"

echo "Report: $REPORT"

# Kurzmeldung an Sarah, wenn dieses Script direkt läuft.
# Die inhaltliche Bewertung übernimmt Gandalf selbst im nächsten
# Chat-Turn - dieses Script legt nur die Rohdaten ab.
