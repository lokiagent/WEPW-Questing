StartMobAvoidance();
UseDBToRepair(true);
UseDBToSell(true);
SetQuestRepairAt(30);
SetQuestSellAt(2);
IgnoreLowLevelQuests(false);

TurnInQuestUsingDB(4842);
TurnInQuestUsingDB(5086);
AcceptQuestUsingDB(5087); -- accept Winterfall Runners
CompleteObjectiveOfQuest(5087,1);
TurnInQuestUsingDB(5087);
TurnInQuestUsingDB(4084);
AcceptQuestUsingDB(4005); -- accept Aquementas
TurnInQuestUsingDB(3507);
StopQuestProfile();