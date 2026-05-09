#!/usr/bin/env bash
set -euo pipefail

SERVERS=(sarahserver1 sarahserver2 sarahserver3)

cat <<'HDR'
# Live-Snapshot Kostenkontrolle
HDR
echo
printf '| Server | Linux-User | Status | Port | Primary | Fallbacks | Provider | Anthropic-Key | OpenAI-Key | Claude in Config |\n'
printf '|---|---|---|---:|---|---|---|---|---|---|\n'

for host in "${SERVERS[@]}"; do
  ssh -o BatchMode=yes -o ConnectTimeout=8 "root@$host" 'bash -s' <<'REMOTE' | awk -F '	' -v host="$host" '{printf "| %s | `%s` | %s | `%s` | `%s` | `%s` | `%s` | %s | %s | %s |\n", host, $1, $2, $3, $6, ($7==""?"-":$7), $8, $4, $5, $9}'
set -e
systemctl list-units 'openclaw-gateway@*.service' --all --no-legend --plain 2>/dev/null | awk '{print $1}' | sed 's/^openclaw-gateway@//; s/\.service$//' | sort -u | while read -r u; do
  [ -n "$u" ] || continue
  home=$(getent passwd "$u" | cut -d: -f6 || true)
  cfg="$home/.openclaw/openclaw.json"
  envf="/etc/openclaw/users/$u.env"
  state=$(systemctl is-active "openclaw-gateway@$u" 2>/dev/null || true)
  port=$(grep -E '^OPENCLAW_GATEWAY_PORT=' "$envf" 2>/dev/null | cut -d= -f2- || true)
  anth_env=$(grep -c '^ANTHROPIC_API_KEY=' "$envf" 2>/dev/null || true)
  openai_env=$(grep -c '^OPENAI_API_KEY=' "$envf" 2>/dev/null || true)
  if [ -f "$cfg" ]; then
    python3 - <<'PY' "$u" "$cfg" "$state" "$port" "$anth_env" "$openai_env"
import json,sys
u,cfg,state,port,anth_env,openai_env=sys.argv[1:]
with open(cfg) as f:
    data=json.load(f)
cur=data
for key in ['agents','defaults','model']:
    cur=cur.get(key,{}) if isinstance(cur,dict) else {}
primary=cur.get('primary') or ''
fallbacks=cur.get('fallbacks') or []
providers=[]
claude='no'
for item in [primary,*fallbacks]:
    if isinstance(item,str) and '/' in item:
        providers.append(item.split('/',1)[0])
        if item.startswith('anthropic/'):
            claude='yes'
providers=','.join(dict.fromkeys(providers))
print('\t'.join([
    u,
    state,
    port,
    'yes' if anth_env != '0' else 'no',
    'yes' if openai_env != '0' else 'no',
    primary,
    ', '.join(fallbacks),
    providers,
    claude,
]))
PY
  fi
done
REMOTE
done
