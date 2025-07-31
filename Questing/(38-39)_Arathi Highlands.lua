StartMobAvoidance();
UseDBToRepair(true);
UseDBToSell(true);
SetQuestRepairAt(30);
SetQuestSellAt(2);
IgnoreLowLevelQuests(false);

TurnInQuestUsingDB(638);
AcceptQuestUsingDB(678); -- accept Call to Arms
AcceptQuestUsingDB(701); -- accept Guile of the Raptor
AcceptQuestUsingDB(642); -- accept The Princess Trapped
---- Obj Debug ---- .complete 642,1
CompleteObjectiveOfQuest(642,1);
TurnInQuestUsingDB(642);
AcceptQuestUsingDB(651); -- accept Stones of Binding
---- Obj Debug ---- .complete 651,2
CompleteObjectiveOfQuest(651,2);
---- Obj Debug ---- .complete 651,3
CompleteObjectiveOfQuest(651,3);
---- Obj Debug ---- .complete 678,2
CompleteObjectiveOfQuest(678,2);
---- Obj Debug ---- .complete 678,1
CompleteObjectiveOfQuest(678,1);
---- Obj Debug ---- .complete 701,1
CompleteObjectiveOfQuest(701,1);
TurnInQuestUsingDB(701);
AcceptQuestUsingDB(702); -- accept Guile of the Raptor
TurnInQuestUsingDB(702);
AcceptQuestUsingDB(847); -- accept Guile of the Raptor
TurnInQuestUsingDB(678);
TurnInQuestUsingDB(847);
---- Obj Debug ---- .complete 651,1
CompleteObjectiveOfQuest(651,1);
TurnInQuestUsingDB(651);
AcceptQuestUsingDB(663); -- accept Land Ho!
TurnInQuestUsingDB(663);
AcceptQuestUsingDB(662); -- accept Deep Sea Salvage
AcceptQuestUsingDB(664); -- accept Drowned Sorrows
AcceptQuestUsingDB(665); -- accept Sunken Treasure
---- Obj Debug ---- .complete 665,1
CompleteObjectiveOfQuest(665,1);
TurnInQuestUsingDB(665);
AcceptQuestUsingDB(666); -- accept Sunken Treasure
---- Obj Debug ---- .complete 662,2
CompleteObjectiveOfQuest(662,2);
---- Obj Debug ---- .complete 662,1
CompleteObjectiveOfQuest(662,1);
---- Obj Debug ---- .complete 662,3
CompleteObjectiveOfQuest(662,3);
---- Obj Debug ---- .complete 662,4
CompleteObjectiveOfQuest(662,4);
---- Obj Debug ---- .complete 666,1
CompleteObjectiveOfQuest(666,1);
---- Obj Debug ---- .complete 664,2
CompleteObjectiveOfQuest(664,2);
---- Obj Debug ---- .complete 664,1
CompleteObjectiveOfQuest(664,1);
TurnInQuestUsingDB(662);
TurnInQuestUsingDB(664);
TurnInQuestUsingDB(666);
AcceptQuestUsingDB(668); -- accept Sunken Treasure
TurnInQuestUsingDB(668);
AcceptQuestUsingDB(669); -- accept Sunken Treasure
StopQuestProfile();