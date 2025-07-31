StartMobAvoidance();
UseDBToRepair(true);
UseDBToSell(true);
SetQuestRepairAt(30);
SetQuestSellAt(2);
IgnoreLowLevelQuests(false);

AcceptQuestUsingDB(4809); -- accept Chillwind Horns
AcceptQuestUsingDB(977); -- accept Are We There, Yeti?
---- Obj Debug ---- .complete 977,1
CompleteObjectiveOfQuest(977,1);
---- Obj Debug ---- .complete 4741,1
CompleteObjectiveOfQuest(4741,1);
TurnInQuestUsingDB(4741);
AcceptQuestUsingDB(4721); -- accept Wild Guardians
TurnInQuestUsingDB(977);
AcceptQuestUsingDB(5163); -- accept Are We There, Yeti?
---- Obj Debug ---- .complete 5163,1
CompleteObjectiveOfQuest(5163,1);
---- Obj Debug ---- .complete 4809,1
CompleteObjectiveOfQuest(4809,1);
AcceptQuestUsingDB(4882); -- accept Guarding Secrets
---- Obj Debug ---- .complete 4721,1
CompleteObjectiveOfQuest(4721,1);
TurnInQuestUsingDB(4809);
TurnInQuestUsingDB(1123);
AcceptQuestUsingDB(1124); -- accept Wasteland
AcceptQuestUsingDB(5527); -- accept A Reliquary of Purity
TurnInQuestUsingDB(4721);
TurnInQuestUsingDB(4882);
AcceptQuestUsingDB(4883); -- accept Guarding Secrets
TurnInQuestUsingDB(3564);
AcceptQuestUsingDB(7826); -- accept A Donation of Wool
AcceptQuestUsingDB(7827); -- accept A Donation of Silk
AcceptQuestUsingDB(7831); -- accept A Donation of Mageweave
AcceptQuestUsingDB(7824); -- accept A Donation of Runecloth
AcceptQuestUsingDB(7833); -- accept A Donation of Wool
AcceptQuestUsingDB(7834); -- accept A Donation of Silk
AcceptQuestUsingDB(7835); -- accept A Donation of Mageweave
AcceptQuestUsingDB(7836); -- accept A Donation of Runecloth
AcceptQuestUsingDB(8276); -- accept Taking Back Silithus
AcceptQuestUsingDB(7820); -- accept A Donation of Wool
AcceptQuestUsingDB(7821); -- accept A Donation of Silk
AcceptQuestUsingDB(7822); -- accept A Donation of Mageweave
AcceptQuestUsingDB(7823); -- accept A Donation of Runecloth
TurnInQuestUsingDB(4987);
TurnInQuestUsingDB(4883);
---- Obj Debug ---- .complete 5163,2
CompleteObjectiveOfQuest(5163,2);
---- Obj Debug ---- .complete 4005,1
CompleteObjectiveOfQuest(4005,1);
TurnInQuestUsingDB(4005);
AcceptQuestUsingDB(3961); -- accept Linken's Adventure
TurnInQuestUsingDB(3961);
---- Obj Debug ---- .complete 5163,3
CompleteObjectiveOfQuest(5163,3);
StopQuestProfile();