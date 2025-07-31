StartMobAvoidance();
UseDBToRepair(true);
UseDBToSell(true);
SetQuestRepairAt(30);
SetQuestSellAt(2);
IgnoreLowLevelQuests(false);

AcceptQuestUsingDB(5535); -- accept Spiritual Unrest
AcceptQuestUsingDB(5536); -- accept A Land Filled with Hatred
CompleteObjectiveOfQuest(5535,1);
CompleteObjectiveOfQuest(5535,2);
CompleteObjectiveOfQuest(5536,1);
CompleteObjectiveOfQuest(5536,2);
CompleteObjectiveOfQuest(5536,3);
TurnInQuestUsingDB(5535);
TurnInQuestUsingDB(5536);
TurnInQuestUsingDB(3504);
AcceptQuestUsingDB(3517); -- accept Stealing Knowledge
CompleteObjectiveOfQuest(3517,3);
CompleteObjectiveOfQuest(3517,1);
CompleteObjectiveOfQuest(3517,2);
CompleteObjectiveOfQuest(3517,4);
CompleteObjectiveOfQuest(3568,1);
CompleteObjectiveOfQuest(3568,2);
CompleteObjectiveOfQuest(3568,3);
CompleteObjectiveOfQuest(3568,4);
TurnInQuestUsingDB(3517);
AcceptQuestUsingDB(3518); -- accept Delivery to Magatha
AcceptQuestUsingDB(3541); -- accept Delivery to Jes'rimon
AcceptQuestUsingDB(3561); -- accept Delivery to Archmage Xylem
TurnInQuestUsingDB(3561);
AcceptQuestUsingDB(3565); -- accept Xylem's Payment to Jediga
TurnInQuestUsingDB(3565);
StopQuestProfile();