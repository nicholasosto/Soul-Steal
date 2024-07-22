-- Vampire.lua
local Race = require(game.ServerScriptService.Races.RaceBase)
local LifeDrainAbility = require(game.ServerScriptService.Abilities.LifeDrainAbility)
local NightVisionAbility = require(game.ServerScriptService.Abilities.NightVisionAbility)

local Vampire = setmetatable({}, {__index = Race})

function Vampire:new()
	local instance = Race.new(self, "Vampire")
	instance:addAbility(LifeDrainAbility:new())
	instance:addAbility(NightVisionAbility:new())
	return instance
end

return Vampire