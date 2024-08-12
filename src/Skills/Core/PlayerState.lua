local PlayerState = {}


-- Initialize player state using attributes
function PlayerState.InitializePlayer(player)
    player:SetAttribute("Cooldowns", {})
    player:SetAttribute("Buffs", {})
end

-- Update cooldowns by decreasing them based on deltaTime
function PlayerState.UpdateCooldowns(player, deltaTime)
    local cooldowns = player:GetAttribute("Cooldowns")
    if cooldowns then
        for abilityName, cooldown in pairs(cooldowns) do
            cooldowns[abilityName] = math.max(0, cooldown - deltaTime)
        end
        player:SetAttribute("Cooldowns", cooldowns)
    end
end

-- Apply a buff using attributes
function PlayerState.ApplyBuff(player, buff)
    local buffs = player:GetAttribute("Buffs")
    if buffs then
        buffs[buff.name] = buff
        player:SetAttribute("Buffs", buffs)
    end
end

-- Remove a buff
function PlayerState.RemoveBuff(player, buffName)
    local buffs = player:GetAttribute("Buffs")
    if buffs then
        buffs[buffName] = nil
        player:SetAttribute("Buffs", buffs)
    end
end

-- Set cooldown using attributes
function PlayerState.SetCooldown(player, abilityName, cooldown)
    local cooldowns = player:GetAttribute("Cooldowns")
    if cooldowns then
        cooldowns[abilityName] = cooldown
        player:SetAttribute("Cooldowns", cooldowns)
    end
end

-- Get cooldown
function PlayerState.GetCooldown(player, abilityName)
    local cooldowns = player:GetAttribute("Cooldowns")
    return cooldowns and cooldowns[abilityName] or 0
end

-- Get buff
function PlayerState.GetBuff(player, buffName)
    local buffs = player:GetAttribute("Buffs")
    return buffs and buffs[buffName] or nil
end

-- Clear state (optional: call this when player leaves)
function PlayerState.ClearState(player)
    player:SetAttribute("Cooldowns", {})
    player:SetAttribute("Buffs", {})
end

return PlayerState
