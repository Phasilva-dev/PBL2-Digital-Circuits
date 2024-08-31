/*Um modulo para fazer toda a parte de posicionamento da matriz, escolhe e salva a matriz desejada*/

module posicionamento (
	input ch0,ch1,ch6,ch7,botao,clk_div, //Entradas fisicas de controle
	output pos_a0, pos_b0, pos_c0, pos_d0, pos_e0, //Matriz de posicionamento
	output pos_a1, pos_b1, pos_c1, pos_d1, pos_e1,
	output pos_a2, pos_b2, pos_c2, pos_d2, pos_e2,
	output pos_a3, pos_b3, pos_c3, pos_d3, pos_e3,
	output pos_a4, pos_b4, pos_c4, pos_d4, pos_e4,
	output pos_a5, pos_b5, pos_c5, pos_d5, pos_e5,
	output pos_a6, pos_b6, pos_c6, pos_d6, pos_e6
);
wire nch6,ch7n6;
wire a0, b0, c0, d0, e0; //Matriz que sera escolhida apos a utilizacao do mux
wire a1, b1, c1, d1, e1;
wire a2, b2, c2, d2, e2;
wire a3, b3, c3, d3, e3;
wire a4, b4, c4, d4, e4;
wire a5, b5, c5, d5, e5;
wire a6, b6, c6, d6, e6;
not not_nch6(nch6,ch6);
and and_ch7n6(ch7n6,ch7,nch6);
mux140_35 mapas ( //MUX para escolher os mapas
	// Entradas de seleção h0 e h1
	.ch0(ch0), .ch1(ch1), .ch6(ch6), .ch7(ch7),
	//1'b1

	// Mapeamento para o primeiro conjunto de entradas
	.a00(1'b1), .b00(1'b1), .c00(1'b1), .d00(), .e00(),
	.a01(), .b01(1'b1), .c01(), .d01(), .e01(),
	.a02(), .b02(1'b1), .c02(), .d02(), .e02(),
	.a03(), .b03(), .c03(), .d03(1'b1), .e03(),
	.a04(), .b04(), .c04(1'b1), .d04(1'b1), .e04(1'b1),
	.a05(1'b1), .b05(), .c05(), .d05(), .e05(),
	.a06(1'b1), .b06(1'b1), .c06(1'b1), .d06(), .e06(),

	// Mapeamento para o segundo conjunto de entradas
	.a10(1'b1), .b10(1'b1), .c10(1'b1), .d10(), .e10(),
	.a11(), .b11(), .c11(1'b1), .d11(), .e11(),
	.a12(), .b12(), .c12(), .d12(), .e12(1'b1),
	.a13(), .b13(), .c13(1'b1), .d13(1'b1), .e13(1'b1),
	.a14(1'b1), .b14(), .c14(), .d14(), .e14(1'b1),
	.a15(1'b1), .b15(1'b1), .c15(), .d15(), .e15(),
	.a16(1'b1), .b16(), .c16(), .d16(), .e16(),
	// Mapeamento para o terceiro conjunto de entradas
	.a20(1'b1), .b20(), .c20(), .d20(), .e20(),
	.a21(1'b1), .b21(1'b1), .c21(1'b1), .d21(), .e21(),
	.a22(1'b1), .b22(), .c22(), .d22(), .e22(),
	.a23(), .b23(), .c23(), .d23(), .e23(),
	.a24(), .b24(), .c24(), .d24(1'b1), .e24(1'b1),
	.a25(), .b25(1'b1), .c25(), .d25(), .e25(1'b1),
	.a26(1'b1), .b26(1'b1), .c26(1'b1), .d26(), .e26(1'b1),

	// Mapeamento para o quarto conjunto de entradas
	.a30(), .b30(1'b1), .c30(), .d30(1'b1), .e30(1'b1),
	.a31(), .b31(1'b1), .c31(), .d31(), .e31(1'b1),
	.a32(1'b1), .b32(1'b1), .c32(1'b1), .d32(), .e32(1'b1),
	.a33(), .b33(), .c33(), .d33(), .e33(),
	.a34(), .b34(), .c34(), .d34(), .e34(),
	.a35(), .b35(), .c35(), .d35(1'b1), .e35(),
	.a36(), .b36(), .c36(1'b1), .d36(1'b1), .e36(1'b1),
	
	//Saída
	.a0(a0), .b0(b0), .c0(c0), .d0(d0), .e0(e0), 
	.a1(a1), .b1(b1), .c1(c1), .d1(d1), .e1(e1),
	.a2(a2), .b2(b2), .c2(c2), .d2(d2), .e2(e2),
	.a3(a3), .b3(b3), .c3(c3), .d3(d3), .e3(e3),
	.a4(a4), .b4(b4), .c4(c4), .d4(d4), .e4(e4),
	.a5(a5), .b5(b5), .c5(c5), .d5(d5), .e5(e5),
	.a6(a6), .b6(b6), .c6(c6), .d6(d6), .e6(e6),
);
salvar_mapa2 mapa_posicao (
	 .botao(clk_div),	.ch6(ch7n6),	.ch7(ch7), //Entradas fisicas
	 
    .a0(a0),  .b0(b0),  .c0(c0),  .d0(d0),  .e0(e0), //Mapa que será salvo
    .a1(a1),  .b1(b1),  .c1(c1),  .d1(d1),  .e1(e1),
    .a2(a2),  .b2(b2),  .c2(c2),  .d2(d2),  .e2(e2),
    .a3(a3),  .b3(b3),  .c3(c3),  .d3(d3),  .e3(e3),
    .a4(a4),  .b4(b4),  .c4(c4),  .d4(d4),  .e4(e4),
    .a5(a5),  .b5(b5),  .c5(c5),  .d5(d5),  .e5(e5),
    .a6(a6),  .b6(b6),  .c6(c6),  .d6(d6),  .e6(e6),
	 
	 .ff_a0(pos_a0), .ff_b0(pos_b0), .ff_c0(pos_c0), .ff_d0(pos_d0), .ff_e0(pos_e0), //Mapa salvo nos FF's
    .ff_a1(pos_a1), .ff_b1(pos_b1), .ff_c1(pos_c1), .ff_d1(pos_d1), .ff_e1(pos_e1),
    .ff_a2(pos_a2), .ff_b2(pos_b2), .ff_c2(pos_c2), .ff_d2(pos_d2), .ff_e2(pos_e2),
    .ff_a3(pos_a3), .ff_b3(pos_b3), .ff_c3(pos_c3), .ff_d3(pos_d3), .ff_e3(pos_e3),
    .ff_a4(pos_a4), .ff_b4(pos_b4), .ff_c4(pos_c4), .ff_d4(pos_d4), .ff_e4(pos_e4),
    .ff_a5(pos_a5), .ff_b5(pos_b5), .ff_c5(pos_c5), .ff_d5(pos_d5), .ff_e5(pos_e5),
    .ff_a6(pos_a6), .ff_b6(pos_b6), .ff_c6(pos_c6), .ff_d6(pos_d6), .ff_e6(pos_e6)
);
endmodule