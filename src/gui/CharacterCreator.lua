local Players = game:GetService("Players")
local CS = game:GetService("CollectionService")
local RS = game:GetService("ReplicatedStorage")

local CharacterCreation = {}

-- Selections
CharacterCreation.SelectionConfig = Players.LocalPlayer:WaitForChild("CharacterConfig")

function CharacterCreation:Load()

	local player = Players.LocalPlayer

	local CharacterCreationGUI = script.Parent


	-- Save - Character
	CharacterCreationGUI.Save.Activated:Connect(function()

		print("Save character!")
		
		for _, child in player.CharacterConfig:GetChildren() do
			print(child.Name, child.Value)
		end
		
		local race  = player.CharacterConfig.Race.Value or "Fishy"
		local bodycolor = player.CharacterConfig.BodyColor.Value or "000000"
		local spiritColor = player.CharacterConfig.SpiritColor.Value or "000000"
			
		RS.Event_Pack.LoadCreatedCharacter:FireServer(race, bodycolor, spiritColor)
		
		CharacterCreationGUI.Enabled = false
	end)

end





return CharacterCreation
