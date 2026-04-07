set L_c [expr 6.9]; #Distancia de columnas a los muros 

set Hpano	[expr 3.24*0.5];		# Altura Paño muro 
set Htotal [expr 3.24*17]; #Altura total de muro
set Npanos [expr 17*2]; 
set Npisos [expr 17] ; #Numero de Pisos
set L_f_1 [expr 2.5];	# Largo Ala 1
set L_f_2 [expr 4.25];  #Largo Ala 2  
set L_w [expr 8.8]; # Largo Alma
set L_m [expr 2.5]; # Largo Muro RECTANGULAR
set D_m [expr 4.3]; #Distancia entre muros rectangulares
set D_m_d [expr 10.4]; # Distancia entre muro rectangular y ala de muro tipo C
set D_m_c [expr 2.55]; # Distancia entre ala con ala de muros C 


set Lp [expr 3.24]; #Longitud de rotula plastica utilizada 

# Definición de Coordenadas
#node $tag_node	$X $Y $z
#NODOS DE LA BASE
node 100 0 0 0
node 200 0 [expr $L_m] 0
node 300 0 [expr $L_m + $D_m] 0
node 400 0 [expr $L_m + $D_m + $L_m] 0
node 500 [expr $D_m_d] 0 0
node 600 [expr $D_m_d] 0 0
node 700 [expr $D_m_d] [expr $L_f_2] 0
node 800 [expr $D_m_d] [expr $L_f_2 + $D_m_c] 0
node 900 [expr $D_m_d] [expr $L_f_1 + $D_m_c + $L_f_2] 0
node 1000 [expr $D_m_d] [expr $L_f_1 + $D_m_c + $L_f_2] 0
node 1100 [expr $D_m_d + $L_w] 0 0
node 1200 [expr $D_m_d + $L_w] 0 0
node 1300 [expr $D_m_d + $L_w] [expr $L_f_2] 0
node 1400 [expr $D_m_d + $L_w] [expr $L_f_2 + $D_m_c] 0
node 1500 [expr $D_m_d + $L_w] [expr $L_f_1 + $D_m_c + $L_f_2] 0
node 1600 [expr $D_m_d + $L_w] [expr $L_f_1 + $D_m_c + $L_f_2] 0
node 1700 [expr 2*$D_m_d + $L_w] 0 0
node 1800 [expr 2*$D_m_d + $L_w] [expr $L_m] 0
node 1900 [expr 2*$D_m_d + $L_w] [expr $L_m + $D_m] 0
node 2000 [expr 2*$D_m_d + $L_w] [expr $L_m + $D_m + $L_m] 0


node 4100 0. [expr -1*$L_c] 0
node 4200 [expr $D_m_d] [expr -1*$L_c] 0
node 4300 [expr $D_m_d + $L_w] [expr -1*$L_c] 0
node 4400 [expr $D_m_d + $L_w + $D_m_d] [expr -1*$L_c] 0
node 4500 0 [expr $L_m + $D_m + $L_m + $L_c] 0
node 4600 [expr $D_m_d] [expr $L_m + $D_m + $L_m + $L_c] 0
node 4700 [expr $D_m_d + $L_w] [expr $L_m + $D_m + $L_m + $L_c] 0
node 4800 [expr $D_m_d + $L_w + $D_m_d] [expr $L_m + $D_m + $L_m + $L_c] 0


set X_cord [expr $D_m_d + 0.5*$L_w]
set Y_cord [expr $L_c + 0.5*$L_f_2]
 
set nZ1 1;
#puts 0;
for {set EjeV $nZ1} {$EjeV <= $Npanos} {incr EjeV $nZ1} {
	
	#puts [expr $EjeV*$Hpano];
	node 10[expr $EjeV] 0 0 [expr $EjeV*$Hpano]
	node 20[expr $EjeV] 0 [expr $L_m] [expr $EjeV*$Hpano]
	node 30[expr $EjeV] 0 [expr $L_m + $D_m] [expr $EjeV*$Hpano]
	node 40[expr $EjeV] 0 [expr $L_m + $D_m + $L_m] [expr $EjeV*$Hpano]
	node 50[expr $EjeV] [expr $D_m_d] 0 [expr $EjeV*$Hpano]
	node 60[expr $EjeV] [expr $D_m_d] 0 [expr $EjeV*$Hpano]
	node 70[expr $EjeV] [expr $D_m_d] [expr $L_f_2] [expr $EjeV*$Hpano]
	node 80[expr $EjeV] [expr $D_m_d] [expr $L_f_2 + $D_m_c] [expr $EjeV*$Hpano]
	node 90[expr $EjeV] [expr $D_m_d] [expr $L_f_1 + $D_m_c + $L_f_2] [expr $EjeV*$Hpano]
	node 100[expr $EjeV] [expr $D_m_d] [expr $L_f_1 + $D_m_c + $L_f_2] [expr $EjeV*$Hpano]
	node 110[expr $EjeV] [expr $D_m_d + $L_w] 0 [expr $EjeV*$Hpano]
	node 120[expr $EjeV] [expr $D_m_d + $L_w] 0 [expr $EjeV*$Hpano]
	node 130[expr $EjeV] [expr $D_m_d + $L_w] [expr $L_f_2] [expr $EjeV*$Hpano]
	node 140[expr $EjeV] [expr $D_m_d + $L_w] [expr $L_f_2 + $D_m_c] [expr $EjeV*$Hpano]
	node 150[expr $EjeV] [expr $D_m_d + $L_w] [expr $L_f_1 + $D_m_c + $L_f_2] [expr $EjeV*$Hpano]
	node 160[expr $EjeV] [expr $D_m_d + $L_w] [expr $L_f_1 + $D_m_c + $L_f_2] [expr $EjeV*$Hpano]
	node 170[expr $EjeV] [expr 2*$D_m_d + $L_w] 0 [expr $EjeV*$Hpano]
	node 180[expr $EjeV] [expr 2*$D_m_d + $L_w] [expr $L_m] [expr $EjeV*$Hpano]
	node 190[expr $EjeV] [expr 2*$D_m_d + $L_w] [expr $L_m + $D_m] [expr $EjeV*$Hpano]
	node 200[expr $EjeV] [expr 2*$D_m_d + $L_w] [expr $L_m + $D_m + $L_m] [expr $EjeV*$Hpano]
	
	node 410[expr $EjeV] 0. [expr -1*$L_c] [expr $EjeV*$Hpano]
	node 420[expr $EjeV] [expr $D_m_d] [expr -1*$L_c] [expr $EjeV*$Hpano]
	node 430[expr $EjeV] [expr $D_m_d + $L_w] [expr -1*$L_c] [expr $EjeV*$Hpano]
	node 440[expr $EjeV] [expr $D_m_d + $L_w + $D_m_d] [expr -1*$L_c] [expr $EjeV*$Hpano]
	node 450[expr $EjeV] 0 [expr $L_m + $D_m + $L_m + $L_c] [expr $EjeV*$Hpano]
	node 460[expr $EjeV] [expr $D_m_d] [expr $L_m + $D_m + $L_m + $L_c] [expr $EjeV*$Hpano]
	node 470[expr $EjeV] [expr $D_m_d + $L_w] [expr $L_m + $D_m + $L_m + $L_c] [expr $EjeV*$Hpano]
	node 480[expr $EjeV] [expr $D_m_d + $L_w + $D_m_d] [expr $L_m + $D_m + $L_m + $L_c] [expr $EjeV*$Hpano]
	
	#node 1000[expr $EjeV] [expr $X_cord] [expr $Y_cord] [expr $EjeV*$Hpano]
    	
}


for {set EjeV $nZ1} {$EjeV <= $Npisos} {incr EjeV $nZ1} {
	rigidDiaphragm 3 10[expr $EjeV*2] 20[expr $EjeV*2] 30[expr $EjeV*2] 40[expr $EjeV*2] 50[expr $EjeV*2] 70[expr $EjeV*2] 80[expr $EjeV*2] 100[expr $EjeV*2] 110[expr $EjeV*2] 130[expr $EjeV*2] 140[expr $EjeV*2] 160[expr $EjeV*2] 170[expr $EjeV*2] 180[expr $EjeV*2] 190[expr $EjeV*2] 200[expr $EjeV*2] 410[expr $EjeV*2] 420[expr $EjeV*2] 430[expr $EjeV*2] 440[expr $EjeV*2] 450[expr $EjeV*2] 460[expr $EjeV*2] 470[expr $EjeV*2] 480[expr $EjeV*2] 60[expr $EjeV*2] 90[expr $EjeV*2] 120[expr $EjeV*2] 150[expr $EjeV*2]
	
}




#EMPOTRADO BASE 
#fix $tag_node  #fix_X #fix_Y # fix_Z #fix_RX #fix_RY #fix_RZ 
fix 4100 1 1 1 1 1 1;
fix 4200 1 1 1 1 1 1;
fix 4300 1 1 1 1 1 1;
fix 4400 1 1 1 1 1 1;
fix 4500 1 1 1 1 1 1;
fix 4600 1 1 1 1 1 1;
fix 4700 1 1 1 1 1 1;
fix 4800 1 1 1 1 1 1;

fix 100 1 1 1 1 1 1;
fix 200 1 1 1 1 1 1;
fix 300 1 1 1 1 1 1;
fix 400 1 1 1 1 1 1;
fix 500 1 1 1 1 1 1;
fix 600 1 1 1 1 1 1;
fix 700 1 1 1 1 1 1;
fix 800 1 1 1 1 1 1;
fix 900 1 1 1 1 1 1;
fix 1000 1 1 1 1 1 1;
fix 1100 1 1 1 1 1 1;
fix 1200 1 1 1 1 1 1;
fix 1300 1 1 1 1 1 1;
fix 1400 1 1 1 1 1 1;
fix 1500 1 1 1 1 1 1;
fix 1600 1 1 1 1 1 1;
fix 1700 1 1 1 1 1 1;
fix 1800 1 1 1 1 1 1;
fix 1900 1 1 1 1 1 1;
fix 2000 1 1 1 1 1 1;
















