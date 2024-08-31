
module mux140_35(

	input ch0,ch1,ch6,ch7,

	input a00,b00,c00,d00,e00,
	input a01,b01,c01,d01,e01,
	input a02,b02,c02,d02,e02,
	input a03,b03,c03,d03,e03,
	input a04,b04,c04,d04,e04,
	input a05,b05,c05,d05,e05,
	input a06,b06,c06,d06,e06, //primeiro mapa
	
	input a10,b10,c10,d10,e10,
	input a11,b11,c11,d11,e11,
	input a12,b12,c12,d12,e12,
	input a13,b13,c13,d13,e13,
	input a14,b14,c14,d14,e14,
	input a15,b15,c15,d15,e15,
	input a16,b16,c16,d16,e16, //segundo mapa
	
	input a20,b20,c20,d20,e20,
	input a21,b21,c21,d21,e21,
	input a22,b22,c22,d22,e22,
	input a23,b23,c23,d23,e23,
	input a24,b24,c24,d24,e24,
	input a25,b25,c25,d25,e25,
	input a26,b26,c26,d26,e26, //terceiro mapa
	
	input a30,b30,c30,d30,e30,
	input a31,b31,c31,d31,e31,
	input a32,b32,c32,d32,e32,
	input a33,b33,c33,d33,e33,
	input a34,b34,c34,d34,e34,
	input a35,b35,c35,d35,e35,
	input a36,b36,c36,d36,e36, //quarto mapa
	
	output a0,b0,c0,d0,e0,
	output a1,b1,c1,d1,e1,
	output a2,b2,c2,d2,e2,
	output a3,b3,c3,d3,e3,
	output a4,b4,c4,d4,e4,
	output a5,b5,c5,d5,e5,
	output a6,b6,c6,d6,e6 //Mapa final
);

wire h0,h1,nch6,ch7n6;
wire nh0,nh1,s00,s01,s10,s11;

wire ma00,mb00,mc00,md00,me00;
wire ma01,mb01,mc01,md01,me01;
wire ma02,mb02,mc02,md02,me02;
wire ma03,mb03,mc03,md03,me03;
wire ma04,mb04,mc04,md04,me04;
wire ma05,mb05,mc05,md05,me05;
wire ma06,mb06,mc06,md06,me06; //primeiro mapa mux
	
wire ma10,mb10,mc10,md10,me10;
wire ma11,mb11,mc11,md11,me11;
wire ma12,mb12,mc12,md12,me12;
wire ma13,mb13,mc13,md13,me13;
wire ma14,mb14,mc14,md14,me14;
wire ma15,mb15,mc15,md15,me15;
wire ma16,mb16,mc16,md16,me16; //segundo mapa mux
	
wire ma20,mb20,mc20,md20,me20;
wire ma21,mb21,mc21,md21,me21;
wire ma22,mb22,mc22,md22,me22;
wire ma23,mb23,mc23,md23,me23;
wire ma24,mb24,mc24,md24,me24;
wire ma25,mb25,mc25,md25,me25;
wire ma26,mb26,mc26,md26,me26; //terceiro mapa mux
	
wire ma30,mb30,mc30,md30,me30;
wire ma31,mb31,mc31,md31,me31;
wire ma32,mb32,mc32,md32,me32;
wire ma33,mb33,mc33,md33,me33;
wire ma34,mb34,mc34,md34,me34;
wire ma35,mb35,mc35,md35,me35;
wire ma36,mb36,mc36,md36,me36; //quarto mapa mux

//Estado manual
not not_nch6(nch6,ch6); //ch6 negado = posicionamento
and and_ch7n6(ch7n6,ch7,nch6);
and and_h0(h0,ch7n6,ch0);
and and_h1(h1,ch7n6,ch1);

//not's
not not_ch1(nh1,h1);
not not_ch0(nh0,h0);
//and's
and and_00(s00,nh1,nh0); //situação para mapa1
and and_01(s01,nh1,h0); //situação para mapa2
and and_10(s10,h1,nh0); //situação para mapa3
and and_11(s11,h1,h0); //situação para mapa4

//pixel a0
and and_a00(ma00,a00,s00);
and and_a10(ma10,a10,s01);
and and_a20(ma20,a20,s10);
and and_a30(ma30,a30,s11);
or or_a0(a0,ma00,ma10,ma20,ma30);

//pixel a1
and and_a01(ma01,a01,s00);
and and_a11(ma11,a11,s01);
and and_a21(ma21,a21,s10);
and and_a31(ma31,a31,s11);
or or_a1(a1,ma01,ma11,ma21,ma31);

//pixel a2
and and_a02(ma02,a02,s00);
and and_a12(ma12,a12,s01);
and and_a22(ma22,a22,s10);
and and_a32(ma32,a32,s11);
or or_a2(a2,ma02,ma12,ma22,ma32);

//pixel a3
and and_a03(ma03,a03,s00);
and and_a13(ma13,a13,s01);
and and_a23(ma23,a23,s10);
and and_a33(ma33,a33,s11);
or or_a3(a3,ma03,ma13,ma23,ma33);

//pixel a4
and and_a04(ma04,a04,s00);
and and_a14(ma14,a14,s01);
and and_a24(ma24,a24,s10);
and and_a34(ma34,a34,s11);
or or_a4(a4,ma04,ma14,ma24,ma34);

//pixel a5
and and_a05(ma05,a05,s00);
and and_a15(ma15,a15,s01);
and and_a25(ma25,a25,s10);
and and_a35(ma35,a35,s11);
or or_a5(a5,ma05,ma15,ma25,ma35);

//pixel a6
and and_a06(ma06,a06,s00);
and and_a16(ma16,a16,s01);
and and_a26(ma26,a26,s10);
and and_a36(ma36,a36,s11);
or or_a6(a6,ma06,ma16,ma26,ma36);





//pixel b0
and and_b00(mb00,b00,s00);
and and_b10(mb10,b10,s01);
and and_b20(mb20,b20,s10);
and and_b30(mb30,b30,s11);
or or_b0(b0,mb00,mb10,mb20,mb30);

//pixel b1
and and_b01(mb01,b01,s00);
and and_b11(mb11,b11,s01);
and and_b21(mb21,b21,s10);
and and_b31(mb31,b31,s11);
or or_b1(b1,mb01,mb11,mb21,mb31);

//pixel b2
and and_b02(mb02,b02,s00);
and and_b12(mb12,b12,s01);
and and_b22(mb22,b22,s10);
and and_b32(mb32,b32,s11);
or or_b2(b2,mb02,mb12,mb22,mb32);

//pixel b3
and and_b03(mb03,b03,s00);
and and_b13(mb13,b13,s01);
and and_b23(mb23,b23,s10);
and and_b33(mb33,b33,s11);
or or_b3(b3,mb03,mb13,mb23,mb33);

//pixel b4
and and_b04(mb04,b04,s00);
and and_b14(mb14,b14,s01);
and and_b24(mb24,b24,s10);
and and_b34(mb34,b34,s11);
or or_b4(b4,mb04,mb14,mb24,mb34);

//pixel b5
and and_b05(mb05,b05,s00);
and and_b15(mb15,b15,s01);
and and_b25(mb25,b25,s10);
and and_b35(mb35,b35,s11);
or or_b5(b5,mb05,mb15,mb25,mb35);

//pixel b6
and and_b06(mb06,b06,s00);
and and_b16(mb16,b16,s01);
and and_b26(mb26,b26,s10);
and and_b36(mb36,b36,s11);
or or_b6(b6,mb06,mb16,mb26,mb36);




//pixel c0
and and_c00(mc00,c00,s00);
and and_c10(mc10,c10,s01);
and and_c20(mc20,c20,s10);
and and_c30(mc30,c30,s11);
or or_c0(c0,mc00,mc10,mc20,mc30);

//pixel c1
and and_c01(mc01,c01,s00);
and and_c11(mc11,c11,s01);
and and_c21(mc21,c21,s10);
and and_c31(mc31,c31,s11);
or or_c1(c1,mc01,mc11,mc21,mc31);

//pixel c2
and and_c02(mc02,c02,s00);
and and_c12(mc12,c12,s01);
and and_c22(mc22,c22,s10);
and and_c32(mc32,c32,s11);
or or_c2(c2,mc02,mc12,mc22,mc32);

//pixel c3
and and_c03(mc03,c03,s00);
and and_c13(mc13,c13,s01);
and and_c23(mc23,c23,s10);
and and_c33(mc33,c33,s11);
or or_c3(c3,mc03,mc13,mc23,mc33);

//pixel c4
and and_c04(mc04,c04,s00);
and and_c14(mc14,c14,s01);
and and_c24(mc24,c24,s10);
and and_c34(mc34,c34,s11);
or or_c4(c4,mc04,mc14,mc24,mc34);

//pixel c5
and and_c05(mc05,c05,s00);
and and_c15(mc15,c15,s01);
and and_c25(mc25,c25,s10);
and and_c35(mc35,c35,s11);
or or_c5(c5,mc05,mc15,mc25,mc35);

//pixel c6
and and_c06(mc06,c06,s00);
and and_c16(mc16,c16,s01);
and and_c26(mc26,c26,s10);
and and_c36(mc36,c36,s11);
or or_c6(c6,mc06,mc16,mc26,mc36);




//pixel d0
and and_d00(md00,d00,s00);
and and_d10(md10,d10,s01);
and and_d20(md20,d20,s10);
and and_d30(md30,d30,s11);
or or_d0(d0,md00,md10,md20,md30);

//pixel d1
and and_d01(md01,d01,s00);
and and_d11(md11,d11,s01);
and and_d21(md21,d21,s10);
and and_d31(md31,d31,s11);
or or_d1(d1,md01,md11,md21,md31);

//pixel d2
and and_d02(md02,d02,s00);
and and_d12(md12,d12,s01);
and and_d22(md22,d22,s10);
and and_d32(md32,d32,s11);
or or_d2(d2,md02,md12,md22,md32);

//pixel d3
and and_d03(md03,d03,s00);
and and_d13(md13,d13,s01);
and and_d23(md23,d23,s10);
and and_d33(md33,d33,s11);
or or_d3(d3,md03,md13,md23,md33);

//pixel d4
and and_d04(md04,d04,s00);
and and_d14(md14,d14,s01);
and and_d24(md24,d24,s10);
and and_d34(md34,d34,s11);
or or_d4(d4,md04,md14,md24,md34);

//pixel d5
and and_d05(md05,d05,s00);
and and_d15(md15,d15,s01);
and and_d25(md25,d25,s10);
and and_d35(md35,d35,s11);
or or_d5(d5,md05,md15,md25,md35);

//pixel d6
and and_d06(md06,d06,s00);
and and_d16(md16,d16,s01);
and and_d26(md26,d26,s10);
and and_d36(md36,d36,s11);
or or_d6(d6,md06,md16,md26,md36);




//pixel e0
and and_e00(me00,e00,s00);
and and_e10(me10,e10,s01);
and and_e20(me20,e20,s10);
and and_e30(me30,e30,s11);
or or_e0(e0,me00,me10,me20,me30);

//pixel e1
and and_e01(me01,e01,s00);
and and_e11(me11,e11,s01);
and and_e21(me21,e21,s10);
and and_e31(me31,e31,s11);
or or_e1(e1,me01,me11,me21,me31);

//pixel e2
and and_e02(me02,e02,s00);
and and_e12(me12,e12,s01);
and and_e22(me22,e22,s10);
and and_e32(me32,e32,s11);
or or_e2(e2,me02,me12,me22,me32);

//pixel e3
and and_e03(me03,e03,s00);
and and_e13(me13,e13,s01);
and and_e23(me23,e23,s10);
and and_e33(me33,e33,s11);
or or_e3(e3,me03,me13,me23,me33);

//pixel e4
and and_e04(me04,e04,s00);
and and_e14(me14,e14,s01);
and and_e24(me24,e24,s10);
and and_e34(me34,e34,s11);
or or_e4(e4,me04,me14,me24,me34);

//pixel e5
and and_e05(me05,e05,s00);
and and_e15(me15,e15,s01);
and and_e25(me25,e25,s10);
and and_e35(me35,e35,s11);
or or_e5(e5,me05,me15,me25,me35);

//pixel e6
and and_e06(me06,e06,s00);
and and_e16(me16,e16,s01);
and and_e26(me26,e26,s10);
and and_e36(me36,e36,s11);
or or_e6(e6,me06,me16,me26,me36);

endmodule
