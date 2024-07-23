-- RaceFactory.lua
print("Loading RaceFactory module")

local Vampire = require(game.ServerScriptService.Races.Vampire)
local Lich = require(game.ServerScriptService.Races.Lich)

print("Loaded race modules")

local RaceFactory = {}

function RaceFactory:createRace(raceType)
    print("Creating race of type:", raceType)
	local race = nil
    if raceType == "Vampire" then
        race = Vampire:new()
		print("Vampire created",race)
    elseif raceType == "Lich" then
        race = Lich:new()
		race:init()
    else
        error("Unknown race type: " .. tostring(raceType))
    end
end

return RaceFactory