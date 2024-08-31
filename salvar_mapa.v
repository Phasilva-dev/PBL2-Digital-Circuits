/*Modulo para salvar um mapa numa matriz de registradores, porem, nao eh possivel setar de volta para 1
o que foi escrito, resolvendo assim problemas que envolvem sobrescrever historico de ataque*/
module salvar_mapa (
	input botao,ch6,ch7, //Entradas fisicas de controle
	input a0,b0,c0,d0,e0, //Matriz que sera salva
	input a1,b1,c1,d1,e1,
	input a2,b2,c2,d2,e2,
	input a3,b3,c3,d3,e3,
	input a4,b4,c4,d4,e4,
	input a5,b5,c5,d5,e5,
	input a6,b6,c6,d6,e6,
	output wire ff_a0, ff_b0, ff_c0, ff_d0, ff_e0, //Matriz salva
	output wire ff_a1, ff_b1, ff_c1, ff_d1, ff_e1,
	output wire ff_a2, ff_b2, ff_c2, ff_d2, ff_e2,
	output wire ff_a3, ff_b3, ff_c3, ff_d3, ff_e3,
	output wire ff_a4, ff_b4, ff_c4, ff_d4, ff_e4,
	output wire ff_a5, ff_b5, ff_c5, ff_d5, ff_e5,
	output wire ff_a6, ff_b6, ff_c6, ff_d6, ff_e6
);
wire bch;
wire nch7;

/*Wires para garantir que após registar um nivel logico alto, não seria mais possivel setar para nivel
logico baixo sem usar a função reset.*/
wire o_a0,o_b0,o_c0,o_d0,o_e0;
wire o_a1,o_b1,o_c1,o_d1,o_e1;
wire o_a2,o_b2,o_c2,o_d2,o_e2;
wire o_a3,o_b3,o_c3,o_d3,o_e3;
wire o_a4,o_b4,o_c4,o_d4,o_e4;
wire o_a5,o_b5,o_c5,o_d5,o_e5;
wire o_a6,o_b6,o_c6,o_d6,o_e6;

not not_nch7(nch7,ch7);
and and_bch(bch,botao,ch6);

//Ors para retroalimentar a entrada D
or or_a0(o_a0,ff_a0,a0);
or or_a1(o_a1,ff_a1,a1);
or or_a2(o_a2,ff_a2,a2);
or or_a3(o_a3,ff_a3,a3);
or or_a4(o_a4,ff_a4,a4);
or or_a5(o_a5,ff_a5,a5);
or or_a6(o_a6,ff_a6,a6);

or or_b0(o_b0,ff_b0,b0);
or or_b1(o_b1,ff_b1,b1);
or or_b2(o_b2,ff_b2,b2);
or or_b3(o_b3,ff_b3,b3);
or or_b4(o_b4,ff_b4,b4);
or or_b5(o_b5,ff_b5,b5);
or or_b6(o_b6,ff_b6,b6);

or or_c0(o_c0,ff_c0,c0);
or or_c1(o_c1,ff_c1,c1);
or or_c2(o_c2,ff_c2,c2);
or or_c3(o_c3,ff_c3,c3);
or or_c4(o_c4,ff_c4,c4);
or or_c5(o_c5,ff_c5,c5);
or or_c6(o_c6,ff_c6,c6);

or or_d0(o_d0,ff_d0,d0);
or or_d1(o_d1,ff_d1,d1);
or or_d2(o_d2,ff_d2,d2);
or or_d3(o_d3,ff_d3,d3);
or or_d4(o_d4,ff_d4,d4);
or or_d5(o_d5,ff_d5,d5);
or or_d6(o_d6,ff_d6,d6);

or or_e0(o_e0,ff_e0,e0);
or or_e1(o_e1,ff_e1,e1);
or or_e2(o_e2,ff_e2,e2);
or or_e3(o_e3,ff_e3,e3);
or or_e4(o_e4,ff_e4,e4);
or or_e5(o_e5,ff_e5,e5);
or or_e6(o_e6,ff_e6,e6);

//Coluna A
d_flip_flop ffa0 (
	.clk(bch), .reset(nch7), .d(o_a0), .q(ff_a0)
);
d_flip_flop ffa1 (
	.clk(bch), .reset(nch7), .d(o_a1), .q(ff_a1)
);
d_flip_flop ffa2 (
	.clk(bch), .reset(nch7), .d(o_a2), .q(ff_a2)
);
d_flip_flop ffa3 (
	.clk(bch), .reset(nch7), .d(o_a3), .q(ff_a3)
);
d_flip_flop ffa4 (
	.clk(bch), .reset(nch7), .d(o_a4), .q(ff_a4)
);
d_flip_flop ffa5 (
	.clk(bch), .reset(nch7), .d(o_a5), .q(ff_a5)
);
d_flip_flop ffa6 (
	.clk(bch), .reset(nch7), .d(o_a6), .q(ff_a6)
);
//Coluna B
d_flip_flop ffb0 (
    .clk(bch), .reset(nch7), .d(o_b0), .q(ff_b0)
);
d_flip_flop ffb1 (
    .clk(bch), .reset(nch7), .d(o_b1), .q(ff_b1)
);
d_flip_flop ffb2 (
    .clk(bch), .reset(nch7), .d(o_b2), .q(ff_b2)
);
d_flip_flop ffb3 (
    .clk(bch), .reset(nch7), .d(o_b3), .q(ff_b3)
);
d_flip_flop ffb4 (
    .clk(bch), .reset(nch7), .d(o_b4), .q(ff_b4)
);
d_flip_flop ffb5 (
    .clk(bch), .reset(nch7), .d(o_b5), .q(ff_b5)
);
d_flip_flop ffb6 (
    .clk(bch), .reset(nch7), .d(o_b6), .q(ff_b6)
);
//Coluna C
d_flip_flop ffc0 (
    .clk(bch), .reset(nch7), .d(o_c0), .q(ff_c0)
);
d_flip_flop ffc1 (
    .clk(bch), .reset(nch7), .d(o_c1), .q(ff_c1)
);
d_flip_flop ffc2 (
    .clk(bch), .reset(nch7), .d(o_c2), .q(ff_c2)
);
d_flip_flop ffc3 (
    .clk(bch), .reset(nch7), .d(o_c3), .q(ff_c3)
);
d_flip_flop ffc4 (
    .clk(bch), .reset(nch7), .d(o_c4), .q(ff_c4)
);
d_flip_flop ffc5 (
    .clk(bch), .reset(nch7), .d(o_c5), .q(ff_c5)
);
d_flip_flop ffc6 (
    .clk(bch), .reset(nch7), .d(o_c6), .q(ff_c6)
);
//Coluna D
d_flip_flop ffd0 (
    .clk(bch), .reset(nch7), .d(o_d0), .q(ff_d0)
);
d_flip_flop ffd1 (
    .clk(bch), .reset(nch7), .d(o_d1), .q(ff_d1)
);
d_flip_flop ffd2 (
    .clk(bch), .reset(nch7), .d(o_d2), .q(ff_d2)
);
d_flip_flop ffd3 (
    .clk(bch), .reset(nch7), .d(o_d3), .q(ff_d3)
);
d_flip_flop ffd4 (
    .clk(bch), .reset(nch7), .d(o_d4), .q(ff_d4)
);
d_flip_flop ffd5 (
    .clk(bch), .reset(nch7), .d(o_d5), .q(ff_d5)
);
d_flip_flop ffd6 (
    .clk(bch), .reset(nch7), .d(o_d6), .q(ff_d6)
);
//Coluna E
d_flip_flop ffe0 (
    .clk(bch), .reset(nch7), .d(o_e0), .q(ff_e0)
);
d_flip_flop ffe1 (
    .clk(bch), .reset(nch7), .d(o_e1), .q(ff_e1)
);
d_flip_flop ffe2 (
    .clk(bch), .reset(nch7), .d(o_e2), .q(ff_e2)
);
d_flip_flop ffe3 (
    .clk(bch), .reset(nch7), .d(o_e3), .q(ff_e3)
);
d_flip_flop ffe4 (
    .clk(bch), .reset(nch7), .d(o_e4), .q(ff_e4)
);
d_flip_flop ffe5 (
    .clk(bch), .reset(nch7), .d(o_e5), .q(ff_e5)
);
d_flip_flop ffe6 (
    .clk(bch), .reset(nch7), .d(o_e6), .q(ff_e6)
);

endmodule