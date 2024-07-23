-- Lich.lua
local RaceBase = require(game.ServerScriptService.Races.RaceBase)
local NecromancyAbility = require(game.ServerScriptService.Abilities.NecromancyAbility)
local MagicShieldAbility = require(game.ServerScriptService.Abilities.MagicShieldAbility)

local Lich = setmetatable({}, {__index = RaceBase})

function Lich:new()
    local instance = RaceBase.new(self, "Lich")
    return instance
end

function Lich:init()
    self:addAbility(NecromancyAbility:new())
    self:addAbility(MagicShieldAbility:new())
end

return Lich