
# Soul Steal Game Design and Design Patterns

## Game Concept
The game revolves around players harvesting souls by engaging in combat with NPCs and other players. Players must reduce their target's health to a certain percentage before initiating a soul steal, which involves a beam that drains the target's energy and rewards the player with experience points.

## Key Gameplay Mechanics
1. **Health and Damage System:** Players and NPCs have health bars. Combat reduces health, and specific thresholds allow for soul steals.
2. **Soul Steal Mechanism:** A beam effect is used to drain energy from low-health targets, transferring it to the player.
3. **Rewards and Progression:** Players gain experience points for successful soul steals, leading to leveling up and unlocking new abilities.
4. **Race and Abilities:** Different races (e.g., Vampire, Lich) with unique abilities add variety and strategic depth.

## Race and Abilities Design
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

### Implementing Abilities in Roblox
#### Life Drain Ability
```lua
local function lifeDrain(vampire, target)
    local drainAmount = 10
    if target.Health > drainAmount then
        target.Health = target.Health - drainAmount
        vampire.Health = math.min(vampire.MaxHealth, vampire.Health + drainAmount)
        
        -- Add visual and sound effects
        local drainEffect = Instance.new("ParticleEmitter")
        drainEffect.Parent = target
        drainEffect.Texture = "rbxassetid://exampleTextureID"
        
        local drainSound = Instance.new("Sound")
        drainSound.Parent = target
        drainSound.SoundId = "rbxassetid://exampleSoundID"
        drainSound:Play()
        
        wait(1)
        drainEffect:Destroy()
    end
end
```

#### Night Vision Ability
```lua
local function toggleNightVision(player, enabled)
    local nightVisionEffect = Instance.new("ColorCorrectionEffect")
    nightVisionEffect.Parent = game.Lighting
    nightVisionEffect.Brightness = enabled and 0.2 or 0
    nightVisionEffect.Contrast = enabled and 0.5 or 0
    nightVisionEffect.Saturation = enabled and 1.5 or 1

    if enabled then
        player.PlayerGui:FindFirstChild("NightVisionOverlay").Enabled = true
    else
        player.PlayerGui:FindFirstChild("NightVisionOverlay").Enabled = false
    end
end

local userInputService = game:GetService("UserInputService")
userInputService.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.N then
        toggleNightVision(game.Players.LocalPlayer, true)
    end
end)

userInputService.InputEnded:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.N then
        toggleNightVision(game.Players.LocalPlayer, false)
    end
end)
```

#### Race Ability
```lua
local function raceAbility(player)
    local character = player.Character
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        local originalWalkSpeed = humanoid.WalkSpeed
        local originalJumpPower = humanoid.JumpPower

        humanoid.WalkSpeed = originalWalkSpeed * 2
        humanoid.JumpPower = originalJumpPower * 1.5
        
        local speedEffect = Instance.new("ParticleEmitter")
        speedEffect.Parent = character.HumanoidRootPart
        speedEffect.Texture = "rbxassetid://exampleTextureID"
        speedEffect.Rate = 100

        local speedSound = Instance.new("Sound")
        speedSound.Parent = character.HumanoidRootPart
        speedSound.SoundId = "rbxassetid://exampleSoundID"
        speedSound:Play()

        wait(5)

        humanoid.WalkSpeed = originalWalkSpeed
        humanoid.JumpPower = originalJumpPower

        speedEffect:Destroy()
        speedSound:Destroy()
    end
end

local userInputService = game:GetService("UserInputService")
userInputService.InputBegan:Connect(function(input, gameProcessed)
    if input.KeyCode == Enum.KeyCode.R and not gameProcessed then
        raceAbility(game.Players.LocalPlayer)
    end
end)
```

## Design Patterns Used
### Strategy Pattern
- **Purpose:** Define a family of algorithms (abilities) and make them interchangeable.
- **Implementation:**
    - Create an `Ability` interface with an `activate` method.
    - Implement specific abilities like `LifeDrainAbility`, `NightVisionAbility`, etc.

#### Ability Interface
```lua
Ability = {}
Ability.__index = Ability

function Ability:new(name)
    local instance = setmetatable({}, self)
    instance.name = name
    return instance
end

function Ability:activate(player)
    error("This method should be overridden")
end
```

#### Specific Abilities
```lua
LifeDrainAbility = setmetatable({}, {__index = Ability})

function LifeDrainAbility:new()
    return Ability.new(self, "Life Drain")
end

function LifeDrainAbility:activate(player)
    print(player.Name .. " used Life Drain!")
end

NightVisionAbility = setmetatable({}, {__index = Ability})

function NightVisionAbility:new()
    return Ability.new(self, "Night Vision")
end

function NightVisionAbility:activate(player)
    print(player.Name .. " activated Night Vision!")
end
```

### Factory Pattern
- **Purpose:** Centralize the creation logic for different races.
- **Implementation:**
    - Create a `RaceFactory` to handle the instantiation of different races.

#### Race Base Class
```lua
Race = {}
Race.__index = Race

function Race:new(name)
    local instance = setmetatable({}, self)
    instance.name = name
    instance.abilities = {}
    return instance
end

function Race:addAbility(ability)
    table.insert(self.abilities, ability)
end

function Race:useAbility(index, player)
    if self.abilities[index] then
        self.abilities[index]:activate(player)
    else
        print("No such ability!")
    end
end
```

#### Specific Races
```lua
Vampire = setmetatable({}, {__index = Race})

function Vampire:new()
    local instance = Race.new(self, "Vampire")
    instance:addAbility(LifeDrainAbility:new())
    instance:addAbility(NightVisionAbility:new())
    return instance
end
```

#### Race Factory
```lua
RaceFactory = {}

function RaceFactory:createRace(raceType)
    if raceType == "Vampire" then
        return Vampire:new()
    else
        error("Unknown race type")
    end
end
```

#### Using the Patterns Together
```lua
local raceFactory = RaceFactory
local player = {Name = "Player1"}

local vampire = raceFactory:createRace("Vampire")
vampire:useAbility(1, player)  -- Player1 used Life Drain!
vampire:useAbility(2, player)  -- Player1 activated Night Vision!
```

## Conclusion
Combining the **Strategy Pattern** for abilities with the **Factory Pattern** for creating races provides a flexible and modular architecture for your game. This design allows you to easily add new races and abilities, manage existing ones, and maintain clean and maintainable code.

By implementing these patterns, you can ensure that your soul steal game is scalable, easy to extend, and offers a rich and varied gameplay experience for players.
