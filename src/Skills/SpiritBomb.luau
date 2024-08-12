local SpiritBomb = {}
local SuphiDS = require(game.ServerScriptService.DataService.SuphiDS)
local Game_Settings = game.ServerScriptService.Game_Settings

function SpiritBomb:Activate(player)

    local myDataStore = SuphiDS.find(Game_Settings.DatastoreName.Value, player.UserId)

    while myDataStore.State == false do
       print("Data Loading...")
        task.wait(5)
    end

    print("POWER = ", myDataStore.Value.Attributes.Attunement)
    print(player.Name .. " activated SpiritBomb")
end

return SpiritBomb