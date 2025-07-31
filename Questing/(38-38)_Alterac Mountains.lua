StartMobAvoidance();
UseDBToRepair(true);
UseDBToSell(true);
SetQuestRepairAt(30);
SetQuestSellAt(2);
IgnoreLowLevelQuests(false);

AcceptQuestUsingDB(545); -- accept Dalaran Patrols
AcceptQuestUsingDB(557); -- accept Bracers of Binding
AcceptQuestUsingDB(566); -- accept WANTED: Baron Vardus
AcceptQuestUsingDB(503); -- accept Gol'dir
TurnInQuestUsingDB(1712);
AcceptQuestUsingDB(1713); -- accept The Summoning
TurnInQuestUsingDB(1713);
---- Obj Debug ---- .complete 503,1
CompleteObjectiveOfQuest(503,1);
---- Obj Debug ---- .complete 503,2
CompleteObjectiveOfQuest(503,2);
TurnInQuestUsingDB(503);
AcceptQuestUsingDB(506); -- accept Blackmoore's Legacy
TurnInQuestUsingDB(506);
AcceptQuestUsingDB(507); -- accept Lord Aliden Perenolde
---- Obj Debug ---- .complete 1136,1
CompleteObjectiveOfQuest(1136,1);
---- Obj Debug ---- .complete 557,1
CompleteObjectiveOfQuest(557,1);
---- Obj Debug ---- .complete 545,1
CompleteObjectiveOfQuest(545,1);
---- Obj Debug ---- .complete 545,2
CompleteObjectiveOfQuest(545,2);
---- Obj Debug ---- .complete 507,1
CompleteObjectiveOfQuest(507,1);
TurnInQuestUsingDB(507);
AcceptQuestUsingDB(508); -- accept Taretha's Gift
---- Obj Debug ---- .complete 566,1
CompleteObjectiveOfQuest(566,1);
TurnInQuestUsingDB(545);
TurnInQuestUsingDB(557);
TurnInQuestUsingDB(566);
TurnInQuestUsingDB(508);
StopQuestProfile();