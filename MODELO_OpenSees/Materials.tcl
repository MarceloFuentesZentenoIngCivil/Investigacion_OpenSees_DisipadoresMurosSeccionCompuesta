# Definicion de propiedades de materiales
# unconfined
#set tag_concreteCM 1;
set tag_concrete02muro 60;
set tag_concrete02 40;
set tag_concrete02_conf 41;
set fpc [expr 30*1000000.0]; 	# peak compressive stress N/m2
set ec0 [expr (1.0/1150.0)*(pow(($fpc/1000000.0),0.25))] ;	# strain at peak compressive stress
set ft [expr 0.31*sqrt([expr $fpc/1000000.0])*1000000.0];	# peak tensile stress
set Ets [expr $ft/0.002];
set As10 [expr 0.25*3.14*(10*0.001)*(10*0.001)];
set As12 [expr 0.25*3.14*(12*0.001)*(12*0.001)];
set As18 [expr 0.25*3.14*(18*0.001)*(18*0.001)];
set As22 [expr 0.25*3.14*(22*0.001)*(22*0.001)];
set As25 [expr 0.25*3.14*(25*0.001)*(25*0.001)];
set As28 [expr 0.25*3.14*(28*0.001)*(28*0.001)];
set As32 [expr 0.25*3.14*(32*0.001)*(32*0.001)];
set Fy [expr 420.0*$MPa];
set tag_steel 2;
set Es [expr 200.*$GPa];
set b 0.01;
set R0 20;
set cR1 0.925;
set cR2 0.15;
set vc 0.2;
set tag_Gc 3;
set Ec1 [expr 25742.96*1000000.0]; #Ec utilizado en Tesis de Jose Cofre;
set Gc1 [expr $Ec1/(2.0*(1.0+$vc))]; #Gc utilizado en Tesis de Jose Cofre;
set k [expr 0.15];
uniaxialMaterial Elastic $tag_Gc [expr $k*$Gc1];

#CUANTIAS ALMAS
set rhofi10a10 [expr $As10/(0.4*0.1)]
set rhofi12a10 [expr $As12/(0.4*0.1)]
#CUANTIAS EXTREMOS
#MUROS RECTOS  CUANTIAS LONGITUDINALES 
set rho2fi22 [expr (2*$As22)/(0.4*0.125)];
#MURO C SUPERIOR 
set rho4fi22 [expr (4*$As22)/(0.4*0.15)]; 
set rho3fi22 [expr (3*$As22)/(0.4*0.125)];
#MURO C Inferior
set rho3fi28 [expr (3*$As28)/(0.4*0.125)] ; 
set rho4fi28 [expr (4*$As28)/(0.4*0.175)];


uniaxialMaterial Concrete02 $tag_concrete02 -$fpc -$ec0 0.0 -0.004 0.25 $ft $Ets
uniaxialMaterial Concrete02 $tag_concrete02muro -$fpc -$ec0 [expr 0.2*-$fpc] -0.004 0.25 $ft $Ets
uniaxialMaterial Concrete02 $tag_concrete02_conf -$fpc -$ec0 [expr 0.5*-$fpc] -0.01 0.25 $ft $Ets

uniaxialMaterial SteelMPF $tag_steel $Fy $Fy $Es $b $b $R0 $cR1 $cR2





##########################################################################################################
##--------------------------------- 3.- Distribucion en altura de los disipadores.
##########################################################################################################

set tag_ElasInter 26;
set tag_material_D1D2_floor1_floor5 14;
set tag_material_D1D2_floor6_floor10 15;
set tag_material_D1D2_floor11_floor17 16;
set tag_material_D3D4_floor1_floor5 17;
set tag_material_D3D4_floor6_floor10 18;
set tag_material_D3D4_floor11_floor17 19;

set tag_section_D1D2_floor1_floor5 20;
set tag_section_D1D2_floor6_floor10 21;
set tag_section_D1D2_floor11_floor17 22;
set tag_section_D3D4_floor1_floor5 23;
set tag_section_D3D4_floor6_floor10 24;
set tag_section_D3D4_floor11_floor17 25;
set E_ElasInter [expr 5.0e12*0.5];
set E_Disp [expr 5.0e10*0.5];
set Fy_D1D2_floor1_floor5 [expr 45*9806.65*0.5];
set Fy_D1D2_floor6_floor10 [expr 45*9806.65*0.5];
set Fy_D1D2_floor11_floor17 [expr 18*9806.65*0.5];
set Fy_D3D4_floor1_floor5 [expr 150*9806.65*0.5];
set Fy_D3D4_floor6_floor10 [expr 90*9806.65*0.5];
set Fy_D3D4_floor11_floor17 [expr 45*9806.65*0.5];

set b_Damp     0.001; #Razon de post-fluencia de los disipadores, para los modelos Steel01, Steel02, SteelMPF y Bouc-Wen.
set R_Damp     10;     #Transicion entre el rango lineal y no lineal, para los modelos Steel02, SteelMPF y Bouc-Wen.
set cR1_Damp   0.5;    #Parámetro de los modelos Steel02 y SteelMPF.
set cR2_Damp   1.0;    #Parámetro de los modelos Steel02 y SteelMPF.



uniaxialMaterial Steel01 $tag_material_D1D2_floor1_floor5 $Fy_D1D2_floor1_floor5 $E_Disp $b_Damp
uniaxialMaterial Steel01 $tag_material_D1D2_floor6_floor10 $Fy_D1D2_floor6_floor10 $E_Disp $b_Damp
uniaxialMaterial Steel01 $tag_material_D1D2_floor11_floor17 $Fy_D1D2_floor11_floor17 $E_Disp $b_Damp
uniaxialMaterial Steel01 $tag_material_D3D4_floor1_floor5 $Fy_D3D4_floor1_floor5 $E_Disp $b_Damp
uniaxialMaterial Steel01 $tag_material_D3D4_floor6_floor10 $Fy_D3D4_floor6_floor10 $E_Disp $b_Damp
uniaxialMaterial Steel01 $tag_material_D3D4_floor11_floor17 $Fy_D3D4_floor11_floor17 $E_Disp $b_Damp

uniaxialMaterial Elastic $tag_ElasInter $E_ElasInter









