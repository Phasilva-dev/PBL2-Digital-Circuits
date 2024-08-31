module mux70_35(

	input ch6, //nch6 = Posicionamento, ch6 = Ataque

	input a00,b00,c00,d00,e00,
	input a01,b01,c01,d01,e01,
	input a02,b02,c02,d02,e02,
	input a03,b03,c03,d03,e03,
	input a04,b04,c04,d04,e04,
	input a05,b05,c05,d05,e05,
	input a06,b06,c06,d06,e06, //Mapa do Posicionamento
	
	input a10,b10,c10,d10,e10,
	input a11,b11,c11,d11,e11,
	input a12,b12,c12,d12,e12,
	input a13,b13,c13,d13,e13,
	input a14,b14,c14,d14,e14,
	input a15,b15,c15,d15,e15,
	input a16,b16,c16,d16,e16, //Mapa do Ataque
	
	output a0,b0,c0,d0,e0, //Mapa Final
	output a1,b1,c1,d1,e1,
	output a2,b2,c2,d2,e2,
	output a3,b3,c3,d3,e3,
	output a4,b4,c4,d4,e4,
	output a5,b5,c5,d5,e5,
	output a6,b6,c6,d6,e6
);

wire nch6;
wire ma00,mb00,mc00,md00,me00;
wire ma01,mb01,mc01,md01,me01;
wire ma02,mb02,mc02,md02,me02;
wire ma03,mb03,mc03,md03,me03;
wire ma04,mb04,mc04,md04,me04;
wire ma05,mb05,mc05,md05,me05;
wire ma06,mb06,mc06,md06,me06; //ands do mapa de posicionamento
	
wire ma10,mb10,mc10,md10,me10;
wire ma11,mb11,mc11,md11,me11;
wire ma12,mb12,mc12,md12,me12;
wire ma13,mb13,mc13,md13,me13;
wire ma14,mb14,mc14,md14,me14;
wire ma15,mb15,mc15,md15,me15;
wire ma16,mb16,mc16,md16,me16; //ands do mapa de ataque
not not_nch6(nch6,ch6);

//pixel a0
and and_a00(ma00, a00, nch6);
and and_a10(ma10, a10, ch6);
or or_a0(a0, ma00, ma10);
//pixel a1
and and_a01(ma01, a01, nch6);
and and_a11(ma11, a11, ch6);
or or_a1(a1, ma01, ma11);
//pixel a2
and and_a02(ma02, a02, nch6);
and and_a12(ma12, a12, ch6);
or or_a2(a2, ma02, ma12);
//pixel a3
and and_a03(ma03, a03, nch6);
and and_a13(ma13, a13, ch6);
or or_a3(a3, ma03, ma13);
//pixel a4
and and_a04(ma04, a04, nch6);
and and_a14(ma14, a14, ch6);
or or_a4(a4, ma04, ma14);
//pixel a5
and and_a05(ma05, a05, nch6);
and and_a15(ma15, a15, ch6);
or or_a5(a5, ma05, ma15);
//pixel a6
and and_a06(ma06, a06, nch6);
and and_a16(ma16, a16, ch6);
or or_a6(a6, ma06, ma16);
//pixel b0
and and_b00(mb00,b00,nch6);
and and_b10(mb10,b10,ch6);
or or_b0(b0,mb00,mb10);
//pixel b1
and and_b01(mb01,b01,nch6);
and and_b11(mb11,b11,ch6);
or or_b1(b1,mb01,mb11);
//pixel b2
and and_b02(mb02,b02,nch6);
and and_b12(mb12,b12,ch6);
or or_b2(b2,mb02,mb12);
//pixel b3
and and_b03(mb03,b03,nch6);
and and_b13(mb13,b13,ch6);
or or_b3(b3,mb03,mb13);
//pixel b4
and and_b04(mb04,b04,nch6);
and and_b14(mb14,b14,ch6);
or or_b4(b4,mb04,mb14);
//pixel b5
and and_b05(mb05,b05,nch6);
and and_b15(mb15,b15,ch6);
or or_b5(b5,mb05,mb15);
//pixel b6
and and_b06(mb06,b06,nch6);
and and_b16(mb16,b16,ch6);
or or_b6(b6,mb06,mb16);
//pixel c0
and and_c00(mc00, c00, nch6);
and and_c10(mc10, c10, ch6);
or or_c0(c0, mc00, mc10);
//pixel c1
and and_c01(mc01, c01, nch6);
and and_c11(mc11, c11, ch6);
or or_c1(c1, mc01, mc11);
//pixel c2
and and_c02(mc02, c02, nch6);
and and_c12(mc12, c12, ch6);
or or_c2(c2, mc02, mc12);
//pixel c3
and and_c03(mc03, c03, nch6);
and and_c13(mc13, c13, ch6);
or or_c3(c3, mc03, mc13);
//pixel c4
and and_c04(mc04, c04, nch6);
and and_c14(mc14, c14, ch6);
or or_c4(c4, mc04, mc14);
//pixel c5
and and_c05(mc05, c05, nch6);
and and_c15(mc15, c15, ch6);
or or_c5(c5, mc05, mc15);
//pixel c6
and and_c06(mc06, c06, nch6);
and and_c16(mc16, c16, ch6);
or or_c6(c6, mc06, mc16);
//pixel d0
and and_d00(md00, d00, nch6);
and and_d10(md10, d10, ch6);
or or_d0(d0, md00, md10);
//pixel d1
and and_d01(md01, d01, nch6);
and and_d11(md11, d11, ch6);
or or_d1(d1, md01, md11);
//pixel d2
and and_d02(md02, d02, nch6);
and and_d12(md12, d12, ch6);
or or_d2(d2, md02, md12);
//pixel d3
and and_d03(md03, d03, nch6);
and and_d13(md13, d13, ch6);
or or_d3(d3, md03, md13);
//pixel d4
and and_d04(md04, d04, nch6);
and and_d14(md14, d14, ch6);
or or_d4(d4, md04, md14);
//pixel d5
and and_d05(md05, d05, nch6);
and and_d15(md15, d15, ch6);
or or_d5(d5, md05, md15);
//pixel d6
and and_d06(md06, d06, nch6);
and and_d16(md16, d16, ch6);
or or_d6(d6, md06, md16);
//pixel e0
and and_e00(me00, e00, nch6);
and and_e10(me10, e10, ch6);
or or_e0(e0, me00, me10);
//pixel e1
and and_e01(me01, e01, nch6);
and and_e11(me11, e11, ch6);
or or_e1(e1, me01, me11);
//pixel e2
and and_e02(me02, e02, nch6);
and and_e12(me12, e12, ch6);
or or_e2(e2, me02, me12);
//pixel e3
and and_e03(me03, e03, nch6);
and and_e13(me13, e13, ch6);
or or_e3(e3, me03, me13);
//pixel e4
and and_e04(me04, e04, nch6);
and and_e14(me14, e14, ch6);
or or_e4(e4, me04, me14);
//pixel e5
and and_e05(me05, e05, nch6);
and and_e15(me15, e15, ch6);
or or_e5(e5, me05, me15);
//pixel e6
and and_e06(me06, e06, nch6);
and and_e16(me16, e16, ch6);
or or_e6(e6, me06, me16);

endmodule