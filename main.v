module main (
	input ch7,ch6,ch5,ch4,ch3,ch2,ch1,ch0,
	input clk,
	input bt,
	output ca,cb,cc,cd,ce,
	output l0,l1,l2,l3,l4,l5,l6,
	output a,b,c,d,e,f,g,p,
	output dig1,dig2,dig3,dig4,
	output vermelho, verde
);
 wire botao,clk_div;
 not not_botao(botao,bt);
 or or_p(p,1'b1);
clock_divisor_16x div_freq (
	.clk(clk),
	.clk_div(clk_div)
);
mux_demux_seg exibir_seg (
	.ch7(ch7),
	.ch6(ch6),
	.ch5(ch5),
	.ch4(ch4),
	.ch3(ch3),
	.ch2(ch2),
	.ch1(ch1),
	.ch0(ch0),
	.clk_div(clk_div),
	.dig1(dig1),
	.dig2(dig2),
	.dig3(dig3),
	.dig4(dig4),
	.a(a),
	.b(b),
	.c(c),
	.d(d),
	.e(e),
	.f(f),
	.g(g)
);

matrizes_e_rbg pos_atq_rbg (
  .ch7(ch7),
  .ch6(ch6),
  .ch5(ch5),
  .ch4(ch4),
  .ch3(ch3),
  .ch2(ch2),
  .ch1(ch1),
  .ch0(ch0),
  .botao(botao),
  .clk_div(clk_div),
  .ca(ca),
  .cb(cb),
  .cc(cc),
  .cd(cd),
  .ce(ce),
  .l0(l0),
  .l1(l1),
  .l2(l2),
  .l3(l3),
  .l4(l4),
  .l5(l5),
  .l6(l6),
  .vermelho(vermelho),
  .verde(verde)
);
endmodule