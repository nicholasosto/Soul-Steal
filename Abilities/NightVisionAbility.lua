-- NightVisionAbility.lua
local Ability = require(game.ServerScriptService.Abilities.AbilityBase)

local NightVisionAbility = setmetatable({}, {__index = Ability})

function NightVisionAbility:new()
	return Ability.new(self, "Night Vision")
end

function NightVisionAbility:activate(player)
	print(player.Name .. " activated Night Vision!")
	-- Implement the logic for night vision here
end

return NightVisionAbility