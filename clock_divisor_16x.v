/*Um divisor de clock comum utilizando FFs do tipo T, um se liga no outro dividindo a frequencia por 2
foi utilizado exatamente 16 FFs aqui*/

module clock_divisor_16x (
  input wire clk,              // Sinal de clock de entrada
  output clk_div //output wire [15:0] divided   // Saída com 16 divisões do clock
);

wire [15:0] q;  // Saídas Q dos 16 flip-flops

t_flip_flop ff0 (
  .clk(clk),
  .t(1'b1),      // T é sempre 1 para o primeiro flip-flop
  .q(q[0]),
  .q_bar()
);

t_flip_flop ff1 (
  .clk(q[0]),    // Usamos a saída do flip-flop anterior como clock
  .t(1'b1),      // T é sempre 1
  .q(q[1]),
  .q_bar()
);
t_flip_flop ff2 (
  .clk(q[1]),    // Usamos a saída do flip-flop anterior como clock
  .t(1'b1),      // T é sempre 1
  .q(q[2]),
  .q_bar()
);
t_flip_flop ff3 (
  .clk(q[2]),    // Usamos a saída do flip-flop anterior como clock
  .t(1'b1),      // T é sempre 1
  .q(q[3]),
  .q_bar()
);
t_flip_flop ff4 (
  .clk(q[3]),    // Usamos a saída do flip-flop anterior como clock
  .t(1'b1),      // T é sempre 1
  .q(q[4]),
  .q_bar()
);
t_flip_flop ff5 (
  .clk(q[4]),    // Usamos a saída do flip-flop anterior como clock
  .t(1'b1),      // T é sempre 1
  .q(q[5]),
  .q_bar()
);
t_flip_flop ff6 (
  .clk(q[5]),    // Usamos a saída do flip-flop anterior como clock
  .t(1'b1),      // T é sempre 1
  .q(q[6]),
  .q_bar()
);
t_flip_flop ff7 (
  .clk(q[6]),    // Usamos a saída do flip-flop anterior como clock
  .t(1'b1),      // T é sempre 1
  .q(q[7]),
  .q_bar()
);
t_flip_flop ff8 (
  .clk(q[7]),    // Usamos a saída do flip-flop anterior como clock
  .t(1'b1),      // T é sempre 1
  .q(q[8]),
  .q_bar()
);
t_flip_flop ff9 (
  .clk(q[8]),    // Usamos a saída do flip-flop anterior como clock
  .t(1'b1),      // T é sempre 1
  .q(q[9]),
  .q_bar()
);
t_flip_flop ff10 (
  .clk(q[9]),    // Usamos a saída do flip-flop anterior como clock
  .t(1'b1),      // T é sempre 1
  .q(q[10]),
  .q_bar()
);
t_flip_flop ff11 (
  .clk(q[10]),    // Usamos a saída do flip-flop anterior como clock
  .t(1'b1),      // T é sempre 1
  .q(q[11]),
  .q_bar()
);
t_flip_flop ff12 (
  .clk(q[11]),    // Usamos a saída do flip-flop anterior como clock
  .t(1'b1),      // T é sempre 1
  .q(q[12]),
  .q_bar()
);
t_flip_flop ff13 (
  .clk(q[12]),    // Usamos a saída do flip-flop anterior como clock
  .t(1'b1),      // T é sempre 1
  .q(q[13]),
  .q_bar()
);
t_flip_flop ff14 (
  .clk(q[13]),    // Usamos a saída do flip-flop anterior como clock
  .t(1'b1),      // T é sempre 1
  .q(q[14]),
  .q_bar()
);
t_flip_flop ff15 (
  .clk(q[14]),   // Usamos a saída do penúltimo flip-flop como clock
  .t(1'b1),      // T é sempre 1 para o último flip-flop
  .q(q[15]),
  .q_bar()
);

assign clk_div = q[15];//assign divided = q; caso quisesse pegar todos os clocks

endmodule