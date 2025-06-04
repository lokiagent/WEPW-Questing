ZoneProfiles = {
    ["Barrens13-16"] = {
        Waypoints = {
            {-409.7565,-2840.666,94.25677},
            {-694.605,-2809.554,95.65337}
        },
        VendorIDs = {3486},
        TargetNames = {"Zhevra Runner", "Sunscale Screecher", "Fleeting Plainstrider", "Sunscale Lashtail", "Greater Plainstrider", "Savannah Huntress"},
        MinLevel = 13,
        MaxLevel = 16,
        Range = 80
    },
    ["Barrens16-21"] = {
        Waypoints = {
            {569.0314,-1818.443,92.62054},
            {647.8192,-1951.777,93.26044}
        },
        VendorIDs = {3682},
        TargetNames = {"Zhevra Charger", "Ornery Plainstrider", "Savannah Patriarch", "Sunscale Scytheclaw"},
        MinLevel = 16,
        MaxLevel = 21,
        Range = 80
    },
    ["Barrens21-25"] = {
        Waypoints = {
            {-2479.396,-2282.147,93.53313},
            {-2616.538,-2004.369,93.41865},
            {-2535.269,-1819.184,92.89848}
        },
        VendorIDs = {10380},
        TargetNames = {"Zhevra Courser", "Thunderhead", "Thunderhawk Cloudscraper"},
        MinLevel = 21,
        MaxLevel = 25,
        Range = 80
    }
}
UseDBToRepair(true)
UseDBToSell(false)
SetQuestRepairAt(30)
SetQuestSellAt(2)
StartMobAvoidance()
AllowTraining(true)
Player=GetPlayer()
-- Global Blacklist --
BlackListUnitGUID(F1300014A600C6BB)
BlackListUnitGUID(F130001235006BCE)
BlackListUnitGUID(F130001235006BCD)
BlackListUnitGUID(F130001314002289)
BlackListUnitGUID(F1300019A700229B)
BlackListUnitGUID(F130001313002296)
BlackListUnitGUID(F130005E9000228D)
BlackListUnitGUID(F13000130F002295)
BlackListUnitGUID(F1300039A2003B05)

-- Functions --
function GetZoneProfile()
    for name, profile in pairs(ZoneProfiles) do
        if Player.Level >= profile.MinLevel and Player.Level <= profile.MaxLevel then
            return profile
        end
    end
    return nil
end
function SelectFoodandWater()
    local foodWaterTable = {
        {level = 5,  food = "Tough Hunk of Bread", water = "Refreshing Spring Water"},
        {level = 15, food = "Freshly Baked Bread", water = "Ice Cold Milk"},
        {level = 25, food = "Moist Cornbread", water = "Melon Juice"},
        {level = 35, food = "Mulgore Spice Bread", water = "Sweet Nectar"},
        {level = 45, food = "Soft Banana Bread", water = "Moonberry Juice"},
        {level = 55, food = "Friendship Bread", water = "Morning Glory Dew"},
        {level = 60, food = "Alterac Mana Biscuit", water = "Alterac Mana Biscuit"}
    }
    local Food, Water
    for _, entry in ipairs(foodWaterTable) do
        if Player.Class ~= "Warrior" and Player.Class ~= "Rogue" and Player.Class ~= "Hunter" then
            if Player.Level < entry.level then
                Food = entry.food
                Water = entry.water
                SetFood(Food, 40)
                SetWater(Water, 40)
            end
        elseif Player.Level < entry.level then
            Food = entry.food
            Water = nil -- Warriors, Rogues, and Hunters do not require water
            SetFood(Food, 40)
            SetWater(nil, nil)
        end
    end
end
function Override()
    if ItemCount(Water) < 5 or ItemCount(Food) < 5 then
        Override = "Food"
        return false
    end
    if Player.Level == Zone.MaxLevel then
        Override = "Level"
        return false
    end
    if Override == "Stop" then
        return false
    end
        if Player.Level == 13 then
        Override = "MaxLevel"
        return false
    end
    Override = nil
    return true
end
function SellAtVendor(VendorID)
    local Vendor = GetNPCPostionFromDB(VendorID)
    QuestGoToPoint(Vendor[0],Vendor[1],Vendor[2],false,true)
    local Units = GetUnitsList()
    for unit in Units do
        if unit.ID == VendorID then
            print("Found vendor: " .. unit.Name)
            FindMeshPathToUnit(unit)
            InteractWithUnit(unit)
            SleepPlugin(3000)
        end
    else
        print("Error: " .. unit.Name .. " not found.")
    end
end
function Skinning()
    local skill = GetSkill("Skinning")
    if skill ~= true then
        Log("Skinning skill not available, please train it.")
        return false
    end
    if skill == true and HasItem("Skinning Knife") then
        Log("Skinning skill available, ready to skin.")
        return true
    end
    if skill == true and HasItem("Skinning Knife") == false then
        Log("Skinning skill available but no Skinning Knife found, please equip one.")
        return false
    end
    return false -- Default return if no conditions are met
end
--Grind cycle--
Zone = GetZoneProfile()
if Override == "Food" then
    SellAtVendor()
    Override = nil
elseif Override == "Level" then
    TrainAtNearestTrainer()
    Override = nil
elseif Override == "Stop" then
    UseItem("Hearthstone")
    SleepPlugin(15000)
    StopQuestProfile()
    Override = nil
elseif Override == "MaxLevel" then
    Log("Reached maximum level for this zone, stopping profile.")
    LoadQuestProfile("Grinding\\Horde-Zach\\Ashenvale%2025-35.lua")
    Override = nil
elseif Override == nil then
    SkinningFlag = Skinning()
    --GrindAndGatherPath(List<string> Names, List<Vector3> Waypoints, int TargetRadius = 80, bool SkinMobs = false, string OverRide)
    GrindAndGatherPath(TableToList(Zone.TargetNames), TableToVecList(Zone.Waypoints), Zone.Range, SkinningFlag, "Override")
end