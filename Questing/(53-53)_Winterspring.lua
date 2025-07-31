StartMobAvoidance();
UseDBToRepair(true);
UseDBToSell(true);
SetQuestRepairAt(30);
SetQuestSellAt(2);
IgnoreLowLevelQuests(false);

TurnInQuestUsingDB(7066);
TurnInQuestUsingDB(8465);
TurnInQuestUsingDB(3908);
AcceptQuestUsingDB(5082); -- accept Threat of the Winterfall
---- Obj Debug ---- .complete 5082,3
CompleteObjectiveOfQuest(5082,3);
---- Obj Debug ---- .complete 5082,1
CompleteObjectiveOfQuest(5082,1);
---- Obj Debug ---- .complete 5082,2
CompleteObjectiveOfQuest(5082,2);
AcceptQuestUsingDB(5083); -- accept Winterfall Firewater
TurnInQuestUsingDB(5082);
TurnInQuestUsingDB(5083);
AcceptQuestUsingDB(5084); -- accept Falling to Corruption
AcceptQuestUsingDB(3909); -- accept The Videre Elixir
TurnInQuestUsingDB(4808);
StopQuestProfile();