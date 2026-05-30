#!/usr/bin/env bash
set -euo pipefail

REPO="$(cd "$(dirname "$0")/.." && pwd)"
PLUGIN="$REPO/.claude-plugin/plugin.json"

skill_dirs=$(bash "$REPO/scripts/list-skills.sh" | grep -v '^skills/local/' | sed 's|/SKILL\.md$||')

skills_json=$(printf '%s\n' $skill_dirs | jq -R . | jq -s .)

tmp=$(mktemp)
jq --argjson skills "$skills_json" '.skills = $skills' "$PLUGIN" > "$tmp"
mv "$tmp" "$PLUGIN"

echo "Updated $PLUGIN with skills:"
printf '%s\n' $skill_dirs | sed 's/^/  /'
