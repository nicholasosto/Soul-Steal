-- Lich.lua
local Race = require(game.ServerScriptService.Races.RaceBase)
local NecromancyAbility = require(game.ServerScriptService.Abilities.NecromancyAbility)
local MagicShieldAbility = require(game.ServerScriptService.Abilities.MagicShieldAbility)

local Lich = setmetatable({}, {__index = Race})

function Lich:new()
	local instance = Race.new(self, "Lich")
	instance:addAbility(NecromancyAbility:new())
	instance:addAbility(MagicShieldAbility:new())
	return instance
end

return Lich