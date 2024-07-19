# Bounce Bound Saga

## Overview
Bounce Bound Saga is a 2D platformer game where players navigate through segments filled with obstacles and items. The game features dynamically generated levels that increase in difficulty.

## Game Components

### Main.gd
This script initializes the game by creating instances of `SegmentGenerator` and `GameManager`. It also sets up the first three segments of the game.

### SegmentGenerator.gd
This script is responsible for generating each game segment. Each segment includes terrain, a random number of obstacles, and occasionally items. The difficulty of the segments increases as the game progresses.

### GameManager.gd
This script manages the game's state, including tracking the score and lives. It updates the score based on gameplay events and handles game over conditions.

### Main.tscn
This is the main scene of the game, serving as the entry point for the game logic and visual elements.

## Gameplay
- Players navigate through segments while avoiding obstacles.
- Items can be collected to increase the score.
- The game ends when the player runs out of lives.

## Installation
1. Clone the repository.
2. Open the project in Godot Engine.
3. Run the `Main.tscn` scene to start the game.

## Controls
- Use arrow keys or WASD to move.
- Jump to avoid obstacles and collect items.

## License
This project is licensed under the MIT License. See the LICENSE file for details.
