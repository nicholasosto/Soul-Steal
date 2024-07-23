local HealthSystem = {}

function HealthSystem.reduceHealth(target, amount)
    if target.Health > amount then
        target.Health = target.Health - amount
    else
        target.Health = 0
    end
end

function HealthSystem.increaseHealth(target, amount, maxHealth)
    target.Health = math.min(maxHealth, target.Health + amount)
end

return HealthSystem
