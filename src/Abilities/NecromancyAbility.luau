-- NecromancyAbility.lua
local Ability = require(game.ServerScriptService.Abilities.AbilityBase)

local NecromancyAbility = setmetatable({}, {__index = Ability})

function NecromancyAbility:new()
	return Ability.new(self, "Necromancy")
end

function NecromancyAbility:activate(player)
	print(player.Name .. " used Necromancy!")
	-- Implement the logic for necromancy here
end

return NecromancyAbility