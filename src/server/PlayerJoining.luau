local Players = game:GetService("Players")
local SuphiDS = require(game.ServerScriptService.DataService.SuphiDS)
local Templates = require(game.ServerScriptService.DataService:WaitForChild("DataTemplate"))
-- Config
local Game_Settings = game.ServerScriptService.Game_Settings

-- Registers Skills
local SkillManager = require(game.ServerScriptService.Skills.Core.SkillManager)

-- Module
local PlayerJoining = {}

-- Helper Functions
-- Create Leaderstats folder
local function createLeaderStatsFolder(player, dsAttributes)
    local leaderstats = Instance.new("Folder")
    leaderstats.Name = "leaderstats"
    leaderstats.Parent = player
    for key, value in pairs(dsAttributes) do
        local attributeValue = Instance.new("IntValue")
        attributeValue.Name = key
        attributeValue.Parent = leaderstats
        attributeValue.Value = value
    end
end

-- Register player skills from datastore
local function registerPlayerSkills(player, playerData)
    for _, skill in ipairs(playerData.Value.Inventory.Skills) do
        SkillManager.RegisterAbility(skill, require(game.ServerScriptService.Skills[skill]))
        local ability = SkillManager.GetAbility(skill)
        if ability then
            ability:Activate(player)
        end
    end
end


-- Handles the state of the datastore
local function StateChanged(state, dataStore)
    local player = Players:GetPlayerByUserId(dataStore.Key)
	-- While the datastore isnt available loop and inform player
	while dataStore.State == false do
		if dataStore:Open(Templates.PlayerData) ~= "Success" then
			print("Data Loading...")
		end
		task.wait(5)
	end

    -- 01 Register player skills
    registerPlayerSkills(player, dataStore)
    -- 02 Create Leaderstats folder
    createLeaderStatsFolder(player, dataStore.Value.Attributes)
    -- 03 Load Action Bar
    
end



Players.PlayerAdded:Connect(function(player)
    
    print(player.Name .. " has joined the game!")
    local playerData = SuphiDS.new(Game_Settings.DatastoreName.Value, player.UserId)
    StateChanged(playerData.State, playerData)
end)

return PlayerJoining
