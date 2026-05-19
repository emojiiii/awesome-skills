---
name: dota2-arcade-abilities-items
description: Create, modify, and debug Dota 2 Arcade custom abilities, items, modifiers, AbilityValues, ability/item KV, DataDriven legacy definitions, and TypeScript or Lua ability logic. Use when implementing spells, item actives/passives, charges, cooldowns, tooltips, modifier properties, or ability events.
---

# Dota 2 Arcade Abilities And Items

## Overview

Use this skill for ability, item, and modifier work. Prefer TypeScript ability/modifier classes in modern projects, but keep KV definitions accurate because Dota still reads ability and item metadata from KV.

## File Scope

- `game/scripts/npc/npc_abilities_custom.txt`
- `game/scripts/npc/npc_items_custom.txt`
- `src/vscripts/abilities`
- `src/vscripts/items`
- `src/vscripts/modifiers`
- legacy `game/scripts/vscripts` Lua ability or modifier files

## Implementation Workflow

1. Find the KV entry first. Confirm ability/item name, behavior flags, cast range, cooldown, mana cost, texture, and `AbilityValues`.
2. Find or create the TypeScript/Lua logic class that matches the KV script binding pattern used by the project.
3. Put tunable numeric values in `AbilityValues` unless they are purely internal implementation constants.
4. Implement modifiers as separate reusable classes when behavior persists over time or affects properties.
5. Keep server-side effects server-side. Send only UI feedback through Panorama events or nettable state.
6. Test level scaling, special values, illusions, spell immunity, death, purge, and cooldown/charge edge cases when relevant.

## KV Guidance

- Preserve exact KV nesting and quoted keys.
- Prefer `AbilityValues` for values used in tooltips or balance changes.
- Match ability behavior flags to the intended targeting model.
- Keep custom item names and ability names stable once referenced by units or scripts.
- Be careful with DataDriven examples: use them as legacy reference unless the project already relies on DataDriven.

## Modifier Guidance

- Declare properties and states in the style used by the project.
- Keep interval thinkers, aura logic, and stack logic isolated.
- Use server checks around state mutations.
- Handle cleanup on destroy when particles, sounds, dummy units, or timers are created.

## Assets

Use snippets under `assets/snippets/` for minimal ability, modifier, and KV starting points. Adapt to the local decorator/registration pattern before pasting.

## Documentation

Use ModDota `abilities`, `abilities/datadriven`, and `abilities/lua-modifiers` articles for examples. Use local project declarations for exact TypeScript signatures.

## Coordinate With Other Skills

Use `dota2-arcade-units-heroes` when abilities are assigned to units/heroes. Use `dota2-arcade-assets-content` when particles, models, sounds, or icons are part of the ability.
