local AttackModule = {}

-- Direct attack, applying damage to a target's Humanoid
function AttackModule.Attack(target, damage)
    local humanoid = target:FindFirstChildOfClass("Humanoid")
    if humanoid then
        humanoid:TakeDamage(damage)
        print("Attack dealt", damage, "damage to", target.Name, ". Remaining health:", humanoid.Health)
    end
end

-- Apply a critical hit by increasing damage
function AttackModule.CriticalHit(target, damage)
    local critMultiplier = 1.5 -- Example multiplier for critical hits
    local critDamage = damage * critMultiplier
    AttackModule.Attack(target, critDamage)
    print("Critical hit! Dealt", critDamage, "damage to", target.Name)
end

return AttackModule
