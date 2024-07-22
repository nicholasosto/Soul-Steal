-- MagicShieldAbility.lua
local Ability = require(game.ServerScriptService.Abilities.AbilityBase)

local MagicShieldAbility = setmetatable({}, {__index = Ability})

function MagicShieldAbility:new()
	return Ability.new(self, "Magic Shield")
end

function MagicShieldAbility:activate(player)
	print(player.Name .. " used Magic Shield!")
	-- Implement the logic for magic shield here
end

return MagicShieldAbility