/*botao e a chave fisica para confirmar, ch6 deve ser usada para indicar o estado do jogo
e ch7 para identificar o estado da maquina(ligado desligado)
Diferente do salvar_mapa, esse modulo reescreve tudo por cima, sendo utilizado
para a matriz de posicionamento evitando assim sobreposicao de matrizes.*/
module salvar_mapa2 (
	input botao,ch6,ch7, //Entradas fisicas para operação dos FFs
	input a0,b0,c0,d0,e0, //Matriz que será salva
	input a1,b1,c1,d1,e1,
	input a2,b2,c2,d2,e2,
	input a3,b3,c3,d3,e3,
	input a4,b4,c4,d4,e4,
	input a5,b5,c5,d5,e5,
	input a6,b6,c6,d6,e6,
	output ff_a0, ff_b0, ff_c0, ff_d0, ff_e0, //Matriz salva nos FFs
	output ff_a1, ff_b1, ff_c1, ff_d1, ff_e1,
	output ff_a2, ff_b2, ff_c2, ff_d2, ff_e2,
	output ff_a3, ff_b3, ff_c3, ff_d3, ff_e3,
	output ff_a4, ff_b4, ff_c4, ff_d4, ff_e4,
	output ff_a5, ff_b5, ff_c5, ff_d5, ff_e5,
	output ff_a6, ff_b6, ff_c6, ff_d6, ff_e6
);
wire bch;
wire nch7;
not not_nch7(nch7,ch7);
and and_bch(bch,botao,ch6);

// Coluna A
d_flip_flop ffa0 (
    .clk(bch), .reset(nch7), .d(a0), .q(ff_a0)
);
d_flip_flop ffa1 (
    .clk(bch), .reset(nch7), .d(a1), .q(ff_a1)
);
d_flip_flop ffa2 (
    .clk(bch), .reset(nch7), .d(a2), .q(ff_a2)
);
d_flip_flop ffa3 (
    .clk(bch), .reset(nch7), .d(a3), .q(ff_a3)
);
d_flip_flop ffa4 (
    .clk(bch), .reset(nch7), .d(a4), .q(ff_a4)
);
d_flip_flop ffa5 (
    .clk(bch), .reset(nch7), .d(a5), .q(ff_a5)
);
d_flip_flop ffa6 (
    .clk(bch), .reset(nch7), .d(a6), .q(ff_a6)
);

// Coluna B
d_flip_flop ffb0 (
    .clk(bch), .reset(nch7), .d(b0), .q(ff_b0)
);
d_flip_flop ffb1 (
    .clk(bch), .reset(nch7), .d(b1), .q(ff_b1)
);
d_flip_flop ffb2 (
    .clk(bch), .reset(nch7), .d(b2), .q(ff_b2)
);
d_flip_flop ffb3 (
    .clk(bch), .reset(nch7), .d(b3), .q(ff_b3)
);
d_flip_flop ffb4 (
    .clk(bch), .reset(nch7), .d(b4), .q(ff_b4)
);
d_flip_flop ffb5 (
    .clk(bch), .reset(nch7), .d(b5), .q(ff_b5)
);
d_flip_flop ffb6 (
    .clk(bch), .reset(nch7), .d(b6), .q(ff_b6)
);

// Coluna C
d_flip_flop ffc0 (
    .clk(bch), .reset(nch7), .d(c0), .q(ff_c0)
);
d_flip_flop ffc1 (
    .clk(bch), .reset(nch7), .d(c1), .q(ff_c1)
);
d_flip_flop ffc2 (
    .clk(bch), .reset(nch7), .d(c2), .q(ff_c2)
);
d_flip_flop ffc3 (
    .clk(bch), .reset(nch7), .d(c3), .q(ff_c3)
);
d_flip_flop ffc4 (
    .clk(bch), .reset(nch7), .d(c4), .q(ff_c4)
);
d_flip_flop ffc5 (
    .clk(bch), .reset(nch7), .d(c5), .q(ff_c5)
);
d_flip_flop ffc6 (
    .clk(bch), .reset(nch7), .d(c6), .q(ff_c6)
);

// Coluna D
d_flip_flop ffd0 (
    .clk(bch), .reset(nch7), .d(d0), .q(ff_d0)
);
d_flip_flop ffd1 (
    .clk(bch), .reset(nch7), .d(d1), .q(ff_d1)
);
d_flip_flop ffd2 (
    .clk(bch), .reset(nch7), .d(d2), .q(ff_d2)
);
d_flip_flop ffd3 (
    .clk(bch), .reset(nch7), .d(d3), .q(ff_d3)
);
d_flip_flop ffd4 (
    .clk(bch), .reset(nch7), .d(d4), .q(ff_d4)
);
d_flip_flop ffd5 (
    .clk(bch), .reset(nch7), .d(d5), .q(ff_d5)
);
d_flip_flop ffd6 (
    .clk(bch), .reset(nch7), .d(d6), .q(ff_d6)
);

// Coluna E
d_flip_flop ffe0 (
    .clk(bch), .reset(nch7), .d(e0), .q(ff_e0)
);
d_flip_flop ffe1 (
    .clk(bch), .reset(nch7), .d(e1), .q(ff_e1)
);
d_flip_flop ffe2 (
    .clk(bch), .reset(nch7), .d(e2), .q(ff_e2)
);
d_flip_flop ffe3 (
    .clk(bch), .reset(nch7), .d(e3), .q(ff_e3)
);
d_flip_flop ffe4 (
    .clk(bch), .reset(nch7), .d(e4), .q(ff_e4)
);
d_flip_flop ffe5 (
    .clk(bch), .reset(nch7), .d(e5), .q(ff_e5)
);
d_flip_flop ffe6 (
    .clk(bch), .reset(nch7), .d(e6), .q(ff_e6)
);


endmodule