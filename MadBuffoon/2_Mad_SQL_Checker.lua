--[[
Name: Mad's SQL Checker
Version: 1.0.0
Made by: MadBuffoon
Notes: This is to check DP changes to allow my other 

]]

local query_UpHearthStone = WorldDBQuery(string.format("SELECT * FROM item_template WHERE entry=6948 AND Spellid_1=79381"))
if not query_UpHearthStone then
local UpHearthStone1 = [[DELETE FROM item_template WHERE entry=6948;]]
local UpHearthStone2 = [[INSERT INTO `item_template` (`entry`, `class`, `subclass`, `SoundOverrideSubclass`, `name`, `displayid`, `Quality`, `Flags`, `FlagsExtra`, `BuyCount`, `BuyPrice`, `SellPrice`, `InventoryType`, `AllowableClass`, `AllowableRace`, `ItemLevel`, `RequiredLevel`, `RequiredSkill`, `RequiredSkillRank`, `requiredspell`, `requiredhonorrank`, `RequiredCityRank`, `RequiredReputationFaction`, `RequiredReputationRank`, `maxcount`, `stackable`, `ContainerSlots`, `StatsCount`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`, `ScalingStatDistribution`, `ScalingStatValue`, `dmg_min1`, `dmg_max1`, `dmg_type1`, `dmg_min2`, `dmg_max2`, `dmg_type2`, `armor`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `delay`, `ammo_type`, `RangedModRange`, `spellid_1`, `spelltrigger_1`, `spellcharges_1`, `spellppmRate_1`, `spellcooldown_1`, `spellcategory_1`, `spellcategorycooldown_1`, `spellid_2`, `spelltrigger_2`, `spellcharges_2`, `spellppmRate_2`, `spellcooldown_2`, `spellcategory_2`, `spellcategorycooldown_2`, `spellid_3`, `spelltrigger_3`, `spellcharges_3`, `spellppmRate_3`, `spellcooldown_3`, `spellcategory_3`, `spellcategorycooldown_3`, `spellid_4`, `spelltrigger_4`, `spellcharges_4`, `spellppmRate_4`, `spellcooldown_4`, `spellcategory_4`, `spellcategorycooldown_4`, `spellid_5`, `spelltrigger_5`, `spellcharges_5`, `spellppmRate_5`, `spellcooldown_5`, `spellcategory_5`, `spellcategorycooldown_5`, `bonding`, `description`, `PageText`, `LanguageID`, `PageMaterial`, `startquest`, `lockid`, `Material`, `sheath`, `RandomProperty`, `RandomSuffix`, `block`, `itemset`, `MaxDurability`, `area`, `Map`, `BagFamily`, `TotemCategory`, `socketColor_1`, `socketContent_1`, `socketColor_2`, `socketContent_2`, `socketColor_3`, `socketContent_3`, `socketBonus`, `GemProperties`, `RequiredDisenchantSkill`, `ArmorDamageModifier`, `duration`, `ItemLimitCategory`, `HolidayId`, `ScriptName`, `DisenchantID`, `FoodType`, `minMoneyLoot`, `maxMoneyLoot`, `flagsCustom`, `VerifiedBuild`) VALUES (6948, 15, 0, -1, 'Hearthstone', 6418, 1, 64, 0, 1, 0, 0, 0, -1, -1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 79381, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 1, 'Use - Opens a menu for menus.', 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 12340);]]

WorldDBExecute(UpHearthStone1)
WorldDBExecute(UpHearthStone2)
end


-- Pocket Portal
local Q1 = WorldDBQuery(string.format("SELECT * FROM creature_template WHERE entry='900002'"))
local Q2 = WorldDBQuery(string.format("SELECT * FROM creature_equip_template WHERE CreatureID='900002'"))
local Q3 = WorldDBQuery(string.format("SELECT * FROM smart_scripts WHERE entryorguid=900002 AND source_type='0'"))

local executesq1 = [[
INSERT INTO creature_template (entry, modelid1, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, HealthModifier, ManaModifier, ArmorModifier, faction, npcflag, speed_walk, speed_run, scale, `rank`, Damagemodifier, unit_class, unit_flags, `type`, type_flags, RegenHealth, flags_extra, AiName) VALUES
(900002, '30615', "Pocket Portal", "", 'Directions', '50000', 80, 83, 1.56, 1.56, 1.56, 35, 3, 1, 1.14286, 1.25, 1, 1, 1, 0, 7, 138936390, 1, 2, 'SmartAI')
]]
local executesq2 = [[
UPDATE creature_template SET AIName="SmartAI" WHERE entry=900002 LIMIT 1
]]
local executesq3 = [[
INSERT INTO `creature_equip_template` (`CreatureID`,`ItemID1`,`ItemID2`,`ItemID3`) VALUES (900002,11855,5956,0)
]]
local executesq4 = [[
INSERT INTO smart_scripts (entryorguid, source_type, id, link, event_type, event_phase_mask, event_chance, event_flags, event_param1, event_param2, event_param3, event_param4, action_type, action_param1, action_param2, action_param3, action_param4, action_param5, action_param6, target_type, target_param1, target_param2, target_param3, target_x, target_y, target_z, target_o, comment) VALUES 
(900002, 0, 1, 0, 62, 0, 100, 0, 50000, 1, 0, 0, 62, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, -8842.09, 626.358, 94.0867, 3.61363, "Teleporter script"),
(900002, 0, 2, 0, 62, 0, 100, 0, 50000, 2, 0, 0, 62, 1, 0, 0, 0, 0, 0, 7, 0, 0, 0, 1601.08, -4378.69, 9.9846, 2.14362, "Teleporter script"),
(900002, 0, 3, 0, 62, 0, 100, 0, 50000, 11, 0, 0, 62, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, -14281.9, 552.564, 8.90422, 0.860144, "Teleporter script"),
(900002, 0, 4, 0, 62, 0, 100, 0, 50000, 10, 0, 0, 62, 530, 0, 0, 0, 0, 0, 7, 0, 0, 0, -1887.62, 5359.09, -12.4279, 4.40435, "Teleporter script"),
(900002, 0, 5, 0, 62, 0, 100, 0, 50000, 9, 0, 0, 62, 571, 0, 0, 0, 0, 0, 7, 0, 0, 0, 5809.55, 503.975, 657.526, 2.38338, "Teleporter script"),
(900002, 0, 6, 0, 62, 0, 100, 0, 50000, 12, 0, 0, 62, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, -13181.8, 339.356, 42.9805, 1.18013, "Teleporter script"),
(900002, 0, 7, 0, 62, 0, 100, 0, 50000, 3, 0, 0, 62, 1, 0, 0, 0, 0, 0, 7, 0, 0, 0, 9869.91, 2493.58, 1315.88, 2.78897, "Teleporter script"),
(900002, 0, 8, 0, 62, 0, 100, 0, 50000, 4, 0, 0, 62, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, -4900.47, -962.585, 501.455, 5.40538, "Teleporter script"),
(900002, 0, 9, 0, 62, 0, 100, 0, 50000, 5, 0, 0, 62, 530, 0, 0, 0, 0, 0, 7, 0, 0, 0, -3864.92, -11643.7, -137.644, 5.50862, "Teleporter script"),
(900002, 0, 10, 0, 62, 0, 100, 0, 50000, 6, 0, 0, 62, 1, 0, 0, 0, 0, 0, 7, 0, 0, 0, -1274.45, 71.8601, 128.159, 2.80623, "Teleporter script"),
(900002, 0, 11, 0, 62, 0, 100, 0, 50000, 7, 0, 0, 62, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 1633.75, 240.167, -43.1034, 6.26128, "Teleporter script"),
(900002, 0, 12, 0, 62, 0, 100, 0, 50000, 8, 0, 0, 62, 530, 0, 0, 0, 0, 0, 7, 0, 0, 0, 9738.28, -7454.19, 13.5605, 0.043914, "Teleporter script"),
(900002, 0, 13, 0, 62, 0, 100, 0, 50000+1, 0, 0, 0, 62, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, -5163.54, 925.423, 257.181, 1.57423, "Teleporter script"),
(900002, 0, 14, 0, 62, 0, 100, 0, 50000+1, 1, 0, 0, 62, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, -11209.6, 1666.54, 24.6974, 1.42053, "Teleporter script"),
(900002, 0, 15, 0, 62, 0, 100, 0, 50000+1, 2, 0, 0, 62, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, -8799.15, 832.718, 97.6348, 6.04085, "Teleporter script"),
(900002, 0, 16, 0, 62, 0, 100, 0, 50000+1, 3, 0, 0, 62, 1, 0, 0, 0, 0, 0, 7, 0, 0, 0, 1811.78, -4410.5, -18.4704, 5.20165, "Teleporter script"),
(900002, 0, 17, 0, 62, 0, 100, 0, 50000+1, 4, 0, 0, 62, 1, 0, 0, 0, 0, 0, 7, 0, 0, 0, -4657.3, -2519.35, 81.0529, 4.54808, "Teleporter script"),
(900002, 0, 18, 0, 62, 0, 100, 0, 50000+1, 5, 0, 0, 62, 1, 0, 0, 0, 0, 0, 7, 0, 0, 0, -4470.28, -1677.77, 81.3925, 1.16302, "Teleporter script"),
(900002, 0, 19, 0, 62, 0, 100, 0, 50000+1, 6, 0, 0, 62, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 2873.15, -764.523, 160.332, 5.10447, "Teleporter script"),
(900002, 0, 20, 0, 62, 0, 100, 0, 50000+1, 7, 0, 0, 62, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, -234.675, 1561.63, 76.8921, 1.24031, "Teleporter script"),
(900002, 0, 21, 0, 62, 0, 100, 0, 50000+1, 8, 0, 0, 62, 1, 0, 0, 0, 0, 0, 7, 0, 0, 0, -731.607, -2218.39, 17.0281, 2.78486, "Teleporter script"),
(900002, 0, 22, 0, 62, 0, 100, 0, 50000+1, 9, 0, 0, 62, 1, 0, 0, 0, 0, 0, 7, 0, 0, 0, 4249.99, 740.102, -25.671, 1.34062, "Teleporter script"),
(900002, 0, 23, 0, 62, 0, 100, 0, 50000+1, 10, 0, 0, 62, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, -7179.34, -921.212, 165.821, 5.09599, "Teleporter script"),
(900002, 0, 24, 0, 62, 0, 100, 0, 50000+1, 11, 0, 0, 62, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, -7527.05, -1226.77, 285.732, 5.29626, "Teleporter script"),
(900002, 0, 25, 0, 62, 0, 100, 0, 50000+1, 12, 0, 0, 62, 1, 0, 0, 0, 0, 0, 7, 0, 0, 0, -3520.14, 1119.38, 161.025, 4.70454, "Teleporter script"),
(900002, 0, 26, 0, 62, 0, 100, 0, 50000+1, 13, 0, 0, 62, 1, 0, 0, 0, 0, 0, 7, 0, 0, 0, -1421.42, 2907.83, 137.415, 1.70718, "Teleporter script"),
(900002, 0, 27, 0, 62, 0, 100, 0, 50000+1, 14, 0, 0, 62, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 1269.64, -2556.21, 93.6088, 0.620623, "Teleporter script"),
(900002, 0, 28, 0, 62, 0, 100, 0, 50000+1, 15, 0, 0, 62, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 3352.92, -3379.03, 144.782, 6.25978, "Teleporter script"),
(900002, 0, 29, 0, 62, 0, 100, 0, 50000+1, 16, 0, 0, 62, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, -10177.9, -3994.9, -111.239, 6.01885, "Teleporter script"),
(900002, 0, 30, 0, 62, 0, 100, 0, 50000+1, 17, 0, 0, 62, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, -6071.37, -2955.16, 209.782, 0.015708, "Teleporter script"),
(900002, 0, 31, 0, 62, 0, 100, 0, 50000+1, 18, 0, 0, 62, 1, 0, 0, 0, 0, 0, 7, 0, 0, 0, -6801.19, -2893.02, 9.00388, 0.158639, "Teleporter script"),
(900002, 0, 32, 0, 62, 0, 100, 0, 50000+2, 0, 0, 0, 62, 530, 0, 0, 0, 0, 0, 7, 0, 0, 0, -3324.49, 4943.45, -101.239, 4.63901, "Teleporter script"),
(900002, 0, 33, 0, 62, 0, 100, 0, 50000+2, 1, 0, 0, 62, 1, 0, 0, 0, 0, 0, 7, 0, 0, 0, -8369.65, -4253.11, -204.272, -2.70526, "Teleporter script"),
(900002, 0, 34, 0, 62, 0, 100, 0, 50000+2, 2, 0, 0, 62, 530, 0, 0, 0, 0, 0, 7, 0, 0, 0, 738.865, 6865.77, -69.4659, 6.27655, "Teleporter script"),
(900002, 0, 35, 0, 62, 0, 100, 0, 50000+2, 3, 0, 0, 62, 530, 0, 0, 0, 0, 0, 7, 0, 0, 0, -347.29, 3089.82, 21.394, 5.68114, "Teleporter script"),
(900002, 0, 36, 0, 62, 0, 100, 0, 50000+2, 4, 0, 0, 62, 530, 0, 0, 0, 0, 0, 7, 0, 0, 0, 12884.6, -7317.69, 65.5023, 4.799, "Teleporter script"),
(900002, 0, 37, 0, 62, 0, 100, 0, 50000+2, 5, 0, 0, 62, 530, 0, 0, 0, 0, 0, 7, 0, 0, 0, 3100.48, 1536.49, 190.3, 4.62226, "Teleporter script"),
(900002, 0, 38, 0, 62, 0, 100, 0, 50000+3, 0, 0, 0, 62, 571, 0, 0, 0, 0, 0, 7, 0, 0, 0, 3707.86, 2150.23, 36.76, 3.22, "Teleporter script"),
(900002, 0, 39, 0, 62, 0, 100, 0, 50000+3, 1, 0, 0, 62, 1, 0, 0, 0, 0, 0, 7, 0, 0, 0, -8756.39, -4440.68, -199.489, 4.66289, "Teleporter script"),
(900002, 0, 40, 0, 62, 0, 100, 0, 50000+3, 2, 0, 0, 62, 571, 0, 0, 0, 0, 0, 7, 0, 0, 0, 8590.95, 791.792, 558.235, 3.13127, "Teleporter script"),
(900002, 0, 41, 0, 62, 0, 100, 0, 50000+3, 3, 0, 0, 62, 571, 0, 0, 0, 0, 0, 7, 0, 0, 0, 4765.59, -2038.24, 229.363, 0.887627, "Teleporter script"),
(900002, 0, 42, 0, 62, 0, 100, 0, 50000+3, 4, 0, 0, 62, 571, 0, 0, 0, 0, 0, 7, 0, 0, 0, 6722.44, -4640.67, 450.632, 3.91123, "Teleporter script"),
(900002, 0, 43, 0, 62, 0, 100, 0, 50000+3, 5, 0, 0, 62, 571, 0, 0, 0, 0, 0, 7, 0, 0, 0, 5643.16, 2028.81, 798.274, 4.60242, "Teleporter script"),
(900002, 0, 44, 0, 62, 0, 100, 0, 50000+3, 6, 0, 0, 62, 571, 0, 0, 0, 0, 0, 7, 0, 0, 0, 3782.89, 6965.23, 105.088, 6.14194, "Teleporter script"),
(900002, 0, 45, 0, 62, 0, 100, 0, 50000+3, 7, 0, 0, 62, 571, 0, 0, 0, 0, 0, 7, 0, 0, 0, 5693.08, 502.588, 652.672, 4.0229, "Teleporter script"),
(900002, 0, 46, 0, 62, 0, 100, 0, 50000+3, 8, 0, 0, 62, 571, 0, 0, 0, 0, 0, 7, 0, 0, 0, 9136.52, -1311.81, 1066.29, 5.19113, "Teleporter script"),
(900002, 0, 47, 0, 62, 0, 100, 0, 50000+3, 9, 0, 0, 62, 571, 0, 0, 0, 0, 0, 7, 0, 0, 0, 8922.12, -1009.16, 1039.56, 1.57044, "Teleporter script"),
(900002, 0, 48, 0, 62, 0, 100, 0, 50000+3, 10, 0, 0, 62, 571, 0, 0, 0, 0, 0, 7, 0, 0, 0, 1203.41, -4868.59, 41.2486, 0.283237, "Teleporter script"),
(900002, 0, 49, 0, 62, 0, 100, 0, 50000+3, 11, 0, 0, 62, 571, 0, 0, 0, 0, 0, 7, 0, 0, 0, 1267.24, -4857.3, 215.764, 3.22768, "Teleporter script"),
(900002, 0, 50, 0, 62, 0, 100, 0, 50000+4, 0, 0, 0, 62, 530, 0, 0, 0, 0, 0, 7, 0, 0, 0, -3649.92, 317.469, 35.2827, 2.94285, "Teleporter script"),
(900002, 0, 51, 0, 62, 0, 100, 0, 50000+4, 1, 0, 0, 62, 229, 0, 0, 0, 0, 0, 7, 0, 0, 0, 152.451, -474.881, 116.84, 0.001073, "Teleporter script"),
(900002, 0, 52, 0, 62, 0, 100, 0, 50000+4, 2, 0, 0, 62, 1, 0, 0, 0, 0, 0, 7, 0, 0, 0, -8177.89, -4181.23, -167.552, 0.913338, "Teleporter script"),
(900002, 0, 53, 0, 62, 0, 100, 0, 50000+4, 3, 0, 0, 62, 530, 0, 0, 0, 0, 0, 7, 0, 0, 0, 797.855, 6865.77, -65.4165, 0.005938, "Teleporter script"),
(900002, 0, 54, 0, 62, 0, 100, 0, 50000+4, 4, 0, 0, 62, 571, 0, 0, 0, 0, 0, 7, 0, 0, 0, 8515.61, 714.153, 558.248, 1.57753, "Teleporter script"),
(900002, 0, 55, 0, 62, 0, 100, 0, 50000+4, 5, 0, 0, 62, 530, 0, 0, 0, 0, 0, 7, 0, 0, 0, 3530.06, 5104.08, 3.50861, 5.51117, "Teleporter script"),
(900002, 0, 56, 0, 62, 0, 100, 0, 50000+4, 6, 0, 0, 62, 530, 0, 0, 0, 0, 0, 7, 0, 0, 0, -336.411, 3130.46, -102.928, 5.20322, "Teleporter script"),
(900002, 0, 57, 0, 62, 0, 100, 0, 50000+4, 7, 0, 0, 62, 571, 0, 0, 0, 0, 0, 7, 0, 0, 0, 5855.22, 2102.03, 635.991, 3.57899, "Teleporter script"),
(900002, 0, 58, 0, 62, 0, 100, 0, 50000+4, 8, 0, 0, 62, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, -11118.9, -2010.33, 47.0819, 0.649895, "Teleporter script"),
(900002, 0, 59, 0, 62, 0, 100, 0, 50000+4, 9, 0, 0, 62, 230, 0, 0, 0, 0, 0, 7, 0, 0, 0, 1126.64, -459.94, -102.535, 3.46095, "Teleporter script"),
(900002, 0, 60, 0, 62, 0, 100, 0, 50000+4, 10, 0, 0, 62, 571, 0, 0, 0, 0, 0, 7, 0, 0, 0, 3668.72, -1262.46, 243.622, 4.785, "Teleporter script"),
(900002, 0, 61, 0, 62, 0, 100, 0, 50000+4, 11, 0, 0, 62, 1, 0, 0, 0, 0, 0, 7, 0, 0, 0, -4708.27, -3727.64, 54.5589, 3.72786, "Teleporter script"),
(900002, 0, 62, 0, 62, 0, 100, 0, 50000+4, 12, 0, 0, 62, 1, 0, 0, 0, 0, 0, 7, 0, 0, 0, -8409.82, 1499.06, 27.7179, 2.51868, "Teleporter script"),
(900002, 0, 63, 0, 62, 0, 100, 0, 50000+4, 13, 0, 0, 62, 530, 0, 0, 0, 0, 0, 7, 0, 0, 0, 12574.1, -6774.81, 15.0904, 3.13788, "Teleporter script"),
(900002, 0, 64, 0, 62, 0, 100, 0, 50000+4, 14, 0, 0, 62, 530, 0, 0, 0, 0, 0, 7, 0, 0, 0, 3088.49, 1381.57, 184.863, 4.61973, "Teleporter script"),
(900002, 0, 65, 0, 62, 0, 100, 0, 50000+4, 15, 0, 0, 62, 1, 0, 0, 0, 0, 0, 7, 0, 0, 0, -8240.09, 1991.32, 129.072, 0.941603, "Teleporter script"),
(900002, 0, 66, 0, 62, 0, 100, 0, 50000+4, 16, 0, 0, 62, 571, 0, 0, 0, 0, 0, 7, 0, 0, 0, 3784.17, 7028.84, 161.258, 5.79993, "Teleporter script"),
(900002, 0, 67, 0, 62, 0, 100, 0, 50000+4, 17, 0, 0, 62, 571, 0, 0, 0, 0, 0, 7, 0, 0, 0, 3472.43, 264.923, -120.146, 3.27923, "Teleporter script"),
(900002, 0, 68, 0, 62, 0, 100, 0, 50000+4, 18, 0, 0, 62, 571, 0, 0, 0, 0, 0, 7, 0, 0, 0, 9222.88, -1113.59, 1216.12, 6.27549, "Teleporter script"),
(900002, 0, 69, 0, 62, 0, 100, 0, 50000+4, 19, 0, 0, 62, 571, 0, 0, 0, 0, 0, 7, 0, 0, 0, 5453.72, 2840.79, 421.28, 0, "Teleporter script"),
(900002, 0, 70, 0, 62, 0, 100, 0, 50000+4, 21, 0, 0, 62, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, -11916.7, -1215.72, 92.289, 4.72454, "Teleporter script"),
(900002, 0, 71, 0, 62, 0, 100, 0, 50000+4, 22, 0, 0, 62, 530, 0, 0, 0, 0, 0, 7, 0, 0, 0, 6851.78, -7972.57, 179.242, 4.64691, "Teleporter script"),
(900002, 0, 72, 0, 62, 0, 100, 0, 50000+5, 0, 0, 0, 62, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, -9449.06, 64.8392, 56.3581, 3.07047, "Teleporter script"),
(900002, 0, 73, 0, 62, 0, 100, 0, 50000+5, 1, 0, 0, 62, 530, 0, 0, 0, 0, 0, 7, 0, 0, 0, 9024.37, -6682.55, 16.8973, 3.14131, "Teleporter script"),
(900002, 0, 74, 0, 62, 0, 100, 0, 50000+5, 2, 0, 0, 62, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, -5603.76, -482.704, 396.98, 5.23499, "Teleporter script"),
(900002, 0, 75, 0, 62, 0, 100, 0, 50000+5, 3, 0, 0, 62, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 2274.95, 323.918, 34.1137, 4.24367, "Teleporter script"),
(900002, 0, 76, 0, 62, 0, 100, 0, 50000+5, 4, 0, 0, 62, 530, 0, 0, 0, 0, 0, 7, 0, 0, 0, 7595.73, -6819.6, 84.3718, 2.56561, "Teleporter script"),
(900002, 0, 77, 0, 62, 0, 100, 0, 50000+5, 5, 0, 0, 62, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, -5405.85, -2894.15, 341.972, 5.48238, "Teleporter script"),
(900002, 0, 78, 0, 62, 0, 100, 0, 50000+5, 6, 0, 0, 62, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 505.126, 1504.63, 124.808, 1.77987, "Teleporter script"),
(900002, 0, 79, 0, 62, 0, 100, 0, 50000+5, 7, 0, 0, 62, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, -10684.9, 1033.63, 32.5389, 6.07384, "Teleporter script"),
(900002, 0, 80, 0, 62, 0, 100, 0, 50000+5, 8, 0, 0, 62, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, -9447.8, -2270.85, 71.8224, 0.283853, "Teleporter script"),
(900002, 0, 81, 0, 62, 0, 100, 0, 50000+5, 9, 0, 0, 62, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, -10531.7, -1281.91, 38.8647, 1.56959, "Teleporter script"),
(900002, 0, 82, 0, 62, 0, 100, 0, 50000+5, 10, 0, 0, 62, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, -385.805, -787.954, 54.6655, 1.03926, "Teleporter script"),
(900002, 0, 83, 0, 62, 0, 100, 0, 50000+5, 11, 0, 0, 62, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, -3517.75, -913.401, 8.86625, 2.60705, "Teleporter script"),
(900002, 0, 84, 0, 62, 0, 100, 0, 50000+5, 12, 0, 0, 62, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 275.049, -652.044, 130.296, 0.502032, "Teleporter script"),
(900002, 0, 85, 0, 62, 0, 100, 0, 50000+5, 13, 0, 0, 62, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, -1581.45, -2704.06, 35.4168, 0.490373, "Teleporter script"),
(900002, 0, 86, 0, 62, 0, 100, 0, 50000+5, 14, 0, 0, 62, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, -11921.7, -59.544, 39.7262, 3.73574, "Teleporter script"),
(900002, 0, 87, 0, 62, 0, 100, 0, 50000+5, 15, 0, 0, 62, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, -6782.56, -3128.14, 240.48, 5.65912, "Teleporter script"),
(900002, 0, 88, 0, 62, 0, 100, 0, 50000+5, 16, 0, 0, 62, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, -10368.6, -2731.3, 21.6537, 5.29238, "Teleporter script"),
(900002, 0, 89, 0, 62, 0, 100, 0, 50000+5, 17, 0, 0, 62, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 112.406, -3929.74, 136.358, 0.981903, "Teleporter script"),
(900002, 0, 90, 0, 62, 0, 100, 0, 50000+5, 18, 0, 0, 62, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, -6686.33, -1198.55, 240.027, 0.916887, "Teleporter script"),
(900002, 0, 91, 0, 62, 0, 100, 0, 50000+5, 19, 0, 0, 62, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, -11184.7, -3019.31, 7.29238, 3.20542, "Teleporter script"),
(900002, 0, 92, 0, 62, 0, 100, 0, 50000+5, 20, 0, 0, 62, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, -7979.78, -2105.72, 127.919, 5.10148, "Teleporter script"),
(900002, 0, 93, 0, 62, 0, 100, 0, 50000+5, 21, 0, 0, 62, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 1743.69, -1723.86, 59.6648, 5.23722, "Teleporter script"),
(900002, 0, 94, 0, 62, 0, 100, 0, 50000+5, 22, 0, 0, 62, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 2280.64, -5275.05, 82.0166, 4.7479, "Teleporter script"),
(900002, 0, 95, 0, 62, 0, 100, 0, 50000+5, 23, 0, 0, 62, 530, 0, 0, 0, 0, 0, 7, 0, 0, 0, 12806.5, -6911.11, 41.1156, 2.22935, "Teleporter script"),
(900002, 0, 96, 0, 62, 0, 100, 0, 50000+6, 0, 0, 0, 62, 530, 0, 0, 0, 0, 0, 7, 0, 0, 0, -4192.62, -12576.7, 36.7598, 1.62813, "Teleporter script"),
(900002, 0, 97, 0, 62, 0, 100, 0, 50000+6, 1, 0, 0, 62, 1, 0, 0, 0, 0, 0, 7, 0, 0, 0, 9889.03, 915.869, 1307.43, 1.9336, "Teleporter script"),
(900002, 0, 98, 0, 62, 0, 100, 0, 50000+6, 2, 0, 0, 62, 1, 0, 0, 0, 0, 0, 7, 0, 0, 0, 228.978, -4741.87, 10.1027, 0.416883, "Teleporter script"),
(900002, 0, 99, 0, 62, 0, 100, 0, 50000+6, 3, 0, 0, 62, 1, 0, 0, 0, 0, 0, 7, 0, 0, 0, -2473.87, -501.225, -9.42465, 0.6525, "Teleporter script"),
(900002, 0, 100, 0, 62, 0, 100, 0, 50000+6, 4, 0, 0, 62, 530, 0, 0, 0, 0, 0, 7, 0, 0, 0, -2095.7, -11841.1, 51.1557, 6.19288, "Teleporter script"),
(900002, 0, 101, 0, 62, 0, 100, 0, 50000+6, 5, 0, 0, 62, 1, 0, 0, 0, 0, 0, 7, 0, 0, 0, 6463.25, 683.986, 8.92792, 4.33534, "Teleporter script"),
(900002, 0, 102, 0, 62, 0, 100, 0, 50000+6, 6, 0, 0, 62, 1, 0, 0, 0, 0, 0, 7, 0, 0, 0, -575.772, -2652.45, 95.6384, 0.006469, "Teleporter script"),
(900002, 0, 103, 0, 62, 0, 100, 0, 50000+6, 7, 0, 0, 62, 1, 0, 0, 0, 0, 0, 7, 0, 0, 0, 1574.89, 1031.57, 137.442, 3.8013, "Teleporter script"),
(900002, 0, 104, 0, 62, 0, 100, 0, 50000+6, 8, 0, 0, 62, 1, 0, 0, 0, 0, 0, 7, 0, 0, 0, 1919.77, -2169.68, 94.6729, 6.14177, "Teleporter script"),
(900002, 0, 105, 0, 62, 0, 100, 0, 50000+6, 9, 0, 0, 62, 1, 0, 0, 0, 0, 0, 7, 0, 0, 0, -5375.53, -2509.2, -40.432, 2.41885, "Teleporter script"),
(900002, 0, 106, 0, 62, 0, 100, 0, 50000+6, 10, 0, 0, 62, 1, 0, 0, 0, 0, 0, 7, 0, 0, 0, -656.056, 1510.12, 88.3746, 3.29553, "Teleporter script"),
(900002, 0, 107, 0, 62, 0, 100, 0, 50000+6, 11, 0, 0, 62, 1, 0, 0, 0, 0, 0, 7, 0, 0, 0, -3350.12, -3064.85, 33.0364, 5.12666, "Teleporter script"),
(900002, 0, 108, 0, 62, 0, 100, 0, 50000+6, 12, 0, 0, 62, 1, 0, 0, 0, 0, 0, 7, 0, 0, 0, -4808.31, 1040.51, 103.769, 2.90655, "Teleporter script"),
(900002, 0, 109, 0, 62, 0, 100, 0, 50000+6, 13, 0, 0, 62, 1, 0, 0, 0, 0, 0, 7, 0, 0, 0, -6940.91, -3725.7, 48.9381, 3.11174, "Teleporter script"),
(900002, 0, 110, 0, 62, 0, 100, 0, 50000+6, 14, 0, 0, 62, 1, 0, 0, 0, 0, 0, 7, 0, 0, 0, 3117.12, -4387.97, 91.9059, 5.49897, "Teleporter script"),
(900002, 0, 111, 0, 62, 0, 100, 0, 50000+6, 15, 0, 0, 62, 1, 0, 0, 0, 0, 0, 7, 0, 0, 0, 3898.8, -1283.33, 220.519, 6.24307, "Teleporter script"),
(900002, 0, 112, 0, 62, 0, 100, 0, 50000+6, 16, 0, 0, 62, 1, 0, 0, 0, 0, 0, 7, 0, 0, 0, -6291.55, -1158.62, -258.138, 0.457099, "Teleporter script"),
(900002, 0, 113, 0, 62, 0, 100, 0, 50000+6, 17, 0, 0, 62, 1, 0, 0, 0, 0, 0, 7, 0, 0, 0, -6815.25, 730.015, 40.9483, 2.39066, "Teleporter script"),
(900002, 0, 114, 0, 62, 0, 100, 0, 50000+6, 18, 0, 0, 62, 1, 0, 0, 0, 0, 0, 7, 0, 0, 0, 6658.57, -4553.48, 718.019, 5.18088, "Teleporter script"),
(900002, 0, 115, 0, 62, 0, 100, 0, 50000+7, 0, 0, 0, 62, 530, 0, 0, 0, 0, 0, 7, 0, 0, 0, -207.335, 2035.92, 96.464, 1.59676, "Teleporter script"),
(900002, 0, 116, 0, 62, 0, 100, 0, 50000+7, 1, 0, 0, 62, 530, 0, 0, 0, 0, 0, 7, 0, 0, 0, -220.297, 5378.58, 23.3223, 1.61718, "Teleporter script"),
(900002, 0, 117, 0, 62, 0, 100, 0, 50000+7, 2, 0, 0, 62, 530, 0, 0, 0, 0, 0, 7, 0, 0, 0, -2266.23, 4244.73, 1.47728, 3.68426, "Teleporter script"),
(900002, 0, 118, 0, 62, 0, 100, 0, 50000+7, 3, 0, 0, 62, 530, 0, 0, 0, 0, 0, 7, 0, 0, 0, -1610.85, 7733.62, -17.2773, 1.33522, "Teleporter script"),
(900002, 0, 119, 0, 62, 0, 100, 0, 50000+7, 4, 0, 0, 62, 530, 0, 0, 0, 0, 0, 7, 0, 0, 0, 2029.75, 6232.07, 133.495, 1.30395, "Teleporter script"),
(900002, 0, 120, 0, 62, 0, 100, 0, 50000+7, 5, 0, 0, 62, 530, 0, 0, 0, 0, 0, 7, 0, 0, 0, 3271.2, 3811.61, 143.153, 3.44101, "Teleporter script"),
(900002, 0, 121, 0, 62, 0, 100, 0, 50000+7, 6, 0, 0, 62, 530, 0, 0, 0, 0, 0, 7, 0, 0, 0, -3681.01, 2350.76, 76.587, 4.25995, "Teleporter script"),
(900002, 0, 122, 0, 62, 0, 100, 0, 50000+8, 0, 0, 0, 62, 571, 0, 0, 0, 0, 0, 7, 0, 0, 0, 2954.24, 5379.13, 60.4538, 2.55544, "Teleporter script"),
(900002, 0, 123, 0, 62, 0, 100, 0, 50000+8, 1, 0, 0, 62, 571, 0, 0, 0, 0, 0, 7, 0, 0, 0, 682.848, -3978.3, 230.161, 1.54207, "Teleporter script"),
(900002, 0, 124, 0, 62, 0, 100, 0, 50000+8, 2, 0, 0, 62, 571, 0, 0, 0, 0, 0, 7, 0, 0, 0, 2678.17, 891.826, 4.37494, 0.101121, "Teleporter script"),
(900002, 0, 125, 0, 62, 0, 100, 0, 50000+8, 3, 0, 0, 62, 571, 0, 0, 0, 0, 0, 7, 0, 0, 0, 4017.35, -3403.85, 290, 5.35431, "Teleporter script"),
(900002, 0, 126, 0, 62, 0, 100, 0, 50000+8, 4, 0, 0, 62, 571, 0, 0, 0, 0, 0, 7, 0, 0, 0, 5560.23, -3211.66, 371.709, 5.55055, "Teleporter script"),
(900002, 0, 127, 0, 62, 0, 100, 0, 50000+8, 5, 0, 0, 62, 571, 0, 0, 0, 0, 0, 7, 0, 0, 0, 5614.67, 5818.86, -69.722, 3.60807, "Teleporter script"),
(900002, 0, 128, 0, 62, 0, 100, 0, 50000+8, 6, 0, 0, 62, 571, 0, 0, 0, 0, 0, 7, 0, 0, 0, 5411.17, -966.37, 167.082, 1.57167, "Teleporter script"),
(900002, 0, 129, 0, 62, 0, 100, 0, 50000+8, 7, 0, 0, 62, 571, 0, 0, 0, 0, 0, 7, 0, 0, 0, 6120.46, -1013.89, 408.39, 5.12322, "Teleporter script"),
(900002, 0, 130, 0, 62, 0, 100, 0, 50000+8, 8, 0, 0, 62, 571, 0, 0, 0, 0, 0, 7, 0, 0, 0, 8323.28, 2763.5, 655.093, 2.87223, "Teleporter script"),
(900002, 0, 131, 0, 62, 0, 100, 0, 50000+8, 9, 0, 0, 62, 571, 0, 0, 0, 0, 0, 7, 0, 0, 0, 4522.23, 2828.01, 389.975, 0.215009, "Teleporter script");
]]
if not Q1 and not Q2 and not Q3 then
WorldDBExecute(executesq1)
WorldDBExecute(executesq2)
WorldDBExecute(executesq3)
WorldDBExecute(executesq4)
end

