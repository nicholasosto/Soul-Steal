-- LifeDrainAbility.lua
local AbilityBase = require(game.ServerScriptService.Abilities.AbilityBase)

local LifeDrainAbility = setmetatable({}, {__index = AbilityBase})

function LifeDrainAbility:new()
    return AbilityBase.new(self, "Life Drain")
end

function LifeDrainAbility:activate(player)
    print(player.Name .. " used Life Drain!")
    -- Implement Life Drain logic here
end

return LifeDrainAbility