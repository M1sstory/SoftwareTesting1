#ifdef PEG
struct T_SRC {
	char *fl; int ln;
} T_SRC[NTRANS];

void
tr_2_src(int m, char *file, int ln)
{	T_SRC[m].fl = file;
	T_SRC[m].ln = ln;
}

void
putpeg(int n, int m)
{	printf("%5d	trans %4d ", m, n);
	printf("%s:%d\n",
		T_SRC[n].fl, T_SRC[n].ln);
}
#endif

void
settable(void)
{	Trans *T;
	Trans *settr(int, int, int, int, int, char *, int, int, int);

	trans = (Trans ***) emalloc(9*sizeof(Trans **));

	/* proctype 7: never_0 */

	trans[7] = (Trans **) emalloc(14*sizeof(Trans *));

	trans[7][6]	= settr(263,0,5,1,0,".(goto)", 0, 2, 0);
	T = trans[7][5] = settr(262,0,0,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(262,0,1,0,0,"DO", 0, 2, 0);
	    T->nxt	= settr(262,0,3,0,0,"DO", 0, 2, 0);
	trans[7][1]	= settr(258,0,10,3,0,"(!((tioa_tdma_state==1)))", 1, 2, 0);
	trans[7][2]	= settr(259,0,10,1,0,"goto accept_S4", 0, 2, 0);
	trans[7][3]	= settr(260,0,5,1,0,"(1)", 0, 2, 0);
	trans[7][4]	= settr(261,0,5,1,0,"goto T0_init", 0, 2, 0);
	trans[7][7]	= settr(264,0,10,1,0,"break", 0, 2, 0);
	trans[7][11]	= settr(268,0,10,1,0,".(goto)", 0, 2, 0);
	T = trans[7][10] = settr(267,0,0,0,0,"DO", 0, 2, 0);
	    T->nxt	= settr(267,0,8,0,0,"DO", 0, 2, 0);
	trans[7][8]	= settr(265,0,10,4,0,"(!((tioa_tdma_state==1)))", 1, 2, 0);
	trans[7][9]	= settr(266,0,10,1,0,"goto accept_S4", 0, 2, 0);
	trans[7][12]	= settr(269,0,13,1,0,"break", 0, 2, 0);
	trans[7][13]	= settr(270,0,0,5,5,"-end-", 0, 3500, 0);

	/* proctype 6: onPacketReceive */

	trans[6] = (Trans **) emalloc(78*sizeof(Trans *));

	T = trans[ 6][76] = settr(256,2,0,0,0,"ATOMIC", 1, 2, 0);
	T->nxt	= settr(256,2,1,0,0,"ATOMIC", 1, 2, 0);
	trans[6][1]	= settr(181,2,6,6,0,"printf('****Receiving PACKET %d',receivedPacket.processId)", 1, 2, 0);
	T = trans[6][6] = settr(186,2,0,0,0,"IF", 1, 2, 0);
	T = T->nxt	= settr(186,2,2,0,0,"IF", 1, 2, 0);
	    T->nxt	= settr(186,2,4,0,0,"IF", 1, 2, 0);
	trans[6][2]	= settr(182,2,13,7,7,"((controlPacket[receivedPacket.processId].msg.members<4))", 1, 2, 0); /* m: 3 -> 13,0 */
	reached6[3] = 1;
	trans[6][3]	= settr(0,0,0,0,0,"controlPacket[receivedPacket.processId].msg.members = (controlPacket[receivedPacket.processId].msg.members+1)",0,0,0);
	trans[6][7]	= settr(187,2,13,1,0,".(goto)", 1, 2, 0);
	trans[6][4]	= settr(184,2,5,2,0,"else", 1, 2, 0);
	trans[6][5]	= settr(185,2,13,1,0,"(1)", 1, 2, 0);
	T = trans[6][13] = settr(193,2,0,0,0,"IF", 1, 2, 0);
	T = T->nxt	= settr(193,2,8,0,0,"IF", 1, 2, 0);
	    T->nxt	= settr(193,2,11,0,0,"IF", 1, 2, 0);
	trans[6][8]	= settr(188,2,20,8,8,"(1)", 1, 2, 0); /* m: 9 -> 20,0 */
	reached6[9] = 1;
	trans[6][9]	= settr(0,0,0,0,0,"ck[receivedPacket.processId].member[receivedPacket.processId] = controlPacket[receivedPacket.processId].msg.members",0,0,0);
	trans[6][10]	= settr(0,0,0,0,0,"printf('$$$$Updating ck of %d when received from %d---own',receivedPacket.processId,receivedPacket.processId)",0,0,0);
	trans[6][14]	= settr(194,2,20,1,0,".(goto)", 1, 2, 0);
	trans[6][11]	= settr(191,2,12,2,0,"else", 1, 2, 0);
	trans[6][12]	= settr(192,2,20,1,0,"(1)", 1, 2, 0);
	T = trans[6][20] = settr(200,2,0,0,0,"IF", 1, 2, 0);
	T = T->nxt	= settr(200,2,15,0,0,"IF", 1, 2, 0);
	    T->nxt	= settr(200,2,18,0,0,"IF", 1, 2, 0);
	trans[6][15]	= settr(195,2,36,9,9,"(1)", 1, 2, 0); /* m: 16 -> 36,0 */
	reached6[16] = 1;
	trans[6][16]	= settr(0,0,0,0,0,"ck[receivedPacket.processId].member[receivedPacket.msg.id] = controlPacket[receivedPacket.msg.id].msg.members",0,0,0);
	trans[6][17]	= settr(0,0,0,0,0,"printf('$$$Updating ck of %d when received from %d---sender',receivedPacket.processId,receivedPacket.msg.id)",0,0,0);
	trans[6][21]	= settr(201,2,22,1,0,".(goto)", 1, 2, 0); /* m: 22 -> 0,36 */
	reached6[22] = 1;
	trans[6][18]	= settr(198,2,19,2,0,"else", 1, 2, 0);
	trans[6][19]	= settr(199,2,36,10,10,"(1)", 1, 2, 0); /* m: 22 -> 36,0 */
	reached6[22] = 1;
	trans[6][22]	= settr(202,2,36,11,11,"m = 0", 1, 2, 0);
	trans[6][37]	= settr(217,2,36,1,0,".(goto)", 1, 2, 0);
	T = trans[6][36] = settr(216,2,0,0,0,"DO", 1, 2, 0);
	T = T->nxt	= settr(216,2,23,0,0,"DO", 1, 2, 0);
	    T->nxt	= settr(216,2,34,0,0,"DO", 1, 2, 0);
	trans[6][23]	= settr(203,2,30,12,12,"((m<=3))", 1, 2, 0); /* m: 24 -> 30,0 */
	reached6[24] = 1;
	trans[6][24]	= settr(0,0,0,0,0,"n = 0",0,0,0);
	trans[6][31]	= settr(211,2,30,1,0,".(goto)", 1, 2, 0);
	T = trans[6][30] = settr(210,2,0,0,0,"DO", 1, 2, 0);
	T = T->nxt	= settr(210,2,25,0,0,"DO", 1, 2, 0);
	    T->nxt	= settr(210,2,28,0,0,"DO", 1, 2, 0);
	trans[6][25]	= settr(205,2,30,13,13,"((n<=3))", 1, 2, 0); /* m: 26 -> 30,0 */
	reached6[26] = 1;
	trans[6][26]	= settr(0,0,0,0,0,"printf('|%d',ck[m].member[n])",0,0,0);
	trans[6][27]	= settr(0,0,0,0,0,"n = (n+1)",0,0,0);
	trans[6][28]	= settr(208,2,33,2,0,"else", 1, 2, 0);
	trans[6][29]	= settr(209,2,33,1,0,"goto :b8", 1, 2, 0); /* m: 33 -> 0,36 */
	reached6[33] = 1;
	trans[6][32]	= settr(212,2,33,1,0,"break", 1, 2, 0);
	trans[6][33]	= settr(213,2,36,14,14,"m = (m+1)", 1, 2, 0);
	trans[6][34]	= settr(214,2,39,2,0,"else", 1, 2, 0);
	trans[6][35]	= settr(215,2,39,1,0,"goto :b7", 1, 2, 0); /* m: 39 -> 0,62 */
	reached6[39] = 1;
	trans[6][38]	= settr(218,2,39,1,0,"break", 1, 2, 0);
	trans[6][39]	= settr(219,2,62,15,15,"commonKnowledgeState[receivedPacket.msg.id] = receivedPacket.msg.state", 1, 2, 0); /* m: 40 -> 0,62 */
	reached6[40] = 1;
	trans[6][40]	= settr(0,0,0,0,0,"printf('~~~~~In On Receive--before for')",0,0,0);
	trans[6][41]	= settr(0,0,0,0,0,"m = 0",0,0,0);
	trans[6][63]	= settr(243,2,62,1,0,".(goto)", 1, 2, 0);
	T = trans[6][62] = settr(242,2,0,0,0,"DO", 1, 2, 0);
	T = T->nxt	= settr(242,2,42,0,0,"DO", 1, 2, 0);
	    T->nxt	= settr(242,2,60,0,0,"DO", 1, 2, 0);
	trans[6][42]	= settr(222,2,56,16,16,"((m<=3))", 1, 2, 0); /* m: 43 -> 56,0 */
	reached6[43] = 1;
	trans[6][43]	= settr(0,0,0,0,0,"n = 0",0,0,0);
	trans[6][57]	= settr(237,2,56,1,0,".(goto)", 1, 2, 0);
	T = trans[6][56] = settr(236,2,0,0,0,"DO", 1, 2, 0);
	T = T->nxt	= settr(236,2,44,0,0,"DO", 1, 2, 0);
	    T->nxt	= settr(236,2,54,0,0,"DO", 1, 2, 0);
	trans[6][44]	= settr(224,2,51,17,0,"((n<=3))", 1, 2, 0);
	T = trans[6][51] = settr(231,2,0,0,0,"IF", 1, 2, 0);
	T = T->nxt	= settr(231,2,45,0,0,"IF", 1, 2, 0);
	    T->nxt	= settr(231,2,48,0,0,"IF", 1, 2, 0);
	trans[6][45]	= settr(225,2,56,18,18,"((ck[m].member[n]==4))", 1, 2, 0); /* m: 46 -> 56,0 */
	reached6[46] = 1;
	trans[6][46]	= settr(0,0,0,0,0,"counter = (counter+1)",0,0,0);
	trans[6][47]	= settr(0,0,0,0,0,"printf('\\nin onreceive::::Insidee for \\nCount: %d\\n',counter)",0,0,0);
	trans[6][52]	= settr(232,2,53,1,0,".(goto)", 1, 2, 0); /* m: 53 -> 0,56 */
	reached6[53] = 1;
	trans[6][48]	= settr(228,2,49,2,0,"else", 1, 2, 0);
	trans[6][49]	= settr(229,2,50,19,0,"printf('In else\\ns')", 1, 2, 0);
	trans[6][50]	= settr(230,2,56,20,20,"(1)", 1, 2, 0); /* m: 53 -> 56,0 */
	reached6[53] = 1;
	trans[6][53]	= settr(233,2,56,21,21,"n = (n+1)", 1, 2, 0);
	trans[6][54]	= settr(234,2,59,2,0,"else", 1, 2, 0);
	trans[6][55]	= settr(235,2,59,1,0,"goto :b10", 1, 2, 0); /* m: 59 -> 0,62 */
	reached6[59] = 1;
	trans[6][58]	= settr(238,2,59,1,0,"break", 1, 2, 0);
	trans[6][59]	= settr(239,2,62,22,22,"m = (m+1)", 1, 2, 0);
	trans[6][60]	= settr(240,2,65,2,0,"else", 1, 2, 0);
	trans[6][61]	= settr(241,2,65,1,0,"goto :b9", 1, 2, 0); /* m: 65 -> 0,72 */
	reached6[65] = 1;
	trans[6][64]	= settr(244,2,65,1,0,"break", 1, 2, 0);
	trans[6][65]	= settr(245,2,72,23,23,"printf('Count is ::: %d',counter)", 1, 2, 0);
	T = trans[6][72] = settr(252,2,0,0,0,"IF", 1, 2, 0);
	T = T->nxt	= settr(252,2,66,0,0,"IF", 1, 2, 0);
	    T->nxt	= settr(252,2,69,0,0,"IF", 1, 2, 0);
	trans[6][66]	= settr(246,4,77,24,24,"((counter==16))", 1, 2, 0); /* m: 67 -> 77,0 */
	reached6[67] = 1;
	trans[6][67]	= settr(0,0,0,0,0,"tioa_tdma_state = 1",0,0,0);
	trans[6][68]	= settr(0,0,0,0,0,"printf('\\n~~~~~~Going to TDMA, Count = %d\\n',counter)",0,0,0);
	trans[6][73]	= settr(253,2,74,1,0,".(goto)", 1, 2, 0); /* m: 74 -> 0,77 */
	reached6[74] = 1;
	trans[6][69]	= settr(249,2,70,2,0,"else", 1, 2, 0);
	trans[6][70]	= settr(250,4,77,25,25,"tioa_tdma_state = 0", 1, 2, 0); /* m: 71 -> 0,77 */
	reached6[71] = 1;
	trans[6][71]	= settr(0,0,0,0,0,"printf('\\n~~~~~~Going to Aloha, Count = %d\\n',counter)",0,0,0);
	trans[6][74]	= settr(254,4,77,26,26,"commonKnowledgeState[receivedPacket.msg.id] = tioa_tdma_state", 1, 2, 0); /* m: 75 -> 0,77 */
	reached6[75] = 1;
	trans[6][75]	= settr(0,0,0,0,0,"counter = 0",0,0,0);
	trans[6][77]	= settr(257,0,0,27,27,"-end-", 0, 3500, 0);

	/* proctype 5: receive */

	trans[5] = (Trans **) emalloc(31*sizeof(Trans *));

	trans[5][28]	= settr(178,0,27,1,0,".(goto)", 0, 2, 0);
	T = trans[5][27] = settr(177,0,0,0,0,"DO", 0, 2, 0);
	    T->nxt	= settr(177,0,25,0,0,"DO", 0, 2, 0);
	T = trans[5][25] = settr(175,0,0,0,0,"IF", 0, 2, 0);
	T = T->nxt	= settr(175,0,1,0,0,"IF", 0, 2, 0);
	T = T->nxt	= settr(175,0,3,0,0,"IF", 0, 2, 0);
	T = T->nxt	= settr(175,0,5,0,0,"IF", 0, 2, 0);
	T = T->nxt	= settr(175,0,7,0,0,"IF", 0, 2, 0);
	T = T->nxt	= settr(175,0,9,0,0,"IF", 0, 2, 0);
	T = T->nxt	= settr(175,0,11,0,0,"IF", 0, 2, 0);
	T = T->nxt	= settr(175,0,13,0,0,"IF", 0, 2, 0);
	T = T->nxt	= settr(175,0,15,0,0,"IF", 0, 2, 0);
	T = T->nxt	= settr(175,0,17,0,0,"IF", 0, 2, 0);
	T = T->nxt	= settr(175,0,19,0,0,"IF", 0, 2, 0);
	T = T->nxt	= settr(175,0,21,0,0,"IF", 0, 2, 0);
	    T->nxt	= settr(175,0,23,0,0,"IF", 0, 2, 0);
	trans[5][1]	= settr(151,0,2,28,28,"P0P1?receivedPacket.processId,receivedPacket.msg.id,receivedPacket.msg.state,receivedPacket.msg.members,receivedPacket.msg.time", 1, 503, 0);
	trans[5][2]	= settr(152,0,27,29,29,"(run onPacketReceive(receivedPacket.processId,receivedPacket.msg.id,receivedPacket.msg.state,receivedPacket.msg.members,receivedPacket.msg.time))", 0, 2, 0);
	trans[5][26]	= settr(176,0,27,1,0,".(goto)", 0, 2, 0);
	trans[5][3]	= settr(153,0,4,30,30,"P0P2?receivedPacket.processId,receivedPacket.msg.id,receivedPacket.msg.state,receivedPacket.msg.members,receivedPacket.msg.time", 1, 504, 0);
	trans[5][4]	= settr(154,0,27,31,31,"(run onPacketReceive(receivedPacket.processId,receivedPacket.msg.id,receivedPacket.msg.state,receivedPacket.msg.members,receivedPacket.msg.time))", 0, 2, 0);
	trans[5][5]	= settr(155,0,6,32,32,"P0P3?receivedPacket.processId,receivedPacket.msg.id,receivedPacket.msg.state,receivedPacket.msg.members,receivedPacket.msg.time", 1, 505, 0);
	trans[5][6]	= settr(156,0,27,33,33,"(run onPacketReceive(receivedPacket.processId,receivedPacket.msg.id,receivedPacket.msg.state,receivedPacket.msg.members,receivedPacket.msg.time))", 0, 2, 0);
	trans[5][7]	= settr(157,0,8,34,34,"P1P0?receivedPacket.processId,receivedPacket.msg.id,receivedPacket.msg.state,receivedPacket.msg.members,receivedPacket.msg.time", 1, 506, 0);
	trans[5][8]	= settr(158,0,27,35,35,"(run onPacketReceive(receivedPacket.processId,receivedPacket.msg.id,receivedPacket.msg.state,receivedPacket.msg.members,receivedPacket.msg.time))", 0, 2, 0);
	trans[5][9]	= settr(159,0,10,36,36,"P1P2?receivedPacket.processId,receivedPacket.msg.id,receivedPacket.msg.state,receivedPacket.msg.members,receivedPacket.msg.time", 1, 507, 0);
	trans[5][10]	= settr(160,0,27,37,37,"(run onPacketReceive(receivedPacket.processId,receivedPacket.msg.id,receivedPacket.msg.state,receivedPacket.msg.members,receivedPacket.msg.time))", 0, 2, 0);
	trans[5][11]	= settr(161,0,12,38,38,"P1P3?receivedPacket.processId,receivedPacket.msg.id,receivedPacket.msg.state,receivedPacket.msg.members,receivedPacket.msg.time", 1, 508, 0);
	trans[5][12]	= settr(162,0,27,39,39,"(run onPacketReceive(receivedPacket.processId,receivedPacket.msg.id,receivedPacket.msg.state,receivedPacket.msg.members,receivedPacket.msg.time))", 0, 2, 0);
	trans[5][13]	= settr(163,0,14,40,40,"P2P0?receivedPacket.processId,receivedPacket.msg.id,receivedPacket.msg.state,receivedPacket.msg.members,receivedPacket.msg.time", 1, 509, 0);
	trans[5][14]	= settr(164,0,27,41,41,"(run onPacketReceive(receivedPacket.processId,receivedPacket.msg.id,receivedPacket.msg.state,receivedPacket.msg.members,receivedPacket.msg.time))", 0, 2, 0);
	trans[5][15]	= settr(165,0,16,42,42,"P2P1?receivedPacket.processId,receivedPacket.msg.id,receivedPacket.msg.state,receivedPacket.msg.members,receivedPacket.msg.time", 1, 510, 0);
	trans[5][16]	= settr(166,0,27,43,43,"(run onPacketReceive(receivedPacket.processId,receivedPacket.msg.id,receivedPacket.msg.state,receivedPacket.msg.members,receivedPacket.msg.time))", 0, 2, 0);
	trans[5][17]	= settr(167,0,18,44,44,"P2P3?receivedPacket.processId,receivedPacket.msg.id,receivedPacket.msg.state,receivedPacket.msg.members,receivedPacket.msg.time", 1, 511, 0);
	trans[5][18]	= settr(168,0,27,45,45,"(run onPacketReceive(receivedPacket.processId,receivedPacket.msg.id,receivedPacket.msg.state,receivedPacket.msg.members,receivedPacket.msg.time))", 0, 2, 0);
	trans[5][19]	= settr(169,0,20,46,46,"P3P0?receivedPacket.processId,receivedPacket.msg.id,receivedPacket.msg.state,receivedPacket.msg.members,receivedPacket.msg.time", 1, 512, 0);
	trans[5][20]	= settr(170,0,27,47,47,"(run onPacketReceive(receivedPacket.processId,receivedPacket.msg.id,receivedPacket.msg.state,receivedPacket.msg.members,receivedPacket.msg.time))", 0, 2, 0);
	trans[5][21]	= settr(171,0,22,48,48,"P3P1?receivedPacket.processId,receivedPacket.msg.id,receivedPacket.msg.state,receivedPacket.msg.members,receivedPacket.msg.time", 1, 513, 0);
	trans[5][22]	= settr(172,0,27,49,49,"(run onPacketReceive(receivedPacket.processId,receivedPacket.msg.id,receivedPacket.msg.state,receivedPacket.msg.members,receivedPacket.msg.time))", 0, 2, 0);
	trans[5][23]	= settr(173,0,24,50,50,"P3P2?receivedPacket.processId,receivedPacket.msg.id,receivedPacket.msg.state,receivedPacket.msg.members,receivedPacket.msg.time", 1, 514, 0);
	trans[5][24]	= settr(174,0,27,51,51,"(run onPacketReceive(receivedPacket.processId,receivedPacket.msg.id,receivedPacket.msg.state,receivedPacket.msg.members,receivedPacket.msg.time))", 0, 2, 0);
	trans[5][29]	= settr(179,0,30,1,0,"break", 0, 2, 0);
	trans[5][30]	= settr(180,0,0,52,52,"-end-", 0, 3500, 0);

	/* proctype 4: failureDetector */

	trans[4] = (Trans **) emalloc(23*sizeof(Trans *));

	trans[4][1]	= settr(129,0,19,53,53,"m = 0", 0, 2, 0);
	trans[4][20]	= settr(148,0,19,1,0,".(goto)", 0, 2, 0);
	T = trans[4][19] = settr(147,0,0,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(147,0,2,0,0,"DO", 0, 2, 0);
	    T->nxt	= settr(147,0,17,0,0,"DO", 0, 2, 0);
	trans[4][2]	= settr(130,0,14,54,0,"((m<=3))", 0, 2, 0);
	T = trans[4][14] = settr(142,0,0,0,0,"IF", 0, 2, 0);
	    T->nxt	= settr(142,0,3,0,0,"IF", 0, 2, 0);
	trans[4][3]	= settr(131,0,6,55,0,"((controlPacket[m].msg.members>=m))", 1, 2, 0);
	T = trans[4][6] = settr(134,0,0,0,0,"IF", 0, 2, 0);
	    T->nxt	= settr(134,0,4,0,0,"IF", 0, 2, 0);
	trans[4][4]	= settr(132,0,5,56,0,"((state==commonKnowledgeState[m]))", 1, 2, 0);
	trans[4][5]	= settr(133,0,12,57,57,"missingMessages[m] = (missingMessages[m]+1)", 1, 2, 0);
	trans[4][7]	= settr(135,0,12,1,0,".(goto)", 0, 2, 0);
	T = trans[4][12] = settr(140,0,0,0,0,"IF", 0, 2, 0);
	    T->nxt	= settr(140,0,8,0,0,"IF", 0, 2, 0);
	trans[4][8]	= settr(136,0,9,58,0,"((missingMessages[m]>4))", 1, 2, 0);
	trans[4][9]	= settr(137,0,10,59,59,"controlPacket[m].msg.members = (controlPacket[m].msg.members&~((1<<m)))", 1, 2, 0);
	trans[4][10]	= settr(138,0,11,60,60,"missingMessages[m] = 0", 1, 2, 0);
	trans[4][11]	= settr(139,0,16,61,61,"commonKnowledgeState[m] = 0", 1, 2, 0);
	trans[4][13]	= settr(141,0,16,1,0,".(goto)", 0, 2, 0); /* m: 16 -> 0,19 */
	reached4[16] = 1;
	trans[4][15]	= settr(143,0,16,1,0,".(goto)", 0, 2, 0); /* m: 16 -> 0,19 */
	reached4[16] = 1;
	trans[4][16]	= settr(144,0,19,62,62,"m = (m+1)", 0, 2, 0);
	trans[4][17]	= settr(145,0,22,2,0,"else", 0, 2, 0);
	trans[4][18]	= settr(146,0,22,1,0,"goto :b5", 0, 2, 0);
	trans[4][21]	= settr(149,0,22,1,0,"break", 0, 2, 0);
	trans[4][22]	= settr(150,0,0,63,63,"-end-", 0, 3500, 0);

	/* proctype 3: esbTimeSlot */

	trans[3] = (Trans **) emalloc(29*sizeof(Trans *));

	T = trans[ 3][27] = settr(127,2,0,0,0,"ATOMIC", 1, 2, 0);
	T->nxt	= settr(127,2,24,0,0,"ATOMIC", 1, 2, 0);
	T = trans[3][24] = settr(124,2,0,0,0,"IF", 1, 2, 0);
	    T->nxt	= settr(124,2,1,0,0,"IF", 1, 2, 0);
	trans[3][1]	= settr(101,2,22,64,64,"((tranmission_state==1))", 1, 2, 0); /* m: 2 -> 22,0 */
	reached3[2] = 1;
	trans[3][2]	= settr(0,0,0,0,0,"controlPacket[processID].msg.time = currentSlot",0,0,0);
	trans[3][3]	= settr(0,0,0,0,0,"controlPacket[processID].msg.state = tioa_tdma_state",0,0,0);
	T = trans[3][22] = settr(122,2,0,0,0,"IF", 1, 2, 0);
	T = T->nxt	= settr(122,2,4,0,0,"IF", 1, 2, 0);
	    T->nxt	= settr(122,2,15,0,0,"IF", 1, 2, 0);
	trans[3][4]	= settr(104,2,13,65,0,"((tioa_tdma_state==0))", 1, 2, 0);
	T = trans[3][13] = settr(113,2,0,0,0,"IF", 1, 2, 0);
	    T->nxt	= settr(113,2,5,0,0,"IF", 1, 2, 0);
	trans[3][5]	= settr(105,2,6,66,0,"((tranmission_state==1))", 1, 2, 0);
	trans[3][6]	= settr(106,2,11,67,67,"(run send(processID))", 1, 2, 0);
	T = trans[3][11] = settr(111,2,0,0,0,"IF", 1, 2, 0);
	T = T->nxt	= settr(111,2,7,0,0,"IF", 1, 2, 0);
	    T->nxt	= settr(111,2,9,0,0,"IF", 1, 2, 0);
	trans[3][7]	= settr(107,4,28,68,68,"((controlPacket[processID].msg.members==4))", 1, 2, 0); /* m: 8 -> 28,0 */
	reached3[8] = 1;
	trans[3][8]	= settr(0,0,0,0,0,"tioa_tdma_state = 1",0,0,0);
	trans[3][12]	= settr(112,2,25,1,0,".(goto)", 1, 2, 0); /* m: 25 -> 0,28 */
	reached3[25] = 1;
	trans[3][9]	= settr(109,2,10,2,0,"else", 1, 2, 0);
	trans[3][10]	= settr(110,2,25,69,69,"(run failureDetector(tioa_tdma_state))", 1, 2, 0);
	trans[3][14]	= settr(114,2,25,1,0,".(goto)", 1, 2, 0); /* m: 25 -> 0,28 */
	reached3[25] = 1;
	trans[3][23]	= settr(123,2,25,1,0,".(goto)", 1, 2, 0); /* m: 25 -> 0,28 */
	reached3[25] = 1;
	trans[3][15]	= settr(115,2,20,70,0,"((tioa_tdma_state==1))", 1, 2, 0);
	T = trans[3][20] = settr(120,2,0,0,0,"IF", 1, 2, 0);
	T = T->nxt	= settr(120,2,16,0,0,"IF", 1, 2, 0);
	    T->nxt	= settr(120,2,18,0,0,"IF", 1, 2, 0);
	trans[3][16]	= settr(116,2,17,71,0,"(((currentSlot%4)==processID))", 1, 2, 0);
	trans[3][17]	= settr(117,2,25,72,72,"(run send(processID))", 1, 2, 0);
	trans[3][21]	= settr(121,2,25,1,0,".(goto)", 1, 2, 0); /* m: 25 -> 0,28 */
	reached3[25] = 1;
	trans[3][18]	= settr(118,2,19,2,0,"else", 1, 2, 0);
	trans[3][19]	= settr(119,2,25,73,73,"(run failureDetector(tioa_tdma_state))", 1, 2, 0);
	trans[3][25]	= settr(125,4,28,74,74,".(goto)", 1, 2, 0); /* m: 26 -> 0,28 */
	reached3[26] = 1;
	trans[3][26]	= settr(0,0,0,0,0,"currentSlot = (currentSlot+1)",0,0,0);
	trans[3][28]	= settr(128,0,0,75,75,"-end-", 0, 3500, 0);

	/* proctype 2: send */

	trans[2] = (Trans **) emalloc(48*sizeof(Trans *));

	trans[2][1]	= settr(54,0,2,76,76,"sendPacket.msg.id = senderID", 0, 2, 0);
	trans[2][2]	= settr(55,0,3,77,77,"sendPacket.msg.state = tioa_tdma_state", 1, 2, 0);
	trans[2][3]	= settr(56,0,46,78,78,"sendPacket.msg.members = senderID", 0, 2, 0);
	T = trans[ 2][46] = settr(99,2,0,0,0,"ATOMIC", 1, 2, 0);
	T->nxt	= settr(99,2,44,0,0,"ATOMIC", 1, 2500, 0);
	T = trans[2][44] = settr(97,2,0,0,0,"IF", 1, 2500, 0);
	T = T->nxt	= settr(97,2,4,0,0,"IF", 1, 2500, 0);
	T = T->nxt	= settr(97,2,14,0,0,"IF", 1, 2500, 0);
	T = T->nxt	= settr(97,2,24,0,0,"IF", 1, 2500, 0);
	    T->nxt	= settr(97,2,34,0,0,"IF", 1, 2500, 0);
	trans[2][4]	= settr(57,2,7,79,79,"(((senderID==0)&&((currentSlot%4)==senderID)))", 1, 2500, 0); /* m: 5 -> 7,0 */
	reached2[5] = 1;
	trans[2][5]	= settr(0,0,0,0,0,"sendPacket.msg.time = currentSlot",0,0,0);
	trans[2][6]	= settr(0,0,0,0,0,"sendPacket.processId = 1",0,0,0);
	trans[2][7]	= settr(60,2,8,80,80,"P0P1!sendPacket.processId,sendPacket.msg.id,sendPacket.msg.state,sendPacket.msg.members,sendPacket.msg.time", 1, 2500, 0);
	trans[2][8]	= settr(61,2,9,81,81,"sendPacket.processId = 2", 1, 2500, 0);
	trans[2][9]	= settr(62,2,10,82,82,"P0P2!sendPacket.processId,sendPacket.msg.id,sendPacket.msg.state,sendPacket.msg.members,sendPacket.msg.time", 1, 2500, 0);
	trans[2][10]	= settr(63,2,12,83,83,"printf('Sending packet = %d',senderID)", 1, 2500, 0); /* m: 11 -> 0,12 */
	reached2[11] = 1;
	trans[2][11]	= settr(0,0,0,0,0,"sendPacket.processId = 3",0,0,0);
	trans[2][12]	= settr(65,2,13,84,84,"P0P3!sendPacket.processId,sendPacket.msg.id,sendPacket.msg.state,sendPacket.msg.members,sendPacket.msg.time", 1, 2500, 0);
	trans[2][13]	= settr(66,4,47,85,85,"printf('Sending packet = %d',senderID)", 1, 2500, 0); /* m: 45 -> 0,47 */
	reached2[45] = 1;
	trans[2][45]	= settr(98,0,47,86,86,".(goto)", 1, 2500, 0);
	trans[2][14]	= settr(67,2,17,87,87,"(((senderID==1)&&((currentSlot%4)==senderID)))", 1, 2500, 0); /* m: 15 -> 17,0 */
	reached2[15] = 1;
	trans[2][15]	= settr(0,0,0,0,0,"sendPacket.msg.time = currentSlot",0,0,0);
	trans[2][16]	= settr(0,0,0,0,0,"sendPacket.processId = 0",0,0,0);
	trans[2][17]	= settr(70,2,18,88,88,"P1P0!sendPacket.processId,sendPacket.msg.id,sendPacket.msg.state,sendPacket.msg.members,sendPacket.msg.time", 1, 2500, 0);
	trans[2][18]	= settr(71,2,19,89,89,"sendPacket.processId = 2", 1, 2500, 0);
	trans[2][19]	= settr(72,2,20,90,90,"P1P2!sendPacket.processId,sendPacket.msg.id,sendPacket.msg.state,sendPacket.msg.members,sendPacket.msg.time", 1, 2500, 0);
	trans[2][20]	= settr(73,2,22,91,91,"printf('Sending packet = %d',senderID)", 1, 2500, 0); /* m: 21 -> 0,22 */
	reached2[21] = 1;
	trans[2][21]	= settr(0,0,0,0,0,"sendPacket.processId = 3",0,0,0);
	trans[2][22]	= settr(75,2,23,92,92,"P1P3!sendPacket.processId,sendPacket.msg.id,sendPacket.msg.state,sendPacket.msg.members,sendPacket.msg.time", 1, 2500, 0);
	trans[2][23]	= settr(76,4,47,93,93,"printf('Sending packet = %d',senderID)", 1, 2500, 0); /* m: 45 -> 0,47 */
	reached2[45] = 1;
	trans[2][24]	= settr(77,2,27,94,94,"(((senderID==2)&&((currentSlot%4)==2)))", 1, 2500, 0); /* m: 25 -> 27,0 */
	reached2[25] = 1;
	trans[2][25]	= settr(0,0,0,0,0,"sendPacket.msg.time = currentSlot",0,0,0);
	trans[2][26]	= settr(0,0,0,0,0,"sendPacket.processId = 0",0,0,0);
	trans[2][27]	= settr(80,2,28,95,95,"P2P0!sendPacket.processId,sendPacket.msg.id,sendPacket.msg.state,sendPacket.msg.members,sendPacket.msg.time", 1, 2500, 0);
	trans[2][28]	= settr(81,2,29,96,96,"sendPacket.processId = 1", 1, 2500, 0);
	trans[2][29]	= settr(82,2,30,97,97,"P2P1!sendPacket.processId,sendPacket.msg.id,sendPacket.msg.state,sendPacket.msg.members,sendPacket.msg.time", 1, 2500, 0);
	trans[2][30]	= settr(83,2,32,98,98,"printf('Sending packet = %d',senderID)", 1, 2500, 0); /* m: 31 -> 0,32 */
	reached2[31] = 1;
	trans[2][31]	= settr(0,0,0,0,0,"sendPacket.processId = 3",0,0,0);
	trans[2][32]	= settr(85,2,33,99,99,"P2P3!sendPacket.processId,sendPacket.msg.id,sendPacket.msg.state,sendPacket.msg.members,sendPacket.msg.time", 1, 2500, 0);
	trans[2][33]	= settr(86,4,47,100,100,"printf('Sending packet = %d',senderID)", 1, 2500, 0); /* m: 45 -> 0,47 */
	reached2[45] = 1;
	trans[2][34]	= settr(87,2,37,101,101,"(((senderID==3)&&((currentSlot%4)==3)))", 1, 2500, 0); /* m: 35 -> 37,0 */
	reached2[35] = 1;
	trans[2][35]	= settr(0,0,0,0,0,"sendPacket.msg.time = currentSlot",0,0,0);
	trans[2][36]	= settr(0,0,0,0,0,"sendPacket.processId = 0",0,0,0);
	trans[2][37]	= settr(90,2,38,102,102,"P3P0!sendPacket.processId,sendPacket.msg.id,sendPacket.msg.state,sendPacket.msg.members,sendPacket.msg.time", 1, 2500, 0);
	trans[2][38]	= settr(91,2,39,103,103,"sendPacket.processId = 1", 1, 2500, 0);
	trans[2][39]	= settr(92,2,40,104,104,"P3P1!sendPacket.processId,sendPacket.msg.id,sendPacket.msg.state,sendPacket.msg.members,sendPacket.msg.time", 1, 2500, 0);
	trans[2][40]	= settr(93,2,42,105,105,"printf('Sending packet = %d',senderID)", 1, 2500, 0); /* m: 41 -> 0,42 */
	reached2[41] = 1;
	trans[2][41]	= settr(0,0,0,0,0,"sendPacket.processId = 2",0,0,0);
	trans[2][42]	= settr(95,2,43,106,106,"P3P2!sendPacket.processId,sendPacket.msg.id,sendPacket.msg.state,sendPacket.msg.members,sendPacket.msg.time", 1, 2500, 0);
	trans[2][43]	= settr(96,4,47,107,107,"printf('Sending packet = %d',senderID)", 1, 2500, 0); /* m: 45 -> 0,47 */
	reached2[45] = 1;
	trans[2][47]	= settr(100,0,0,108,108,"-end-", 0, 3500, 0);

	/* proctype 1: startTimer */

	trans[1] = (Trans **) emalloc(20*sizeof(Trans *));

	trans[1][17]	= settr(51,0,16,1,0,".(goto)", 0, 2, 0);
	T = trans[1][16] = settr(50,0,0,0,0,"DO", 0, 2, 0);
	    T->nxt	= settr(50,0,14,0,0,"DO", 0, 2, 0);
	T = trans[1][14] = settr(48,0,0,0,0,"IF", 0, 2, 0);
	    T->nxt	= settr(48,0,1,0,0,"IF", 0, 2, 0);
	trans[1][1]	= settr(35,0,13,109,0,"((timer_tick<7))", 1, 2, 0);
	T = trans[ 1][13] = settr(47,2,0,0,0,"ATOMIC", 1, 2, 0);
	T->nxt	= settr(47,2,2,0,0,"ATOMIC", 1, 2, 0);
	trans[1][2]	= settr(36,2,9,110,110,"p = 0", 1, 2, 0); /* m: 3 -> 0,9 */
	reached1[3] = 1;
	trans[1][3]	= settr(0,0,0,0,0,"p = 0",0,0,0);
	trans[1][10]	= settr(44,2,9,1,0,".(goto)", 1, 2, 0);
	T = trans[1][9] = settr(43,2,0,0,0,"DO", 1, 2, 0);
	T = T->nxt	= settr(43,2,4,0,0,"DO", 1, 2, 0);
	    T->nxt	= settr(43,2,7,0,0,"DO", 1, 2, 0);
	trans[1][4]	= settr(38,2,5,111,0,"((p<=3))", 1, 2, 0);
	trans[1][5]	= settr(39,2,6,112,112,"(run esbTimeSlot(p))", 1, 2, 0);
	trans[1][6]	= settr(40,2,9,113,113,"p = (p+1)", 1, 2, 0);
	trans[1][7]	= settr(41,2,11,2,0,"else", 1, 2, 0);
	trans[1][8]	= settr(42,2,11,1,0,"goto :b4", 1, 2, 0);
	trans[1][11]	= settr(45,2,12,1,0,"break", 1, 2, 0);
	trans[1][12]	= settr(46,0,16,114,114,"timer_tick = (timer_tick+1)", 1, 2, 0);
	trans[1][15]	= settr(49,0,16,1,0,".(goto)", 0, 2, 0);
	trans[1][18]	= settr(52,0,19,1,0,"break", 0, 2, 0);
	trans[1][19]	= settr(53,0,0,115,115,"-end-", 0, 3500, 0);

	/* proctype 0: :init: */

	trans[0] = (Trans **) emalloc(36*sizeof(Trans *));

	trans[0][1]	= settr(0,0,2,116,116,"tioa_tdma_state = 0", 1, 2, 0);
	trans[0][2]	= settr(1,0,3,117,117,"tranmission_state = 1", 1, 2, 0);
	trans[0][3]	= settr(2,0,13,118,118,"m = 0", 0, 2, 0); /* m: 4 -> 0,13 */
	reached0[4] = 1;
	trans[0][4]	= settr(0,0,0,0,0,"n = 0",0,0,0);
	trans[0][5]	= settr(0,0,0,0,0,"n = 0",0,0,0);
	trans[0][14]	= settr(13,0,13,1,0,".(goto)", 0, 2, 0);
	T = trans[0][13] = settr(12,0,0,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(12,0,6,0,0,"DO", 0, 2, 0);
	    T->nxt	= settr(12,0,11,0,0,"DO", 0, 2, 0);
	trans[0][6]	= settr(5,0,7,119,0,"((n<=3))", 0, 2, 0);
	trans[0][7]	= settr(6,0,8,120,120,"controlPacket[n].msg.id = 1", 1, 2, 0);
	trans[0][8]	= settr(7,0,9,121,121,"controlPacket[n].msg.state = tioa_tdma_state", 1, 2, 0);
	trans[0][9]	= settr(8,0,10,122,122,"controlPacket[n].msg.members = 1", 1, 2, 0);
	trans[0][10]	= settr(9,0,13,123,123,"n = (n+1)", 0, 2, 0);
	trans[0][11]	= settr(10,0,16,2,0,"else", 0, 2, 0);
	trans[0][12]	= settr(11,0,16,1,0,"goto :b0", 0, 2, 0); /* m: 16 -> 0,30 */
	reached0[16] = 1;
	trans[0][15]	= settr(14,0,16,1,0,"break", 0, 2, 0);
	trans[0][16]	= settr(15,0,30,124,124,"m = 0", 0, 2, 0);
	trans[0][31]	= settr(30,0,30,1,0,".(goto)", 0, 2, 0);
	T = trans[0][30] = settr(29,0,0,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(29,0,17,0,0,"DO", 0, 2, 0);
	    T->nxt	= settr(29,0,28,0,0,"DO", 0, 2, 0);
	trans[0][17]	= settr(16,0,24,125,125,"((m<=3))", 0, 2, 0); /* m: 18 -> 24,0 */
	reached0[18] = 1;
	trans[0][18]	= settr(0,0,0,0,0,"n = 0",0,0,0);
	trans[0][25]	= settr(24,0,24,1,0,".(goto)", 0, 2, 0);
	T = trans[0][24] = settr(23,0,0,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(23,0,19,0,0,"DO", 0, 2, 0);
	    T->nxt	= settr(23,0,22,0,0,"DO", 0, 2, 0);
	trans[0][19]	= settr(18,0,20,126,0,"((n<=3))", 0, 2, 0);
	trans[0][20]	= settr(19,0,21,127,127,"ck[m].member[n] = 1", 1, 2, 0);
	trans[0][21]	= settr(20,0,24,128,128,"n = (n+1)", 0, 2, 0);
	trans[0][22]	= settr(21,0,27,2,0,"else", 0, 2, 0);
	trans[0][23]	= settr(22,0,27,1,0,"goto :b2", 0, 2, 0); /* m: 27 -> 0,30 */
	reached0[27] = 1;
	trans[0][26]	= settr(25,0,27,1,0,"break", 0, 2, 0);
	trans[0][27]	= settr(26,0,30,129,129,"m = (m+1)", 0, 2, 0);
	trans[0][28]	= settr(27,0,34,2,0,"else", 0, 2, 0);
	trans[0][29]	= settr(28,0,34,1,0,"goto :b1", 0, 2, 0);
	trans[0][32]	= settr(31,0,34,1,0,"break", 0, 2, 0);
	T = trans[ 0][34] = settr(33,2,0,0,0,"ATOMIC", 0, 2, 0);
	T->nxt	= settr(33,2,33,0,0,"ATOMIC", 0, 2, 0);
	trans[0][33]	= settr(32,0,35,130,130,"(run startTimer())", 0, 2, 0);
	trans[0][35]	= settr(34,0,0,131,131,"-end-", 0, 3500, 0);
	/* np_ demon: */
	trans[_NP_] = (Trans **) emalloc(2*sizeof(Trans *));
	T = trans[_NP_][0] = settr(9997,0,1,_T5,0,"(np_)", 1,2,0);
	    T->nxt	  = settr(9998,0,0,_T2,0,"(1)",   0,2,0);
	T = trans[_NP_][1] = settr(9999,0,1,_T5,0,"(np_)", 1,2,0);
}

Trans *
settr(	int t_id, int a, int b, int c, int d,
	char *t, int g, int tpe0, int tpe1)
{	Trans *tmp = (Trans *) emalloc(sizeof(Trans));

	tmp->atom  = a&(6|32);	/* only (2|8|32) have meaning */
	if (!g) tmp->atom |= 8;	/* no global references */
	tmp->st    = b;
	tmp->tpe[0] = tpe0;
	tmp->tpe[1] = tpe1;
	tmp->tp    = t;
	tmp->t_id  = t_id;
	tmp->forw  = c;
	tmp->back  = d;
	return tmp;
}

Trans *
cpytr(Trans *a)
{	Trans *tmp = (Trans *) emalloc(sizeof(Trans));

	int i;
	tmp->atom  = a->atom;
	tmp->st    = a->st;
#ifdef HAS_UNLESS
	tmp->e_trans = a->e_trans;
	for (i = 0; i < HAS_UNLESS; i++)
		tmp->escp[i] = a->escp[i];
#endif
	tmp->tpe[0] = a->tpe[0];
	tmp->tpe[1] = a->tpe[1];
	for (i = 0; i < 6; i++)
	{	tmp->qu[i] = a->qu[i];
		tmp->ty[i] = a->ty[i];
	}
	tmp->tp    = (char *) emalloc(strlen(a->tp)+1);
	strcpy(tmp->tp, a->tp);
	tmp->t_id  = a->t_id;
	tmp->forw  = a->forw;
	tmp->back  = a->back;
	return tmp;
}

#ifndef NOREDUCE
int
srinc_set(int n)
{	if (n <= 2) return LOCAL;
	if (n <= 2+  DELTA) return Q_FULL_F; /* 's' or nfull  */
	if (n <= 2+2*DELTA) return Q_EMPT_F; /* 'r' or nempty */
	if (n <= 2+3*DELTA) return Q_EMPT_T; /* empty */
	if (n <= 2+4*DELTA) return Q_FULL_T; /* full  */
	if (n ==   5*DELTA) return GLOBAL;
	if (n ==   6*DELTA) return TIMEOUT_F;
	if (n ==   7*DELTA) return ALPHA_F;
	Uerror("cannot happen srinc_class");
	return BAD;
}
int
srunc(int n, int m)
{	switch(m) {
	case Q_FULL_F: return n-2;
	case Q_EMPT_F: return n-2-DELTA;
	case Q_EMPT_T: return n-2-2*DELTA;
	case Q_FULL_T: return n-2-3*DELTA;
	case ALPHA_F:
	case TIMEOUT_F: return 257; /* non-zero, and > MAXQ */
	}
	Uerror("cannot happen srunc");
	return 0;
}
#endif
int cnt;
#ifdef HAS_UNLESS
int
isthere(Trans *a, int b)
{	Trans *t;
	for (t = a; t; t = t->nxt)
		if (t->t_id == b)
			return 1;
	return 0;
}
#endif
#ifndef NOREDUCE
int
mark_safety(Trans *t) /* for conditional safety */
{	int g = 0, i, j, k;

	if (!t) return 0;
	if (t->qu[0])
		return (t->qu[1])?2:1;	/* marked */

	for (i = 0; i < 2; i++)
	{	j = srinc_set(t->tpe[i]);
		if (j >= GLOBAL && j != ALPHA_F)
			return -1;
		if (j != LOCAL)
		{	k = srunc(t->tpe[i], j);
			if (g == 0
			||  t->qu[0] != k
			||  t->ty[0] != j)
			{	t->qu[g] = k;
				t->ty[g] = j;
				g++;
	}	}	}
	return g;
}
#endif
void
retrans(int n, int m, int is, short srcln[], uchar reach[], uchar lpstate[])
	/* process n, with m states, is=initial state */
{	Trans *T0, *T1, *T2, *T3;
	Trans *T4, *T5; /* t_reverse or has_unless */
	int i;
#if defined(HAS_UNLESS) || !defined(NOREDUCE)
	int k;
#endif
#ifndef NOREDUCE
	int g, h, j, aa;
#endif
#ifdef HAS_UNLESS
	int p;
#endif
	if (state_tables >= 4)
	{	printf("STEP 1 %s\n", 
			procname[n]);
		for (i = 1; i < m; i++)
		for (T0 = trans[n][i]; T0; T0 = T0->nxt)
			crack(n, i, T0, srcln);
		return;
	}
	do {
		for (i = 1, cnt = 0; i < m; i++)
		{	T2 = trans[n][i];
			T1 = T2?T2->nxt:(Trans *)0;
/* prescan: */		for (T0 = T1; T0; T0 = T0->nxt)
/* choice in choice */	{	if (T0->st && trans[n][T0->st]
				&&  trans[n][T0->st]->nxt)
					break;
			}
#if 0
		if (T0)
		printf("\tstate %d / %d: choice in choice\n",
		i, T0->st);
#endif
			if (T0)
			for (T0 = T1; T0; T0 = T0->nxt)
			{	T3 = trans[n][T0->st];
				if (!T3->nxt)
				{	T2->nxt = cpytr(T0);
					T2 = T2->nxt;
					imed(T2, T0->st, n, i);
					continue;
				}
				do {	T3 = T3->nxt;
					T2->nxt = cpytr(T3);
					T2 = T2->nxt;
					imed(T2, T0->st, n, i);
				} while (T3->nxt);
				cnt++;
			}
		}
	} while (cnt);
	if (state_tables >= 3)
	{	printf("STEP 2 %s\n", 
			procname[n]);
		for (i = 1; i < m; i++)
		for (T0 = trans[n][i]; T0; T0 = T0->nxt)
			crack(n, i, T0, srcln);
		return;
	}
	for (i = 1; i < m; i++)
	{	if (trans[n][i] && trans[n][i]->nxt) /* optimize */
		{	T1 = trans[n][i]->nxt;
#if 0
			printf("\t\tpull %d (%d) to %d\n",
			T1->st, T1->forw, i);
#endif
			srcln[i] = srcln[T1->st];	/* Oyvind Teig, 5.2.0 */

			if (!trans[n][T1->st]) continue;
			T0 = cpytr(trans[n][T1->st]);
			trans[n][i] = T0;
			reach[T1->st] = 1;
			imed(T0, T1->st, n, i);
			for (T1 = T1->nxt; T1; T1 = T1->nxt)
			{
#if 0
			printf("\t\tpull %d (%d) to %d\n",
				T1->st, T1->forw, i);
#endif
		/*		srcln[i] = srcln[T1->st];  gh: not useful */
				if (!trans[n][T1->st]) continue;
				T0->nxt = cpytr(trans[n][T1->st]);
				T0 = T0->nxt;
				reach[T1->st] = 1;
				imed(T0, T1->st, n, i);
	}	}	}
	if (state_tables >= 2)
	{	printf("STEP 3 %s\n", 
			procname[n]);
		for (i = 1; i < m; i++)
		for (T0 = trans[n][i]; T0; T0 = T0->nxt)
			crack(n, i, T0, srcln);
		return;
	}
#ifdef HAS_UNLESS
	for (i = 1; i < m; i++)
	{	if (!trans[n][i]) continue;
		/* check for each state i if an
		 * escape to some state p is defined
		 * if so, copy and mark p's transitions
		 * and prepend them to the transition-
		 * list of state i
		 */
	 if (!like_java) /* the default */
	 {	for (T0 = trans[n][i]; T0; T0 = T0->nxt)
		for (k = HAS_UNLESS-1; k >= 0; k--)
		{	if (p = T0->escp[k])
			for (T1 = trans[n][p]; T1; T1 = T1->nxt)
			{	if (isthere(trans[n][i], T1->t_id))
					continue;
				T2 = cpytr(T1);
				T2->e_trans = p;
				T2->nxt = trans[n][i];
				trans[n][i] = T2;
		}	}
	 } else /* outermost unless checked first */
	 {	T4 = T3 = (Trans *) 0;
		for (T0 = trans[n][i]; T0; T0 = T0->nxt)
		for (k = HAS_UNLESS-1; k >= 0; k--)
		{	if (p = T0->escp[k])
			for (T1 = trans[n][p]; T1; T1 = T1->nxt)
			{	if (isthere(trans[n][i], T1->t_id))
					continue;
				T2 = cpytr(T1);
				T2->nxt = (Trans *) 0;
				T2->e_trans = p;
				if (T3)	T3->nxt = T2;
				else	T4 = T2;
				T3 = T2;
		}	}
		if (T4)
		{	T3->nxt = trans[n][i];
			trans[n][i] = T4;
		}
	 }
	}
#endif
#ifndef NOREDUCE
	for (i = 1; i < m; i++)
	{	if (a_cycles)
		{ /* moves through these states are visible */
	#if PROG_LAB>0 && defined(HAS_NP)
			if (progstate[n][i])
				goto degrade;
			for (T1 = trans[n][i]; T1; T1 = T1->nxt)
				if (progstate[n][T1->st])
					goto degrade;
	#endif
			if (accpstate[n][i] || visstate[n][i])
				goto degrade;
			for (T1 = trans[n][i]; T1; T1 = T1->nxt)
				if (accpstate[n][T1->st])
					goto degrade;
		}
		T1 = trans[n][i];
		if (!T1) continue;
		g = mark_safety(T1);	/* V3.3.1 */
		if (g < 0) goto degrade; /* global */
		/* check if mixing of guards preserves reduction */
		if (T1->nxt)
		{	k = 0;
			for (T0 = T1; T0; T0 = T0->nxt)
			{	if (!(T0->atom&8))
					goto degrade;
				for (aa = 0; aa < 2; aa++)
				{	j = srinc_set(T0->tpe[aa]);
					if (j >= GLOBAL && j != ALPHA_F)
						goto degrade;
					if (T0->tpe[aa]
					&&  T0->tpe[aa]
					!=  T1->tpe[0])
						k = 1;
			}	}
			/* g = 0;	V3.3.1 */
			if (k)	/* non-uniform selection */
			for (T0 = T1; T0; T0 = T0->nxt)
			for (aa = 0; aa < 2; aa++)
			{	j = srinc_set(T0->tpe[aa]);
				if (j != LOCAL)
				{	k = srunc(T0->tpe[aa], j);
					for (h = 0; h < 6; h++)
						if (T1->qu[h] == k
						&&  T1->ty[h] == j)
							break;
					if (h >= 6)
					{	T1->qu[g%6] = k;
						T1->ty[g%6] = j;
						g++;
			}	}	}
			if (g > 6)
			{	T1->qu[0] = 0;	/* turn it off */
				printf("pan: warning, line %d, ",
					srcln[i]);
			 	printf("too many stmnt types (%d)",
					g);
			  	printf(" in selection\n");
			  goto degrade;
			}
		}
		/* mark all options global if >=1 is global */
		for (T1 = trans[n][i]; T1; T1 = T1->nxt)
			if (!(T1->atom&8)) break;
		if (T1)
degrade:	for (T1 = trans[n][i]; T1; T1 = T1->nxt)
			T1->atom &= ~8;	/* mark as unsafe */
		/* can only mix 'r's or 's's if on same chan */
		/* and not mixed with other local operations */
		T1 = trans[n][i];
		if (!T1 || T1->qu[0]) continue;
		j = T1->tpe[0];
		if (T1->nxt && T1->atom&8)
		{ if (j == 5*DELTA)
		  {	printf("warning: line %d ", srcln[i]);
			printf("mixed condition ");
			printf("(defeats reduction)\n");
			goto degrade;
		  }
		  for (T0 = T1; T0; T0 = T0->nxt)
		  for (aa = 0; aa < 2; aa++)
		  if  (T0->tpe[aa] && T0->tpe[aa] != j)
		  {	printf("warning: line %d ", srcln[i]);
			printf("[%d-%d] mixed %stion ",
				T0->tpe[aa], j, 
				(j==5*DELTA)?"condi":"selec");
			printf("(defeats reduction)\n");
			printf("	'%s' <-> '%s'\n",
				T1->tp, T0->tp);
			goto degrade;
		} }
	}
#endif
	for (i = 1; i < m; i++)
	{	T2 = trans[n][i];
		if (!T2
		||  T2->nxt
		||  strncmp(T2->tp, ".(goto)", 7)
		||  !stopstate[n][i])
			continue;
		stopstate[n][T2->st] = 1;
	}
	if (state_tables && !verbose)
	{	if (dodot)
		{	char buf[256], *q = buf, *p = procname[n];
			while (*p != '\0')
			{	if (*p != ':')
				{	*q++ = *p;
				}
				p++;
			}
			*q = '\0';
			printf("digraph ");
			switch (Btypes[n]) {
			case I_PROC:  printf("init {\n"); break;
			case N_CLAIM: printf("claim_%s {\n", buf); break;
			case E_TRACE: printf("notrace {\n"); break;
			case N_TRACE: printf("trace {\n"); break;
			default:      printf("p_%s {\n", buf); break;
			}
			printf("size=\"8,10\";\n");
			printf("  GT [shape=box,style=dotted,label=\"%s\"];\n", buf);
			printf("  GT -> S%d;\n", is);
		} else
		{	switch (Btypes[n]) {
			case I_PROC:  printf("init\n"); break;
			case N_CLAIM: printf("claim %s\n", procname[n]); break;
			case E_TRACE: printf("notrace assertion\n"); break;
			case N_TRACE: printf("trace assertion\n"); break;
			default:      printf("proctype %s\n", procname[n]); break;
		}	}
		for (i = 1; i < m; i++)
		{	reach[i] = 1;
		}
		tagtable(n, m, is, srcln, reach);
		if (dodot) printf("}\n");
	} else
	for (i = 1; i < m; i++)
	{	int nrelse;
		if (Btypes[n] != N_CLAIM)
		{	for (T0 = trans[n][i]; T0; T0 = T0->nxt)
			{	if (T0->st == i
				&& strcmp(T0->tp, "(1)") == 0)
				{	printf("error: proctype '%s' ",
						procname[n]);
		  			printf("line %d, state %d: has un",
						srcln[i], i);
					printf("conditional self-loop\n");
					pan_exit(1);
		}	}	}
		nrelse = 0;
		for (T0 = trans[n][i]; T0; T0 = T0->nxt)
		{	if (strcmp(T0->tp, "else") == 0)
				nrelse++;
		}
		if (nrelse > 1)
		{	printf("error: proctype '%s' state",
				procname[n]);
		  	printf(" %d, inherits %d", i, nrelse);
		  	printf(" 'else' stmnts\n");
			pan_exit(1);
	}	}
#if !defined(LOOPSTATE) && !defined(BFS_PAR)
	if (state_tables)
#endif
	do_dfs(n, m, is, srcln, reach, lpstate);

	if (!t_reverse)
	{	return;
	}
	/* process n, with m states, is=initial state -- reverse list */
	if (!state_tables && Btypes[n] != N_CLAIM)
	{	for (i = 1; i < m; i++)
		{	Trans *Tx = (Trans *) 0; /* list of escapes */
			Trans *Ty = (Trans *) 0; /* its tail element */
			T1 = (Trans *) 0; /* reversed list */
			T2 = (Trans *) 0; /* its tail */
			T3 = (Trans *) 0; /* remembers possible 'else' */

			/* find unless-escapes, they should go first */
			T4 = T5 = T0 = trans[n][i];
	#ifdef HAS_UNLESS
			while (T4 && T4->e_trans) /* escapes are first in orig list */
			{	T5 = T4;	  /* remember predecessor */
				T4 = T4->nxt;
			}
	#endif
			/* T4 points to first non-escape, T5 to its parent, T0 to original list */
			if (T4 != T0)		 /* there was at least one escape */
			{	T3 = T5->nxt;		 /* start of non-escapes */
				T5->nxt = (Trans *) 0;	 /* separate */
				Tx = T0;		 /* start of the escapes */
				Ty = T5;		 /* its tail */
				T0 = T3;		 /* the rest, to be reversed */
			}
			/* T0 points to first non-escape, Tx to the list of escapes, Ty to its tail */

			/* first tail-add non-escape transitions, reversed */
			T3 = (Trans *) 0;
			for (T5 = T0; T5; T5 = T4)
			{	T4 = T5->nxt;
	#ifdef HAS_UNLESS
				if (T5->e_trans)
				{	printf("error: cannot happen!\n");
					continue;
				}
	#endif
				if (strcmp(T5->tp, "else") == 0)
				{	T3 = T5;
					T5->nxt = (Trans *) 0;
				} else
				{	T5->nxt = T1;
					if (!T1) { T2 = T5; }
					T1 = T5;
			}	}
			/* T3 points to a possible else, which is removed from the list */
			/* T1 points to the reversed list so far (without escapes) */
			/* T2 points to the tail element -- where the else should go */
			if (T2 && T3)
			{	T2->nxt = T3;	/* add else */
			} else
			{	if (T3) /* there was an else, but there's no tail */
				{	if (!T1)	/* and no reversed list */
					{	T1 = T3; /* odd, but possible */
					} else		/* even stranger */
					{	T1->nxt = T3;
			}	}	}

			/* add in the escapes, to that they appear at the front */
			if (Tx && Ty) { Ty->nxt = T1; T1 = Tx; }

			trans[n][i] = T1;
			/* reversed, with escapes first and else last */
	}	}
	if (state_tables && verbose)
	{	printf("FINAL proctype %s\n", 
			procname[n]);
		for (i = 1; i < m; i++)
		for (T0 = trans[n][i]; T0; T0 = T0->nxt)
			crack(n, i, T0, srcln);
	}
}
void
imed(Trans *T, int v, int n, int j)	/* set intermediate state */
{	progstate[n][T->st] |= progstate[n][v];
	accpstate[n][T->st] |= accpstate[n][v];
	stopstate[n][T->st] |= stopstate[n][v];
	mapstate[n][j] = T->st;
}
void
tagtable(int n, int m, int is, short srcln[], uchar reach[])
{	Trans *z;

	if (is >= m || !trans[n][is]
	||  is <= 0 || reach[is] == 0)
		return;
	reach[is] = 0;
	if (state_tables)
	for (z = trans[n][is]; z; z = z->nxt)
	{	if (dodot)
			dot_crack(n, is, z);
		else
			crack(n, is, z, srcln);
	}

	for (z = trans[n][is]; z; z = z->nxt)
	{
#ifdef HAS_UNLESS
		int i, j;
#endif
		tagtable(n, m, z->st, srcln, reach);
#ifdef HAS_UNLESS
		for (i = 0; i < HAS_UNLESS; i++)
		{	j = trans[n][is]->escp[i];
			if (!j) break;
			tagtable(n, m, j, srcln, reach);
		}
#endif
	}
}

extern Trans *t_id_lkup[];

void
dfs_table(int n, int m, int is, short srcln[], uchar reach[], uchar lpstate[])
{	Trans *z;

	if (is >= m || is <= 0 || !trans[n][is])
		return;
	if ((reach[is] & (4|8|16)) != 0)
	{	if ((reach[is] & (8|16)) == 16)	/* on stack, not yet recorded */
		{	lpstate[is] = 1;
			reach[is] |= 8; /* recorded */
			if (state_tables && verbose)
			{	printf("state %d line %d is a loopstate\n", is, srcln[is]);
		}	}
		return;
	}
	reach[is] |= (4|16);	/* visited | onstack */
	for (z = trans[n][is]; z; z = z->nxt)
	{	t_id_lkup[z->t_id] = z;
#ifdef HAS_UNLESS
		int i, j;
#endif
		dfs_table(n, m, z->st, srcln, reach, lpstate);
#ifdef HAS_UNLESS
		for (i = 0; i < HAS_UNLESS; i++)
		{	j = trans[n][is]->escp[i];
			if (!j) break;
			dfs_table(n, m, j, srcln, reach, lpstate);
		}
#endif
	}
	reach[is] &= ~16; /* no longer on stack */
}
void
do_dfs(int n, int m, int is, short srcln[], uchar reach[], uchar lpstate[])
{	int i;
	dfs_table(n, m, is, srcln, reach, lpstate);
	for (i = 0; i < m; i++)
		reach[i] &= ~(4|8|16);
}
void
crack(int n, int j, Trans *z, short srcln[])
{	int i;

	if (!z) return;
	printf("	state %3d -(tr %3d)-> state %3d  ",
		j, z->forw, z->st);
	printf("[id %3d tp %3d", z->t_id, z->tpe[0]);
	if (z->tpe[1]) printf(",%d", z->tpe[1]);
#ifdef HAS_UNLESS
	if (z->e_trans)
		printf(" org %3d", z->e_trans);
	else if (state_tables >= 2)
	for (i = 0; i < HAS_UNLESS; i++)
	{	if (!z->escp[i]) break;
		printf(" esc %d", z->escp[i]);
	}
#endif
	printf("]");
	printf(" [%s%s%s%s%s] %s:%d => ",
		z->atom&6?"A":z->atom&32?"D":"-",
		accpstate[n][j]?"a" :"-",
		stopstate[n][j]?"e" : "-",
		progstate[n][j]?"p" : "-",
		z->atom & 8 ?"L":"G",
		PanSource, srcln[j]);
	for (i = 0; z->tp[i]; i++)
		if (z->tp[i] == '\n')
			printf("\\n");
		else
			putchar(z->tp[i]);
	if (verbose && z->qu[0])
	{	printf("\t[");
		for (i = 0; i < 6; i++)
			if (z->qu[i])
				printf("(%d,%d)",
				z->qu[i], z->ty[i]);
		printf("]");
	}
	printf("\n");
	fflush(stdout);
}
/* spin -a m.pml; cc -o pan pan.c; ./pan -D | dot -Tps > foo.ps; ps2pdf foo.ps */
void
dot_crack(int n, int j, Trans *z)
{	int i;

	if (!z) return;
	printf("	S%d -> S%d  [color=black", j, z->st);

	if (z->atom&6) printf(",style=dashed");
	else if (z->atom&32) printf(",style=dotted");
	else if (z->atom&8) printf(",style=solid");
	else printf(",style=bold");

	printf(",label=\"");
	for (i = 0; z->tp[i]; i++)
	{	if (z->tp[i] == '\\'
		&&  z->tp[i+1] == 'n')
		{	i++; printf(" ");
		} else
		{	putchar(z->tp[i]);
	}	}
	printf("\"];\n");
	if (accpstate[n][j]) printf("  S%d [color=red,style=bold];\n", j);
	else if (progstate[n][j]) printf("  S%d [color=green,style=bold];\n", j);
	if (stopstate[n][j]) printf("  S%d [color=blue,style=bold,shape=box];\n", j);
}

#ifdef VAR_RANGES
#define BYTESIZE	32	/* 2^8 : 2^3 = 256:8 = 32 */

typedef struct Vr_Ptr {
	char	*nm;
	uchar	vals[BYTESIZE];
	struct Vr_Ptr *nxt;
} Vr_Ptr;
Vr_Ptr *ranges = (Vr_Ptr *) 0;

void
logval(char *s, int v)
{	Vr_Ptr *tmp;

	if (v<0 || v > 255) return;
	for (tmp = ranges; tmp; tmp = tmp->nxt)
		if (!strcmp(tmp->nm, s))
			goto found;
	tmp = (Vr_Ptr *) emalloc(sizeof(Vr_Ptr));
	tmp->nxt = ranges;
	ranges = tmp;
	tmp->nm = s;
found:
	tmp->vals[(v)/8] |= 1<<((v)%8);
}

void
dumpval(uchar X[], int range)
{	int w, x, i, j = -1;

	for (w = i = 0; w < range; w++)
	for (x = 0; x < 8; x++, i++)
	{
from:		if ((X[w] & (1<<x)))
		{	printf("%d", i);
			j = i;
			goto upto;
	}	}
	return;
	for (w = 0; w < range; w++)
	for (x = 0; x < 8; x++, i++)
	{
upto:		if (!(X[w] & (1<<x)))
		{	if (i-1 == j)
				printf(", ");
			else
				printf("-%d, ", i-1);
			goto from;
	}	}
	if (j >= 0 && j != 255)
		printf("-255");
}

void
dumpranges(void)
{	Vr_Ptr *tmp;
	printf("\nValues assigned within ");
	printf("interval [0..255]:\n");
	for (tmp = ranges; tmp; tmp = tmp->nxt)
	{	printf("\t%s\t: ", tmp->nm);
		dumpval(tmp->vals, BYTESIZE);
		printf("\n");
	}
}
#endif
