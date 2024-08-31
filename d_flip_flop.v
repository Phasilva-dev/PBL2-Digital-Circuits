module d_flip_flop (
  input clk,    // Sinal de clock de entrada
  input reset,  // Sinal de reset assíncrono (opcional)
  input d,      // Dado de entrada
  output q      // Saída Q
);

  reg q_reg;         // Registrador interno para armazenar o valor de Q

  // O Flip-Flop D é sensível à borda de subida do sinal de clock
  always @(posedge clk or posedge reset) begin
    if (reset)       // Verifica se o reset está ativado (pode ser opcional)
      q_reg <= 1'b0; // Define Q para 0 quando o reset está ativado
    else
      q_reg <= d;    // Armazena o valor de D em Q na borda de subida do clock
  end

  // Atribui o valor do registrador interno à saída Q
  assign q = q_reg;

endmodule