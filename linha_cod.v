/*Um decodificador para acessar as linhas da matriz de led, transformando 3 entradas normais (xyz)
e 2 de estado (ch7 e 6) em 7 saídas diferentes.*/
module linha_cod (
  input ch7,ch6,x,y,z,  //ch7 é ligar e desligar, ch6 é posicionamento ou ataque x,y,z é a ch2,1,0
  output L0,L1,L2,L3,L4,L5,L6 //Linhas escolhidas
);
	wire v,nx,ny,nz;

//Um decodificador simples
//not's
and and_v(v, ch7,ch6);
not inv_x(nx,x);
not inv_y(ny,y);
not inv_z(nz,z);

//L0
and nand_l0(L0,v,nx,ny,nz);
//L1
and nand_l1(L1,v,nx,ny,z);
//L2
and nand_l2(L2,v,nx,y,nz);
//L3
and nand_l3(L3,v,nx,y,z);
//L4
and nand_l4(L4,v,x,ny,nz);
//L5
and nand_l5(L5,v,x,ny,z);
//L6
and nand_l6(L6,v,x,y,nz);

endmodule