---
name: dota2-arcade-doc-research
description: Find, compare, and cite Dota 2 Arcade documentation across ModDota, Valve Developer Community, Panorama API pages, TypeScriptAddonTemplate, and local addon source. Use when the user asks how a Dota 2 custom game API works, where to find docs, which article applies, whether examples are Lua or TypeScript, or how to verify an implementation detail before editing code.
---

# Dota 2 Arcade Doc Research

## Overview

Use this skill to answer Dota 2 Arcade questions from current sources before implementation. Prefer TypeScript-first ModDota guidance when it exists, but identify when the underlying runtime or official examples are Lua, KV, Panorama JavaScript, or Valve engine behavior.

## Research Order

1. Inspect the user's project first when a repo or file is available. Local `package.json`, `src/vscripts`, `src/panorama`, `game/scripts/npc`, and `content/panorama` files are more specific than public examples.
2. Use the TypeScriptAddonTemplate for modern project structure, build commands, `src/common`, `src/vscripts`, and `src/panorama` conventions.
3. Use ModDota articles for community workflows, custom game patterns, KV examples, TypeScript tutorials, abilities, Panorama, assets, units, and tooling.
4. Use Valve Developer Community pages for official Panorama APIs and engine-facing behavior. Treat Valve docs as authoritative for API names, but verify Dota 2 custom game applicability against examples or local types.
5. Search generated declarations or installed packages in the project when public docs are incomplete. TypeScript definitions often expose exact signatures.

## Source Map

- ModDota home: `https://moddota.com/`
- ModDota articles source: `https://github.com/ModDota/moddota.github.io/tree/source/_articles`
- TypeScriptAddonTemplate: `https://github.com/ModDota/TypeScriptAddonTemplate`
- TypeScript introduction: `https://moddota.com/scripting/Typescript/typescript-introduction/`
- Panorama TypeScript introduction: `https://moddota.com/panorama/introduction-to-panorama-ui-with-typescript`
- Valve Panorama JavaScript API: `https://developer.valvesoftware.com/wiki/Panorama/Overview/Javascript/API`

Read `references/source-map.md` when the task is mainly about finding the right Dota 2 Arcade documentation category.

## Verification Habits

- Browse or inspect the source when the user asks for the latest docs, exact API names, direct links, or behavior that may have changed.
- Distinguish `game/` runtime files from `content/` asset/UI files.
- Distinguish TypeScript source from compiled Lua or JavaScript output.
- When docs conflict, state the conflict and prefer local project code or official API pages for signatures.
- Keep quoted text short. Summarize examples instead of copying whole articles.

## Output

Return the smallest useful answer: a direct recommendation, the relevant docs, and any project-specific caveats. Include links for web sources.
