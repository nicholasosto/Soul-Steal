local AreaOfEffectModule = {}

local function CalculateDistance3D(pointA, pointB)
    local dx = pointA.X - pointB.X
    local dy = pointA.Y - pointB.Y
    local dz = pointA.Z - pointB.Z
    return math.sqrt(dx * dx + dy * dy + dz * dz)
end

local function GetTargetsInRadius(center, radius, targets)
    local targetsInRadius = {}
    for _, target in ipairs(targets) do
        local distance = CalculateDistance3D(center.Position, target.Position)
        if distance <= radius then
            table.insert(targetsInRadius, target)
        end
    end
    return targetsInRadius
end

function AreaOfEffectModule.ApplyAoE(center, radius, damage, targets)
    local affectedTargets = GetTargetsInRadius(center, radius, targets)
    for _, target in ipairs(affectedTargets) do
        local humanoid = target:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid:TakeDamage(damage)
            print("AoE dealt", damage, "damage to", target.Name)
        end
    end
end

return AreaOfEffectModule
