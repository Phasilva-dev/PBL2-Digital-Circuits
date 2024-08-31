module t_flip_flop (
  input wire clk,    // Sinal de clock
  input wire t,      // Entrada T
  output wire q,     // Saída Q
  output wire q_bar  // Saída complementar Q_bar
);

reg q_reg;  // Registrador para armazenar o estado Q
//posedge
//negedge
always @(posedge clk) begin
  if (t) begin
    q_reg <= ~q_reg;  // Inverte o estado do registrador quando T é 1
  end
end

assign q = q_reg;
assign q_bar = ~q_reg;

endmodule