-- Create a ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "ExampleScreenGui"
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Create a Frame
local frame = Instance.new("Frame")
frame.Name = "MainFrame"
frame.Size = UDim2.new(0.5, 0, 0.5, 0)
frame.Position = UDim2.new(0.25, 0, 0.25, 0)
frame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
frame.Parent = screenGui

-- Create a TextLabel
local textLabel = Instance.new("TextLabel")
textLabel.Name = "ExampleTextLabel"
textLabel.Size = UDim2.new(1, 0, 0.1, 0)
textLabel.Position = UDim2.new(0, 0, 0, 0)
textLabel.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
textLabel.Text = "Example TextLabel"
textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
textLabel.Parent = frame

-- Create a TextButton
local textButton = Instance.new("TextButton")
textButton.Name = "ExampleTextButton"
textButton.Size = UDim2.new(1, 0, 0.1, 0)
textButton.Position = UDim2.new(0, 0, 0.1, 0)
textButton.BackgroundColor3 = Color3.fromRGB(100, 100, 255)
textButton.Text = "Click Me"
textButton.TextColor3 = Color3.fromRGB(255, 255, 255)
textButton.Parent = frame

-- Create an ImageLabel
local imageLabel = Instance.new("ImageLabel")
imageLabel.Name = "ExampleImageLabel"
imageLabel.Size = UDim2.new(0.2, 0, 0.2, 0)
imageLabel.Position = UDim2.new(0, 0, 0.2, 0)
imageLabel.Image = "rbxassetid://12345678" -- Replace with your image asset ID
imageLabel.Parent = frame

-- Create an ImageButton
local imageButton = Instance.new("ImageButton")
imageButton.Name = "ExampleImageButton"
imageButton.Size = UDim2.new(0.2, 0, 0.2, 0)
imageButton.Position = UDim2.new(0.2, 0, 0.2, 0)
imageButton.Image = "rbxassetid://87654321" -- Replace with your image asset ID
imageButton.Parent = frame

-- Create a ScrollingFrame
local scrollingFrame = Instance.new("ScrollingFrame")
scrollingFrame.Name = "ExampleScrollingFrame"
scrollingFrame.Size = UDim2.new(1, 0, 0.3, 0)
scrollingFrame.Position = UDim2.new(0, 0, 0.4, 0)
scrollingFrame.CanvasSize = UDim2.new(2, 0, 0, 0)
scrollingFrame.BackgroundColor3 = Color3.fromRGB(150, 150, 150)
scrollingFrame.Parent = frame

-- Create a TextBox
local textBox = Instance.new("TextBox")
textBox.Name = "ExampleTextBox"
textBox.Size = UDim2.new(1, 0, 0.1, 0)
textBox.Position = UDim2.new(0, 0, 0.7, 0)
textBox.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
textBox.Text = "Type here"
textBox.TextColor3 = Color3.fromRGB(0, 0, 0)
textBox.Parent = frame

-- Create a ViewportFrame
local viewportFrame = Instance.new("ViewportFrame")
viewportFrame.Name = "ExampleViewportFrame"
viewportFrame.Size = UDim2.new(0.2, 0, 0.2, 0)
viewportFrame.Position = UDim2.new(0.4, 0, 0.2, 0)
viewportFrame.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
viewportFrame.Parent = frame

-- Create a UIListLayout
local uiListLayout = Instance.new("UIListLayout")
uiListLayout.Name = "ExampleUIListLayout"
uiListLayout.FillDirection = Enum.FillDirection.Horizontal
uiListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
uiListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
uiListLayout.Parent = frame

-- Populate ViewportFrame with a part
local part = Instance.new("Part")
part.Size = Vector3.new(4, 4, 4)
part.Position = Vector3.new(0, 0, 0)
part.Anchored = true

local camera = Instance.new("Camera")
camera.CFrame = CFrame.new(Vector3.new(10, 10, 10), part.Position)
viewportFrame.CurrentCamera = camera
camera.Parent = viewportFrame

part.Parent = viewportFrame
