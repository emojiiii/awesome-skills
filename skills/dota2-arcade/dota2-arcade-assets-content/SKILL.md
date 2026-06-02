---
name: dota2-arcade-assets-content
description: Handle Dota 2 Arcade asset and content work including particles, models, materials, textures, sounds, maps, minimap icons, Panorama resources, file paths, content/game separation, and packaging references. Use when custom game behavior depends on non-code assets or asset paths.
version: 0.0.1
---

# Dota 2 Arcade Assets And Content

## Overview

Use this skill for Dota 2 `content` and asset pipeline issues. Keep content authoring assets distinct from runtime `game` scripts and KV files.11111

## File Scope

* `content/`: source-side maps, models, materials, particles, sounds, and Panorama resources.
* `game/`: runtime scripts, KV, compiled scripts, and files loaded by the game.
* `content/panorama`: XML, CSS, images, and UI resources.
* `game/scripts/npc`: KV references to models, particles, sounds, icons, and abilities.

## Workflow

1. Identify whether the problem is source asset authoring, runtime path reference, or packaging/build output.
2. Locate every reference to the asset path before renaming or moving files.
3. Keep model, material, particle, sound, and UI image paths consistent with Dota 2 conventions used by the project.
4. For ability assets, check both KV and script-side precache or particle/sound usage.
5. For map assets, check Hammer/map source paths and runtime launch assumptions.
6. Test in game because many asset failures only appear in console or as missing visuals/sounds.

## Asset Types

* Particles: verify particle file path, control points, attachment points, cleanup, and precache.
* Models/materials: verify model path, material dependencies, hitboxes, animations, and unit KV references.
* Sounds: verify sound event definitions and script/KV playback path.
* Maps: verify map name, launch command, Hammer source, and addon packaging.
* Panorama resources: verify XML/CSS/image paths under `content/panorama`.

## Documentation

Use ModDota `assets`, `assets/maps`, `assets/models`, and `assets/particles` articles for examples. Use project-local asset references as the primary source of naming conventions.

## Coordinate With Other Skills

Use `dota2-arcade-abilities-items` when assets are tied to spells or modifiers. Use `dota2-arcade-units-heroes` when assets are tied to unit or hero KV.