-- Zone Profiles --
ZoneProfiles = {
    ["Durotar1-3"] = {
        Waypoints = {
            {-422.769,-4296.835,44.44546},
            {-405.6567,-4212.864,54.68137},
            {-596.7441,-4364.921,41.20194}
        },
        VendorIDs = {3160},
        TargetNames = {"Mottled Boar"},
        MinLevel = 1,
        MaxLevel = 3,
        Range = 80
    },
    ["Durotar3-5"] = {
        Waypoints = {
            {-411.3607,-4097.119,50.73689},
            {-220.2734,-4217.403,60.44237},
            {-334.3555,-4433.006,55.1583}
        },
        VendorIDs = {3160},
        TargetNames = {"Scorpid Worker"},
        MinLevel = 3,
        MaxLevel = 5,
        Range = 80
    },
    ["Durotar5-10"] = {
        Waypoints = {
            {-508.3306,-4775.701,36.42898},
            {-257.3499,-4873.29,29.07109},
            {-49.1504,-4877.828,19.47404},
            {84.89589,-5023.077,10.49025},
            {-194.6051,-5063.928,21.58897}
        },
        VendorIDs = {10369},
        TargetNames = {"Kul Tiras Sailor", "Kul Tiras Marine", "Clattering Scorpid"},
        MinLevel = 5,
        MaxLevel = 10,
        Range = 80
    },
    ["Durotar10-13"] = {
        Waypoints = {
            {1239.976,-4675.843,17.02699},
            {1111.634,-4292.296,22.33069},
            {1145.858,-4094.85,18.58129},
            {786.5002,-3926.906,19.55322}
        },
        VendorIDs = {3165},
        TargetNames = {"Elder Mottled Boar", "Venomtail Scorpid"},
        MinLevel = 10,
        MaxLevel = 13,
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
if Override == "Food" then
    SellAtVendor()
    Override = nil
elseif Override == "Level" then
    for _, target in Zone.TargetNames do
        RemoveNameFromAvoidWhiteList(target)
    end
    TrainAtNearestTrainer()
    Override = nil
elseif Override == "Stop" then
    UseItem("Hearthstone")
    SleepPlugin(15000)
    StopQuestProfile()
    Override = nil
elseif Override == "MaxLevel" then
    Log("Reached maximum level for this zone, stopping profile.")
    LoadQuestProfile("Grinding\\Horde-Zach\\Barrens%2013-20.lua")
    Override = nil
elseif Override == nil then
    Zone = GetZoneProfile()
    SkinningFlag = Skinning()
    for _, target in Zone.TargetNames do
        AddNameToAvoidWhiteList(target)
    end
    --GrindAndGatherPath(List<string> Names, List<Vector3> Waypoints, int TargetRadius = 80, bool SkinMobs = false, string OverRide)
    GrindAndGatherPath(TableToList(Zone.TargetNames), TableToFloat(Zone.Waypoints), Zone.Range, SkinningFlag, "Override")
end