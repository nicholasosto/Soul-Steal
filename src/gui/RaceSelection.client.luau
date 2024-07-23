-- Main UI container
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "RaceSelectionUI"
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Main Frame
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0.6, 0, 0.6, 0)
mainFrame.Position = UDim2.new(0.2, 0, 0.2, 0)
mainFrame.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
mainFrame.BackgroundTransparency = 0.3
mainFrame.Parent = screenGui

-- Title Label
local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, 0, 0.2, 0)
titleLabel.Position = UDim2.new(0, 0, 0, 0)
titleLabel.Text = "Select Your Race"
titleLabel.TextColor3 = Color3.new(1, 1, 1)
titleLabel.TextScaled = true
titleLabel.BackgroundTransparency = 1
titleLabel.Parent = mainFrame

-- Human Race Button
local humanButton = Instance.new("TextButton")
humanButton.Size = UDim2.new(0.3, 0, 0.2, 0)
humanButton.Position = UDim2.new(0.1, 0, 0.3, 0)
humanButton.Text = "Human"
humanButton.TextColor3 = Color3.new(1, 1, 1)
humanButton.TextScaled = true
humanButton.BackgroundColor3 = Color3.new(0, 0.5, 0.5)
humanButton.Parent = mainFrame

-- Human Image
local humanImage = Instance.new("ImageLabel")
humanImage.Size = UDim2.new(0.3, 0, 0.4, 0)
humanImage.Position = UDim2.new(0.1, 0, 0.5, 0)
humanImage.Image = "rbxassetid://12345679"  -- Replace with your asset ID
humanImage.BackgroundTransparency = 1
humanImage.Parent = mainFrame

-- Elf Race Button
local elfButton = Instance.new("TextButton")
elfButton.Size = UDim2.new(0.3, 0, 0.2, 0)
elfButton.Position = UDim2.new(0.6, 0, 0.3, 0)
elfButton.Text = "Elf"
elfButton.TextColor3 = Color3.new(1, 1, 1)
elfButton.TextScaled = true
elfButton.BackgroundColor3 = Color3.new(0.5, 0, 0.5)
elfButton.Parent = mainFrame

-- Elf Image
local elfImage = Instance.new("ImageLabel")
elfImage.Size = UDim2.new(0.3, 0, 0.4, 0)
elfImage.Position = UDim2.new(0.6, 0, 0.5, 0)
elfImage.Image = "rbxassetid://12345680"  -- Replace with your asset ID
elfImage.BackgroundTransparency = 1
elfImage.Parent = mainFrame

-- Orc Race Button
local orcButton = Instance.new("TextButton")
orcButton.Size = UDim2.new(0.3, 0, 0.2, 0)
orcButton.Position = UDim2.new(0.35, 0, 0.3, 0)
orcButton.Text = "Orc"
orcButton.TextColor3 = Color3.new(1, 1, 1)
orcButton.TextScaled = true
orcButton.BackgroundColor3 = Color3.new(0.5, 0.5, 0)
orcButton.Parent = mainFrame

-- Orc Image
local orcImage = Instance.new("ImageLabel")
orcImage.Size = UDim2.new(0.3, 0, 0.4, 0)
orcImage.Position = UDim2.new(0.35, 0, 0.5, 0)
orcImage.Image = "rbxassetid://12345681"  -- Replace with your asset ID
orcImage.BackgroundTransparency = 1
orcImage.Parent = mainFrame

-- Button Functionality
local function onRaceSelected(race)
    print(race .. " race selected!")
	-- Add your race selection functionality here
	game.ReplicatedStorage.RemoteEvents.RaceSelected:FireServer(race)
    mainFrame.Visible = false
end

humanButton.MouseButton1Click:Connect(function()
    onRaceSelected("Human")
end)

elfButton.MouseButton1Click:Connect(function()
    onRaceSelected("Elf")
end)

orcButton.MouseButton1Click:Connect(function()
    onRaceSelected("Orc")
end)