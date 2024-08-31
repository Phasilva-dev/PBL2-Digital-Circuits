/*Modulo capaz de gerar uma matriz vazia atravez dos decodificadores, utilizado para as funcoes de ataque*/

module col_x_lin (
	input ch7,ch6,ch5,ch4,ch3,ch2,ch1,ch0,botao, //entradas de chaves
	input clk,
	input pos_a0, pos_b0, pos_c0, pos_d0, pos_e0, //Matriz de defesa/posicionamento
	input pos_a1, pos_b1, pos_c1, pos_d1, pos_e1,
	input pos_a2, pos_b2, pos_c2, pos_d2, pos_e2,
	input pos_a3, pos_b3, pos_c3, pos_d3, pos_e3,
	input pos_a4, pos_b4, pos_c4, pos_d4, pos_e4,
	input pos_a5, pos_b5, pos_c5, pos_d5, pos_e5,
	input pos_a6, pos_b6, pos_c6, pos_d6, pos_e6,
	output atq_a0, atq_b0, atq_c0, atq_d0, atq_e0, //Matriz de ataque(Todo o historico)
	output atq_a1, atq_b1, atq_c1, atq_d1, atq_e1,
	output atq_a2, atq_b2, atq_c2, atq_d2, atq_e2,
	output atq_a3, atq_b3, atq_c3, atq_d3, atq_e3,
	output atq_a4, atq_b4, atq_c4, atq_d4, atq_e4,
	output atq_a5, atq_b5, atq_c5, atq_d5, atq_e5,
	output atq_a6, atq_b6, atq_c6, atq_d6, atq_e6,
	output vermelho,verde
);
wire l0,l1,l2,l3,l4,l5,l6;
wire ca,cb,cc,cd,ce;
wire ch76;

and and_ch76(ch76,ch7,ch6);

	wire fa0, fb0, fc0, fd0, fe0;	//Matriz resultante dos codificadores, eh importante lembrar que
	wire fa1, fb1, fc1, fd1, fe1;	//apenas um desses pontos sera nivel logico alto por vez.
	wire fa2, fb2, fc2, fd2, fe2;
	wire fa3, fb3, fc3, fd3, fe3;
	wire fa4, fb4, fc4, fd4, fe4;
	wire fa5, fb5, fc5, fd5, fe5;
	wire fa6, fb6, fc6, fd6, fe6;

//instacia os decodificadores para definir qual pixel é o que deve ser atacado.
linha_cod cod_linha (
	.ch7(ch7), //Decodificador para as linhas(l)
	.ch6(ch6),
	.x(ch2),
	.y(ch1),
	.z(ch0),
	.L0 (l0),
	.L1 (l1),
	.L2 (l2),
	.L3 (l3),
	.L4 (l4),
	.L5 (l5), 
	.L6 (l6),
);
coluna_cod cod_coluna (
	.ch7(ch7), //Decodificador para as colunas(c)
	.ch6(ch6),
	.x(ch5),
	.y(ch4),
	.z(ch3),
	.CA(ca),
	.CB(cb),
	.CC(cc),
	.CD(cd),
	.CE(ce),
);

//coluna A
and and_fa0(fa0, l0, ca, botao);
and and_fa1(fa1, l1, ca, botao);
and and_fa2(fa2, l2, ca, botao);
and and_fa3(fa3, l3, ca, botao);
and and_fa4(fa4, l4, ca, botao);
and and_fa5(fa5, l5, ca, botao);
and and_fa6(fa6, l6, ca, botao);

//coluna B
and and_fb0(fb0, l0, cb, botao);
and and_fb1(fb1, l1, cb, botao);
and and_fb2(fb2, l2, cb, botao);
and and_fb3(fb3, l3, cb, botao);
and and_fb4(fb4, l4, cb, botao);
and and_fb5(fb5, l5, cb, botao);
and and_fb6(fb6, l6, cb, botao);

//coluna C
and and_fc0(fc0, l0, cc, botao);
and and_fc1(fc1, l1, cc, botao);
and and_fc2(fc2, l2, cc, botao);
and and_fc3(fc3, l3, cc, botao);
and and_fc4(fc4, l4, cc, botao);
and and_fc5(fc5, l5, cc, botao);
and and_fc6(fc6, l6, cc, botao);

//coluna D
and and_fd0(fd0, l0, cd, botao);
and and_fd1(fd1, l1, cd, botao);
and and_fd2(fd2, l2, cd, botao);
and and_fd3(fd3, l3, cd, botao);
and and_fd4(fd4, l4, cd, botao);
and and_fd5(fd5, l5, cd, botao);
and and_fd6(fd6, l6, cd, botao);

//coluna E
and and_fe0(fe0, l0, ce, botao);
and and_fe1(fe1, l1, ce, botao);
and and_fe2(fe2, l2, ce, botao);
and and_fe3(fe3, l3, ce, botao);
and and_fe4(fe4, l4, ce, botao);
and and_fe5(fe5, l5, ce, botao);
and and_fe6(fe6, l6, ce, botao);


salvar_mapa matriz_de_atq (
	.botao(clk), .ch6(ch76),	.ch7(ch7), //Entradas de controle
	.a0(fa0), .b0(fb0), .c0(fc0), .d0(fd0), .e0(fe0),	//Matriz resultante dos codificadores
	.a1(fa1), .b1(fb1), .c1(fc1), .d1(fd1), .e1(fe1),
	.a2(fa2), .b2(fb2), .c2(fc2), .d2(fd2), .e2(fe2),
	.a3(fa3), .b3(fb3), .c3(fc3), .d3(fd3), .e3(fe3),
	.a4(fa4), .b4(fb4), .c4(fc4), .d4(fd4), .e4(fe4),
	.a5(fa5), .b5(fb5), .c5(fc5), .d5(fd5), .e5(fe5),
	.a6(fa6), .b6(fb6), .c6(fc6), .d6(fd6), .e6(fe6),
	.ff_a0(atq_a0), .ff_b0(atq_b0), .ff_c0(atq_c0), .ff_d0(atq_d0), .ff_e0(atq_e0),	//Todo historico de
	.ff_a1(atq_a1), .ff_b1(atq_b1), .ff_c1(atq_c1), .ff_d1(atq_d1), .ff_e1(atq_e1),	//ataques salvos em FFs
	.ff_a2(atq_a2), .ff_b2(atq_b2), .ff_c2(atq_c2), .ff_d2(atq_d2), .ff_e2(atq_e2),
	.ff_a3(atq_a3), .ff_b3(atq_b3), .ff_c3(atq_c3), .ff_d3(atq_d3), .ff_e3(atq_e3),
	.ff_a4(atq_a4), .ff_b4(atq_b4), .ff_c4(atq_c4), .ff_d4(atq_d4), .ff_e4(atq_e4),
	.ff_a5(atq_a5), .ff_b5(atq_b5), .ff_c5(atq_c5), .ff_d5(atq_d5), .ff_e5(atq_e5),
	.ff_a6(atq_a6), .ff_b6(atq_b6), .ff_c6(atq_c6), .ff_d6(atq_d6), .ff_e6(atq_e6)
);


comparador atq_x_pos (
	.ch6(ch6),	.ch7(ch7),	.botao(botao),
	.pos_a0(pos_a0), .pos_b0(pos_b0), .pos_c0(pos_c0), .pos_d0(pos_d0), .pos_e0(pos_e0),
	.pos_a1(pos_a1), .pos_b1(pos_b1), .pos_c1(pos_c1), .pos_d1(pos_d1), .pos_e1(pos_e1),
	.pos_a2(pos_a2), .pos_b2(pos_b2), .pos_c2(pos_c2), .pos_d2(pos_d2), .pos_e2(pos_e2),
	.pos_a3(pos_a3), .pos_b3(pos_b3), .pos_c3(pos_c3), .pos_d3(pos_d3), .pos_e3(pos_e3),
	.pos_a4(pos_a4), .pos_b4(pos_b4), .pos_c4(pos_c4), .pos_d4(pos_d4), .pos_e4(pos_e4),
	.pos_a5(pos_a5), .pos_b5(pos_b5), .pos_c5(pos_c5), .pos_d5(pos_d5), .pos_e5(pos_e5),
	.pos_a6(pos_a6), .pos_b6(pos_b6), .pos_c6(pos_c6), .pos_d6(pos_d6), .pos_e6(pos_e6),
	//Matriz de posicionamento(salva nos FFs)
	.fa0(fa0), .fb0(fb0), .fc0(fc0), .fd0(fd0), .fe0(fe0),	//A coordenada que foi escolhida para atacar
	.fa1(fa1), .fb1(fb1), .fc1(fc1), .fd1(fd1), .fe1(fe1),	//esta no meio desta matriz.
	.fa2(fa2), .fb2(fb2), .fc2(fc2), .fd2(fd2), .fe2(fe2),
	.fa3(fa3), .fb3(fb3), .fc3(fc3), .fd3(fd3), .fe3(fe3),
	.fa4(fa4), .fb4(fb4), .fc4(fc4), .fd4(fd4), .fe4(fe4),
	.fa5(fa5), .fb5(fb5), .fc5(fc5), .fd5(fd5), .fe5(fe5),
	.fa6(fa6), .fb6(fb6), .fc6(fc6), .fd6(fd6), .fe6(fe6),
	.atq_a0(), .atq_b0(), .atq_c0(), .atq_d0(), .atq_e0(), //Nao utilizada nesse caso
	.atq_a1(), .atq_b1(), .atq_c1(), .atq_d1(), .atq_e1(), 
	.atq_a2(), .atq_b2(), .atq_c2(), .atq_d2(), .atq_e2(),
	.atq_a3(), .atq_b3(), .atq_c3(), .atq_d3(), .atq_e3(),
	.atq_a4(), .atq_b4(), .atq_c4(), .atq_d4(), .atq_e4(),
	.atq_a5(), .atq_b5(), .atq_c5(), .atq_d5(), .atq_e5(),
	.atq_a6(), .atq_b6(), .atq_c6(), .atq_d6(), .atq_e6(),
	.vermelho(vermelho), .verde(verde) //Resultado do tiro gerado pela comparação das 2 matrizes.
);
endmodule
