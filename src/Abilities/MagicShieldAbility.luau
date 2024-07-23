-- File: ServerScriptService > MagicShieldServerScript

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local magicShieldToggle = ReplicatedStorage:WaitForChild("MagicShieldToggle")

local shieldDuration = 10 -- Duration of the shield in seconds

-- Function to apply magic shield
local function applyMagicShield(player)
    local character = player.Character
    if character then
        -- Create shield effect
        local shield = Instance.new("Part")
        shield.Name = "MagicShield"
        shield.Shape = Enum.PartType.Ball
        shield.Size = Vector3.new(10, 10, 10)
        shield.Transparency = 0.5
        shield.Anchored = true
        shield.CanCollide = false
        shield.BrickColor = BrickColor.new("Bright blue")
        shield.Parent = character
        shield.CFrame = character.PrimaryPart.CFrame

        -- Attach shield to player
        local weld = Instance.new("WeldConstraint")
        weld.Part0 = shield
        weld.Part1 = character.PrimaryPart
        weld.Parent = shield

        -- Increase player defense (example: increase health)
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid.MaxHealth = humanoid.MaxHealth * 2
            humanoid.Health = humanoid.MaxHealth
        end

        -- Remove shield after duration
        delay(shieldDuration, function()
            if shield then
                shield:Destroy()
            end
            if humanoid then
                humanoid.MaxHealth = humanoid.MaxHealth / 2
                humanoid.Health = humanoid.Health > humanoid.MaxHealth and humanoid.MaxHealth or humanoid.Health
            end
        end)
    end
end

-- Listen for magic shield toggle requests
magicShieldToggle.OnServerEvent:Connect(applyMagicShield)