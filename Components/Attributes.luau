--[[
	File: AttributesGUI.lua
	Location: PlayerGui
	Last Update: 03-2024
	Author: @TrembusTech
	Overview: This script is responsible for managing player attributes in Roblox games, leveraging the Suphi Datastore for efficient data handling and synchronization
]]--

--local AttributeTemplates = game.ReplicatedStorage.UITemplate_Pack.Attribute_Templates
local GameKeys = require(game.ReplicatedStorage.Shared.GameKeys)
local Events = game.ReplicatedStorage.Event_Pack

local AttributesGUI = {}

local player = game.Players.LocalPlayer
local PlayerPowerLevel = 14
local frameTemplate: Frame = script:WaitForChild("AttributeFrame")

-- Gui References
local characterSheetGui = script.Parent.Parent
local AttributesFrame = script.Parent.Parent.BackgroundFrame.Attributes_Frame

-- Configurations
local AttributesConfiguration: Configuration = player:WaitForChild("Attributes")
local ResourcesConfiguration:Configuration = player:WaitForChild("Resources")
local ProgressConfiguration:Configuration = player:WaitForChild("Resources")

local godPowerNV: NumberValue = player:WaitForChild("GodPower")

-- Keys
AttributesGUI.CoreAttributeKeys = GameKeys.CoreAttributeKeys
AttributesGUI.Resources = GameKeys.ResourceKeys

-- [ Get Power Level ]
function AttributesGUI:GetPowerLevel(player: Player)
	
	PlayerPowerLevel = 14
	
	for _, key in AttributesGUI.CoreAttributeKeys do
		local multiple = 1
		
		local attributeVO:NumberValue = AttributesConfiguration:FindFirstChild(key)
		
		if key == "Attunement" then multiple = 4 continue end
			
		PlayerPowerLevel += attributeVO.Value * multiple
	end
		
	return PlayerPowerLevel
end

-- [ Create Attribute Frames]
function AttributesGUI:CreateAttributeFrames(player: Player, parentFrame:Frame)
	
	-- Loop through Core Attributes
	for _, key in AttributesGUI.CoreAttributeKeys do
		
		-- UI Number Value Object
		local attributeVO:NumberValue = AttributesConfiguration:FindFirstChild(key)
		
		-- UI Frame
		local attributeFrame:Frame = frameTemplate:Clone()
		attributeFrame.Parent = parentFrame
		attributeFrame.Name = key.."_Frame"
		
		-- UI Buttons
		local increaseButton: TextButton = attributeFrame.Increase
		local decreaseButton: TextButton = attributeFrame.Decrease
		local attributeLabel: TextLabel = attributeFrame.Label
		local attributeAmount: TextLabel = attributeFrame.Amount
		
		-- Set Label Texts
		attributeAmount.Text = attributeVO.Value
		attributeLabel.Text = key
		
		-- [[ Attribute Value text change listener]]
		attributeVO:GetPropertyChangedSignal("Value"):Connect(function(...: any) 
			attributeAmount.Text = tostring(attributeVO.Value)
		end)
		
		-- Increase Button
		increaseButton.Activated:Connect(function(inputObject: InputObject, clickCount: number) 
	
			Events.Attributes.IncreaseAttribute:FireServer(key)
		end)
		
		-- Decrease Button
		decreaseButton.Activated:Connect(function(inputObject: InputObject, clickCount: number) 
				
			Events.Attributes.DecreaseAttribute:FireServer(key)
		end)		
	end
	
end

for _, resourceCfg in ResourcesConfiguration:GetChildren() do
	
	local attribtueLabel = AttributesFrame:FindFirstChild(resourceCfg.Name)

	if not attribtueLabel then continue end
	
	local MaxNV:NumberValue = resourceCfg.Max
	
	local text = "<b>["..resourceCfg.Name.."] Max:</b> "..tostring(MaxNV.Value)
	
	MaxNV:GetPropertyChangedSignal("Value"):Connect(function() 
		text = "<b>["..resourceCfg.Name.."] Max:</b> "..tostring(MaxNV.Value)
		attribtueLabel.Text = text
	end)

	attribtueLabel.Text = text
	
	AttributesFrame.PlayerName.Text = player.Name
end

AttributesConfiguration.AttributePoints:GetPropertyChangedSignal("Value"):Connect(function()
	
	print(script.Parent.Parent.Parent.Parent)
	AttributesFrame.APValue.Text = tostring(AttributesConfiguration.AttributePoints.Value)
	
end)

godPowerNV:GetPropertyChangedSignal("Value"):Connect(function()
	AttributesFrame.GodPower.Text = " God Power: ".. player.GodPower.Value

end)

return AttributesGUI
