/*MUX 35_5 criado exclusivamente para o modulo exibir matriz*/
module mux35_5 (
	input a0,b0,c0,d0,e0, //Mapa que será amostrado
	input a1,b1,c1,d1,e1,
	input a2,b2,c2,d2,e2,
	input a3,b3,c3,d3,e3,
	input a4,b4,c4,d4,e4,
	input a5,b5,c5,d5,e5,
	input a6,b6,c6,d6,e6,
	input l0,l1,l2,l3,l4,l5,l6, //contador de linhas para ficar alternando qual coluna(linha) vai ligar
	output ca,cb,cc,cd,ce //coluna A até a E
);

wire l_a0, l_b0, l_c0, l_d0, l_e0; //Matriz no MUX
wire l_a1, l_b1, l_c1, l_d1, l_e1;
wire l_a2, l_b2, l_c2, l_d2, l_e2;
wire l_a3, l_b3, l_c3, l_d3, l_e3;
wire l_a4, l_b4, l_c4, l_d4, l_e4;
wire l_a5, l_b5, l_c5, l_d5, l_e5;
wire l_a6, l_b6, l_c6, l_d6, l_e6;

//Coluna A
and and_la0(l_a0, a0,l0);
and and_la1(l_a1, a1,l1);
and and_la2(l_a2, a2,l2);
and and_la3(l_a3, a3,l3);
and and_la4(l_a4, a4,l4);
and and_la5(l_a5, a5,l5);
and and_la6(l_a6, a6,l6);
or or_ca(ca,l_a0,l_a1,l_a2,l_a3,l_a4,l_a5,l_a6);

//Coluna B
and and_lb0(l_b0, b0, l0);
and and_lb1(l_b1, b1, l1);
and and_lb2(l_b2, b2, l2);
and and_lb3(l_b3, b3, l3);
and and_lb4(l_b4, b4, l4);
and and_lb5(l_b5, b5, l5);
and and_lb6(l_b6, b6, l6);
or or_cb(cb, l_b0, l_b1, l_b2, l_b3, l_b4, l_b5, l_b6);

// Coluna C
and and_lc0(l_c0, c0, l0);
and and_lc1(l_c1, c1, l1);
and and_lc2(l_c2, c2, l2);
and and_lc3(l_c3, c3, l3);
and and_lc4(l_c4, c4, l4);
and and_lc5(l_c5, c5, l5);
and and_lc6(l_c6, c6, l6);
or or_cc(cc, l_c0, l_c1, l_c2, l_c3, l_c4, l_c5, l_c6);

// Coluna D
and and_ld0(l_d0, d0, l0);
and and_ld1(l_d1, d1, l1);
and and_ld2(l_d2, d2, l2);
and and_ld3(l_d3, d3, l3);
and and_ld4(l_d4, d4, l4);
and and_ld5(l_d5, d5, l5);
and and_ld6(l_d6, d6, l6);
or or_cd(cd, l_d0, l_d1, l_d2, l_d3, l_d4, l_d5, l_d6);

// Coluna E
and and_le0(l_e0, e0, l0);
and and_le1(l_e1, e1, l1);
and and_le2(l_e2, e2, l2);
and and_le3(l_e3, e3, l3);
and and_le4(l_e4, e4, l4);
and and_le5(l_e5, e5, l5);
and and_le6(l_e6, e6, l6);
or or_ce(ce, l_e0, l_e1, l_e2, l_e3, l_e4, l_e5, l_e6);

endmodule