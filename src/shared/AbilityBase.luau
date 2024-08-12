local AbilityBase = {}
AbilityBase.__index = AbilityBase

function AbilityBase.new()
    local self = setmetatable({}, AbilityBase)
    self.cooldown = 0
    return self
end

function AbilityBase:activate()
    print("Activating ability")
    return true
end

function AbilityBase:deactivate()
    -- Implement deactivation logic
end

return AbilityBase
