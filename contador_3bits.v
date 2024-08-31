/*Contador de 3 bits utilizando flip-flop T e clock para variar os bits em ordem*/
module contador_3bits(
  input clk_div,      // Sinal de clock de entrada
  output q0,q1,q2			 //output wire [15:0] divided   // Saída com 16 divisões do clock
);
//Simplesmente o contador de 2 bits com 1 flip_flop T a mais
contador_2bits count3_01 (
	.clk_div(clk_div),
	.q0(q0),
	.q1(q1)
);
t_flip_flop count3_2 (
  .clk(q1),
  .t(1'b1),      // T é sempre 1 para o primeiro flip-flop
  .q(q2),
  .q_bar()
  );
endmodule