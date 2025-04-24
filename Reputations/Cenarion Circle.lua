StartMobAvoidance();
UseDBToRepair(true);
UseDBToSell(true);
SetQuestRepairAt(30);
SetQuestSellAt(2);
IgnoreLowLevelQuests(false);

AcceptQuestUsingDB(8318);
---- Obj Debug ---- .complete 8318,1
CompleteObjectiveOfQuest(8318,1);
TurnInQuestUsingDB(8318);
StopQuestProfile();