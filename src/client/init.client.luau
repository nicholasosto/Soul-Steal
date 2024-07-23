local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RemoteEvents = ReplicatedStorage:WaitForChild("RemoteEvents")
local StarterGui = game:GetService("StarterGui")

local HealthBar = require(game.StarterGui:WaitForChild("Components"):WaitForChild("HealthBar"))

local function initializeGUI()
    -- Set up health bar and other UI elements
    local healthBar = HealthBar.new()
    healthBar.Parent = StarterGui
end

local function onCharacterAdded(character)
    -- Initialize character abilities and UI elements
    initializeGUI()
    character.Humanoid.HealthChanged:Connect(function(health)
        HealthBar.update(health, character.Humanoid.MaxHealth)
    end)
end

local function onPlayerAdded(player)
    player.CharacterAdded:Connect(onCharacterAdded)
    -- Load additional player-specific settings if needed
end

game.Players.PlayerAdded:Connect(onPlayerAdded)

local function onLifeDrain()
    -- Implement client-side logic for LifeDrain
end

RemoteEvents.LifeDrain.OnClientEvent:Connect(onLifeDrain)
