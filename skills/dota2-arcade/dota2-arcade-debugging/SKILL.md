---
name: dota2-arcade-debugging
description: Diagnose Dota 2 Arcade failures across TypeScript builds, Lua runtime, Panorama UI, XML/CSS loading, KV syntax, addon structure, hot reload, events, nettables, assets, launch commands, and in-game console logs. Use when the user reports errors, missing UI, broken abilities, failed builds, or behavior mismatch.
---

# Dota 2 Arcade Debugging

## Overview

Use this skill to move from a symptom to the most likely Dota 2 Arcade failure layer. Debug from build output to game runtime to client UI instead of changing unrelated systems.

## First Triage

Classify the failure:

- Build or typecheck failure: TypeScript, TypeScriptToLua, bundler, package scripts.
- Addon launch failure: addon name, map name, Dota path, launch script, missing generated files.
- Server runtime failure: Lua stack trace, nil values, missing class registration, event payload mismatch.
- Panorama failure: XML/CSS/JS load, missing panel id, bad API call, client event issue.
- KV failure: syntax, wrong file, missing ability/unit/item name, bad value type.
- Asset failure: missing particle/model/material/sound/map path.
- Sync failure: CustomNetTables or custom events not arriving or arriving with wrong payload shape.

Use `scripts/scan-common-issues.sh <project-root>` for a quick project-level scan.

## Debugging Workflow

1. Ask for or inspect the exact error text, console output, screenshot, changed files, and command that failed.
2. Reproduce with the smallest existing command: typecheck, build, dev watcher, or launch script.
3. Identify whether TypeScript source or compiled output is authoritative for this repo.
4. Search for the symbol, file path, ability name, unit name, event name, or panel id from the error.
5. Patch the smallest source file that owns the issue.
6. Run the relevant build/check again.
7. If runtime-only, describe the exact in-game verification path and console signal to watch.

## Common Causes

- Editing compiled Lua or JS while the watcher overwrites it.
- Ability/unit names differ between KV and scripts.
- Panorama script compiled to a different path than XML expects.
- Server sends an event before the Panorama subscriber loads.
- Client sends untrusted or malformed payloads and server code assumes they are valid.
- KV syntax breaks due to missing quotes or braces.
- Asset paths are correct in `content` but not referenced correctly in runtime files.

## Output

When reporting findings, lead with the failure layer, the file/path/symbol involved, the fix, and the verification command or in-game check.

## Coordinate With Other Skills

After identifying the layer, switch to the relevant implementation skill for the actual patch when useful.
