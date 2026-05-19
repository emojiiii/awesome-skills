---
name: dota2-arcade-project-setup
description: Set up, inspect, and organize Dota 2 Arcade addon projects with a TypeScript-first ModDota TypeScriptAddonTemplate workflow. Use when creating a new custom game, identifying project layout, wiring build scripts, deciding where files belong under game/content/src, or migrating a Lua addon toward TypeScript.
---

# Dota 2 Arcade Project Setup

## Overview

Use this skill for repository-level Dota 2 Arcade work. Default to TypeScriptAddonTemplate conventions unless the existing project is clearly Lua-only.

## First Inspection

Inspect these files before changing structure:

- `package.json`
- `tsconfig.json`, `src/vscripts/tsconfig.json`, `src/panorama/tsconfig.json`
- `src/common`, `src/vscripts`, `src/panorama`
- `game/scripts/vscripts`
- `game/scripts/npc`
- `content/panorama`
- `.vscode/tasks.json` and workflow files when present

Use `scripts/inspect-addon.sh <project-root>` for a quick structural summary when the project is available locally.

## Directory Rules

- Put TypeScript gameplay source in `src/vscripts`; compiled Lua belongs in `game/scripts/vscripts`.
- Put Panorama TypeScript source in `src/panorama`; compiled JavaScript usually belongs under `content/panorama/scripts/custom_game`.
- Put shared declarations and event contracts in `src/common`.
- Put NPC, ability, item, hero, and unit KV in `game/scripts/npc`.
- Put Panorama XML/CSS and UI resources in `content/panorama`.
- Put map, particle, model, material, and sound authoring assets under `content` unless the project has a stricter convention.

Do not edit compiled Lua or compiled Panorama JavaScript when matching TypeScript source exists. Patch source and rebuild.

## Setup Workflow

1. Confirm the addon name and Dota 2 install/addons target expected by the project.
2. Confirm whether the repo is based on TypeScriptAddonTemplate, a Lua addon, or a custom hybrid.
3. Install dependencies only after reading the package manager lockfile.
4. Prefer the repo's existing scripts. In TypeScriptAddonTemplate, expect `npm run dev` or VS Code build tasks to compile and watch.
5. Keep generated output out of source edits unless the project intentionally commits generated files.
6. After structural changes, run typecheck/build scripts that already exist in `package.json`.

## Migration Guidance

When moving a Lua addon toward TypeScript:

- Preserve existing `game/scripts/npc` KV first.
- Introduce TypeScript for new systems before rewriting stable Lua.
- Move event names and nettable contracts into shared declarations where useful.
- Keep compiled output reviewable until the build pipeline is trusted.

## Coordinate With Other Skills

- Use `dota2-arcade-panorama-ui` for UI files and Panorama API usage.
- Use `dota2-arcade-vscripts` for GameMode and gameplay systems.
- Use `dota2-arcade-abilities-items` for ability, item, and modifier implementation.
- Use `dota2-arcade-debugging` when setup work fails to build or launch.
