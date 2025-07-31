StartMobAvoidance();
UseDBToRepair(true);
UseDBToSell(true);
SetQuestRepairAt(30);
SetQuestSellAt(2);
IgnoreLowLevelQuests(false);

TurnInQuestUsingDB(4521);
AcceptQuestUsingDB(4741); -- accept Wild Guardians
TurnInQuestUsingDB(5165);
TurnInQuestUsingDB(5203);
AcceptQuestUsingDB(5887); -- accept Salve via Hunting
TurnInQuestUsingDB(3942);
AcceptQuestUsingDB(4084); -- accept Silver Heart
CompleteObjectiveOfQuest(4084,2);
CompleteObjectiveOfQuest(5086,1);
CompleteObjectiveOfQuest(4084,1);
StopQuestProfile();