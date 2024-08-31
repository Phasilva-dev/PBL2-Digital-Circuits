/*Um demux 1/7 para fazer a exibição das linhas da matriz de leds*/

module demux_count_3b (
	input clk_div, //clock pro contador de 3bits
	output l0,l1,l2,l3,l4,l5,l6 //a linha que deve ser ligada
);
wire b0,b1,b2,nb0,nb1,nb2; //bit 0 ao 2 e suas versões negadas

wire q000,q001,q010,q011,q100,q101,q110; //bit 000 até o 110 para contemplar cada linha

contador_3bits count3 (
	.clk_div(clk_div),
	.q0(b0),
	.q1(b1),
	.q2(b2)
);
not not_b0(nb0,b0);
not not_b1(nb1,b1);
not not_b2(nb2,b2);
	
and and_q000(q000,nb2,nb1,nb0);
and and_q001(q001,nb2,nb1,b0);
and and_q010(q010,nb2,b1,nb0);
and and_q011(q011,nb2,b1,b0);
and and_q100(q100,b2,nb1,nb0);
and and_q101(q101,b2,nb1,b0);
and and_q110(q110,b2,b1,nb0);

nand nand_l0(l0,1'b1,q000);
nand nand_l1(l1,1'b1,q001);
nand nand_l2(l2,1'b1,q010);
nand nand_l3(l3,1'b1,q011);
nand nand_l4(l4,1'b1,q100);
nand nand_l5(l5,1'b1,q101);
nand nand_l6(l6,1'b1,q110);

endmodule
