-- RaceFactory.lua
local Vampire = require(game.ServerScriptService.Races.Vampire)
local Lich = require(game.ServerScriptService.Races.Lich)

local RaceFactory = {}

function RaceFactory:createRace(raceType)
	if raceType == "Vampire" then
		return Vampire:new()
	elseif raceType == "Lich" then
		return Lich:new()
	else
		error("Unknown race type")
	end
end

return RaceFactory