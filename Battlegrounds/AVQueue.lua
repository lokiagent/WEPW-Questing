-- Get Player info
UseDBToRepair(false)
Player = GetPlayer()
entry = GetQueInfo1()
----BlackListPoints----
BlackListPoint(-185.5141,-399.0058,14.98006,20)
BlackListPoint(-164.3019,-405.6448,0,20)
BlackListPoint(-143.0899,-429.9878,0,20)
BlackListPoint(-182.4838,-421.1358,0,20)
BlackListPoint(-224.908,-412.2838,0,20)
BlackListPoint(-209.7565,-454.3309,27.85686,20)
BlackListPoint(-164.3019,-458.7569,49.2913,20)
BlackListPoint(-243.0898,-427.7748,20.64892,20)
BlackListPoint(-173.3929,-494.1649,0,20)
BlackListPoint(-233.9989,-476.4609,0,20)
BlackListPoint(-243.0898,-456.5438,29.23934,20)
BlackListPoint(-106.7262,-454.3309,26.44338,20)
BlackListPoint(-82.4838,-416.7098,18.41362,20)
BlackListPoint(-112.7868,-489.7389,32.08698,20)
BlackListPoint(307.8606,-400.1205,11.02554,20)
BlackListPoint(644.9474,-357.7662,50.44614,20)
BlackListPoint(650.5125,-354.4058,33.13669,20)
BlackListPoint(654.9985,-355.9453,31.15319,20)
-- Target options:
Drek = {11946} --Drek'Thar
Vanndar = {11948} --Vanndar Stormpike
HordeNPCs = {12097, 10367, 13536, 13329, 13542, 13359, 13543, 13538, 13332, 12053, 10364, 12052, 14185, 13089} --Horde NPCs
AllianceNPCs = {13816, 12096, 12997, 13358, 13096, 5135, 14041, 5134, 13018, 14187, 13086, 13552, 12050, 13551} --Alliance NPCs
Wildpaw = {11838, 11839, 11837, 10991, 11840, 11677} --Wildpaw Gnolls
Snowblind = {11675, 10986, 11678} --Snowblind Harpies
Whitewhisker = {11605, 11604, 11603, 10982} --Whitewhisker Gnolls
Irondeep = {11602, 11600, 10987} --Irondeep Troggs

-- Choose targets from the list above
npcIDs = TableToList(Vanndar)

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
    else
        return StormwindBattleMasterID, StormwindBattleMaster
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
    if IsPvpComplete() == true or
       UnitHasAura(Player, "Ghost", false) or
       UnitHasAura(Player, "Preparation") or
       GetAreaID() ~= 1459 then
        return false
    end
    while Player:InCombat() == false 
    and Player:IsMounted() == false 
    and GetCurrentPathSize() > 5 
    and GetTargetUnit() == nil do
        StopMoving()
        SleepPlugin() --Wait for buffs or effects to wear off
        UseMacro("MountMe")
    end
    return true
end

function DeadBot()
    Log("Player is dead.")
    while UnitHasAura(Player, "Ghost", false) do
        StopMoving()
    end 
end
function PreMatchPrep()
    Log("Player is in Pre-Match preparation")
    while  UnitHasAura(Player, "Preparation") do
        local HordeMainGate = {-868.0319, -562.9142, 57.14179}
        local AllianceMainGate = {798.5951, -493.4344, 99.67441}
        if Faction == "Alliance" then
            QuestGoToPoint(AllianceMainGate[1],AllianceMainGate[2],AllianceMainGate[3], false, true)
        else
            QuestGoToPoint(HordeMainGate[1],HordeMainGate[2],HordeMainGate[3], false, true)
        end
    end
    local HordeMountableArea = {-885.4476,-528.1896,54.09409}
    local AllianceMountableArea = {763.9349,-490.5696,97.48938}
    if Faction == "Alliance" then
        QuestGoToPoint(AllianceMountableArea[1],AllianceMountableArea[2],AllianceMountableArea[3], false, true)
    else
        QuestGoToPoint(HordeMountableArea[1],HordeMountableArea[2],HordeMountableArea[3], false, true)
    end
    UseMacro("MountMe")
end
function MarkTurnIn()
    local unitslist = GetUnitsList()
    if AreaID ~= 1459 then
        if Faction == "Alliance" then
            local MarkofHonor = 15351
            local MarkofHonorName = "Alliance Brigadier General"
        else
            local MarkofHonor = 8387
            local MarkofHonorName = "Horde Warbringer"
        end --faction check
        while ItemCount("Alterac Valley Mark of Honor") >= 3 do
            if Faction == "Horde" then
                QuestGoToPoint(1971.815, -4793.429, 56.76123, false, true)
                QuestGoToPoint(1970.817, -4801.953, 56.76451, false, true)
                QuestGoToPoint(1980.079, -4809.797, 56.76451, false, true)
                Log("You have at least 3 Alterac Valley Mark of Honor, turning in quest.")
                foreach unit in unitslist do
                    if unit:Name() == "Horde Warbringer" then
                        FindMeshPathToUnit(unit)
                        Path()
                        TargetUnit(unit)
                        InteractWithUnit(unit)
                        SleepPlugin(2000)
                    end -- turn in
                end -- foreach
            end -- if horde
            if Faction == "Horde" then
                QuestGoToPoint(1980.079, -4809.797, 56.76451, false, true)
                QuestGoToPoint(1970.817, -4801.953, 56.76451, false, true)
                QuestGoToPoint(1971.815, -4793.429, 56.76123, false, true)
            end
            if Faction == "Alliance" then
                QuestGoToPoint(-8440.335,312.7079,120.8858, false, true)
                QuestGoToPoint(-8443.32,314.2846,120.8858, false, true)
                QuestGoToPoint(-8441.301,314.1023,120.8858 false, true)
                Log("You have at least 3 Alterac Valley Mark of Honor, turning in quest.")
                foreach unit in unitslist do
                    if unit:Name() == "Alliance Brigadier General" then
                        FindMeshPathToUnit(unit)
                        Path()
                        TargetUnit(unit)
                        InteractWithUnit(unit)
                        SleepPlugin(2000)
                    end -- turn in
                end -- foreach
            end -- faction check
        end -- while
    end -- if areaid
end -- function

-- Handle queue states
local function handleQueueState()
    entry = GetQueInfo1()
    local state = entry:GetState()
    if UnitHasAura(Player, "Deserter") then
        SetBOTState("Deserter")
        Log("You have the Deserter debuff, you cannot enter a battleground.")
        SleepPlugin(10000)
    elseif UnitHasAura(Player, "Ghost", false) then
        DeadBot()
    elseif UnitHasAura(Player, "Preparation") then
        PreMatchPrep()
    elseif state == 4 or state == "Active" then
        SetBOTState("InBattleground")
        Log("In battleground, starting grind")
        local targetMessages = {
            [Vanndar[1]] = "Go norf, kill dorf",
            [Drek[1]] = "Go south, kill orc",
            [HordeNPCs[1]] = "Go south, kill horde NPCs",
            [AllianceNPCs[1]] = "Go north, kill alliance NPCs",
            [Wildpaw[1]] = "Wildpaw Gnolls? Why aren't you rushing towers?",
            [Snowblind[1]] = "Snowblind Harpies? Those are cursed boobies. No touch.",
            [Whitewhisker[1]] = "Whitewhisker Gnolls? Why aren't you rushing towers?",
            [Irondeep[1]] = "Irondeep Troggs? Why aren't you rushing towers?"
        }
        local targetMessage = targetMessages[GetTargetUnit()]
        Log(targetMessage)
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
        Log("Queuing for Battleground")
        SleepPlugin(5000)
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
    elseif IsPvpComplete() == true then
        SetBOTState("PvpComplete")
        local Winner = GetPvpVictor()
        if Winner == 0 then
            Log("Horde has won the battleground.")
        elseif Winner == 1 then
            Log("Alliance has won the battleground.")
        else
            Log("No winner determined.")
        end
        Log("You have completed the battleground, leaving now.")
        LeaveBG()
    end
end
function LeaveBG()
    if IsPvpComplete() == true then
        RunLua("/click WorldStateScoreFrameLeaveButton")
        Log("Leaving Battleground")
    end
end
-- Start handling queue state

MarkTurnIn()
handleQueueState()
LeaveBG()
