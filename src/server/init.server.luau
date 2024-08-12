--[[	
	File: GameServer.lua
	Location: ServerScripts-> PlayerData
	Last Update: 04-2024
	Author: @TrembusTech
]]--

-- GS: Players
local Players = game:GetService("Players")

-- GS: Filestores
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerScripts = game:GetService("ServerScriptService")

-- Event Pack
local EventPack = ReplicatedStorage:WaitForChild("Event_Pack")

-- Datastore
local DataFolder = ServerScripts:WaitForChild("DataService")
local SuphiDS = require(DataFolder:WaitForChild("SuphiDS"))
local Templates = require(game.ServerScriptService.DataService:WaitForChild("DataTemplate"))

-- Child Modules
local PlayerJoining = require(script.PlayerJoining)
--local SkillHandler = require(script.SkillHandler)

EventPack.ActivateSkill.onServerEvent:Connect(function(player, skill)

    local myDataStore = SuphiDS.find(Templates.DatabaseName, player.UserId)

    while myDataStore.State == false do
       print("Data Loading...")
        task.wait(5)
    end
    
    myDataStore.Value.Attributes.AttributePoints += 2
    player.leaderstats.AttributePoints.Value = myDataStore.Value.Attributes.AttributePoints
end)

