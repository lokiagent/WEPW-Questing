StartMobAvoidance();
UseDBToRepair(true);
UseDBToSell(true);
SetQuestRepairAt(30);
SetQuestSellAt(2);
IgnoreLowLevelQuests(false);

AcceptQuestUsingDB(3505); -- accept Betrayed
TurnInQuestUsingDB(3563);
TurnInQuestUsingDB(3562);
AcceptQuestUsingDB(3542); -- accept Delivery to Andron Gant
AcceptQuestUsingDB(3601); -- accept Kim'jael Indeed!
---- Obj Debug ---- .complete 3505,1
CompleteObjectiveOfQuest(3505,1);
---- Obj Debug ---- .complete 3505,2
CompleteObjectiveOfQuest(3505,2);
---- Obj Debug ---- .complete 3505,3
CompleteObjectiveOfQuest(3505,3);
TurnInQuestUsingDB(3505);
AcceptQuestUsingDB(3506); -- accept Betrayed
---- Obj Debug ---- .complete 3506,1
CompleteObjectiveOfQuest(3506,1);
---- Obj Debug ---- .complete 3601,1
CompleteObjectiveOfQuest(3601,1);
---- Obj Debug ---- .complete 3601,2
CompleteObjectiveOfQuest(3601,2);
---- Obj Debug ---- .complete 3601,3
CompleteObjectiveOfQuest(3601,3);
---- Obj Debug ---- .complete 3601,4
CompleteObjectiveOfQuest(3601,4);
TurnInQuestUsingDB(3601);
AcceptQuestUsingDB(5534); -- accept Kim'jael's "Missing" Equipment
---- Obj Debug ---- .complete 5534,1
CompleteObjectiveOfQuest(5534,1);
TurnInQuestUsingDB(5534);
TurnInQuestUsingDB(3506);
AcceptQuestUsingDB(3507); -- accept Betrayed
StopQuestProfile();