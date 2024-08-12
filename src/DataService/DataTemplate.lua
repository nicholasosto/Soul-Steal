local DataTemplate = {}
--[[
	File: DataTemplate.lua
	Location: ServerScripts
	Last Update: 03-2024
	Author: @TrembusTech
]]--

DataTemplate.DatabaseName = "Soul_Warrior"


DataTemplate.PlayerData = {

	Attributes = {
		-- Level Stuff
		Level = 1,
		ExperiencePoints = 0,
		AttributePoints = 10,
		SpentAttributePoints = 0,
		
		-- Currency
		Zeni = 14000,
		Crystals = 5,
		
		-- Combat Stats
		Attunement = 10,
		Constitution = 10,
		Dexterity = 10,
		Intelligence = 10,
		Strength = 10
	},
	Character = {
		Race = "Feralean",
		BodyColor = "#ffeb15",
		SpiritColor = "#ff0000"
	},

	Inventory = { -- Skills, Forms, and equipment the player has unlocked

		Skills = {
			"Melee",
			"KiBlast",
			"Kamehameha",
			"DestructoDisk",
			"SpiritBomb",
			"SpecialBeamCannon",
			"InstantTransmission"
		},

		Forms = {"Base", "SSJ1"},

		Equipment = {

			Special = {"Monkey","Dragon"},
			Hair = {"Hair_Messy", "Hair_GK_01"},
			Head = {"Earings", "Knight_Helmet"},
			Chest = {"Shirt","Shirt_G1","Shirt_G2"},
			Legs = {"Pants","Pants_V1"}
		},
	},

	Equipped = {  -- Valid values come from Inventory

		Skills = {  -- Used to determin which skill name to activate(value) and in which slot (name) Skills {SlotNumber = SkillName}

			SS01 = "Melee",
			SS02 = "KiBlast",
			SS03 = "Kamehameha",
			SS04 = "DestructoDisk",
			SS05 = "SpiritBomb",
			SS06 = "SpecialBeamCannon",
			SS07 = "None"
		},

		Form = "Base", -- Currently selected transformation Name

		Equipment = { -- Currently equipped items

			Special = "Monkey",
			Hair = "Hair_Messy",
			Head = "Earings",
			Chest = "Shirt",
			Legs = "Pants",
			Back = "Rocket_Pack"
		}
	},
	Preferences = { -- game prefereneces

		PVP = false,
		BG_Music_On = true
	}
}


return DataTemplate
