StartMobAvoidance();
UseDBToRepair(true);
UseDBToSell(true);
SetQuestRepairAt(30);
SetQuestSellAt(2);
IgnoreLowLevelQuests(false);

AcceptQuestUsingDB(1036);
AcceptQuestUsingDB(9272);
TurnInQuestUsingDB(1036);
AcceptQuestUsingDB(4621);
---- Obj Debug ---- .complete 4621,1
CompleteObjectiveOfQuest(4621,1);
---- Obj Debug ---- .complete 4621,2
CompleteObjectiveOfQuest(4621,2);
TurnInQuestUsingDB(4621);
StopQuestProfile();