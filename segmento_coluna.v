/*Este modulo consiste no codificador de binario para matriz de 7 segmentos, mais especificamente
para exibir as letras de A até E*/
module segmento_coluna (
  input ch7,ch6,x,y,z,  //ch7 é ligar e desligar, ch6 é posicionamento ou ataque, x,y,z são as ch5,4,3
  output A,B,C,D,E,F,G  //As saídas do 7 segmentos
);
	wire v,nx,ny,nz,vnxnz,vnynz,vnxny,vnxz,vnxy,vxnynz,vnx,vnxyz,vnxnynz; //Wire para as ands
	
//Expressões conseguidas atravez do Mapa K para ligar e desligar os pontos especificos

//not's
	not inv_x(nx,x);
	not inv_y(ny,y);
	not inv_z(nz,z);

//A
	and and_v(v,ch7,ch6);
	and and_vnxnz(vnxnz,v,nx,nz);
	and and_vnynz(vnynz,v,ny,nz);
	or nor_a(A,vnxnz,vnynz);
	
//B
	and and_vnxyz(vnxyz,v,nx,y,z);
	and and_vnxnynz(vnxnynz,v,nx,ny,nz);
	or nor_b(B,vnxnynz,vnxyz);
	
//C
	and and_vnxny(vnxny,v,nx,ny);
	and and_vnxz(vnxz,v,nx,z);
	or nor_c(C,vnxny,vnxz);
	
//D
	and and_vnxy(vnxy,v,nx,y);
	and and_vxnynz(vxnynz,v,x,ny,nz);
	or nor_d(D,vnxz,vnxy,vxnynz);

//E
	and and_vnx(vnx,v,nx);
	or nor_e(E, vnx, vnynz);
	
//F
	or nor_f(F,vnxny,vnxnz,vnynz);

//G
	or nor_g(G,vnxz,vnynz);
	

endmodule