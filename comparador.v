/*Comparador(and) de matrizes, recebendo as 2 matrizes e saindo uma terceira matriz e uma confirmação de ataque
errado ou certo.*/
module comparador (
	input ch7,ch6, botao,
	input pos_a0, pos_b0, pos_c0, pos_d0, pos_e0, //Primeira matriz (geralmente a de posicionamento)
	input pos_a1, pos_b1, pos_c1, pos_d1, pos_e1,
	input pos_a2, pos_b2, pos_c2, pos_d2, pos_e2,
	input pos_a3, pos_b3, pos_c3, pos_d3, pos_e3,
	input pos_a4, pos_b4, pos_c4, pos_d4, pos_e4,
	input pos_a5, pos_b5, pos_c5, pos_d5, pos_e5,
	input pos_a6, pos_b6, pos_c6, pos_d6, pos_e6,
	input fa0, fb0, fc0, fd0, fe0, //Segunda matriz (geralmente a de ataque)
	input fa1, fb1, fc1, fd1, fe1,
	input fa2, fb2, fc2, fd2, fe2,
	input fa3, fb3, fc3, fd3, fe3,
	input fa4, fb4, fc4, fd4, fe4,
	input fa5, fb5, fc5, fd5, fe5,
	input fa6, fb6, fc6, fd6, fe6,
	output atq_a0, atq_b0, atq_c0, atq_d0, atq_e0, //Matriz resultante
	output atq_a1, atq_b1, atq_c1, atq_d1, atq_e1,
	output atq_a2, atq_b2, atq_c2, atq_d2, atq_e2,
	output atq_a3, atq_b3, atq_c3, atq_d3, atq_e3,
	output atq_a4, atq_b4, atq_c4, atq_d4, atq_e4,
	output atq_a5, atq_b5, atq_c5, atq_d5, atq_e5,
	output atq_a6, atq_b6, atq_c6, atq_d6, atq_e6,
	output vermelho,verde //Confirmação de ataque
);
wire a,b,c,d,e,green,red,ch76;
and and_ch76(ch76,ch7,ch6);

//a0
and and_atq_a0(atq_a0, fa0, pos_a0);
//b0
and and_atq_b0(atq_b0, fb0, pos_b0);
//c0
and and_atq_c0(atq_c0, fc0, pos_c0);
//d0
and and_atq_d0(atq_d0, fd0, pos_d0);
//e0
and and_atq_e0(atq_e0, fe0, pos_e0);

//a1
and and_atq_a1(atq_a1, fa1, pos_a1);
//b1
and and_atq_b1(atq_b1, fb1, pos_b1);
//c1
and and_atq_c1(atq_c1, fc1, pos_c1);
//d1
and and_atq_d1(atq_d1, fd1, pos_d1);
//e1
and and_atq_e1(atq_e1, fe1, pos_e1);

//a2
and and_atq_a2(atq_a2, fa2, pos_a2);
//b2
and and_atq_b2(atq_b2, fb2, pos_b2);
//c2
and and_atq_c2(atq_c2, fc2, pos_c2);
//d2
and and_atq_d2(atq_d2, fd2, pos_d2);
//e2
and and_atq_e2(atq_e2, fe2, pos_e2);

//a3
and and_atq_a3(atq_a3, fa3, pos_a3);
//b3
and and_atq_b3(atq_b3, fb3, pos_b3);
//c3
and and_atq_c3(atq_c3, fc3, pos_c3);
//d3
and and_atq_d3(atq_d3, fd3, pos_d3);
//e3
and and_atq_e3(atq_e3, fe3, pos_e3);

//a4
and and_atq_a4(atq_a4, fa4, pos_a4);
//b4
and and_atq_b4(atq_b4, fb4, pos_b4);
//c4
and and_atq_c4(atq_c4, fc4, pos_c4);
//d4
and and_atq_d4(atq_d4, fd4, pos_d4);
//e4
and and_atq_e4(atq_e4, fe4, pos_e4);

//a5
and and_atq_a5(atq_a5, fa5, pos_a5);
//b5
and and_atq_b5(atq_b5, fb5, pos_b5);
//c5
and and_atq_c5(atq_c5, fc5, pos_c5);
//d5
and and_atq_d5(atq_d5, fd5, pos_d5);
//e5
and and_atq_e5(atq_e5, fe5, pos_e5);

//a6
and and_atq_a6(atq_a6, fa6, pos_a6);
//b6
and and_atq_b6(atq_b6, fb6, pos_b6);
//c6
and and_atq_c6(atq_c6, fc6, pos_c6);
//d6
and and_atq_d6(atq_d6, fd6, pos_d6);
//e6
and and_atq_e6(atq_e6, fe6, pos_e6);

//Comparador para dar o resultado se acertou
//a
or or_a(a,atq_a0,atq_a1,atq_a2,atq_a3,atq_a4,atq_a5,atq_a6);
//b
or or_b(b,atq_b0,atq_b1,atq_b2,atq_b3,atq_b4,atq_b5,atq_b6);
//c
or or_c(c,atq_c0,atq_c1,atq_c2,atq_c3,atq_c4,atq_c5,atq_c6);
//d
or or_d(d,atq_d0,atq_d1,atq_d2,atq_d3,atq_d4,atq_d5,atq_d6);
//e
or or_e(e,atq_e0,atq_e1,atq_e2,atq_e3,atq_e4,atq_e5,atq_e6);

or or_green(green,a,b,c,d,e);
and and_verde(verde,green,botao);

nor or_red(red,a,b,c,d,e);
and and_vermelho(vermelho,red,botao);


endmodule