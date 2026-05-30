#!/usr/bin/env bash
set -euo pipefail

REPO="$(cd "$(dirname "$0")/.." && pwd)"
MARKETPLACE="$REPO/.claude-plugin/marketplace.json"

skill_dirs=$(bash "$REPO/scripts/list-skills.sh" | grep -v '^skills/local/' | sed 's|/SKILL\.md$||')

skills_json=$(printf '%s\n' $skill_dirs | jq -R . | jq -s .)

tmp=$(mktemp)
jq --argjson skills "$skills_json" \
  '.plugins[0].skills = $skills | .plugins[0].strict = false' \
  "$MARKETPLACE" > "$tmp"
mv "$tmp" "$MARKETPLACE"

echo "Updated $MARKETPLACE with skills:"
printf '%s\n' $skill_dirs | sed 's/^/  /'
