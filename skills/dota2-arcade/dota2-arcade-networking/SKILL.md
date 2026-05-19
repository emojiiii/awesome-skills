---
name: dota2-arcade-networking
description: Implement and debug communication between Dota 2 Arcade VScripts and Panorama with CustomNetTables, CustomGameEventManager, event payload types, shared TypeScript declarations, UI state sync, and client/server boundaries. Use when data must move between gameplay code and custom UI.
---

# Dota 2 Arcade Networking

## Overview

Use this skill when server gameplay state and Panorama UI need to communicate. Default to typed event contracts in TypeScript projects.

## Choose The Channel

Use CustomNetTables when:

- UI needs durable state.
- Late subscribers should receive current values.
- Multiple panels need the same state.
- State changes are not high-frequency per-frame data.

Use CustomGameEvents when:

- A user action should request a server action.
- Server needs to push a one-time UI notification.
- Ordering matters more than durable state.
- Payloads are small and event-like.

Do not use networking as a substitute for server authority. Panorama can request actions, but VScripts should validate.

## Implementation Workflow

1. Define the data contract first: event name, direction, payload shape, owner, and lifetime.
2. Put shared TypeScript declarations in `src/common` when both Panorama and VScripts need the shape.
3. Implement server subscriptions during GameMode setup or the relevant system initialization.
4. Implement Panorama subscriptions once, near the UI entry script.
5. Validate all client-originated data on the server.
6. Add logs on both sides while debugging event flow.
7. Remove noisy logs after the communication path is stable.

## Data Shape Rules

- Keep payloads JSON-like and serializable.
- Prefer ids and primitive values over entities or large nested objects.
- Include player id only when the receiver cannot infer it safely.
- Avoid rapid nettable writes for animation-like data.
- Version or namespace event names when a project has many systems.

## Assets

Use `assets/snippets/network-contract.ts` as a minimal shared contract example.

## Coordinate With Other Skills

Use `dota2-arcade-panorama-ui` for rendering and client behavior. Use `dota2-arcade-vscripts` for server systems and validation.
