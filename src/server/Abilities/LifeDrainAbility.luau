-- LifeDrainAbility.lua
local Ability = require(game.ServerScriptService.Abilities.AbilityBase)

local LifeDrainAbility = setmetatable({}, {__index = Ability})

function LifeDrainAbility:new()
	return Ability.new(self, "Life Drain")
end

function LifeDrainAbility:activate(player)
	print(player.Name .. " used Life Drain!")
	-- Implement the logic for life drain here
end

return LifeDrainAbilitya