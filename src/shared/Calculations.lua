

--[[
	File: Calculations.lua
	Location: Replicated Storage
	Last Update: 03-2024
	Author: @TrembusTech
]]--


local Calculations = {}

function Calculations:CalulatePowerLevel(player: Player)
	
	-- TODO: Add form power

	local AttributesCfg = player:FindFirstChild("Attributes")

	if not AttributesCfg then return end

	local StrengthNV = AttributesCfg.Strength
	local ConstitutionNV = AttributesCfg.Constitution
	local AttunementNV = AttributesCfg.Attunement
	local IntelligenceNV = AttributesCfg.Intelligence
	local DexterityNV = AttributesCfg.Dexterity

	if not StrengthNV or not ConstitutionNV or not AttunementNV then return end

	return (StrengthNV.Value * 10) + (ConstitutionNV.Value * 10) + (AttunementNV.Value * 10) * (ConstitutionNV.Value * 10) + (AttunementNV.Value * 10)
end

function Calculations:CalulateMaxHealth(player: Player)

	local AttributesCfg = player:FindFirstChild("Attributes")

	if not AttributesCfg then return end

	local StrengthNV = AttributesCfg.Strength
	local ConstitutionNV = AttributesCfg.Constitution
	local AttunementNV = AttributesCfg.Attunement

	if not StrengthNV or not ConstitutionNV or not AttunementNV then return end

	return (StrengthNV.Value * 5) + (ConstitutionNV.Value * 10) + (AttunementNV.Value * 2)
end

function Calculations:CalulateMaxEnergy(player: Player)

	local AttributesCfg = player:FindFirstChild("Attributes")

	if not AttributesCfg then return end

	local IntelligenceNV = AttributesCfg.Intelligence
	local AttunementNV = AttributesCfg.Attunement

	if not IntelligenceNV or not AttunementNV  then return end

	return (IntelligenceNV.Value * 7) + (AttunementNV.Value * 10)
end


function Calculations:CalulateMaxStamina(player: Player)

	local AttributesCfg = player:FindFirstChild("Attributes")

	if not AttributesCfg then return end

	local DexterityNV = AttributesCfg.Dexterity
	local ConstitutionNV = AttributesCfg.Constitution
	local AttunementNV = AttributesCfg.Attunement

	if not DexterityNV or not ConstitutionNV or not AttunementNV then return end

	return (DexterityNV.Value * 5) + (ConstitutionNV.Value * 10) + (AttunementNV.Value * 2)
end


function Calculations:CalulateMaxExperience(player: Player)

	local AttributesCfg = player:FindFirstChild("Attributes")

	if not AttributesCfg then return end

	local LevelNV = AttributesCfg.Level

	if not LevelNV  then warn("No Level Number Value") return end

	return 200 + LevelNV.Value * 1.52
end


return Calculations
