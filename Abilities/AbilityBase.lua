-- AbilityBase.lua
local Ability = {}
Ability.__index = Ability

function Ability:new(name)
	local instance = setmetatable({}, self)
	instance.name = name
	return instance
end

function Ability:activate(player)
	error("This method should be overridden")
end

return Ability