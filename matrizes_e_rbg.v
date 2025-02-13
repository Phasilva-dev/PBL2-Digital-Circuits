/*Modulo para gerenciar toda a exibicao da matriz de leds e led RGB*/
module matrizes_e_rbg (
	input ch7,ch6,ch5,ch4,ch3,ch2,ch1,ch0,botao, //entradas de fisicas
	input clk_div, //Clock
	output ca,cb,cc,cd,ce, //Pin da coluna
	output l0,l1,l2,l3,l4,l5,l6, //Pin da linha
	output vermelho,verde //Pin do RGB
);
wire pos_a0, pos_b0, pos_c0, pos_d0, pos_e0; //Matriz de posicionamento salva em FFs
wire pos_a1, pos_b1, pos_c1, pos_d1, pos_e1;
wire pos_a2, pos_b2, pos_c2, pos_d2, pos_e2;
wire pos_a3, pos_b3, pos_c3, pos_d3, pos_e3;
wire pos_a4, pos_b4, pos_c4, pos_d4, pos_e4;
wire pos_a5, pos_b5, pos_c5, pos_d5, pos_e5;
wire pos_a6, pos_b6, pos_c6, pos_d6, pos_e6;

wire atq_a0, atq_b0, atq_c0, atq_d0, atq_e0; //Matriz de ataque resultante da comparação
wire atq_a1, atq_b1, atq_c1, atq_d1, atq_e1; //do historico de tiros com a de posicionamento
wire atq_a2, atq_b2, atq_c2, atq_d2, atq_e2;
wire atq_a3, atq_b3, atq_c3, atq_d3, atq_e3;
wire atq_a4, atq_b4, atq_c4, atq_d4, atq_e4;
wire atq_a5, atq_b5, atq_c5, atq_d5, atq_e5;
wire atq_a6, atq_b6, atq_c6, atq_d6, atq_e6;

wire a0, b0, c0, d0, e0; //matriz advinda da saida do MUX 70_35
wire a1, b1, c1, d1, e1;
wire a2, b2, c2, d2, e2;
wire a3, b3, c3, d3, e3;
wire a4, b4, c4, d4, e4;
wire a5, b5, c5, d5, e5;
wire a6, b6, c6, d6, e6;

//Esse módulo seleciona e salva a matriz de posicionamento.
posicionamento pos_matriz (
	.ch0(ch0), .ch1(ch1), .ch6(ch6), .ch7(ch7), .botao(botao),	.clk_div(clk_div), //entradas fisicas
	.pos_a0(pos_a0), .pos_b0(pos_b0), .pos_c0(pos_c0), .pos_d0(pos_d0), .pos_e0(pos_e0), //linha dos flip-flops da matriz de posicionamento
	.pos_a1(pos_a1), .pos_b1(pos_b1), .pos_c1(pos_c1), .pos_d1(pos_d1), .pos_e1(pos_e1),
	.pos_a2(pos_a2), .pos_b2(pos_b2), .pos_c2(pos_c2), .pos_d2(pos_d2), .pos_e2(pos_e2),
	.pos_a3(pos_a3), .pos_b3(pos_b3), .pos_c3(pos_c3), .pos_d3(pos_d3), .pos_e3(pos_e3),
	.pos_a4(pos_a4), .pos_b4(pos_b4), .pos_c4(pos_c4), .pos_d4(pos_d4), .pos_e4(pos_e4),
	.pos_a5(pos_a5), .pos_b5(pos_b5), .pos_c5(pos_c5), .pos_d5(pos_d5), .pos_e5(pos_e5),
	.pos_a6(pos_a6), .pos_b6(pos_b6), .pos_c6(pos_c6), .pos_d6(pos_d6), .pos_e6(pos_e6)
);


ataque atacando (
	.ch7(ch7), .ch6(ch6), .ch5(ch5), .ch4(ch4), .ch3(ch3), .ch2(ch2), .ch1(ch1), .ch0(ch0), .botao(botao), // Entradas de chaves)
	.pos_a0(pos_a0), .pos_b0(pos_b0), .pos_c0(pos_c0), .pos_d0(pos_d0), .pos_e0(pos_e0),//Matriz de posicionamento salva nos FFs
	.pos_a1(pos_a1), .pos_b1(pos_b1), .pos_c1(pos_c1), .pos_d1(pos_d1), .pos_e1(pos_e1),//no módulo de posicionamento
	.pos_a2(pos_a2), .pos_b2(pos_b2), .pos_c2(pos_c2), .pos_d2(pos_d2), .pos_e2(pos_e2),
	.pos_a3(pos_a3), .pos_b3(pos_b3), .pos_c3(pos_c3), .pos_d3(pos_d3), .pos_e3(pos_e3),
	.pos_a4(pos_a4), .pos_b4(pos_b4), .pos_c4(pos_c4), .pos_d4(pos_d4), .pos_e4(pos_e4),
	.pos_a5(pos_a5), .pos_b5(pos_b5), .pos_c5(pos_c5), .pos_d5(pos_d5), .pos_e5(pos_e5),
	.pos_a6(pos_a6), .pos_b6(pos_b6), .pos_c6(pos_c6), .pos_d6(pos_d6), .pos_e6(pos_e6),
	.clk(clk_div),
	.atq_a0(atq_a0), .atq_b0(atq_b0), .atq_c0(atq_c0), .atq_d0(atq_d0), .atq_e0(atq_e0),
	.atq_a1(atq_a1), .atq_b1(atq_b1), .atq_c1(atq_c1), .atq_d1(atq_d1), .atq_e1(atq_e1),
	.atq_a2(atq_a2), .atq_b2(atq_b2), .atq_c2(atq_c2), .atq_d2(atq_d2), .atq_e2(atq_e2),
	.atq_a3(atq_a3), .atq_b3(atq_b3), .atq_c3(atq_c3), .atq_d3(atq_d3), .atq_e3(atq_e3),
	.atq_a4(atq_a4), .atq_b4(atq_b4), .atq_c4(atq_c4), .atq_d4(atq_d4), .atq_e4(atq_e4),
	.atq_a5(atq_a5), .atq_b5(atq_b5), .atq_c5(atq_c5), .atq_d5(atq_d5), .atq_e5(atq_e5),
	.atq_a6(atq_a6), .atq_b6(atq_b6), .atq_c6(atq_c6), .atq_d6(atq_d6), .atq_e6(atq_e6),
	.vermelho(vermelho),	.verde(verde)	
);


//Um mux para definir qual matriz deve ser exibida.
mux70_35 mux_atq_def (
	.ch6(ch6),
	// Mapa do Posicionamento
	.a00(pos_a0), .b00(pos_b0), .c00(pos_c0), .d00(pos_d0), .e00(pos_e0),
	.a01(pos_a1), .b01(pos_b1), .c01(pos_c1), .d01(pos_d1), .e01(pos_e1),
	.a02(pos_a2), .b02(pos_b2), .c02(pos_c2), .d02(pos_d2), .e02(pos_e2),
	.a03(pos_a3), .b03(pos_b3), .c03(pos_c3), .d03(pos_d3), .e03(pos_e3),
	.a04(pos_a4), .b04(pos_b4), .c04(pos_c4), .d04(pos_d4), .e04(pos_e4),
	.a05(pos_a5), .b05(pos_b5), .c05(pos_c5), .d05(pos_d5), .e05(pos_e5),
	.a06(pos_a6), .b06(pos_b6), .c06(pos_c6), .d06(pos_d6), .e06(pos_e6),
	// Mapa do Ataque
	.a10(atq_a0), .b10(atq_b0), .c10(atq_c0), .d10(atq_d0), .e10(atq_e0),
	.a11(atq_a1), .b11(atq_b1), .c11(atq_c1), .d11(atq_d1), .e11(atq_e1),
	.a12(atq_a2), .b12(atq_b2), .c12(atq_c2), .d12(atq_d2), .e12(atq_e2),
	.a13(atq_a3), .b13(atq_b3), .c13(atq_c3), .d13(atq_d3), .e13(atq_e3),
	.a14(atq_a4), .b14(atq_b4), .c14(atq_c4), .d14(atq_d4), .e14(atq_e4),
	.a15(atq_a5), .b15(atq_b5), .c15(atq_c5), .d15(atq_d5), .e15(atq_e5),
	.a16(atq_a6), .b16(atq_b6), .c16(atq_c6), .d16(atq_d6), .e16(atq_e6),
	// Saídas
	.a0(a0), .b0(b0), .c0(c0), .d0(d0), .e0(e0),
	.a1(a1), .b1(b1), .c1(c1), .d1(d1), .e1(e1),
	.a2(a2), .b2(b2), .c2(c2), .d2(d2), .e2(e2),
	.a3(a3), .b3(b3), .c3(c3), .d3(d3), .e3(e3),
	.a4(a4), .b4(b4), .c4(c4), .d4(d4), .e4(e4),
	.a5(a5), .b5(b5), .c5(c5), .d5(d5), .e5(e5),
	.a6(a6), .b6(b6), .c6(c6), .d6(d6), .e6(e6)
);


//Módulo para exibir a matriz.
exibir_matriz matriz_final (
	.a0(a0), .b0(b0), .c0(c0), .d0(d0), .e0(e0),
	.a1(a1), .b1(b1), .c1(c1), .d1(d1), .e1(e1),
	.a2(a2), .b2(b2), .c2(c2), .d2(d2), .e2(e2),
	.a3(a3), .b3(b3), .c3(c3), .d3(d3), .e3(e3),
	.a4(a4), .b4(b4), .c4(c4), .d4(d4), .e4(e4),
	.a5(a5), .b5(b5), .c5(c5), .d5(d5), .e5(e5),
	.a6(a6), .b6(b6), .c6(c6), .d6(d6), .e6(e6),
	.clk_div(clk_div),
	.ca(ca), .cb(cb), .cc(cc), .cd(cd), .ce(ce),
	.l0(l0), .l1(l1), .l2(l2), .l3(l3), .l4(l4), .l5(l5), .l6(l6)
);


endmodule