---
name: dota2-arcade-panorama-ui
description: Build, modify, and debug Dota 2 Arcade Panorama UI with XML, CSS, TypeScript, JavaScript, Panel APIs, custom events, and nettable-driven state. Use when working on HUD, custom panels, layout files, Panorama scripts, UI styling, or client-side communication with VScripts.
---

# Dota 2 Arcade Panorama UI

## Overview

Use this skill for Dota 2 Panorama client UI. Prefer TypeScript for scripts when the project has `src/panorama`; otherwise work with the existing JavaScript layout.

## File Scope

- `src/panorama`: TypeScript Panorama source in TypeScriptAddonTemplate projects.
- `content/panorama/layout/custom_game`: XML layouts.
- `content/panorama/styles/custom_game`: CSS styles.
- `content/panorama/scripts/custom_game`: compiled or hand-written JavaScript.
- `src/common`: shared event and nettable declarations.

Do not patch compiled JavaScript when a matching TypeScript source exists.

## Implementation Workflow

1. Identify the entry layout and script manifest before editing.
2. Locate the panel ids, CSS classes, and script event subscriptions already in use.
3. Decide whether state should be local UI state, a custom game event, or a CustomNetTable.
4. Keep XML declarative: create panels, ids, classes, and static structure there.
5. Keep dynamic behavior in TypeScript or JavaScript.
6. Use CSS classes for visual state instead of rewriting inline styles when possible.
7. Rebuild Panorama scripts with the repo's build command and test in game or via the project's launch workflow.

## API Guidance

- Use Valve's Panorama JavaScript API for Panel, event, scheduling, and UI helpers.
- Use ModDota Panorama articles for Dota custom game-specific examples.
- Use generated TypeScript declarations in the project when signatures differ from docs.
- Keep event payloads small and serializable.
- Use stable panel ids for code that needs `FindChildTraverse`.

## Common Patterns

- Client asks server to act: `GameEvents.SendCustomGameEventToServer`.
- Server pushes discrete UI event: `CustomGameEventManager.Send_ServerToPlayer` or team/all variants.
- Server publishes shared state: `CustomNetTables.SetTableValue`, then Panorama subscribes.
- UI lifecycle behavior: subscribe once at script load and clean up only if the project has explicit panel teardown patterns.

## Assets

Use `assets/snippets/basic-panel.xml` and `assets/snippets/basic-panel.ts` as small starting points, not as mandatory architecture.

## Coordinate With Other Skills

Use `dota2-arcade-networking` for event and nettable contracts. Use `dota2-arcade-debugging` for blank panels, script load failures, CSS not applying, and game/client mismatch.
