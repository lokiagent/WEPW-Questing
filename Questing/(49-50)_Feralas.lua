StartMobAvoidance();
UseDBToRepair(true);
UseDBToSell(true);
SetQuestRepairAt(30);
SetQuestSellAt(2);
IgnoreLowLevelQuests(false);

AcceptQuestUsingDB(3062); -- accept Dark Heart
AcceptQuestUsingDB(3063); -- accept Vengeance on the Northspring
AcceptQuestUsingDB(4120); -- accept The Strength of Corruption
AcceptQuestUsingDB(7734); -- accept Improved Quality
TurnInQuestUsingDB(3123);
AcceptQuestUsingDB(3124); -- accept Hippogryph Muisek
AcceptQuestUsingDB(3128); -- accept Natural Materials
---- Obj Debug ---- .complete 3124,1
CompleteObjectiveOfQuest(3124,1);
---- Obj Debug ---- .complete 3128,3
CompleteObjectiveOfQuest(3128,3);
---- Obj Debug ---- .complete 3128,4
CompleteObjectiveOfQuest(3128,4);
TurnInQuestUsingDB(3124);
AcceptQuestUsingDB(3125); -- accept Faerie Dragon Muisek
---- Obj Debug ---- .complete 3125,1
CompleteObjectiveOfQuest(3125,1);
---- Obj Debug ---- .complete 3128,2
CompleteObjectiveOfQuest(3128,2);
TurnInQuestUsingDB(3125);
AcceptQuestUsingDB(3126); -- accept Treant Muisek
---- Obj Debug ---- .complete 3126,1
CompleteObjectiveOfQuest(3126,1);
---- Obj Debug ---- .complete 3126,1
CompleteObjectiveOfQuest(3126,1);
---- Obj Debug ---- .complete 3126,1
CompleteObjectiveOfQuest(3126,1);
---- Obj Debug ---- .complete 3128,1
CompleteObjectiveOfQuest(3128,1);
TurnInQuestUsingDB(3126);
AcceptQuestUsingDB(3127); -- accept Mountain Giant Muisek
TurnInQuestUsingDB(3128);
AcceptQuestUsingDB(7003); -- accept Zapped Giants
AcceptQuestUsingDB(7721); -- accept Fuel for the Zapping
---- Obj Debug ---- .complete 7003,1
CompleteObjectiveOfQuest(7003,1);
---- Obj Debug ---- .complete 7721,1
CompleteObjectiveOfQuest(7721,1);
TurnInQuestUsingDB(7003);
TurnInQuestUsingDB(7721);
AcceptQuestUsingDB(7725); -- accept Again With the Zapped Giants
---- Obj Debug ---- .complete 7734,1
CompleteObjectiveOfQuest(7734,1);
---- Obj Debug ---- .complete 3127,1
CompleteObjectiveOfQuest(3127,1);
---- Obj Debug ---- .complete 3062,1
CompleteObjectiveOfQuest(3062,1);
---- Obj Debug ---- .complete 3063,1
CompleteObjectiveOfQuest(3063,1);
---- Obj Debug ---- .complete 3063,2
CompleteObjectiveOfQuest(3063,2);
---- Obj Debug ---- .complete 3063,3
CompleteObjectiveOfQuest(3063,3);
---- Obj Debug ---- .complete 3063,4
CompleteObjectiveOfQuest(3063,4);
TurnInQuestUsingDB(3444);
StopQuestProfile();