---Generated by profile builder---
---Avoidance thread Setup---
AddNameToAvoidWhiteList("Elder Mottled Boar")
AddNameToAvoidWhiteList("Venomtail Scorpid")
StartMobAvoidance()

--- Setting Waypoints ---
local Waypoints = {}
Waypoints[1] = {1239.976,-4675.843,17.02699}
Waypoints[2] = {1111.634,-4292.296,22.33069}
Waypoints[3] = {1145.858,-4094.85,18.58129}
Waypoints[4] = {786.5002,-3926.906,19.55322}

--- Setting Vendor ---
UseDBToRepair(false)
UseDBToSell(true)
local VendorIDs = {}
VendorIDs[1] = 3165

SetQuestRepairVendors(TableToList(VendorIDs))

local TargetNames = {}
TargetNames[1] = "Elder Mottled Boar" 
TargetNames[2] = "Venomtail Scorpid" 

GrindAndGatherPath(TableToStringList(TargetNames),TableToVecList(Waypoints),80)

ZoneProfiles["Durotar10-13"] = {
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