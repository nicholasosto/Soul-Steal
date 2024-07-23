
# TODO Checklist for Soul Steal Game Development

## Initial Setup
1. **[ ] Create the Roblox game project.**
2. **[ ] Set up the file structure as outlined.**
3. **[ ] Create placeholders for assets (textures, sounds, particles).**

## Health and Damage System
4. **[ ] Develop the HealthSystem module.**
   - **[ ] Define health properties for players and NPCs.**
   - **[ ] Implement health reduction logic.**
   - **[ ] Create functions for checking if a target's health is low enough for a soul steal.**

## Soul Steal Mechanism
5. **[ ] Develop the SoulStealEvent module.**
   - **[ ] Create functions to initiate the soul steal process.**
   - **[ ] Implement the beam effect for soul steal.**
   - **[ ] Define logic for transferring health/energy to the player.**
6. **[ ] Develop visual and sound effects in the Effects module.**
   - **[ ] Create particle emitters for the drain effect.**
   - **[ ] Add sound effects for the soul steal process.**

## Race and Abilities
7. **[ ] Develop the RaceBase module.**
   - **[ ] Define the base class for races with common properties and methods.**
8. **[ ] Implement specific races in their respective modules (Vampire, Lich, etc.).**
   - **[ ] Create Vampire race module.**
     - **[ ] Implement abilities (Life Drain, Night Vision, Speed Boost).**
   - **[ ] Create Lich race module.**
     - **[ ] Implement abilities (Necromancy, Magic Shield, Soul Siphon).**
9. **[ ] Develop the RaceFactory module.**
   - **[ ] Implement the factory pattern to create different race instances.**

## Abilities
10. **[ ] Develop the AbilityBase module.**
    - **[ ] Define the base class for abilities with common properties and methods.**
11. **[ ] Implement specific abilities in their respective modules.**
    - **[ ] Create LifeDrainAbility module.**
    - **[ ] Create NightVisionAbility module.**
    - **[ ] Create NecromancyAbility module.**
    - **[ ] Create MagicShieldAbility module.**
    - **[ ] Create SoulSiphonAbility module.**

## Game Management
12. **[ ] Develop the GameManager module.**
    - **[ ] Handle game state management.**
    - **[ ] Manage player progression and rewards.**
    - **[ ] Implement leveling up and unlocking new abilities.**
13. **[ ] Develop the CombatManager module.**
    - **[ ] Handle combat interactions between players and NPCs.**
    - **[ ] Implement damage calculations and health updates.**

## Player and NPC Setup
14. **[ ] Develop PlayerController script in StarterPlayerScripts.**
    - **[ ] Implement player controls and interactions.**
    - **[ ] Handle player-specific abilities and effects.**
15. **[ ] Develop CharacterSetup script in StarterCharacterScripts.**
    - **[ ] Set up character properties and behaviors.**
16. **[ ] Create NPC scripts in the Workspace/NPCs directory.**
    - **[ ] Define NPC behavior and interactions.**
    - **[ ] Implement combat logic for NPCs.**

## Environment and Props
17. **[ ] Develop Environment setup scripts.**
    - **[ ] Create and set up the game environment (terrain, lighting).**
    - **[ ] Add props like trees and rocks with their respective scripts.**

## Testing and Debugging
18. **[ ] Test individual modules and scripts for functionality.**
19. **[ ] Debug and fix any issues encountered during testing.**
20. **[ ] Conduct playtesting sessions to ensure smooth gameplay.**
21. **[ ] Optimize performance and fix any remaining bugs.**

## Final Touches
22. **[ ] Add final visual and sound effects.**
23. **[ ] Implement game UI elements (health bars, ability indicators).**
24. **[ ] Polish game mechanics and ensure a seamless player experience.**
