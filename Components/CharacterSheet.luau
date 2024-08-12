--[[
	File: CharacterSheet.lua
	Location: StarterGui
	Last Update: 03-2024
	Author: @TrembusTech
]]--

if script:FindFirstAncestor("StarterGui") then warn("XXXXXXXXXXXXXXXXXXXXXXXXXX") return end

-- Game Services
local Players = game:GetService("Players")

-- Local Player
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

-- Sub Modules
local Attributes = require(script.AttributesGUI)
local ViewPortManager = require(script.ViewportManager)


-- Gui References
local characterSheetGui = script.Parent
local backgroundFrame = characterSheetGui:WaitForChild("BackgroundFrame")
local sheetButtonsFrame = backgroundFrame:FindFirstChild("SheetButtons")


-- Sub Frames
local AttribtueFrame: Frame = backgroundFrame:WaitForChild("Attributes_Frame")
local EquipmentFrame = backgroundFrame:WaitForChild("Equipment_Frame")
local FormsFrame = backgroundFrame:WaitForChild("Forms_Frame")
local SkillsFrame = backgroundFrame:WaitForChild("Skills_Frame")

-- UI Data Labels
local lbl_PlayerName: TextLabel = AttribtueFrame:FindFirstChild("PlayerName",true)
local lbl_GodPower: TextLabel = AttribtueFrame:FindFirstChild("GodPower",true)

local lbl_APValue: TextLabel = AttribtueFrame:FindFirstChild("APValue",true)

local lbl_Energy: TextLabel = AttribtueFrame:FindFirstChild("APValue",true)
local lbl_Health: TextLabel = AttribtueFrame:FindFirstChild("Energy",true)
local lbl_Stamina: TextLabel = AttribtueFrame:FindFirstChild("APValue",true)
local lbl_Experience: TextLabel = AttribtueFrame:FindFirstChild("ExperienceProgress",true)

local lbl_SelectedPanel: TextLabel = backgroundFrame.SelectedPanelLabel

-- Configurations
local AttributesConfiguration = player:WaitForChild("Attributes")

ViewPortManager:Start(character, backgroundFrame:WaitForChild("PreviewFrame"):WaitForChild("ViewportFrame"))

local coreStatCfgs = {}

-- Events
local Event = game.ReplicatedStorage.Event_Pack

-- Sheet Buttons
sheetButtonsFrame.Equipment.Activated:Connect(function(inputObject: InputObject, clickCount: number) 
	lbl_SelectedPanel.Text = "Equipment"
	EquipmentFrame.Visible = not EquipmentFrame.Visible
	
	if not EquipmentFrame.Visible then return end
	FormsFrame.Visible = false
	SkillsFrame.Visible = false
	
end)
sheetButtonsFrame.Forms.Activated:Connect(function(inputObject: InputObject, clickCount: number)
	lbl_SelectedPanel.Text = "Forms"
	FormsFrame.Visible = not FormsFrame.Visible
	if not FormsFrame.Visible then return end
	EquipmentFrame.Visible = false
	SkillsFrame.Visible = false
end)
sheetButtonsFrame.Skills.Activated:Connect(function(inputObject: InputObject, clickCount: number) 
	lbl_SelectedPanel.Text = "Skills"
	SkillsFrame.Visible = not SkillsFrame.Visible
	if not SkillsFrame.Visible then return end
	FormsFrame.Visible = false
	EquipmentFrame.Visible = false
end)

-- Close Button
sheetButtonsFrame.Close.Activated:Connect(function(inputObject: InputObject, clickCount: number) 
	
	characterSheetGui.Enabled = false	
end)

-- Level Label
AttributesConfiguration.Level:GetPropertyChangedSignal("Value"):Connect(function()
	
	AttribtueFrame.Level.Text = "Level "..AttributesConfiguration.Level.Value
end)



Attributes:CreateAttributeFrames(player, AttribtueFrame:WaitForChild("CoreAttributes"))

