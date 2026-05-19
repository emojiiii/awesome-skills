---
name: dota2-arcade-vscripts
description: Implement and debug Dota 2 Arcade server-side gameplay logic with TypeScript-first VScripts, Lua compatibility, GameMode setup, events, timers, filters, spawning, rounds, teams, and game rules. Use when editing addon_game_mode, GameMode classes, script systems, or gameplay flow.
---

# Dota 2 Arcade VScripts

## Overview

Use this skill for server-side gameplay code. In TypeScriptAddonTemplate projects, edit `src/vscripts` and let the toolchain compile to Lua.

## File Scope

- `src/vscripts/addon_game_mode.ts`: addon entrypoint in TypeScript projects.
- `src/vscripts/GameMode.ts`: common main GameMode class location.
- `src/vscripts/lib`: adapters, timers, and helper declarations.
- `game/scripts/vscripts`: compiled Lua output or legacy Lua source.
- `game/scripts/npc`: KV referenced by runtime code.

Do not edit generated Lua if TypeScript source exists.

## Workflow

1. Locate initialization: `Activate`, `Precache`, GameMode constructor, or project-specific bootstrap.
2. Identify lifecycle events already used: game state changes, entity killed, player connect, NPC spawn, ability events, or filters.
3. Keep game rules and round state in a central system instead of scattering global state across ability files.
4. Use timers through the project's existing timer helper.
5. Keep server-authoritative state in VScripts; expose only the UI state Panorama needs.
6. Run typecheck/build before testing in game.

## TypeScript Conventions

- Prefer classes or small modules that match existing project structure.
- Keep event payload types in `src/common` when also used by Panorama.
- Be explicit about server-only APIs.
- Use `print` or project logging helpers for in-game debugging.
- Remember that TypeScript compiles to Lua, so avoid JavaScript runtime assumptions that TypeScriptToLua cannot support.

## Lua Compatibility

For Lua projects, follow local patterns and avoid introducing TypeScript unless the task is explicitly migration or setup. When translating Lua examples to TypeScript:

- Preserve Dota API names and event payload keys.
- Convert table-style config carefully.
- Replace Lua colon/self idioms with the project's TypeScript class or function style.
- Validate compiled output if behavior depends on Lua method binding.

## Assets

Use `assets/snippets/game-mode-system.ts` for a small TypeScript system skeleton.

## Coordinate With Other Skills

Use `dota2-arcade-abilities-items` for ability and modifier internals, `dota2-arcade-networking` for UI communication, and `dota2-arcade-debugging` for build/runtime failures.
