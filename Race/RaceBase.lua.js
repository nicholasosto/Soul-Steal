-- RaceBase.lua
local Race = {}
Race.__index = Race

function Race:new(name)
	local instance = setmetatable({}, self)
	instance.name = name
	instance.abilities = {}
	return instance
end

function Race:addAbility(ability)
	table.insert(self.abilities, ability)
end

function Race:useAbility(index, player)
	if self.abilities[index] then
		self.abilities[index]:activate(player)
	else
		print("No such ability!")
	end
end

return Race