-- Vampire.lua
local RaceBase = require(game.ServerScriptService.Races.RaceBase)
local LifeDrainAbility = require(game.ServerScriptService.Abilities.LifeDrainAbility)
local NightVisionAbility = require(game.ServerScriptService.Abilities.NightVisionAbility)

local Vampire = setmetatable({}, {__index = RaceBase})

function Vampire:new()
    local instance = RaceBase.new(self, "Vampire")
	local lifeDrainAbility = LifeDrainAbility:new()
	local nightVisionAbility = NightVisionAbility:new()
	instance.abilities = {nightVisionAbility, lifeDrainAbility}
    return instance
end

return Vampire