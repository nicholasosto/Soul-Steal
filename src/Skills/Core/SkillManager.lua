local SkillsManager = {}

local registeredAbilities = {}

function SkillsManager.RegisterAbility(abilityName, abilityModule)
    registeredAbilities[abilityName] = abilityModule
end

function SkillsManager.ActivateAbility(abilityName, player)
    local ability = registeredAbilities[abilityName]
    if ability then
        ability:Activate(player)
    end
end

function SkillsManager.DeactivateAbility(abilityName, player)
    local ability = registeredAbilities[abilityName]
    if ability then
        ability:Deactivate(player)
    end
end

function SkillsManager.GetAbility(abilityName)
    return registeredAbilities[abilityName]
end

return SkillsManager
