StartMobAvoidance();
UseDBToRepair(true);
UseDBToSell(true);
SetQuestRepairAt(30);
SetQuestSellAt(2);
IgnoreLowLevelQuests(false);

TurnInQuestUsingDB(5901);
AcceptQuestUsingDB(5902); -- accept A Plague Upon Thee
TurnInQuestUsingDB(5234);
AcceptQuestUsingDB(5235); -- accept Target: Gahrron's Withering
TurnInQuestUsingDB(964);
TurnInQuestUsingDB(5050);
AcceptQuestUsingDB(5051); -- accept Two Halves Become One
---- Obj Debug ---- .complete 5051,1
CompleteObjectiveOfQuest(5051,1);
TurnInQuestUsingDB(5051);
TurnInQuestUsingDB(5902);
AcceptQuestUsingDB(6390); -- accept A Plague Upon Thee
TurnInQuestUsingDB(5152);
AcceptQuestUsingDB(5153); -- accept A Strange Historian
---- Obj Debug ---- .complete 5153,1
CompleteObjectiveOfQuest(5153,1);
TurnInQuestUsingDB(5153);
AcceptQuestUsingDB(5154); -- accept The Annals of Darrowshire
---- Obj Debug ---- .complete 5154,1
CompleteObjectiveOfQuest(5154,1);
TurnInQuestUsingDB(5154);
AcceptQuestUsingDB(5210); -- accept Brother Carlin
TurnInQuestUsingDB(4985);
AcceptQuestUsingDB(4987); -- accept Glyphed Oaken Branch
---- Obj Debug ---- .complete 5235,1
CompleteObjectiveOfQuest(5235,1);
TurnInQuestUsingDB(5235);
AcceptQuestUsingDB(5236); -- accept Return to the Bulwark
TurnInQuestUsingDB(5236);
TurnInQuestUsingDB(6390);
AcceptQuestUsingDB(5238); -- accept Mission Accomplished!
TurnInQuestUsingDB(5210);
StopQuestProfile();