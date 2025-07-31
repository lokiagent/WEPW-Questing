StartMobAvoidance();
UseDBToRepair(true);
UseDBToSell(true);
SetQuestRepairAt(30);
SetQuestSellAt(2);
IgnoreLowLevelQuests(false);

AcceptQuestUsingDB(5155); -- accept Forces of Jaedenar
AcceptQuestUsingDB(5156); -- accept Verifying the Corruption
AcceptQuestUsingDB(4102); -- accept Cleansing Felwood
CompleteObjectiveOfQuest(5155,1);
CompleteObjectiveOfQuest(5155,2);
CompleteObjectiveOfQuest(5155,3);
CompleteObjectiveOfQuest(5155,4);
AcceptQuestUsingDB(4505); -- accept Well of Corruption
AcceptQuestUsingDB(6162); -- accept A Husband's Last Battle
CompleteObjectiveOfQuest(4505,1);
AcceptQuestUsingDB(8460); -- accept Timbermaw Ally
CompleteObjectiveOfQuest(6162,1);
CompleteObjectiveOfQuest(8460,1);
CompleteObjectiveOfQuest(8460,2);
CompleteObjectiveOfQuest(8460,3);
TurnInQuestUsingDB(8460);
AcceptQuestUsingDB(8462); -- accept Speak to Nafien
TurnInQuestUsingDB(5155);
AcceptQuestUsingDB(5157); -- accept Collection of the Corrupt Water
CompleteObjectiveOfQuest(5157,1);
CompleteObjectiveOfQuest(5156,3);
CompleteObjectiveOfQuest(5156,1);
CompleteObjectiveOfQuest(5156,2);
CompleteObjectiveOfQuest(4102,1);
CompleteObjectiveOfQuest(4120,1);
CompleteObjectiveOfQuest(4120,2);
TurnInQuestUsingDB(8462);
AcceptQuestUsingDB(8461); -- accept Deadwood of the North
CompleteObjectiveOfQuest(8461,1);
CompleteObjectiveOfQuest(8461,2);
CompleteObjectiveOfQuest(8461,3);
TurnInQuestUsingDB(8461);
AcceptQuestUsingDB(8465); -- accept Speak to Salfa
StopQuestProfile();