#!/usr/bin/env bash
set -euo pipefail

root="${1:-.}"

echo "Dota 2 Arcade addon inspection: $root"

check_path() {
  local path="$1"
  if [ -e "$root/$path" ]; then
    echo "FOUND $path"
  else
    echo "MISS  $path"
  fi
}

check_path "package.json"
check_path "src/vscripts"
check_path "src/panorama"
check_path "src/common"
check_path "game/scripts/vscripts"
check_path "game/scripts/npc"
check_path "content/panorama"
check_path ".vscode/tasks.json"

if [ -f "$root/package.json" ]; then
  echo
  echo "package scripts:"
  node -e 'const fs=require("fs"); const p=JSON.parse(fs.readFileSync(process.argv[1],"utf8")); for (const [k,v] of Object.entries(p.scripts||{})) console.log(`${k}: ${v}`);' "$root/package.json" 2>/dev/null || true
fi
