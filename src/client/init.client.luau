--[[
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RemoteEvents = ReplicatedStorage:WaitForChild("RemoteEvents")
local StarterGui = game:GetService("StarterGui")

local HealthBar = require(game.StarterGui:WaitForChild("Components"):WaitForChild("HealthBar"))

local function initializeGUI()
    -- Set up health bar and other UI elements
    local healthBar = HealthBar.new()
    healthBar.Parent = StarterGui
    print("GUI initialized!")
end

local function onCharacterAdded(character)
    -- Initialize character abilities and UI elements
    print("Character added!")
    initializeGUI()
    character.Humanoid.HealthChanged:Connect(function(health)
        HealthBar.update(health, character.Humanoid.MaxHealth)
    end)
end

local function onPlayerAdded(player)
    player.CharacterAdded:Connect(onCharacterAdded)
    print(player.Name .. " has joined the game!")
end

game.Players.PlayerAdded:Connect(onPlayerAdded)

local function onLifeDrain()
    print("Life drained!")
end

RemoteEvents.LifeDrain.OnClientEvent:Connect(onLifeDrain)
]]--