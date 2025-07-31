StartMobAvoidance();
UseDBToRepair(true);
UseDBToSell(true);
SetQuestRepairAt(30);
SetQuestSellAt(2);
IgnoreLowLevelQuests(false);

AcceptQuestUsingDB(4726); -- accept Broodling Essence
AcceptQuestUsingDB(4296); -- accept Tablet of the Seven
TurnInQuestUsingDB(3821);
AcceptQuestUsingDB(4022); -- accept A Taste of Flame
CompleteObjectiveOfQuest(4022,1);
CompleteObjectiveOfQuest(4022,2);
TurnInQuestUsingDB(4022);
CompleteObjectiveOfQuest(4726,1);
CompleteObjectiveOfQuest(4296,1);
TurnInQuestUsingDB(4726);
AcceptQuestUsingDB(4808); -- accept Felnok Steelspring
TurnInQuestUsingDB(4296);
AcceptQuestUsingDB(4293); -- accept A Sample of Slime...
AcceptQuestUsingDB(4294); -- accept ... and a Batch of Ooze
AcceptQuestUsingDB(4494); -- accept March of the Silithid
AcceptQuestUsingDB(3504); -- accept Betrayed
TurnInQuestUsingDB(81);
TurnInQuestUsingDB(4300);
StopQuestProfile();