-- RaceBase.lua
local RaceBase = {}
RaceBase.__index = RaceBase

function RaceBase:new(name)
    local instance = setmetatable({}, self)
    instance.name = name
    instance.abilities = {}
    return instance
end

function RaceBase:init()
    -- This method can be overridden by specific race modules
end

function RaceBase:addAbility(ability)
    table.insert(self.abilities, ability)
end

function RaceBase:useAbility(index, player)
    if self.abilities[index] then
        self.abilities[index]:activate(player)
    else
        print("No such ability!")
    end
end


return RaceBase