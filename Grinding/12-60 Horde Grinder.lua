--Default starting settings
UseDBToRepair()
UseDBToSell()
SetQuestRepairAt(30)
SetQuestSellAt(2)
StartMobAvoidance()
AllowTraining(true)
Player=GetPlayer()

--Global Blacklist
BlackListUnitGUID(F1300014A600C6BB)
BlackListUnitGUID(F130001235006BCE)
BlackListUnitGUID(F130001235006BCD)
BlackListUnitGUID(F130001314002289)
BlackListUnitGUID(F1300019A700229B)
BlackListUnitGUID(F130001313002296)
BlackListUnitGUID(F130005E9000228D)
BlackListUnitGUID(F13000130F002295)
BlackListUnitGUID(F1300039A2003B05)

--Zones & Targets
Barrens = {3267,3268,3939,3244,3415,3243}
Barrens14 = {3244,3415,3254,3242,3246,3255}
Midbarrens = {3242,3255,4127,3234,3248,3425}
BarrensRatchetNorth = {3248,3416,4127,3245,3256,3425,5766}
UppercampT = {3255,3426,3245,3234,3256}
CampT = {3463,3240,4129,3247}
lowercampT = {3466,3239,3463,3424}
LowerBarrens = {3238,4128,3249}
Ashenvale = {3824,3820}
Ashenvale2 = {3810,3820,3818,3825,3782,3834,3919}
DesolaceStart = {4692,4728,4696,11576,4689}
desolace33 = {4692,4726,4688,11576,4728}
DesolaceWest = {11577,4693,4729,4697,4727,4690}
FeralasStart = {5286,5268}
Feralas2 = {5260,5268,5307,5300,5304}
Tanaris = {5419,5420,5426,5429,5423,5422,5425}
Tanaris51 = {5421,5424,5474,5471,5427,5472,5465,5420,5475,5426,5429}
UnGoro55 = {6506,6505,9163,6507,6508,9683,9477}
Silithus1 = {11738,11735,11740,11744}

--Starting default variables
CurrentZone = 0
CurrentLevel = 0
radius = 250
SelectedFood = nil
skinning = false
skinningskill = 0
skinningapprentice = 75
skinningjourneyman = 150
skinningexpert = 225
skinningartisan = 300

--Level & Zone Table
ZoneList = {
    {Level = 13, Zone = Barrens, Vendor = 3934},
    {Level = 15, Zone = Barrens14, Vendor = 3934},
    {Level = 17, Zone = Midbarrens, Vendor = 7714},
    {Level = 18, Zone = BarrensRatchetNorth, Vendor = 6791},
    {Level = 19, Zone = UppercampT, Vendor = 7714},
    {Level = 21, Zone = CampT, Vendor = 7714},
    {Level = 24, Zone = lowercampT, Vendor = 7714},
    {Level = 26, Zone = LowerBarrens, Vendor = 7714},
    {Level = 28, Zone = Ashenvale, Vendor = 12196},
    {Level = 31, Zone = Ashenvale2, Vendor = 12196},
    {Level = 35, Zone = DesolaceStart, Vendor = 8152},
    {Level = 37, Zone = desolace33, Vendor = 12027},
    {Level = 40, Zone = DesolaceWest, Vendor = 12027},
    {Level = 43, Zone = FeralasStart, Vendor = 7737},
    {Level = 46, Zone = Feralas2, Vendor = 7737},
    {Level = 47, Zone = Tanaris, Vendor = 8139},
    {Level = 51, Zone = Tanaris51, Vendor = 8139},
    {Level = 54, Zone = UnGoro55, Vendor = 12959},
    {Level = 60, Zone = Silithus1, Vendor = 15174}
}
--Food & Water
5Food = {"Shiny Red Apple", "Tough Jerky", "Slitherskin Mackerel", "Forest Mushroom Cap", "Tough Hunk of Bread", "Darkmoon Dog", "Darnassian Bleu", "Bean Soup", "Candy Cane", "Holiday Spirits"}
15Food = {"Freshly Baked Bread", "Tel'Abim Banana", "Longjaw Mud Snapper", "Haunch of Meat", "Red-speckled Mushroom", "Deeprun Rat Kabob", "Dalaran Sharp", "Blended Bean Brew", "Spiced Beef Jerky"}
25Food = {"Mutton Chop", "Dwarven Mild", "Bristle Whisker Catfish", "Spongy Morel", "Snapvine Watermelon", "Moist Cornbread", "Pickled Kodo Foot", "Steamed Mandu"}
35Food = {"Wild Hog Shank", "Rockscale Cod", "Delicious Cave Mold", "Goldenbark Apple", "Graccu's Homemade Meat Pie", "Mulgore Spice Bread", "Red Hot Wings", "Stormwind Brie", "Wild Ricecake"}
45Food = {"Fine Aged Cheddar", "Cured Ham Steak", "Raw Black Truffle", "Soft Banana Bread", "Moon Harvest Pumpkin", "Striped Yellowtail", "Spicy Beefstick", "Darnassus Kimchi Pie", "Crunchy Frog", "Heaven Peach"}
55Food = {"Alterac Swiss", "Enriched Manna Biscuit", "Blessed Sunfruit", "Roasted Quail", "Deep Fried Plantains", "Spinefin Halibut", "Dried King Bolete", "Homemade Cherry Pie", "Grim Guzzler Boar", "Deep Fried Candybar", "Cabbage Kimchi", "Radish Kimchi", "Winter Kimchi", "Friendship Bread"}
60Food = "Alterac Mana Biscuit"
5Water = "Refreshing Spring Water"
15Water = "Ice Cold Milk"
25Water = "Melon Juice"
35Water = "Sweet Nectar"
45Water = "Moonberry Juice"
55Water = "Morning Glory Dew"
60Water = "Alterac Mana Biscuit"

--Functions
SkinningTrainer = 7088 -- "Thwud"
TrainingFlag = false
function GetZone()
    local PlayerLevel = Player.Level
    for i, zone in ipairs(ZoneList) do
        if PlayerLevel < zone.Level then
            return zone.Zone, zone.Level, zone.Vendor -- Return the zone, level, and vendor
        end
    end
    Log("No zone found for level " .. PlayerLevel)
    return nil, nil, nil -- Return nil if no zone is found
end
function SelectFood()
    if Player.Level < 5 then
        Food = 5Food
    elseif Player.Level < 15 then
        Food = 15Food
    elseif Player.Level < 25 then
        Food = 25Food
    elseif Player.Level < 35 then
        Food = 35Food
    elseif Player.Level < 45 then
        Food = 45Food
    elseif Player.Level < 55 then
        Food = 55Food
    else
        Food = 60Food
    end
    local maxCount = -1
    for i, item in ipairs(Food) do
        local count = ItemCount(item)
        if count > maxCount then
            maxCount = count
            SelectedFood = item
        end
        if count == 0 then
            Log("No food can be selected, please choose manually.")
            SelectedFood = nil
            return
        end
    end
    SetFood(SelectedFood, 40)
    Log ("Selected food: " .. SelectedFood)
end
function SelectWater()
    if Player.Level < 5 and then
        Water = 5Water
    elseif Player.Level < 15 then
        Water = 15Water
    elseif Player.Level < 25 then
        Water = 25Water
    elseif Player.Level < 35 then
        Water = 35Water
    elseif Player.Level < 45 then
        Water = 45Water
    elseif Player.Level < 55 then
        Water = 55Water
    elseif ItemCount(60Water) ~= 0 then
        Water = 60Water
    else
        Log("No water can be selected, please choose manually.")
        Water = nil
    end
    if Water ~= nil then
        SetWater(Water, 40)
    end
    Log("Selected water: " .. Water)
end
function OverrideFunction()
    local Zone = GetZone(Player.Level)
    if HasItem("Skinning Knife") and skinning ~= true then
        Log("Training Skinning skill")
        TrainingFlag = "Skinning"
        return false --False called to stop GrindAndGather call
    end
    if 
    if Player.Level == ZoneMaxLevel then
        Log("Finished with " .. Zone .. ", moving to next zone:" .. Zones[Zone+1])
        return false --False called to stop GrindAndGather call
    end
    if ItemCount(SelectedFood) < 5 or ItemCount(Water) < 5 then
        Log("Low on food or water, returning to vendor")
        return false --False called to stop GrindAndGather call
    end
    if TrainingFlag == "Class" or TrainingFlag == "class" then
        Log("Training Class skills")
        return false --False called to stop GrindAndGather call
    end
    return true --True called to continue GrindAndGather call
end
function SkinningStatus()
    local skill = GetSkill("Skinning")
    if skill ~= true then
        Log("Skinning skill not available, please train it.")
        return false
    end
    if skill == true and HasItem("Skinning Knife") then
        Log("Skinning skill available, ready to skin.")
        return true
    end
    if skill == true and not HasItem("Skinning Knife") then
        Log("Skinning skill available but no Skinning Knife found, please equip one.")
        return false
    end
    return false -- Default return if no conditions are met
end
function Training(TrainingFlag)
    if TrainingFlag == "Skinning" then
        Log("Training Skinning skill at " .. SkinningTrainer)
        while HasSkill("Skinning") ~= true do
            QuestTrainAt(SkinningTrainer) -- Example coordinates for Durotar
        end
        skinning = HasSkill("Skinning")
        Log("Skinning skill trained successfully.")
        TrainingFlag = false
    end
    if TrainingFlag == "Class" then
        Log("Training Class skills at nearest Class Trainer")
        TrainAtNearestClassTrainer()
        TrainingFlag = false
    end
    if TrainingFlag == false or TrainingFlag == nil then
        break -- Exit the loop if no training is needed
    end
end
function GodToFoodVendor()
    Log("Going to food vendor to restock food and water.")
    local VendorPosition = GetNPCPostionFromDB(Vendor)
    QuestGoToPoint(VendorPosition[0], VendorPosition[1], VendorPosition[2], false, true)
    for unit in VendorPosition do
        FindMeshPathToUnit(unit)
        InteractWithUnit(unit)
        RunLua("/run SelectGossipOption(2)")
        SleepPlugin(2000)
    end
end

--Get Target List
Targets, Level, Vendor = GetZone()
--Get Starting Position
StartingFloat = GetNPCPostionFromDB(Targets[1])
--Get Skinning status
skinning = SkinningStatus()

--Start GrindAndGather
GrindAndGather(TableToList(Targets),StartingFloat[1],StartingFloat[2],StartingFloat[3],radius,skinning,"OverrideFunction",true)
SelectFood()
SelectWater()
if ItemCount(SelectedFood) < 5 or ItemCount(Water) < 5 then
    GodToFoodVendor()
end
--End of Script
