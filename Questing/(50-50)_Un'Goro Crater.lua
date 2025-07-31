StartMobAvoidance();
UseDBToRepair(true);
UseDBToSell(true);
SetQuestRepairAt(30);
SetQuestSellAt(2);
IgnoreLowLevelQuests(false);

AcceptQuestUsingDB(4289); -- accept The Apes of Un'Goro
AcceptQuestUsingDB(4290); -- accept The Fare of Lar'korwi
AcceptQuestUsingDB(3844); -- accept It's a Secret to Everybody
TurnInQuestUsingDB(3844);
AcceptQuestUsingDB(3845); -- accept It's a Secret to Everybody
---- Obj Debug ---- .complete 4290,1
CompleteObjectiveOfQuest(4290,1);
TurnInQuestUsingDB(4290);
AcceptQuestUsingDB(4291); -- accept The Scent of Lar'korwi
---- Obj Debug ---- .complete 4291,1
CompleteObjectiveOfQuest(4291,1);
TurnInQuestUsingDB(4291);
AcceptQuestUsingDB(4292); -- accept The Bait for Lar'korwi
---- Obj Debug ---- .complete 4300,1
CompleteObjectiveOfQuest(4300,1);
---- Obj Debug ---- .complete 3845,1
CompleteObjectiveOfQuest(3845,1);
---- Obj Debug ---- .complete 3845,2
CompleteObjectiveOfQuest(3845,2);
---- Obj Debug ---- .complete 3845,3
CompleteObjectiveOfQuest(3845,3);
TurnInQuestUsingDB(3845);
AcceptQuestUsingDB(3908); -- accept It's a Secret to Everybody
TurnInQuestUsingDB(3884);
AcceptQuestUsingDB(4284); -- accept Crystals of Power
TurnInQuestUsingDB(4284);
AcceptQuestUsingDB(3884); -- accept Williden's Journal
StopQuestProfile();