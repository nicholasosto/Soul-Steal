-- Main UI container
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "MainUI"
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Background Frame
local background = Instance.new("ImageLabel")
background.Size = UDim2.new(1, 0, 1, 0)
background.Position = UDim2.new(0, 0, 0, 0)
background.Image = "rbxassetid://12345678"  -- Replace with your asset ID
background.Parent = screenGui

-- Main Menu Frame
local mainMenuFrame = Instance.new("Frame")
mainMenuFrame.Size = UDim2.new(0.5, 0, 0.5, 0)
mainMenuFrame.Position = UDim2.new(0.25, 0, 0.25, 0)
mainMenuFrame.BackgroundColor3 = Color3.new(0, 0, 0)
mainMenuFrame.BackgroundTransparency = 0.5
mainMenuFrame.Parent = screenGui

-- Title Label
local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, 0, 0.2, 0)
titleLabel.Position = UDim2.new(0, 0, 0, 0)
titleLabel.Text = "Soul Steal"
titleLabel.TextColor3 = Color3.new(1, 1, 1)
titleLabel.TextScaled = true
titleLabel.BackgroundTransparency = 1
titleLabel.Parent = mainMenuFrame

-- Play Button
local playButton = Instance.new("TextButton")
playButton.Size = UDim2.new(0.8, 0, 0.2, 0)
playButton.Position = UDim2.new(0.1, 0, 0.4, 0)
playButton.Text = "Play"
playButton.TextColor3 = Color3.new(1, 1, 1)
playButton.TextScaled = true
playButton.BackgroundColor3 = Color3.new(0, 0.5, 0)
playButton.Parent = mainMenuFrame

-- Exit Button
local exitButton = Instance.new("TextButton")
exitButton.Size = UDim2.new(0.8, 0, 0.2, 0)
exitButton.Position = UDim2.new(0.1, 0, 0.7, 0)
exitButton.Text = "Exit"
exitButton.TextColor3 = Color3.new(1, 1, 1)
exitButton.TextScaled = true
exitButton.BackgroundColor3 = Color3.new(0.5, 0, 0)
exitButton.Parent = mainMenuFrame

-- Play Button Functionality
playButton.MouseButton1Click:Connect(function()
    print("Play button clicked!")
    -- Add your play game functionality here
end)

-- Exit Button Functionality
exitButton.MouseButton1Click:Connect(function()
    print("Exit button clicked!")
    -- Add your exit game functionality here
end)