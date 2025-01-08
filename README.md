# Instagib-GoldSrc-Source

This repository contains:

- An **AMX Mod X (AMXX) Instagib plugin** for GoldSrc games
- A **SourceMod Instagib plugin** for Source games

These plugins have been tested with:

- **Half-Life 1** (GoldSrc)
- **Opposing Force** (GoldSrc)
- **Deathmatch Classic** (GoldSrc)
- **Half-Life 2 Deathmatch** (Source)

## What is Instagib?

**Instagib** is a gameplay mode popularized by *Quake*, where players can instantly kill their opponents with a single shot.

The term "instagib" comes from "instant giblets," referring to the way enemies are immediately "gibbed" (exploded into pieces) upon being hit.

## Installation

### GoldSrc Games

1. Ensure **Metamod** and **AMX Mod X** are installed.
2. Place the `instagib.amxx` file into `/addons/amxmodx/plugins`.
3. Copy the `Sound` folder into your game's `sound` directory.

### Source Games

1. Ensure **Metamod** and **SourceMod** are installed.
2. Place the `instagib.smx` file into `/addons/sourcemod/plugins`.
3. Copy the `Sound` folder into your game's `sound` directory.

## How to Use

### GoldSrc Games

- Use the `/instagib` command to enable or disable Instagib mode.
- When enabled:
    - Player speed is increased.
    - Gravity is reduced.
    - All weapons deal one-hit kills.
    - Players explode into gibs upon death.
    - A custom hitsound plays on each successful hit.

### Source Games

- Use the `sm_instagib` command to enable or disable Instagib mode.
- When enabled:
    - Player speed is increased.
    - Gravity is reduced.
    - All weapons deal one-hit kills.
    - Players' bodies are forcefully pushed upon death.
    - A custom hitsound plays on each successful hit.

## Encountered an Issue?

If you experience any problems or have suggestions, feel free to open an issue or submit a pull request. Contributions are welcome!
