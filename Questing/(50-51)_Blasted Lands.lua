StartMobAvoidance();
UseDBToRepair(true);
UseDBToSell(true);
SetQuestRepairAt(30);
SetQuestSellAt(2);
IgnoreLowLevelQuests(false);

AcceptQuestUsingDB(2623); -- accept The Swamp Talker
TurnInQuestUsingDB(1444);
---- Obj Debug ---- .complete 2623,1
CompleteObjectiveOfQuest(2623,1);
TurnInQuestUsingDB(2623);
AcceptQuestUsingDB(2801); -- accept A Tale of Sorrow
---- Obj Debug ---- .complete 2801,1
CompleteObjectiveOfQuest(2801,1);
TurnInQuestUsingDB(2801);
AcceptQuestUsingDB(2581); -- accept Snickerfang Jowls
AcceptQuestUsingDB(2583); -- accept A Boar's Vitality
AcceptQuestUsingDB(2585); -- accept The Decisive Striker
AcceptQuestUsingDB(2601); -- accept The Basilisk's Bite
AcceptQuestUsingDB(2603); -- accept Vulture's Vigor
AcceptQuestUsingDB(3501); -- accept Everything Counts In Large Amounts
TurnInQuestUsingDB(3501);
TurnInQuestUsingDB(2601);
TurnInQuestUsingDB(2603);
TurnInQuestUsingDB(2581);
TurnInQuestUsingDB(2583);
TurnInQuestUsingDB(2585);
StopQuestProfile();