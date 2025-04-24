StartMobAvoidance();
UseDBToRepair(true);
UseDBToSell(true);
SetQuestRepairAt(30);
SetQuestSellAt(2);
IgnoreLowLevelQuests(false);

AcceptQuestUsingDB(7003);
---- Obj Debug ---- .complete 7003,1
CompleteObjectiveOfQuest(7003,1);
TurnInQuestUsingDB(7003);
AcceptQuestUsingDB(7725);
---- Obj Debug ---- .complete 7725,1
CompleteObjectiveOfQuest(7725,1);
TurnInQuestUsingDB(7725);
StopQuestProfile();