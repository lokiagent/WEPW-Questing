UseDBToRepair(false)
Player = GetPlayer()
StormwindBattleMasterID = 7410
StormwindBattleMaster = "Thelman Slatefist"
IronforgeBattleMasterID = 12197
IronforgeBattleMaster = "Glordrum Steelbeard"
DarnassusBattleMasterID = 5118
DarnassusBattleMaster = "Brogun Stoneshield"
OrgrimmarBattleMasterID = 14942
OrgrimmarBattleMaster = "Kartra Bloodsnarl"
UndercityBattleMasterID = 347
UndercityBattleMaster = "Grizzle Halfmane"
ThunderBluffBattleMasterID = 7427
ThunderBluffBattleMaster = "Taim Ragetotem"
if Player:IsAlliance() == true then
    Faction = "Alliance"
else
    Faction = "Horde"
end
if Faction == "Alliance" then
    FactionBM = StormwindBattleMasterID
    FactionBMName = StormwindBattleMaster
    npcIDs = {12097, 10367, 13536, 13329, 13542, 13359, 13543, 13538, 13332, 12053, 10364, 12052, 14185, 13089}
else
    FactionBM = OrgrimmarBattleMasterID
    FactionBMName = OrgrimmarBattleMaster
    npcIDs = {13816, 12096, 12997, 13358, 13096, 5135, 14041, 5134, 13018, 14187, 13086, 13552, 12050, 13551}
end
-- Initialize AVBM and AVBMFloat
AVBM = {}
AVBM = GetNPCPostionFromDB(FactionBM)
local AVBMFloat = {}
AVBMFloat[1] = AVBM[0]
AVBMFloat[2] = AVBM[1]
AVBMFloat[3] = AVBM[2]


-- Override function
function Override()
    local Area = GetAreaID()
    if Area ~= 1459 then
        return false
    else
        return true
    end
end

-- Get queue information
entry = GetQueInfo1()
if not entry then
    Log("[BGBot] No queue entry!")
    return
end

state = entry:GetState()
if UnitHasAura(Player,"Deserter") == true then
    Log("You have the Deserter debuff, you cannot enter a battleground.")
    SleepPlugin(10000)
elseif state == 4 or state == "Active" then
    Log("In battleground, starting grind")
    Log("AreaID: " .. GetAreaID() .. "MapID: " .. GetMapID() .. "ZoneID: " .. GetZoneID())
    --local startingPoint = GetNPCPostionFromDB(12096)
    --at<-1079.014,-225.1515,60.34335> saved
    local startingPoint = {}
    startingPoint[1] = -1079.014
    startingPoint[2] = -225.1515
    startingPoint[3] = 60.34335
    local startingFloat = TableToFloatArray(startingPoint)
    --local npcIDs = {13816, 12096, 12997, 13358, 13096, 5135, 14041, 5134, 13018, 14187, 13086, 13552, 12050, 13551}
    GrindAndGather(TableToList(npcIDs), 10000, startingFloat, false, "Override", false)

elseif state == 2 or state == "Waiting" then
    Log("Ready to enter battleground")
    RunLua("/click PVPReadyDialogEnterBattleButton")
    UseMacro(BGAccept)
    local acceptBG = GetQueInfo1()
    local bgInfo = acceptBG:GetInfo()
    local mapIDs = bgInfo:MapIds()
    local name = bgInfo:Name()
    Log("AreaID: " .. GetAreaID() .. "MapID: " .. GetMapID() .. "ZoneID: " .. GetZoneID())
    Log("You are entering " .. name .. ". On MapID " .. mapIDs)

elseif state == 1 or state == "Queued" then
    Log("Waiting for AV Queue")
    local queue = GetQueInfo1()
    local queueTime = queue:Elapsed()
    Log("Elapsed time is " .. queueTime)
    SleepPlugin(1000)

elseif state == 0 or state == "None" then
    if HasItem("Alterac Valley Mark of Honor") >= 3 then
        if HasPlayerFinishedQuest(8369) == true then
            CompleteEntireQuest(8387)
        else
            CompleteEntireQuest(8369)
        end
    end
    Log("Queue state: " .. state)
    Log("Queuing for Battleground")
    QuestGoToPoint(AVBMFloat[1],AVBMFloat[2],AVBMFloat[3],false,true)
    local unit = FindUnitByName(FactionBMName)
    if unit then
        local checkQueuedState = 0
        while checkQueuedState == 0 do
        FindMeshPathToUnit(unit)
        TargetUnit(unit)
        InteractWithUnit(unit)
        RunLua("/script SelectGossipOption(1)")
        SleepPlugin(1000) -- Wait for the Battlefield frame to open
        --UseMacro(Gossip1)
        RunLua("/click BattlefieldFrameJoinButton")
        Log("Waiting in AV Queue")
        local checkQueued = GetQueInfo1()
        checkQueuedState = checkQueued:GetState()
            if checkQueuedState == 1 then
                Log("Queued for Battleground")
                Log("Queue state: " .. checkQueuedState)
            elseif checkQueuedState == 0 then
                Log("Not queued for Battleground, retrying...")
                -- Optional delay to prevent spamming
                SleepPlugin(500) -- Replace with a valid wait function if available
            end
        end
    else
        Log("Error: " .. FactionBMName .. " not found.")
        BOT = "NotInQue"
        entry = GetQueInfo1()
        Log("Queue state: " .. state)
    end
end
