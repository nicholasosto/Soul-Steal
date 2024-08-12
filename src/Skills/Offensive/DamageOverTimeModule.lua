local RunService = game:GetService("RunService")

local DamageOverTimeModule = {}

local activeDoTs = {}

function DamageOverTimeModule.ApplyDoT(target, damage, duration, interval)
    if not activeDoTs[target] then
        activeDoTs[target] = {remainingTime = duration, interval = interval, damage = damage, lastTick = 0}
        print("Applying DoT to", target.Name, "for", duration, "seconds, dealing", damage, "damage every", interval, "seconds.")
    end
end

function DamageOverTimeModule.RemoveDoT(target)
    if activeDoTs[target] then
        activeDoTs[target] = nil
        print("Removed DoT from", target.Name)
    end
end

function DamageOverTimeModule.Update(deltaTime)
    for target, dot in pairs(activeDoTs) do
        dot.remainingTime = dot.remainingTime - deltaTime
        dot.lastTick = dot.lastTick + deltaTime
        
        if dot.lastTick >= dot.interval then
            local humanoid = target:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid:TakeDamage(dot.damage)
                print("Dealing", dot.damage, "damage to", target.Name)
            end
            dot.lastTick = 0
        end

        if dot.remainingTime <= 0 then
            DamageOverTimeModule.RemoveDoT(target)
        end
    end
end

RunService.Stepped:Connect(function(_, deltaTime)
    DamageOverTimeModule.Update(deltaTime)
end)

return DamageOverTimeModule
