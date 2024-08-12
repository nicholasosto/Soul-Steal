local AbilityConfig = {}

local abilities = {
    Fireball = {
        damage = 50,
        cooldown = 5,
        range = 30,
        effect = "Burn",
    },
    Heal = {
        healAmount = 40,
        cooldown = 8,
        range = 20,
    },
    -- Add more abilities as needed
}

function AbilityConfig.GetAbilityConfig(abilityName)
    return abilities[abilityName]
end

return AbilityConfig
