/*Contador de 2 bits utilizando flip-flop T e clock para variar os bits em ordem*/
module contador_2bits(
  input clk_div,      // Sinal de clock de entrada
  output q0,q1			 // output do bit 1 e 0.
);

t_flip_flop count0_2 (
  .clk(clk_div),
  .t(1'b1),      // T é sempre 1
  .q(q0),
  .q_bar()
);
t_flip_flop count1_2 (
  .clk(q0),
  .t(1'b1),      // T é sempre 1
  .q(q1),
  .q_bar()
  );
endmodule