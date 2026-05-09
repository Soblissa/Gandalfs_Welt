#!/usr/bin/env bash
set -euo pipefail

SERVERS=(sarahserver1 sarahserver2 sarahserver3)
FROM_DATE=""
TO_DATE=""
FORMAT="markdown"

usage() {
  cat <<'EOF'
Usage:
  collect_costs.sh [--date YYYY-MM-DD] [--from YYYY-MM-DD] [--to YYYY-MM-DD] [--format markdown|tsv]

Examples:
  ./collect_costs.sh
  ./collect_costs.sh --date 2026-05-09
  ./collect_costs.sh --from 2026-05-01 --to 2026-05-31
EOF
}

while [ $# -gt 0 ]; do
  case "$1" in
    --date)
      [ $# -ge 2 ] || { usage; exit 1; }
      FROM_DATE="$2"
      TO_DATE="$2"
      shift 2
      ;;
    --from)
      [ $# -ge 2 ] || { usage; exit 1; }
      FROM_DATE="$2"
      shift 2
      ;;
    --to)
      [ $# -ge 2 ] || { usage; exit 1; }
      TO_DATE="$2"
      shift 2
      ;;
    --format)
      [ $# -ge 2 ] || { usage; exit 1; }
      FORMAT="$2"
      shift 2
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      echo "Unknown argument: $1" >&2
      usage >&2
      exit 1
      ;;
  esac
done

if [ "$FORMAT" = "markdown" ]; then
  echo "# Agenten-Kostenreport"
  echo
  echo "Zeitraum UTC: ${FROM_DATE:-offen} bis ${TO_DATE:-offen}"
  echo
  printf '| Server | Linux-User | Agent-Name | Sessions | Antworten mit Cost | Kosten USD | Erste Nutzung | Letzte Nutzung | Quelle |\n'
  printf '|---|---|---|---:|---:|---:|---|---|---|\n'
fi

for host in "${SERVERS[@]}"; do
  ssh -o BatchMode=yes -o ConnectTimeout=8 "root@$host" 'bash -s' -- "$FROM_DATE" "$TO_DATE" "$host" <<'REMOTE' | awk -F '\t' -v host="$host" -v format="$FORMAT" '
    format == "markdown" {
      printf "| %s | `%s` | %s | %s | %s | %s | %s | %s | `%s` |\n", host, $1, ($2==""?"-":$2), $3, $4, $5, $6, $7, $8
    }
    format == "tsv" {
      print host "\t" $0
    }
  '
python3 - "$1" "$2" "$3" <<'PY'
import json
import pwd
import subprocess
import sys
from pathlib import Path

report_from = sys.argv[1]
report_to = sys.argv[2]
host = sys.argv[3]

canonical_name_overrides = {
    ("sarahserver1", "sebastian"): "Bernd",
    ("sarahserver1", "user1"): "Chefkoch",
    ("sarahserver1", "user2"): "Franks Klaus",
    ("sarahserver2", "agent"): "offen, nicht Turiya",
    ("sarahserver3", "gandalf"): "gandalf",
    ("sarahserver3", "rocky"): "rocky",
    ("sarahserver3", "turyia"): "Turiya",
}

def in_range(ts: str) -> bool:
    if not ts:
        return True
    day = ts[:10]
    if report_from and day < report_from:
        return False
    if report_to and day > report_to:
        return False
    return True

try:
    raw = subprocess.check_output(
        ["systemctl", "list-units", "openclaw-gateway@*.service", "--all", "--no-legend", "--plain"],
        text=True,
        stderr=subprocess.DEVNULL,
    )
except subprocess.CalledProcessError:
    raw = ""

users = []
for line in raw.splitlines():
    unit = line.split()[0] if line.split() else ""
    if unit.startswith("openclaw-gateway@") and unit.endswith(".service"):
        users.append(unit[len("openclaw-gateway@"): -len(".service")])

for user in sorted(set(users)):
    try:
        home = Path(pwd.getpwnam(user).pw_dir)
    except KeyError:
        continue
    identity_candidates = [
        home / ".openclaw" / "workspace" / "IDENTITY.md",
        *sorted((home / ".openclaw").glob("workspace*/IDENTITY.md")),
    ]
    agent_name = user
    for candidate in identity_candidates:
        if candidate.is_file():
            try:
                text = candidate.read_text(encoding="utf-8", errors="replace")
            except Exception:
                continue
            lines = text.splitlines()
            for idx, line in enumerate(lines):
                stripped = line.strip()
                if stripped.lower().startswith("- **name") or stripped.lower().startswith("- name"):
                    if ":" in stripped:
                        value = stripped.split(":", 1)[1].strip().strip("*").strip()
                        if value:
                            agent_name = value
                            break
                    for follow in lines[idx + 1:]:
                        follow_stripped = follow.strip().strip("*").strip()
                        if not follow_stripped:
                            continue
                        if follow_stripped.startswith("-"):
                            break
                        agent_name = follow_stripped
                        break
                    if agent_name != user:
                        break
            if agent_name != user:
                break

    sessions_root = home / ".openclaw" / "agents"
    session_files = sorted(sessions_root.glob("*/sessions/*.jsonl")) if sessions_root.is_dir() else []

    total_cost = 0.0
    cost_messages = 0
    sessions_seen = set()
    first_ts = None
    last_ts = None

    for path in session_files:
        session_has_matching_entry = False
        try:
            with path.open("r", encoding="utf-8", errors="replace") as fh:
                for raw_line in fh:
                    raw_line = raw_line.strip()
                    if not raw_line:
                        continue
                    try:
                        item = json.loads(raw_line)
                    except json.JSONDecodeError:
                        continue
                    ts = item.get("timestamp")
                    if ts and in_range(ts):
                        session_has_matching_entry = True
                        if first_ts is None or ts < first_ts:
                            first_ts = ts
                        if last_ts is None or ts > last_ts:
                            last_ts = ts
                    usage = (((item.get("message") or {}).get("usage") or {}).get("cost") or {})
                    cost = usage.get("total")
                    if ts and in_range(ts) and isinstance(cost, (int, float)):
                        total_cost += float(cost)
                        cost_messages += 1
        except Exception:
            continue
        if session_has_matching_entry:
            sessions_seen.add(path.name)

    agent_name = canonical_name_overrides.get((host, user), agent_name or user)

    print("\t".join([
        user,
        agent_name,
        str(len(sessions_seen)),
        str(cost_messages),
        f"{total_cost:.6f}",
        first_ts or "-",
        last_ts or "-",
        str(sessions_root),
    ]))
PY
REMOTE
done
