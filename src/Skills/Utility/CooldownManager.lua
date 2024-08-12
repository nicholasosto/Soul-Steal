local AbilityHelpers = {}

local PlayerState = require(game.ServerScriptService.Abilities.Core.PlayerState)

function AbilityHelpers.IsAbilityReady(player, abilityName)
    local cooldown = PlayerState.GetCooldown(player, abilityName)
    return cooldown <= 0
end

function AbilityHelpers.ApplyCooldown(player, abilityName, cooldown)
    PlayerState.SetCooldown(player, abilityName, cooldown)
end

function AbilityHelpers.CalculateDamage(baseDamage, modifier)
    return baseDamage * (modifier or 1)
end

return AbilityHelpers
