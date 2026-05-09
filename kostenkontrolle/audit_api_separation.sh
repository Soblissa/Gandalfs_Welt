#!/usr/bin/env bash
set -euo pipefail

SERVERS=(sarahserver1 sarahserver2 sarahserver3)

cat <<'HDR'
# API-Separations-Audit pro Agent
HDR
echo
printf '| Server | Linux-User | OPENAI_API_KEY | ANTHROPIC_API_KEY | Befund |\n'
printf '|---|---|---|---|---|\n'

for host in "${SERVERS[@]}"; do
  ssh -o BatchMode=yes -o ConnectTimeout=8 "root@$host" 'bash -s' <<'REMOTE' | awk -F '\t' -v host="$host" '{printf "| %s | `%s` | `%s` | `%s` | %s |\n", host, $1, $2, $3, $4}'
set -e
systemctl list-units 'openclaw-gateway@*.service' --all --no-legend --plain 2>/dev/null | awk '{print $1}' | sed 's/^openclaw-gateway@//; s/\.service$//' | sort -u | while read -r u; do
  [ -n "$u" ] || continue
  envf="/etc/openclaw/users/$u.env"
  python3 - <<'PY' "$u" "$envf"
import hashlib, sys
from pathlib import Path
user = sys.argv[1]
envf = Path(sys.argv[2])
vals = {}
if envf.is_file():
    for line in envf.read_text(encoding='utf-8', errors='replace').splitlines():
        if '=' in line and not line.lstrip().startswith('#'):
            k, v = line.split('=', 1)
            if k in ('OPENAI_API_KEY', 'ANTHROPIC_API_KEY'):
                vals[k] = v.strip()

def fp(v: str) -> str:
    return hashlib.sha256(v.encode()).hexdigest()[:12] if v else '-'

o = vals.get('OPENAI_API_KEY', '')
a = vals.get('ANTHROPIC_API_KEY', '')
if o or a:
    finding = 'eigener env-Key vorhanden'
else:
    finding = 'kein agentenspezifischer env-Key sichtbar'
print('\t'.join([
    user,
    ('yes:' + fp(o)) if o else 'no:-',
    ('yes:' + fp(a)) if a else 'no:-',
    finding,
]))
PY
done
REMOTE
done
