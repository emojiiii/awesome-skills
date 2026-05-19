---
name: dota2-arcade-units-heroes
description: Define and debug Dota 2 Arcade custom heroes, units, bosses, summons, creeps, NPC KV, unit spawning, hero selection data, model references, unit abilities, and TypeScript or Lua unit behavior. Use when editing npc_units_custom, npc_heroes_custom, spawners, custom bosses, summons, or hero/unit metadata.
---

# Dota 2 Arcade Units And Heroes

## Overview

Use this skill for Dota unit and hero definitions. Most unit metadata lives in KV, while behavior usually lives in VScripts and abilities.

## File Scope

- `game/scripts/npc/npc_units_custom.txt`
- `game/scripts/npc/npc_heroes_custom.txt`
- `game/scripts/npc/npc_abilities_custom.txt`
- `game/scripts/npc/npc_items_custom.txt`
- `src/vscripts` spawning and behavior systems
- `content` model, particle, material, and sound references

## Implementation Workflow

1. Identify whether the target is a hero, basic unit, summon, boss, dummy, thinker, or spawner-created unit.
2. Edit the correct KV file and preserve exact key structure.
3. Confirm model, soundset, bounds, hull size, movement type, attack data, health/mana, armor, vision, and ability slots.
4. Wire abilities by name and verify those abilities exist.
5. Put dynamic behavior in VScripts rather than overloading KV.
6. Test spawning path, ownership, team, controllability, death cleanup, and respawn rules.

## KV Guidance

- Keep names stable once referenced by scripts, maps, or spawners.
- Prefer copying a close vanilla or existing custom unit shape, then changing only intentional fields.
- Verify ability slot numbering for heroes.
- Keep boss/summon balance values in KV where designers are likely to tune them.
- Watch for model path and soundset issues that are actually asset/content problems.

## Spawning Guidance

- Use the project's existing spawn manager or wave system when present.
- Keep spawn tables data-driven when many units share behavior.
- Set owner, team, controllability, and initial orders explicitly when behavior depends on them.
- Clean up temporary summons and dummy units.

## Assets

Use `assets/snippets/npc-unit-kv.txt` as a minimal custom unit KV starting point.

## Coordinate With Other Skills

Use `dota2-arcade-abilities-items` for assigned ability behavior. Use `dota2-arcade-assets-content` for model, material, particle, sound, and map asset issues.
