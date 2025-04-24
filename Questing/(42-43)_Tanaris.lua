StartMobAvoidance();
UseDBToRepair(true);
UseDBToSell(true);
SetQuestRepairAt(30);
SetQuestSellAt(2);
IgnoreLowLevelQuests(false);

AcceptQuestUsingDB(654);
AcceptQuestUsingDB(654);
CompleteObjectiveOfQuest(654,1);
AcceptQuestUsingDB(654);
CompleteObjectiveOfQuest(654,2);
AcceptQuestUsingDB(654);
CompleteObjectiveOfQuest(654,3);
TurnInQuestUsingDB(654);
AcceptQuestUsingDB(864);
StopQuestProfile();