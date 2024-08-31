/*Um decodificador para acessar as colunas da matriz, transformando 3 entradas normais (xyz)
e 2 de estado (ch7 e 6) em 5 saídas diferentes.*/
module coluna_cod (
  input ch7,ch6,x,y,z,  //ch7 é ligar e desligar, ch6 é posicionamento ou ataque, x,y,z é ch5,4,3
  output CA,CB,CC,CD,CE //Coluna escolhida
);
	wire v,nx,ny,nz;
	
//Um decodificador simples para as colunas da matriz.
//not's
and and_v(v, ch7,ch6);
not inv_x(nx,x);
not inv_y(ny,y);
not inv_z(nz,z);

//CA
and and_ca(CA,v,nx,ny,nz);
//CB
and and_cb(CB,v,nx,ny,z);
//CC
and and_cc(CC,v,nx,y,nz);
//CD
and and_cd(CD,v,nx,y,z);
//CE
and and_ce(CE,v,x,ny,nz);

endmodule