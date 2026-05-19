#!/usr/bin/env bash
set -euo pipefail

root="${1:-.}"

echo "Dota 2 Arcade common issue scan: $root"

warn_missing() {
  local path="$1"
  if [ ! -e "$root/$path" ]; then
    echo "WARN missing $path"
  fi
}

warn_missing "package.json"
warn_missing "game/scripts/npc"
warn_missing "content/panorama"

if [ -d "$root/src/vscripts" ] && [ -d "$root/game/scripts/vscripts" ]; then
  echo "INFO TypeScript VScripts source and Lua output both exist. Prefer editing src/vscripts."
fi

if [ -d "$root/src/panorama" ] && [ -d "$root/content/panorama/scripts/custom_game" ]; then
  echo "INFO TypeScript Panorama source and JS output both exist. Prefer editing src/panorama."
fi

if [ -d "$root/game/scripts/npc" ]; then
  echo
  echo "KV files:"
  find "$root/game/scripts/npc" -maxdepth 1 -type f | sort
fi
