
# Soul Steal Game Design and Design Patterns

## 1. Game Concept
The game revolves around players harvesting souls by engaging in combat with NPCs and other players. Players must reduce their target's health to a certain percentage before initiating a soul steal, which involves a beam that drains the target's energy and rewards the player with experience points.

## 2. Key Gameplay Mechanics
1. **Health and Damage System:** Players and NPCs have health bars. Combat reduces health, and specific thresholds allow for soul steals.
2. **Soul Steal Mechanism:** A beam effect is used to drain energy from low-health targets, transferring it to the player.
3. **Rewards and Progression:** Players gain experience points for successful soul steals, leading to leveling up and unlocking new abilities.
4. **Race and Abilities:** Different races (e.g., Vampire, Lich) with unique abilities add variety and strategic depth.

## 3. Race and Abilities Design
### Vampires
- **Abilities:**
  - **Life Drain:** Drains health from an enemy and transfers it to the player.
  - **Night Vision:** Enhances vision in dark environments.
  - **Race (Speed Boost):** Temporarily increases movement speed and jump power.

### Lich
- **Abilities:**
  - **Necromancy:** Summons undead minions.
  - **Magic Shield:** Provides temporary protection.
  - **Soul Siphon:** Drains souls over time from nearby enemies.

## 4. Implementation Details
### Core Modules
- **HealthSystem.lua**: Manages health reduction and restoration.
- **AbilityBase.lua**: Base class for abilities with common properties and methods.

### Remote Events
- **RemoteEvents.lua**: Sets up RemoteEvent instances for client-server communication.

### GUI Elements
- **HealthBar.lua**: Manages health bar UI updates.

### Client Scripts
- **ClientMain.lua**: Handles client-side events and logic.

### Server Scripts
- **ServerMain.lua**: Handles server-side events and logic.

### Environment and NPC Setup
- **NPCBehavior.lua**: Defines NPC behavior and interactions.
- **EnvironmentSetup.lua**: Initializes the game environment.

## Next Steps
Now that the initial scripts are created, you can move on to the next phase of development:

1. **Enhance Core Modules:**
   - Add more detailed logic and features to `HealthSystem.lua` and `AbilityBase.lua` as needed.

2. **Implement Specific Abilities:**
   - Create and implement specific abilities for Vampires and Liches in separate Lua files under the `src/Abilities` directory.

3. **Setup GUI Elements:**
   - Develop additional GUI elements such as ability indicators, experience bars, and other UI components.

4. **Develop Player and NPC Mechanics:**
   - Implement player-specific controls and abilities in the client scripts.
   - Flesh out NPC behavior and interactions in `NPCBehavior.lua`.

5. **Integrate Environment Setup:**
   - Use `EnvironmentSetup.lua` to set up the game world, including terrain, lighting, and props.

6. **Testing and Debugging:**
   - Test each module and script for functionality.
   - Debug and resolve any issues encountered during testing.

7. **Conduct Playtesting:**
   - Organize playtesting sessions to gather feedback and ensure smooth gameplay.

8. **Optimize and Polish:**
   - Optimize performance and fix any remaining bugs.
   - Add final visual and sound effects.
   - Implement and refine game UI elements.
