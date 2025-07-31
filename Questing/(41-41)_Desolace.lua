StartMobAvoidance();
UseDBToRepair(true);
UseDBToSell(true);
SetQuestRepairAt(30);
SetQuestSellAt(2);
IgnoreLowLevelQuests(false);

AcceptQuestUsingDB(5581); -- accept Portals of the Legion
TurnInQuestUsingDB(1373);
AcceptQuestUsingDB(1374); -- accept Khan Jehn
CompleteObjectiveOfQuest(1374,1);
AcceptQuestUsingDB(6134); -- accept Ghost-o-plasm Round Up
AcceptQuestUsingDB(1488); -- accept The Corrupter
CompleteObjectiveOfQuest(6134,1);
CompleteObjectiveOfQuest(5581,1);
CompleteObjectiveOfQuest(5581,1);
CompleteObjectiveOfQuest(5581,1);
CompleteObjectiveOfQuest(5581,1);
CompleteObjectiveOfQuest(5581,1);
CompleteObjectiveOfQuest(5581,1);
CompleteObjectiveOfQuest(1488,2);
CompleteObjectiveOfQuest(1488,1);
TurnInQuestUsingDB(1488);
TurnInQuestUsingDB(6134);
TurnInQuestUsingDB(1374);
TurnInQuestUsingDB(5581);
StopQuestProfile();