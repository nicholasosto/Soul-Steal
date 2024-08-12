--[[
	File: GameKeys.lua
	Location: Replicated Storage
	Last Update: 03-2024
	Author: @TrembusTech
]]--


local GameKeys = {}

GameKeys.AttributeKeys = {

	-- Level Stuff
	"Level",
	"ExperiencePoints",
	"AttributePoints",
	"SpentAttributePoints",

	-- Currency
	"Zeni",
	"Crystals",

	-- Combat Stuff
	"Attunement",
	"Constitution",
	"Dexterity",
	"Intelligence",
	"Strength",
}

GameKeys.CoreAttributeKeys = {
	-- Combat Stuff
	"Attunement",
	"Constitution",
	"Dexterity",
	"Intelligence",
	"Strength",
}

GameKeys.SkillKeys = {
	"SS01",
	"SS02",
	"SS03",
	"SS04",
	"SS05",
	"SS06",
	"SS07",
}

GameKeys.ResourceKeys = {
	"Health",
	"Energy",
	"Stamina",
	"Experience"
}

GameKeys.CurrencyKeys = {
	-- Combat Stuff
	"Zeni",
	"Crystals",
}

GameKeys.ProgressKeys = {
	-- Combat Stuff
	"Level",
	"ExperiencePoints",
	"AttributePoints",
	"SpentAttributePoints"
}


GameKeys.Constants = {
	XP_Constant = 100,
	XP_Scale = 1.4
}

return GameKeys
