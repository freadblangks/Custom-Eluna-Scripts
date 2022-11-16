--[[
Name: ReCustomize Character
Version: 1.5.0
Made by: MadBuffoon
Notes: This is to trigger things like race, faction and Customize/Name Change.

]]
local enabled = true
local MenuMenus = true
local commandline1 = "rcmenu"
local StatChangeNotice = "|cffff3347Note: |cffffd000Log out to use."


--Menu Options
local Change_Race = true
local Change_Faction = true
local Use_Items_instead = false

local Redo_Items = false -- Change this have doing ".reload eluna" to false or it will keep deleting and re-adding the items to the DB


--Cost in gold
local ReCustomize_Cost = 25 
local Change_Race_Cost = 75 
local Change_Faction_Cost = 150

--Cost Item Settings
local ReCustomize_Item = 7777777
local ReCustomize_Item_displayid = 36521 -- Default 36521
local ReCustomize_Item_Name = "ReCustomize Token"
local ReCustomize_Item_Desc = "Item Need to ReCustomize You."
local ReCustomize_Item_Quality = 4 -- 0 Grey, 1 White, 2 Green, 3 Blue, 4 Purple, 5 Legendary, 6 Heirloom
local ReCustomize_Item_Bonding = 0 -- 0 Not Binding, 1 Binds on Pick Up

local Change_Race_Item = 7777778 
local Change_Race_Item_displayid = 36521
local Change_Race_Item_Name = "Change Race Token"
local Change_Race_Item_Desc = "Item Need to Change Race You."
local Change_Race_Item_Quality = 4 -- 0 Grey, 1 White, 2 Green, 3 Blue, 4 Purple, 5 Legendary, 6 Heirloom
local Change_Race_Item_Bonding = 0 -- 0 Not Binding, 1 Binds on Pick Up

local Change_Faction_Item = 7777779
local Change_Faction_Item_displayid = 36521
local Change_Faction_Item_Name = "Change Faction Token"
local Change_Faction_Item_Desc = "Item Need to Change Faction You."
local Change_Faction_Item_Quality = 4 -- 0 Grey, 1 White, 2 Green, 3 Blue, 4 Purple, 5 Legendary, 6 Heirloom
local Change_Faction_Item_Bonding = 0 -- 0 Not Binding, 1 Binds on Pick Up

-- DB Stuff -- Dont Change
local LuaName = "ReCustomize_Character"
local Settings = {
		["Main"] ={
			--{VariableName, TrueFalse, Value, Text},
			{"enabled", enabled, 0, 0},
			{"MenuMenus", MenuMenus, 0, 0},
			{"commandline1", 0, 0, commandline1},
			{"StatChangeNotice", 0, 0, StatChangeNotice},
			{"Change_Race", Change_Race, 0, 0},
			{"Change_Faction", Change_Faction, 0, 0},
			{"Use_Items_instead", Use_Items_instead, 0, 0},
			{"Redo_Items", Redo_Items, 0, 0},
			{"ReCustomize_Cost", 0, ReCustomize_Cost, 0},
			{"Change_Race_Cost", 0, Change_Race_Cost, 0},
			{"Change_Faction_Cost", 0, Change_Faction_Cost, 0},
			{"ReCustomize_Item", 0, ReCustomize_Item, 0},
			{"ReCustomize_Item_displayid", 0, ReCustomize_Item_displayid, 0},
			{"ReCustomize_Item_Name", 0, 0, ReCustomize_Item_Name},
			{"ReCustomize_Item_Desc", 0, 0, ReCustomize_Item_Desc},
			{"ReCustomize_Item_Quality", 0, ReCustomize_Item_Quality, 0},
			{"ReCustomize_Item_Bonding", 0, ReCustomize_Item_Bonding, 0},
			{"Change_Race_Item", 0, Change_Race_Item, 0},
			{"Change_Race_Item_displayid", 0, Change_Race_Item_displayid, 0},
			{"Change_Race_Item_Name", 0, 0, Change_Race_Item_Name},
			{"Change_Race_Item_Desc", 0, 0, Change_Race_Item_Desc},
			{"Change_Race_Item_Quality", 0, Change_Race_Item_Quality, 0},
			{"Change_Race_Item_Bonding", 0, Change_Race_Item_Bonding, 0},
			{"Change_Faction_Item", 0, Change_Faction_Item, 0},
			{"Change_Faction_Item_displayid", 0, Change_Faction_Item_displayid, 0},
			{"Change_Faction_Item_Name", 0, 0, Change_Faction_Item_Name},
			{"Change_Faction_Item_Desc", 0, 0, Change_Faction_Item_Desc},
			{"Change_Faction_Item_Quality", 0, Change_Faction_Item_Quality, 0},
			{"Change_Faction_Item_Bonding", 0, Change_Faction_Item_Bonding, 0}
		}
}

local function setLocal(name, val)
    local index = 1
    while true do
        local var_name, var_value = debug.getlocal(2, index)
        if not var_name then break end
        if var_name == name then 
            debug.setlocal(2, index, val)
        end
        index = index + 1
    end
end

for event, v in ipairs(Settings["Main"]) do
		local query = WorldDBQuery(string.format("SELECT * FROM lua_settings_save WHERE LuaScriptName='%s' and VariableName='%s'", LuaName, v[1]))
		if not query then
			local Input = [[INSERT INTO `lua_settings_save` (`LuaScriptName`, `VariableName`, `TrueFalse`, `Value`, `Text`) VALUES (']]..LuaName..[[', ']]..tostring(v[1])..[[', ']]..tostring(v[2])..[[', ']]..tostring(v[3])..[[', ']]..tostring(v[4])..[[');]]		
			WorldDBExecute(Input)
		else
			
			local query_TrueFalse = WorldDBQuery(string.format("SELECT TrueFalse FROM lua_settings_save WHERE LuaScriptName='%s' and VariableName='%s'", LuaName, v[1])):GetString(0)
			local query_Value = WorldDBQuery(string.format("SELECT Value FROM lua_settings_save WHERE LuaScriptName='%s' and VariableName='%s'", LuaName, v[1])):GetString(0)
			local query_Text = WorldDBQuery(string.format("SELECT Text FROM lua_settings_save WHERE LuaScriptName='%s' and VariableName='%s'", LuaName, v[1])):GetString(0)
			TempVariableName = v[1]
			if (query_TrueFalse == "true") then
				_G[TempVariableName] = true
			elseif (query_TrueFalse == "false") then
				_G[TempVariableName] = false
			elseif (query_Value ~= "0") then
				_G[TempVariableName] = tonumber(query_Value)
			elseif (query_Text ~= "Null") then
				_G[TempVariableName] = tostring(query_Text)
			else
				_G[TempVariableName] = 0
			end
			--SendWorldMessage(tostring(load("return " .. TempVariableName)()))
			local query_Variable = load("return " .. TempVariableName)()
			
			setLocal(TempVariableName, query_Variable)
		end
end
-- Do not change or remove blow this point unless you know what your doing.

if Redo_Items then
local Input_1 = [[DELETE FROM item_template WHERE entry=]]..ReCustomize_Item..[[;]]
local Input_2 = [[DELETE FROM item_template WHERE entry=]]..Change_Race_Item..[[;]]
local Input_3 = [[DELETE FROM item_template WHERE entry=]]..Change_Faction_Item..[[;]]

WorldDBExecute(Input_1)
WorldDBExecute(Input_2)
WorldDBExecute(Input_3)
end


if Use_Items_instead then
	local query_ReCustomize_Item = WorldDBQuery(string.format("SELECT * FROM item_template WHERE entry='%i'", ReCustomize_Item))
		if not query_ReCustomize_Item then
			local Input = [[INSERT INTO `item_template` (`entry`, `class`, `subclass`, `SoundOverrideSubclass`, `name`, `displayid`, `Quality`, `Flags`, `FlagsExtra`, `BuyCount`, `BuyPrice`, `SellPrice`, `InventoryType`, `AllowableClass`, `AllowableRace`, `ItemLevel`, `RequiredLevel`, `RequiredSkill`, `RequiredSkillRank`, `requiredspell`, `requiredhonorrank`, `RequiredCityRank`, `RequiredReputationFaction`, `RequiredReputationRank`, `maxcount`, `stackable`, `ContainerSlots`, `StatsCount`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`, `ScalingStatDistribution`, `ScalingStatValue`, `dmg_min1`, `dmg_max1`, `dmg_type1`, `dmg_min2`, `dmg_max2`, `dmg_type2`, `armor`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `delay`, `ammo_type`, `RangedModRange`, `spellid_1`, `spelltrigger_1`, `spellcharges_1`, `spellppmRate_1`, `spellcooldown_1`, `spellcategory_1`, `spellcategorycooldown_1`, `spellid_2`, `spelltrigger_2`, `spellcharges_2`, `spellppmRate_2`, `spellcooldown_2`, `spellcategory_2`, `spellcategorycooldown_2`, `spellid_3`, `spelltrigger_3`, `spellcharges_3`, `spellppmRate_3`, `spellcooldown_3`, `spellcategory_3`, `spellcategorycooldown_3`, `spellid_4`, `spelltrigger_4`, `spellcharges_4`, `spellppmRate_4`, `spellcooldown_4`, `spellcategory_4`, `spellcategorycooldown_4`, `spellid_5`, `spelltrigger_5`, `spellcharges_5`, `spellppmRate_5`, `spellcooldown_5`, `spellcategory_5`, `spellcategorycooldown_5`, `bonding`, `description`, `PageText`, `LanguageID`, `PageMaterial`, `startquest`, `lockid`, `Material`, `sheath`, `RandomProperty`, `RandomSuffix`, `block`, `itemset`, `MaxDurability`, `area`, `Map`, `BagFamily`, `TotemCategory`, `socketColor_1`, `socketContent_1`, `socketColor_2`, `socketContent_2`, `socketColor_3`, `socketContent_3`, `socketBonus`, `GemProperties`, `RequiredDisenchantSkill`, `ArmorDamageModifier`, `duration`, `ItemLimitCategory`, `HolidayId`, `ScriptName`, `DisenchantID`, `FoodType`, `minMoneyLoot`, `maxMoneyLoot`, `flagsCustom`, `VerifiedBuild`) VALUES (]]..ReCustomize_Item..[[, 15, 0, -1, ']]..ReCustomize_Item_Name..[[', ]]..ReCustomize_Item_displayid..[[, ]]..ReCustomize_Item_Quality..[[, 64, 0, 1, 0, 0, 0, -1, -1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, ]]..ReCustomize_Item_Bonding..[[, ']]..ReCustomize_Item_Desc..[[', 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 12340);]]
			WorldDBExecute(Input)
		end
		
	local query_Change_Race_Item = WorldDBQuery(string.format("SELECT * FROM item_template WHERE entry='%i'", Change_Race_Item))
		if not query_Change_Race_Item then
			local Input = [[INSERT INTO `item_template` (`entry`, `class`, `subclass`, `SoundOverrideSubclass`, `name`, `displayid`, `Quality`, `Flags`, `FlagsExtra`, `BuyCount`, `BuyPrice`, `SellPrice`, `InventoryType`, `AllowableClass`, `AllowableRace`, `ItemLevel`, `RequiredLevel`, `RequiredSkill`, `RequiredSkillRank`, `requiredspell`, `requiredhonorrank`, `RequiredCityRank`, `RequiredReputationFaction`, `RequiredReputationRank`, `maxcount`, `stackable`, `ContainerSlots`, `StatsCount`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`, `ScalingStatDistribution`, `ScalingStatValue`, `dmg_min1`, `dmg_max1`, `dmg_type1`, `dmg_min2`, `dmg_max2`, `dmg_type2`, `armor`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `delay`, `ammo_type`, `RangedModRange`, `spellid_1`, `spelltrigger_1`, `spellcharges_1`, `spellppmRate_1`, `spellcooldown_1`, `spellcategory_1`, `spellcategorycooldown_1`, `spellid_2`, `spelltrigger_2`, `spellcharges_2`, `spellppmRate_2`, `spellcooldown_2`, `spellcategory_2`, `spellcategorycooldown_2`, `spellid_3`, `spelltrigger_3`, `spellcharges_3`, `spellppmRate_3`, `spellcooldown_3`, `spellcategory_3`, `spellcategorycooldown_3`, `spellid_4`, `spelltrigger_4`, `spellcharges_4`, `spellppmRate_4`, `spellcooldown_4`, `spellcategory_4`, `spellcategorycooldown_4`, `spellid_5`, `spelltrigger_5`, `spellcharges_5`, `spellppmRate_5`, `spellcooldown_5`, `spellcategory_5`, `spellcategorycooldown_5`, `bonding`, `description`, `PageText`, `LanguageID`, `PageMaterial`, `startquest`, `lockid`, `Material`, `sheath`, `RandomProperty`, `RandomSuffix`, `block`, `itemset`, `MaxDurability`, `area`, `Map`, `BagFamily`, `TotemCategory`, `socketColor_1`, `socketContent_1`, `socketColor_2`, `socketContent_2`, `socketColor_3`, `socketContent_3`, `socketBonus`, `GemProperties`, `RequiredDisenchantSkill`, `ArmorDamageModifier`, `duration`, `ItemLimitCategory`, `HolidayId`, `ScriptName`, `DisenchantID`, `FoodType`, `minMoneyLoot`, `maxMoneyLoot`, `flagsCustom`, `VerifiedBuild`) VALUES (]]..Change_Race_Item..[[, 15, 0, -1, ']]..Change_Race_Item_Name..[[', ]]..Change_Race_Item_displayid..[[, ]]..Change_Race_Item_Quality..[[, 64, 0, 1, 0, 0, 0, -1, -1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, ]]..Change_Race_Item_Bonding..[[, ']]..Change_Race_Item_Desc..[[', 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 12340);]]
			WorldDBExecute(Input)
		end
		
	local query_Change_Faction_Item = WorldDBQuery(string.format("SELECT * FROM item_template WHERE entry='%i'", Change_Faction_Item))
		if not query_Change_Faction_Item then
			local Input = [[INSERT INTO `item_template` (`entry`, `class`, `subclass`, `SoundOverrideSubclass`, `name`, `displayid`, `Quality`, `Flags`, `FlagsExtra`, `BuyCount`, `BuyPrice`, `SellPrice`, `InventoryType`, `AllowableClass`, `AllowableRace`, `ItemLevel`, `RequiredLevel`, `RequiredSkill`, `RequiredSkillRank`, `requiredspell`, `requiredhonorrank`, `RequiredCityRank`, `RequiredReputationFaction`, `RequiredReputationRank`, `maxcount`, `stackable`, `ContainerSlots`, `StatsCount`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`, `ScalingStatDistribution`, `ScalingStatValue`, `dmg_min1`, `dmg_max1`, `dmg_type1`, `dmg_min2`, `dmg_max2`, `dmg_type2`, `armor`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `delay`, `ammo_type`, `RangedModRange`, `spellid_1`, `spelltrigger_1`, `spellcharges_1`, `spellppmRate_1`, `spellcooldown_1`, `spellcategory_1`, `spellcategorycooldown_1`, `spellid_2`, `spelltrigger_2`, `spellcharges_2`, `spellppmRate_2`, `spellcooldown_2`, `spellcategory_2`, `spellcategorycooldown_2`, `spellid_3`, `spelltrigger_3`, `spellcharges_3`, `spellppmRate_3`, `spellcooldown_3`, `spellcategory_3`, `spellcategorycooldown_3`, `spellid_4`, `spelltrigger_4`, `spellcharges_4`, `spellppmRate_4`, `spellcooldown_4`, `spellcategory_4`, `spellcategorycooldown_4`, `spellid_5`, `spelltrigger_5`, `spellcharges_5`, `spellppmRate_5`, `spellcooldown_5`, `spellcategory_5`, `spellcategorycooldown_5`, `bonding`, `description`, `PageText`, `LanguageID`, `PageMaterial`, `startquest`, `lockid`, `Material`, `sheath`, `RandomProperty`, `RandomSuffix`, `block`, `itemset`, `MaxDurability`, `area`, `Map`, `BagFamily`, `TotemCategory`, `socketColor_1`, `socketContent_1`, `socketColor_2`, `socketContent_2`, `socketColor_3`, `socketContent_3`, `socketBonus`, `GemProperties`, `RequiredDisenchantSkill`, `ArmorDamageModifier`, `duration`, `ItemLimitCategory`, `HolidayId`, `ScriptName`, `DisenchantID`, `FoodType`, `minMoneyLoot`, `maxMoneyLoot`, `flagsCustom`, `VerifiedBuild`) VALUES (]]..Change_Faction_Item..[[, 15, 0, -1, ']]..Change_Faction_Item_Name..[[', ]]..Change_Faction_Item_displayid..[[, ]]..Change_Faction_Item_Quality..[[, 64, 0, 1, 0, 0, 0, -1, -1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, ]]..Change_Faction_Item_Bonding..[[, ']]..Change_Faction_Item_Desc..[[', 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 12340);]]
			WorldDBExecute(Input)
		end
end

local Gold = 10000
local GuidN = 0

--(Start) Pulles for the guid for the player
local function getPlayerCharacterGUID(player)
    local query = CharDBQuery(string.format("SELECT guid FROM characters WHERE name='%s'", player:GetName()))

    if query then 
      local row = query:GetRow()

      return tonumber(row["guid"])
    end

    return nil
  end
--(End)
--(Start) The Gossip Menu that shows Main Menu
function ChangeMenuGossip(event, player)
	
	GuidN = getPlayerCharacterGUID(player)
	local currentgold = math.floor(player:GetCoinage() / 10000)
	local maxtobuy = math.floor(currentgold / ReCustomize_Cost)
	player:GossipClearMenu()
	
	if Use_Items_instead then-- Items Used
		local has_ReCustomize_Item = player:HasItem( ""..ReCustomize_Item.."", 1 )
		local has_Change_Race_Item = player:HasItem( ""..Change_Race_Item.."", 1 )
		local has_Change_Faction_Item = player:HasItem( ""..Change_Faction_Item.."", 1 )

		player:GossipMenuAddItem(3, "|TInterface\\Icons\\achievement_boss_mutanus_the_devourer:34|t ReCustomize Character \n|TInterface\\Icons\\Inv_misc_coin_01:20|t Cost: "..ReCustomize_Item_Name.."", 0, 4, false, "Are you sure?")
		if(Change_Race == true) then
			player:GossipMenuAddItem(8, "|TInterface\\Icons\\achievement_boss_lordmarrowgar:34|t Change Race + Customize \n|TInterface\\Icons\\Inv_misc_coin_01:20|t Cost: "..Change_Race_Item_Name.."", 0, 5, false, "Are you sure?")
		end
		if(Change_Faction == true) then
			player:GossipMenuAddItem(9, "|TInterface\\Icons\\achievement_bg_winwsg:34|t Change Faction/Race + Customize \n|TInterface\\Icons\\Inv_misc_coin_01:20|t Cost: "..Change_Faction_Item_Name.."", 0, 6, false, "Are you sure?")
		end
	else 
		--Gold use
		player:GossipMenuAddItem(3, "|TInterface\\Icons\\achievement_boss_mutanus_the_devourer:34|t ReCustomize Character \n|TInterface\\Icons\\Inv_misc_coin_01:20|t Cost: "..ReCustomize_Cost.."g", 0, 1, false, "Are you sure?")
		if(Change_Race == true) then
			player:GossipMenuAddItem(8, "|TInterface\\Icons\\achievement_boss_lordmarrowgar:34|t Change Race + Customize \n|TInterface\\Icons\\Inv_misc_coin_01:20|t Cost: "..Change_Race_Cost.."g", 0, 2, false, "Are you sure?")
		end
		if(Change_Faction == true) then
			player:GossipMenuAddItem(9, "|TInterface\\Icons\\achievement_bg_winwsg:34|t Change Faction/Race + Customize \n|TInterface\\Icons\\Inv_misc_coin_01:20|t Cost: "..Change_Faction_Cost.."g", 0, 3, false, "Are you sure?")
		end
	end
	if (MenuMenus ~= true) then
		player:GossipMenuAddItem(4, "|TInterface\\Icons\\achievement_bg_hld4bases_eos:34|t [Exit Menu]", 0, 99)
	else	
		player:GossipMenuAddItem(4, "|TInterface\\Icons\\Achievement_bg_returnxflags_def_wsg:34|t [Back]", 0, 97)
	end
	player:GossipSendMenu(1, player, 900000)
end
--(End)
--(Start)
local function OnSelect(event, player, _, sender, intid, code)
local currentgold = player:GetCoinage()
local PlayerName = player:GetName()
	--(Start) ReCustomize
	if(intid == 1) then 
		local cost = ReCustomize_Cost * Gold
		if (currentgold >= cost) then
			RunCommand("character customize "..PlayerName.."")
			player:ModifyMoney(-cost)
			player:GossipComplete()
			player:SendBroadcastMessage("|cff3399FFYou can now ReCustomize your character. Costed: |cfffca726"..ReCustomize_Cost.."g")
			player:SendBroadcastMessage(StatChangeNotice)
			player:GossipComplete()			
		else
			player:SendBroadcastMessage("|cffff3347You don't have the gold. You need |cfffca726"..ReCustomize_Cost.."g")
			ChangeMenuGossip(event, player)
		end
	end
	--(End)
	--(Start) Race Change
	if(intid == 2) then 
		local cost = Change_Race_Cost * Gold
		if (currentgold >= cost) then
			RunCommand("character changerace "..PlayerName.."")
			player:ModifyMoney(-cost)
			player:GossipComplete()
			player:SendBroadcastMessage("|cff3399FFYou can now Race Change your character. Costed: |cfffca726"..Change_Race_Cost.."g")
			player:SendBroadcastMessage(StatChangeNotice)
			player:GossipComplete()			
		else
			player:SendBroadcastMessage("|cffff3347You don't have the gold. You need |cfffca726"..Change_Race_Cost.."g")
			ChangeMenuGossip(event, player)
		end
	end
	--(End)
	--(Start) Faction Change
	if(intid == 3) then 
		local cost = Change_Faction_Cost * Gold
		if (currentgold >= cost) then
			RunCommand("character changefaction "..PlayerName.."")
			player:ModifyMoney(-cost)
			player:GossipComplete()
			player:SendBroadcastMessage("|cff3399FFYou can now Faction Change your character. Costed: |cfffca726"..Change_Faction_Cost.."g")
			player:SendBroadcastMessage(StatChangeNotice)
			player:GossipComplete()			
		else
			player:SendBroadcastMessage("|cffff3347You don't have the gold. You need |cfffca726"..Change_Faction_Cost.."g")
			ChangeMenuGossip(event, player)
		end
	end
	--(End)
	--(Start) ReCustomize Item
	if(intid == 4) then 
		local has_ReCustomize_Item = player:HasItem( ""..ReCustomize_Item.."", 1 )
		if has_ReCustomize_Item then
			RunCommand("character customize "..PlayerName.."")
			player:RemoveItem( ""..ReCustomize_Item.."", 1 )
			player:GossipComplete()
			player:SendBroadcastMessage("|cff3399FFYou can now ReCustomize your character. Costed: |cfffca726"..ReCustomize_Item_Name.."|cff3399FF.")
			player:SendBroadcastMessage(StatChangeNotice)
			player:GossipComplete()			
		else
			player:SendBroadcastMessage("|cffff3347You don't have the item. You need |cfffca726"..ReCustomize_Item_Name.."|cffff3347.")
			ChangeMenuGossip(event, player)
		end
	end
	--(End)
	--(Start) Race Change Item
	if(intid == 5) then 
		local has_Change_Race_Item = player:HasItem( ""..Change_Race_Item.."", 1 )
		if has_Change_Race_Item then
			RunCommand("character changerace "..PlayerName.."")
			player:RemoveItem( ""..Change_Race_Item.."", 1 )
			player:GossipComplete()
			player:SendBroadcastMessage("|cff3399FFYou can now Race Change your character. Costed: |cfffca726"..Change_Race_Item_Name.."|cff3399FF.")
			player:SendBroadcastMessage(StatChangeNotice)
			player:GossipComplete()			
		else
			player:SendBroadcastMessage("|cffff3347You don't have the item. You need |cfffca726"..Change_Race_Item_Name.."|cffff3347.")
			ChangeMenuGossip(event, player)
		end
	end
	--(End)
	--(Start) Faction Change Item
	if(intid == 6) then 
		local has_Change_Faction_Item = player:HasItem( ""..Change_Faction_Item.."", 1 )
		if has_Change_Faction_Item then
			RunCommand("character changefaction "..PlayerName.."")
			player:RemoveItem( ""..Change_Faction_Item.."", 1 )
			player:GossipComplete()
			player:SendBroadcastMessage("|cff3399FFYou can now Faction Change your character. Costed: |cfffca726"..Change_Faction_Item_Name.."|cff3399FF.")
			player:SendBroadcastMessage(StatChangeNotice)
			player:GossipComplete()			
		else
			player:SendBroadcastMessage("|cffff3347You don't have the item. You need |cfffca726"..Change_Faction_Item_Name.."|cffff3347.")
			ChangeMenuGossip(event, player)
		end
	end
	--(End)
	
	if(intid == 97) then --Back
		OtherMenuGossip(event, player)
	end
	if(intid == 98) then --Back
		ChangeMenuGossip(event, player)
		return false
	end
	if(intid == 99) then --Close
		player:SendAreaTriggerMessage("Good Bye!")
		player:GossipComplete()
	end
end
--(End)


--(Start) Part of start up.
local function BootMSG(eventid, delay, repeats, player)
local mingmrank = 3
local IsGM = (player:GetGMRank() >= mingmrank)
if not GMonly or IsGM then
		if (MenuMenus ~= true) then
			player:SendBroadcastMessage("|cff3399FFYou can now ReCustomize your character by typing |cff00cc00 ."..commandline1.." |cff3399FF in chat.")
		end
	end
end
local firstlogin = false
local function OnFirstLogin(event, player)
	if event == 30 then
	firstlogin = true
	end
	
	player:RegisterEvent(BootMSG, 60000, 1, player)
end
local function OnLogin(event, player)
	if not firstlogin then
	player:RegisterEvent(BootMSG, 20000, 1, player)
	else
	firstlogin = false
	end
end
--(end)

--(Start) Command: Check
local function PrintChangeMenuCheck(event, player, command)
	if (command == commandline1) then
		ChangeMenuGossip(event, player)
		return false
	end
end
--(end)

if enabled then
RegisterPlayerEvent(30, OnFirstLogin)
RegisterPlayerEvent(3, OnLogin)
RegisterPlayerEvent(42, PrintChangeMenuCheck)
RegisterPlayerGossipEvent(900000, 2, OnSelect)
end
