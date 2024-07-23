-- Server.lua
local RaceFactory = require(game.ServerScriptService.Races.RaceFactory)

game.ReplicatedStorage.RaceSelected.OnServerEvent:Connect(function(player, raceType)
    local race = RaceFactory:createRace(raceType)
    player:SetAttribute("RaceInstance", race)
end)

game.ReplicatedStorage.UseAbility.OnServerEvent:Connect(function(player, abilityIndex)
    local race = player:GetAttribute("RaceInstance")
    if race then
        race:useAbility(abilityIndex, player)
    else
        print("Player has no race selected!")
    end
end)