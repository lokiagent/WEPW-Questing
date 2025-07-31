StartMobAvoidance();
UseDBToRepair(true);
UseDBToSell(true);
SetQuestRepairAt(30);
SetQuestSellAt(2);
IgnoreLowLevelQuests(false);

AcceptQuestUsingDB(1166); -- accept Overlord Mok'Morokk's Concern
AcceptQuestUsingDB(1169); -- accept Identifying the Brood
AcceptQuestUsingDB(1168); -- accept Army of the Black Dragon
CompleteObjectiveOfQuest(1205,1);
CompleteObjectiveOfQuest(1187,1);
CompleteObjectiveOfQuest(1261,1);
AcceptQuestUsingDB(2846); -- accept Tiara of the Deep
CompleteObjectiveOfQuest(1166,1);
CompleteObjectiveOfQuest(1166,2);
CompleteObjectiveOfQuest(1166,3);
CompleteObjectiveOfQuest(1168,3);
CompleteObjectiveOfQuest(1168,1);
CompleteObjectiveOfQuest(1168,2);
CompleteObjectiveOfQuest(1169,1);
CompleteObjectiveOfQuest(1169,2);
TurnInQuestUsingDB(1169);
AcceptQuestUsingDB(1170); -- accept The Brood of Onyxia
TurnInQuestUsingDB(1168);
TurnInQuestUsingDB(1170);
AcceptQuestUsingDB(1171); -- accept The Brood of Onyxia
TurnInQuestUsingDB(1166);
TurnInQuestUsingDB(1171);
TurnInQuestUsingDB(1261);
AcceptQuestUsingDB(1262); -- accept Report to Zor
StopQuestProfile();