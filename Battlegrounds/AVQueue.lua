UseDBToRepair(false)
Player = GetPlayer()
entry = GetQueInfo1()

-- Target options:
Drek = {11946} --Drek'Thar
Vanndar = {11948} --Vanndar Stormpike
HordeNPCs = {12097, 10367, 13536, 13329, 13542, 13359, 13543, 13538, 13332, 12053, 10364, 12052, 14185, 13089} --Horde NPCs
AllianceNPCs = {13816, 12096, 12997, 13358, 13096, 5135, 14041, 5134, 13018, 14187, 13086, 13552, 12050, 13551}
Wildpaw = {11838, 11839, 11837, 10991, 11840, 11677} --Wildpaw Gnolls
Snowblind = {11675, 10986, 11678} --Snowblind Harpies
Whitewhisker = {11605, 11604, 11603, 10982} --Whitewhisker Gnolls
Irondeep = {11602, 11600, 10987} --Irondeep Troggs

-- Choose targets from the list above
npcIDs = TableToList(AllianceNPCs)

-- List Battleground Masters and their IDs
StormwindBattleMasterID = 7410
StormwindBattleMaster = "Thelman Slatefist"
OrgrimmarBattleMasterID = 14942
OrgrimmarBattleMaster = "Kartra Bloodsnarl"

-- Determine faction
Faction = Player:IsAlliance() and "Alliance" or "Horde"

-- Assign Battle Master based on faction
local function assignBattleMaster()
    if Faction == "Horde" then
        return OrgrimmarBattleMasterID, OrgrimmarBattleMaster
    elseif Faction == "Alliance" then
        return StormwindBattleMasterID, StormwindBattleMaster
    else
        Log("Error: Invalid faction configuration.")
        return nil, nil
    end
end

FactionBM, FactionBMName = assignBattleMaster()

-- Get location of the Battleground Master
local function getBattleMasterLocation()
    local position = GetNPCPostionFromDB(FactionBM)
    return {position[0], position[1], position[2]}
end

AVBMFloat = getBattleMasterLocation()

-- Override function
function Override()
    local QueueStatus = entry:GetState()
    if QueueStatus ~= 4 then
        RunLua("/click WorldStateScoreFrameLeaveButton")
        return false
    end

    if UnitHasAura(Player, "Ghost", false) or UnitHasAura(Player, "Preparation") then
        StopMoving()
        Log("Player is dead or in Pre-Match preparation, stopping movement for 15 seconds.")
        SleepPlugin(15000)
    end
    return true
end

-- Handle queue states
local function handleQueueState()
    entry = GetQueInfo1()
    local state = entry:GetState()
    if UnitHasAura(Player, "Deserter") then
        SetBOTState("Deserter")
        Log("You have the Deserter debuff, you cannot enter a battleground.")
        SleepPlugin(10000)
    elseif state == 4 or state == "Active" then
        SetBOTState("InBattleground")
        Log("In battleground, starting grind")
        local startingPoint = {-1079.014, -225.1515, 60.34335}
        GrindAndGather(npcIDs, 10000, TableToFloatArray(startingPoint), false, "Override", false)
    elseif state == 2 or state == "Waiting" then
        SetBOTState("EnteringBattleground")
        Log("Ready to enter battleground")
        RunLua("/click PVPReadyDialogEnterBattleButton")
        local bgInfo = GetQueInfo1():GetInfo()
        Log("You are entering " .. bgInfo:Name() .. ". On MapID " .. bgInfo:MapIds())
    elseif state == 1 or state == "Queued" then
        SetBOTState("InQueue")
        Log("Waiting for AV Queue")
        Log("Elapsed time is " .. entry:Elapsed())
        SleepPlugin(1000)
    elseif state == 0 or state == "None" then
        SetBOTState("NotInQue")
        if HasItem("Alterac Valley Mark of Honor") >= 3 then
            Log("You have at least 3 Alterac Valley Mark of Honor, turning in quest.")
            TurnInQuestUsingDB(HasPlayerFinishedQuest(8369) and 8387 or 8369)
        end
        Log("Queuing for Battleground")
        QuestGoToPoint(AVBMFloat[1], AVBMFloat[2], AVBMFloat[3], false, true)
        local unit = FindUnitByName(FactionBMName)
        if unit then
            local checkQueuedState = 0
            while checkQueuedState == 0 do
            FindMeshPathToUnit(unit)
            TargetUnit(unit)
            InteractWithUnit(unit)
            RunLua("/run SelectGossipOption(1)")
            UseMacro(gossip1)
            SleepPlugin(1000)
            RunLua("/click BattlefieldFrameJoinButton")
            Log("Waiting in AV Queue")
            checkQueuedState = GetQueInfo1():GetState()
            if checkQueuedState == 1 then
                Log("Queued for Battleground")
            elseif checkQueuedState == 0 then
                Log("Not queued for Battleground, retrying...")
                SleepPlugin(500)
            end
        end
        else
            Log("Error: " .. FactionBMName .. " not found.")
        end
    end
end

-- Start handling queue state
handleQueueState()
