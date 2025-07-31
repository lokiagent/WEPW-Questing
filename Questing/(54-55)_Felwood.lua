StartMobAvoidance();
UseDBToRepair(true);
UseDBToSell(true);
SetQuestRepairAt(30);
SetQuestSellAt(2);
IgnoreLowLevelQuests(false);

AcceptQuestUsingDB(4521); -- accept Wild Guardians
AcceptQuestUsingDB(4506); -- accept Corrupted Sabers
TurnInQuestUsingDB(5159);
AcceptQuestUsingDB(5165); -- accept Dousing the Flames of Protection
---- Obj Debug ---- .complete 5165,1
CompleteObjectiveOfQuest(5165,1);
---- Obj Debug ---- .complete 5165,4
CompleteObjectiveOfQuest(5165,4);
AcceptQuestUsingDB(5202); -- accept A Strange Red Key
TurnInQuestUsingDB(5202);
AcceptQuestUsingDB(5203); -- accept Rescue From Jaedenar
---- Obj Debug ---- .complete 5165,3
CompleteObjectiveOfQuest(5165,3);
---- Obj Debug ---- .complete 5165,2
CompleteObjectiveOfQuest(5165,2);
---- Obj Debug ---- .complete 4506,1
CompleteObjectiveOfQuest(4506,1);
TurnInQuestUsingDB(4506);
TurnInQuestUsingDB(5084);
AcceptQuestUsingDB(5085); -- accept Mystery Goo
StopQuestProfile();