local ConfigurationManager = {}

local ConfigurationPack = game.ReplicatedStorage.Configuration_Pack

local SkillConfigurations = game.ServerStorage.Skill_Pack
local EquipmentConfigurations = ConfigurationPack.Equipment
local FormsConfigurations = ConfigurationPack.Forms

function ConfigurationManager:GetClientSkillInfo(name)
	local skillCfg: Configuration = SkillConfigurations:FindFirstChild(name)
	
	if not skillCfg then warn("No skill config") return end
	
	local imageId = skillCfg.ImageLabel.Image
	local cooldown = skillCfg.Cooldown.Value
	local casttime = skillCfg.CastTime.Value
	
	local ClientSkill = {
		ImageId = imageId,
		Cooldown = cooldown,
		CastTime = casttime
	}
	
	return ClientSkill
end

function ConfigurationManager:GetEquipmentDisplayItem(name)

end

function ConfigurationManager:GetFormslDisplayItem(name)

end

function ConfigurationManager:CreateSkillConfiguration(player: Player, datastore)

end

function ConfigurationManager:CreateAttributesConfiguration(player: Player, datastore)

end

function ConfigurationManager:CreateResourcesConfiguration(player: Player, datastore)

end

function ConfigurationManager:CreateFormsConfiguration(player: Player, datastore)

end

function ConfigurationManager:CreateEquipmentConfiguration(player: Player, datastore)

end




return ConfigurationManager
