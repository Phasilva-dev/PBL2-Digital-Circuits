/*Este modulo consiste no codificador de binario para matriz de 7 segmentos, mais especificamente
para exibir as letras dos estados (P de Posicionamento e A de Ataque)*/
module segmento_estado (
  input ch7,ch6,  //ch7 é ligar e desligar, ch6 é posicionamento ou ataque 
  output A,B,C,D,E,F,G //As saídas do 7 segmentos
);
wire ch76;

//Expressões conseguidas atravez do Mapa K para ligar e desligar os pontos especificos

//A
or nor_a(A, ch7);

//B
or nor_b(B, ch7);

//C
and and_ch76(ch76, ch7,ch6);
or nor_c(C,ch76);

//D
and and_d(D,1'b0); //Está "feio" porém foi melhor assim para eu me guiar
//E
or nor_e(E, ch7);
//F
or nor_f(F, ch7);
//G
or nor_g(G, ch7);

endmodule