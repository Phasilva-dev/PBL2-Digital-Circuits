/*Este modulo consiste no codificador de binario para matriz de 7 segmentos, mais especificamente
para exibir os números 0 até 6*/

module segmento_linha (
  input v,x,y,z,  //ch7 é ligar e desligar, x,y,z são as ch2,1,0
  output A,B,C,D,E,F,G  //As saídas do 7 segmentos
);
	wire nx,ny,nz,vnxnz,vnxy,vxnyz,vnx,vnynz,vny,vnxz,vxny,vynz,vxnz,vnxyz,vxynz; //Wire para as ands
	
//Expressões conseguidas atravez do Mapa K para ligar e desligar os pontos especificos
//not's
	not inv_x(nx,x);
	not inv_y(ny,y);
	not inv_z(nz,z);

//A
	and and_vnxnz(vnxnz,v,nx,nz);
	and and_vnxy(vnxy,v,nx,y);
	and and_vxnyz(vxnyz,v,x,ny,z);
	or nor_a(A,vnxnz,vnxy,vxnyz);
	
//B
//vx' + vy'z'
	and and_vnx(vnx,v,nx);
	and and_vnynz(vnynz,v,ny,nz);
	or nor_b(B, vnx,vnynz);
	
//C
//vy' + vx'z + vxz'
	and and_vny(vny,v,ny);
	and and_vnxz(vnxz,v,nx,z);
	and and_vxny(vxny,v,x,ny);
	and and_vxynz(vxynz,v,x,y,nz);
	or nor_c(C, vny,vnxz,vxny,vxynz);
	
//D
//vx'z' + vx'y + vxy'z + vyz'
	and and_vynz(vynz,v,y,nz);
	or nor_d(D,vnxnz,vnxy,vxnyz,vynz);
	
//E
// vx'z' + vyz'
	or nor_e(E,vnxnz,vynz);

//F
//vy'z' + vxy' + vxz'
	and and_vxnz(vxnz,v,x,nz);
	or nor_f(F,vnynz,vxny,vxnz);

//G
//vx'y + vxy' + vyz'
	and and_vnxyz(vnxyz,v,nx,y,z);
	or nor_g(G,vynz,vxny,vynz,vnxyz);
endmodule




