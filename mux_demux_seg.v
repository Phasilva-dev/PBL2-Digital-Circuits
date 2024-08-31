/*O módulo final quanto a utilizacao da matriz de 7 segmentos, seguindo a seguinte logica.
é obtido os 3 digitos do 7seg atravez dos módulos anteriores e 4 bits atravez do contador de 2b
é feito então um mux 28/7 para definir quais segmentos serão ligados
e um demux 4/1 para decidir qual digito vai ser exibido.*/

module mux_demux_seg(
	input ch7,ch6,ch5,ch4,ch3,ch2,ch1,ch0, //as chaves fisicas
	input clk_div, //sinal de clock dividido
	output dig1,dig2,dig3,dig4, //qual digito devemos ligar no 7 segmentos
	output a,b,c,d,e,f,g //cada pin do 7 segmento
);

wire q0,q1,nq0,nq1; //wires para cada bit do contador e sua versão negada

wire a1,b1,c1,d1,e1,f1,g1,a3,b3,c3,d3,e3,f3,g3,a4,b4,c4,d4,e4,f4,g4;
//cada um das 7 saidas dos 3 digitos dos 7 seg que desejamos ligar

wire ma1,mb1,mc1,md1,me1,mf1,mg1,ma3,mb3,mc3,md3,me3,mf3,mg3,ma4,mb4,mc4,md4,me4,mf4,mg4;
//a mesma coisa da linha de cima só que com o sinal do mux

wire ma2,mb2,mc2,md2,me2,mf2,mg2;
//Teoricamente não precisa disso, mas usei para ficar mais simples de entender,
//essas são as portas and do mux do dig2

wire q00,q01,q10,q11; //contando de 0 a 3 em binario

contador_2bits cont_seg(
	//contador de 2 bits pro demux e mux
	.clk_div(clk_div),
	.q0(q0),
	.q1(q1)
);

segmento_estado dig_1(
	//Definindo o digito 1
	.ch7(ch7),
	.ch6(ch6),
	.A(a1),
	.B(b1),
	.C(c1),
	.D(d1),
	.E(e1),
	.F(f1),
	.G(g1)
);
segmento_coluna dig_3(
	//definindo o digito 3
	.ch7(ch7),
	.ch6(ch6),
	.x(ch5),
	.y(ch4),
	.z(ch3),
	.A(a3),
	.B(b3),
	.C(c3),
	.D(d3),
	.E(e3),
	.F(f3),
	.G(g3)
);
segmento_linha dig_4(
	//definindo o digito 4
	.v(ch7), //Controle do estado Desligado e ligado
	.x(ch2),
	.y(ch1),
	.z(ch0),
	.A(a4),
	.B(b4),
	.C(c4),
	.D(d4),
	.E(e4),
	.F(f4),
	.G(g4)
);
// Setando sinais
not not_q0(nq0,q0);
not not_q1(nq1,q1);
and and_mux_dig1(q00,nq1,nq0);
and and_mux_dig2(q01,nq1,q0);
and and_mux_dig3(q10,q1,nq0);
and and_mux_dig4(q11,q1,q0);
//Mux do A
and and_ma1(ma1,a1,q00);
and and_ma2(ma2,1'b0,q01);
and and_ma3(ma3,a3,q10);
and and_ma4(ma4,a4,q11);
nor nor_a(a, ma1,ma2,ma3,ma4);
//Mux do B
and and_mb1(mb1,b1,q00);
and and_mb2(mb2,1'b0,q01);
and and_mb3(mb3,b3,q10);
and and_mb4(mb4,b4,q11);
nor nor_b(b, mb1,mb2,mb3,mb4);
//Mux do C
and and_mc1(mc1,c1,q00);
and and_mc2(mc2,1'b0,q01);
and and_mc3(mc3,c3,q10);
and and_mc4(mc4,c4,q11);
nor nor_c(c, mc1,mc2,mc3,mc4);
//Mux do D
and and_md1(md1,d1,q00);
and and_md2(md2,1'b0,q01);
and and_md3(md3,d3,q10);
and and_md4(md4,d4,q11);
nor nor_d(d, md1,md2,md3,md4);
//Mux do E
and and_me1(me1,e1,q00);
and and_me2(me2,1'b0,q01);
and and_me3(me3,e3,q10);
and and_me4(me4,e4,q11);
nor nor_e(e, me1,me2,me3,me4);
//Mux do F
and and_mf1(mf1,f1,q00);
and and_mf2(mf2,1'b0,q01);
and and_mf3(mf3,f3,q10);
and and_mf4(mf4,f4,q11);
nor nor_f(f, mf1,mf2,mf3,mf4);
//Mux do G
and and_mg1(mg1,g1,q00);
and and_mg2(mg2,1'b0,q01);
and and_mg3(mg3,g3,q10);
and and_mg4(mg4,g4,q11);
nor nor_g(g, mg1,mg2,mg3,mg4);
//inicio do DEMUX pra acionamento do digito
nand nand_digito1(dig1,1'b1,q00);
nand nand_digito2(dig2,1'b0,q01);
nand nand_digito3(dig3,1'b1,q10);
nand nand_digito4(dig4,1'b1,q11);

endmodule


