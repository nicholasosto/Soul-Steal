-- File: ServerScriptService > NightVisionServerScript

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Lighting = game:GetService("Lighting")

local nightVisionToggle = ReplicatedStorage:WaitForChild("NightVisionToggle")

-- Default lighting settings
local originalBrightness = Lighting.Brightness
local originalAmbient = Lighting.Ambient

-- Night vision lighting settings
local nightVisionBrightness = 2
local nightVisionAmbient = Color3.new(0, 1, 0) -- Green tint for night vision

-- Function to apply night vision
local function applyNightVision(player, enabled)
    if enabled then
        Lighting.Brightness = nightVisionBrightness
        Lighting.Ambient = nightVisionAmbient
    else
        Lighting.Brightness = originalBrightness
        Lighting.Ambient = originalAmbient
    end
end

-- Listen for night vision toggle requests
nightVisionToggle.OnServerEvent:Connect(applyNightVision)