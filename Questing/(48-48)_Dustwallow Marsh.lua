StartMobAvoidance();
UseDBToRepair(true);
UseDBToSell(true);
SetQuestRepairAt(30);
SetQuestSellAt(2);
IgnoreLowLevelQuests(false);

AcceptQuestUsingDB(1205); -- accept Deadmire
AcceptQuestUsingDB(1172); -- accept The Brood of Onyxia
---- Obj Debug ---- .complete 1205,1
CompleteObjectiveOfQuest(1205,1);
TurnInQuestUsingDB(2846);
---- Obj Debug ---- .complete 1172,1
CompleteObjectiveOfQuest(1172,1);
TurnInQuestUsingDB(625);
AcceptQuestUsingDB(626); -- accept Cortello's Riddle
TurnInQuestUsingDB(1172);
TurnInQuestUsingDB(1205);
---- Obj Debug ---- .complete 3444,1
CompleteObjectiveOfQuest(3444,1);
TurnInQuestUsingDB(32);
AcceptQuestUsingDB(649); -- accept Ripple Recovery
TurnInQuestUsingDB(649);
AcceptQuestUsingDB(650); -- accept Ripple Recovery
AcceptQuestUsingDB(4300); -- accept Bone-Bladed Weapons
StopQuestProfile();