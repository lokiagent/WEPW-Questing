StartMobAvoidance();
UseDBToRepair(true);
UseDBToSell(true);
SetQuestRepairAt(30);
SetQuestSellAt(2);
IgnoreLowLevelQuests(false);

TurnInQuestUsingDB(1061);
AcceptQuestUsingDB(1062); -- accept Goblin Invaders
AcceptQuestUsingDB(6548); -- accept Avenge My Village
CompleteObjectiveOfQuest(6548,1);
CompleteObjectiveOfQuest(6548,2);
TurnInQuestUsingDB(6548);
AcceptQuestUsingDB(6629); -- accept Kill Grundig Darkcloud
CompleteObjectiveOfQuest(6629,1);
CompleteObjectiveOfQuest(6629,2);
AcceptQuestUsingDB(6523); -- accept Protect Kaya
CompleteObjectiveOfQuest(6523,1);
AcceptQuestUsingDB(6461); -- accept Blood Feeders
CompleteObjectiveOfQuest(6461,1);
TurnInQuestUsingDB(1483);
AcceptQuestUsingDB(1093); -- accept Super Reaper 6000
CompleteObjectiveOfQuest(1069,1);
CompleteObjectiveOfQuest(6461,2);
CompleteObjectiveOfQuest(1093,1);
CompleteObjectiveOfQuest(1062,1);
TurnInQuestUsingDB(1093);
AcceptQuestUsingDB(1094); -- accept Further Instructions
StopQuestProfile();