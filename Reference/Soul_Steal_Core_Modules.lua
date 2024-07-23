
-- HealthSystem.lua
local HealthSystem = {}

function HealthSystem.reduceHealth(target, amount)
    if target.Health > amount then
        target.Health = target.Health - amount
    else
        target.Health = 0
    end
end

function HealthSystem.increaseHealth(target, amount, maxHealth)
    target.Health = math.min(maxHealth, target.Health + amount)
end

return HealthSystem

-- AbilityBase.lua
local AbilityBase = {}
AbilityBase.__index = AbilityBase

function AbilityBase.new()
    local self = setmetatable({}, AbilityBase)
    self.cooldown = 0
    return self
end

function AbilityBase:activate()
    -- Implement activation logic
end

function AbilityBase:deactivate()
    -- Implement deactivation logic
end

return AbilityBase

-- RemoteEvents.lua
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RemoteEvents = ReplicatedStorage:WaitForChild("RemoteEvents")

local LifeDrain = Instance.new("RemoteEvent")
LifeDrain.Name = "LifeDrain"
LifeDrain.Parent = RemoteEvents

-- Repeat for other remote events like MagicShield, Necromancy, etc.

-- HealthBar.lua
local HealthBar = {}

function HealthBar.update(health, maxHealth)
    local percentage = health / maxHealth
    -- Update health bar UI
end

return HealthBar

-- ClientMain.lua
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RemoteEvents = ReplicatedStorage:WaitForChild("RemoteEvents")

local function onLifeDrain()
    -- Implement client-side logic for LifeDrain
end

RemoteEvents.LifeDrain.OnClientEvent:Connect(onLifeDrain)

-- ServerMain.lua
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RemoteEvents = ReplicatedStorage:WaitForChild("RemoteEvents")

local HealthSystem = require(game.ServerScriptService:WaitForChild("HealthSystem"))

local function onLifeDrain(player, target)
    HealthSystem.reduceHealth(target, 10)
    HealthSystem.increaseHealth(player.Character, 10, player.Character.MaxHealth)
end

RemoteEvents.LifeDrain.OnServerEvent:Connect(onLifeDrain)

-- NPCBehavior.lua
local NPCBehavior = {}

function NPCBehavior.onSpawn(npc)
    -- Implement NPC spawn behavior
end

function NPCBehavior.onCombat(npc, target)
    -- Implement NPC combat behavior
end

return NPCBehavior

-- EnvironmentSetup.lua
local EnvironmentSetup = {}

function EnvironmentSetup.initialize()
    -- Set up terrain, lighting, and other environment elements
end

return EnvironmentSetup
