local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local screenGui = Instance.new("ScreenGui")
screenGui.Parent = playerGui

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0.3, 0, 0.3, 0)
frame.Position = UDim2.new(0.35, 0, 0.35, 0)
frame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
frame.Parent = screenGui

local raceLabel = Instance.new("TextLabel")
raceLabel.Size = UDim2.new(1, 0, 0.2, 0)
raceLabel.Position = UDim2.new(0, 0, 0, 0)
raceLabel.Text = "Race: Lich" -- You can change this dynamically based on your character's race
raceLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
raceLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
raceLabel.Parent = frame

local abilities = {
    {name = "Life Drain", script = "LifeDrain"},
    {name = "Magic Shield", script = "MagicShield"},
    {name = "Necromancy", script = "Necromancy"},
    {name = "Night Vision", script = "NightVision"}
}

for i, ability in ipairs(abilities) do
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1, 0, 0.2, 0)
    button.Position = UDim2.new(0, 0, 0.2 * i, 0)
    button.Text = ability.name
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    button.Parent = frame

    button.MouseButton1Click:Connect(function()
        -- Here you can require and activate the ability script
        local abilityScript = require(game.ReplicatedStorage.RemoteEvents:WaitForChild(ability.script))
        abilityScript:Activate(player)
    end)
end
