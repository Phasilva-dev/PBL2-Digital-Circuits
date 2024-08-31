/*modulo que combina mux, demux e contador para conseguir exibir na matriz 7x5*/
module exibir_matriz (
	input a0,b0,c0,d0,e0, //Matriz que sera exibida
	input a1,b1,c1,d1,e1,
	input a2,b2,c2,d2,e2,
	input a3,b3,c3,d3,e3,
	input a4,b4,c4,d4,e4,
	input a5,b5,c5,d5,e5,
	input a6,b6,c6,d6,e6, 
	input clk_div,
	output ca,cb,cc,cd,ce, //pixeis da coluna 0(a) até a 4(e)
	output l0,l1,l2,l3,l4,l5,l6 //pixeis da linha 0 até 6
);
wire bit0,bit1,bit2,nb0,nb1,nb2; //bit 0 ao 2 e suas versões negadas

wire q000,q001,q010,q011,q100,q101,q110; //bit 000 até o 110 para contemplar cada linha

demux_count_3b E_demux_count_3b (
    .clk_div(clk_div), //contador de linhas
    .l0(l0),
    .l1(l1),
    .l2(l2),
    .l3(l3),
    .l4(l4),
    .l5(l5),
    .l6(l6)
);

contador_3bits count3 ( //Contador que ligara no MUX, as linhas não serviam pois estavam negadas e preferi fazer assim
	.clk_div(clk_div),
	.q0(bit0),
	.q1(bit1),
	.q2(bit2)
);
not not_b0(nb0,bit0);
not not_b1(nb1,bit1);
not not_b2(nb2,bit2);
	
and and_q000(q000,nb2,nb1,nb0);
and and_q001(q001,nb2,nb1,bit0);
and and_q010(q010,nb2,bit1,nb0);
and and_q011(q011,nb2,bit1,bit0);
and and_q100(q100,bit2,nb1,nb0);
and and_q101(q101,bit2,nb1,bit0);
and and_q110(q110,bit2,bit1,nb0);
mux35_5 E_mux35_5 (
    .a0(a0), .b0(b0), .c0(c0), .d0(d0), .e0(e0),
    .a1(a1), .b1(b1), .c1(c1), .d1(d1), .e1(e1),
    .a2(a2), .b2(b2), .c2(c2), .d2(d2), .e2(e2),
    .a3(a3), .b3(b3), .c3(c3), .d3(d3), .e3(e3),
    .a4(a4), .b4(b4), .c4(c4), .d4(d4), .e4(e4),
    .a5(a5), .b5(b5), .c5(c5), .d5(d5), .e5(e5),
    .a6(a6), .b6(b6), .c6(c6), .d6(d6), .e6(e6),
    .l0(q000), .l1(q001), .l2(q010), .l3(q011), .l4(q100), .l5(q101), .l6(q110), 
    .ca(ca), .cb(cb), .cc(cc), .cd(cd), .ce(ce)
);

endmodule