# awesome-skills

Repository for reusable Codex skills.

## Layout

```text
skills/
  dota2-arcade/
    dota2-arcade-doc-research/
    dota2-arcade-project-setup/
    dota2-arcade-panorama-ui/
    dota2-arcade-vscripts/
    dota2-arcade-abilities-items/
    dota2-arcade-units-heroes/
    dota2-arcade-networking/
    dota2-arcade-assets-content/
    dota2-arcade-debugging/
```

## Dota 2 Arcade Skills

The Dota 2 Arcade skills are TypeScript-first and ModDota-oriented. They assume modern addon work should prefer `ModDota/TypeScriptAddonTemplate` when possible, while still understanding legacy Lua VScripts, DataDriven KV, and compiled Lua output.

| Skill | Purpose |
| --- | --- |
| `dota2-arcade-doc-research` | Find and verify ModDota, Valve Wiki, Panorama, VScript, KV, and template documentation. |
| `dota2-arcade-project-setup` | Create, inspect, and maintain TypeScript-first addon project structure and build workflow. |
| `dota2-arcade-panorama-ui` | Build and debug Panorama XML/CSS/TypeScript UI. |
| `dota2-arcade-vscripts` | Implement gameplay flow, GameMode logic, timers, events, and server-side systems. |
| `dota2-arcade-abilities-items` | Implement abilities, items, modifiers, AbilityValues, and ability/item KV. |
| `dota2-arcade-units-heroes` | Define custom heroes, units, bosses, summons, NPC KV, spawns, and unit behavior. |
| `dota2-arcade-networking` | Coordinate Panorama and VScripts through CustomNetTables and custom game events. |
| `dota2-arcade-assets-content` | Handle particles, models, materials, sounds, maps, Panorama resources, and content paths. |
| `dota2-arcade-debugging` | Diagnose build, runtime, Panorama, TypeScript, Lua, KV, hot-reload, and packaging issues. |

## Source References

- [ModDota documentation](https://moddota.com/)
- [ModDota documentation source](https://github.com/ModDota/moddota.github.io/tree/source/_articles)
- [ModDota TypeScriptAddonTemplate](https://github.com/ModDota/TypeScriptAddonTemplate)
- [Valve Panorama JavaScript API](https://developer.valvesoftware.com/wiki/Panorama/Overview/Javascript/API)
