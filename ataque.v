//Modulo para gerenciar toda parte de ataque na matriz de leds

module ataque (
	input ch7,ch6,ch5,ch4,ch3,ch2,ch1,ch0,botao, //entradas de chaves
	input pos_a0, pos_b0, pos_c0, pos_d0, pos_e0, //Matriz de defesa/posicionamento(salva em FFs)
	input pos_a1, pos_b1, pos_c1, pos_d1, pos_e1,
	input pos_a2, pos_b2, pos_c2, pos_d2, pos_e2,
	input pos_a3, pos_b3, pos_c3, pos_d3, pos_e3,
	input pos_a4, pos_b4, pos_c4, pos_d4, pos_e4,
	input pos_a5, pos_b5, pos_c5, pos_d5, pos_e5,
	input pos_a6, pos_b6, pos_c6, pos_d6, pos_e6,
	input clk,	//Foi utilizado como entrada para salvar a matriz
	output atq_a0, atq_b0, atq_c0, atq_d0, atq_e0, //Matriz de ataque(resultado do ataque)
	output atq_a1, atq_b1, atq_c1, atq_d1, atq_e1,
	output atq_a2, atq_b2, atq_c2, atq_d2, atq_e2,
	output atq_a3, atq_b3, atq_c3, atq_d3, atq_e3,
	output atq_a4, atq_b4, atq_c4, atq_d4, atq_e4,
	output atq_a5, atq_b5, atq_c5, atq_d5, atq_e5,
	output atq_a6, atq_b6, atq_c6, atq_d6, atq_e6,
	output vermelho,verde

);
	wire botao_clk;
	wire fa0, fb0, fc0, fd0, fe0; // Linhas da matriz de ataque(Salva em FFs vindas do modulo Col_x_Lin)
	wire fa1, fb1, fc1, fd1, fe1;
	wire fa2, fb2, fc2, fd2, fe2;
	wire fa3, fb3, fc3, fd3, fe3;
	wire fa4, fb4, fc4, fd4, fe4;
	wire fa5, fb5, fc5, fd5, fe5;
	wire fa6, fb6, fc6, fd6, fe6;
	
col_x_lin variaveis_de_ataque (
	.ch7(ch7), .ch6(ch6), .ch5(ch5), .ch4(ch4), .ch3(ch3), .ch2(ch2), .ch1(ch1), .ch0(ch0), .botao(botao), // Entradas de chaves
	.clk(clk),
	.pos_a0(pos_a0), .pos_b0(pos_b0), .pos_c0(pos_c0), .pos_d0(pos_d0), .pos_e0(pos_e0),//Matriz de posicionamento salva nos FFs
	.pos_a1(pos_a1), .pos_b1(pos_b1), .pos_c1(pos_c1), .pos_d1(pos_d1), .pos_e1(pos_e1),//no módulo de posicionamento
	.pos_a2(pos_a2), .pos_b2(pos_b2), .pos_c2(pos_c2), .pos_d2(pos_d2), .pos_e2(pos_e2),
	.pos_a3(pos_a3), .pos_b3(pos_b3), .pos_c3(pos_c3), .pos_d3(pos_d3), .pos_e3(pos_e3),
	.pos_a4(pos_a4), .pos_b4(pos_b4), .pos_c4(pos_c4), .pos_d4(pos_d4), .pos_e4(pos_e4),
	.pos_a5(pos_a5), .pos_b5(pos_b5), .pos_c5(pos_c5), .pos_d5(pos_d5), .pos_e5(pos_e5),
	.pos_a6(pos_a6), .pos_b6(pos_b6), .pos_c6(pos_c6), .pos_d6(pos_d6), .pos_e6(pos_e6),
	.atq_a0(fa0), .atq_b0(fb0), .atq_c0(fc0), .atq_d0(fd0), .atq_e0(fe0), // Linhas da matriz de ataque indo da linha 0 até a 6 (ainda não é flip-flop)
	.atq_a1(fa1), .atq_b1(fb1), .atq_c1(fc1), .atq_d1(fd1), .atq_e1(fe1), // essas linhas são basicamente os exato ponto que atacamos
	.atq_a2(fa2), .atq_b2(fb2), .atq_c2(fc2), .atq_d2(fd2), .atq_e2(fe2),
	.atq_a3(fa3), .atq_b3(fb3), .atq_c3(fc3), .atq_d3(fd3), .atq_e3(fe3),
	.atq_a4(fa4), .atq_b4(fb4), .atq_c4(fc4), .atq_d4(fd4), .atq_e4(fe4),
	.atq_a5(fa5), .atq_b5(fb5), .atq_c5(fc5), .atq_d5(fd5), .atq_e5(fe5),
	.atq_a6(fa6), .atq_b6(fb6), .atq_c6(fc6), .atq_d6(fd6), .atq_e6(fe6),
	.vermelho(vermelho),	.verde(verde)
);
comparador atq_x_pos (
	.ch6(ch6),	.ch7(ch7),	.botao(botao),
	.pos_a0(pos_a0), .pos_b0(pos_b0), .pos_c0(pos_c0), .pos_d0(pos_d0), .pos_e0(pos_e0),//Matriz de posicionamento salva nos FFs
	.pos_a1(pos_a1), .pos_b1(pos_b1), .pos_c1(pos_c1), .pos_d1(pos_d1), .pos_e1(pos_e1),//no módulo de posicionamento
	.pos_a2(pos_a2), .pos_b2(pos_b2), .pos_c2(pos_c2), .pos_d2(pos_d2), .pos_e2(pos_e2),
	.pos_a3(pos_a3), .pos_b3(pos_b3), .pos_c3(pos_c3), .pos_d3(pos_d3), .pos_e3(pos_e3),
	.pos_a4(pos_a4), .pos_b4(pos_b4), .pos_c4(pos_c4), .pos_d4(pos_d4), .pos_e4(pos_e4),
	.pos_a5(pos_a5), .pos_b5(pos_b5), .pos_c5(pos_c5), .pos_d5(pos_d5), .pos_e5(pos_e5),
	.pos_a6(pos_a6), .pos_b6(pos_b6), .pos_c6(pos_c6), .pos_d6(pos_d6), .pos_e6(pos_e6),
	.fa0(fa0), .fb0(fb0), .fc0(fc0), .fd0(fd0), .fe0(fe0), //Historico de ataque
	.fa1(fa1), .fb1(fb1), .fc1(fc1), .fd1(fd1), .fe1(fe1), //Matriz salva nos FFs
	.fa2(fa2), .fb2(fb2), .fc2(fc2), .fd2(fd2), .fe2(fe2),
	.fa3(fa3), .fb3(fb3), .fc3(fc3), .fd3(fd3), .fe3(fe3),
	.fa4(fa4), .fb4(fb4), .fc4(fc4), .fd4(fd4), .fe4(fe4),
	.fa5(fa5), .fb5(fb5), .fc5(fc5), .fd5(fd5), .fe5(fe5),
	.fa6(fa6), .fb6(fb6), .fc6(fc6), .fd6(fd6), .fe6(fe6),
	.atq_a0(atq_a0), .atq_b0(atq_b0), .atq_c0(atq_c0), .atq_d0(atq_d0), .atq_e0(atq_e0), //Matriz gerada atrávez da comparação da coordenada de escolha
	.atq_a1(atq_a1), .atq_b1(atq_b1), .atq_c1(atq_c1), .atq_d1(atq_d1), .atq_e1(atq_e1), //Com a matriz de posicionamento, fazendo assim com que a saida
	.atq_a2(atq_a2), .atq_b2(atq_b2), .atq_c2(atq_c2), .atq_d2(atq_d2), .atq_e2(atq_e2), //Seja apenas os tiros corretos
	.atq_a3(atq_a3), .atq_b3(atq_b3), .atq_c3(atq_c3), .atq_d3(atq_d3), .atq_e3(atq_e3),
	.atq_a4(atq_a4), .atq_b4(atq_b4), .atq_c4(atq_c4), .atq_d4(atq_d4), .atq_e4(atq_e4),
	.atq_a5(atq_a5), .atq_b5(atq_b5), .atq_c5(atq_c5), .atq_d5(atq_d5), .atq_e5(atq_e5),
	.atq_a6(atq_a6), .atq_b6(atq_b6), .atq_c6(atq_c6), .atq_d6(atq_d6), .atq_e6(atq_e6),
	.vermelho(), .verde() //Nao utilizado nesse caso pois geraria erro.
);
endmodule