local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RemoteEvents = ReplicatedStorage:WaitForChild("RemoteEvents")

local HealthSystem = require(game.ReplicatedStorage.Shared:WaitForChild("HealthSystem"))
local EnvironmentSetup = require(game.ReplicatedStorage.Setup:WaitForChild("EnvironmentSetup"))

-- Initialize environment
EnvironmentSetup.initialize()

local function onPlayerAdded(player)
    -- Set up player character and initial health
    player.CharacterAdded:Connect(function(character)
        local humanoid = character:WaitForChild("Humanoid")
        humanoid.Health = 100
        humanoid.MaxHealth = 100
        -- Additional setup for character abilities and UI can go here
    end)
    
    -- Load player data if applicable
end

local function onPlayerRemoving(player)
    -- Save player data if applicable
end

Players.PlayerAdded:Connect(onPlayerAdded)
Players.PlayerRemoving:Connect(onPlayerRemoving)

local function onLifeDrain(player, target)
    HealthSystem.reduceHealth(target, 10)
    HealthSystem.increaseHealth(player.Character, 10, player.Character.MaxHealth)
end

RemoteEvents.LifeDrain.OnServerEvent:Connect(onLifeDrain)
