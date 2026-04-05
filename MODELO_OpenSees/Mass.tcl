set B [expr 0.058823529]; 
set zero 1e-5;	# Valor muy pequeño pero ditinto de cero para prevenir problemas a la hora de invertir matrices
set M_rec_1_1 [expr $B*357474.44]; #Estos son valores obtenidos del modelo en ETABS, reacciones basales luego de quitar apoyo intermedio / n° pisos 
set M_rec_1_2 [expr $B*356598.96]; 
set M_rec_2_3 [expr $B*360422.52];
set M_rec_2_4 [expr $B*353960.31];
set M_C_1_5 [expr $B*1195474.97*0.5];
set M_C_1_6 [expr $B*1195474.97*0.5];
set M_C_1_7 [expr $B*407351.82];
set M_C_1_11 [expr $B*1195474.97*0.5];
set M_C_1_12 [expr $B*1195474.97*0.5];
set M_C_1_13 [expr $B*407351.82];
set M_C_2_8 [expr $B*262196.27];
set M_C_2_9 [expr $B*1111479.25*0.5];
set M_C_2_10 [expr $B*1111479.25*0.5];
set M_C_2_14 [expr $B*262196.27];
set M_C_2_15 [expr $B*1111479.25*0.5];
set M_C_2_16 [expr $B*1111479.25*0.5];
set M_rec_3_17 [expr $B*357474.44];
set M_rec_3_18 [expr $B*356598.96];
set M_rec_4_19 [expr $B*360422.52];
set M_rec_4_20 [expr $B*353960.31];

set M_col_41 [expr $B*426047.77];
set M_col_42 [expr $B*611484.23];
set M_col_43 [expr $B*611484.23];
set M_col_44 [expr $B*426047.77];
set M_col_45 [expr $B*425756.72];
set M_col_46 [expr $B*616601.96];
set M_col_47 [expr $B*616601.96];
set M_col_48 [expr $B*425756.72];
set C 1.0;
set D 1.0;

set Mtotal [expr $B*12969.7*1000]


#mass $nodeTag		mx			my		mz 	mrx 	mry		mrz
#Piso 1
for {set EjeV $nZ1} {$EjeV <= $Npisos} {incr EjeV $nZ1} {
	#mass 1000[expr $EjeV] $Mtotal $Mtotal $zero $zero $zero $zero
	mass 10[expr $EjeV*2] [expr $C*$M_rec_1_1] [expr $D*$M_rec_1_1] $zero $zero $zero $zero  	 
	mass 20[expr $EjeV*2] [expr $C*$M_rec_1_2] [expr $D*$M_rec_1_2] $zero $zero $zero $zero 
	mass 30[expr $EjeV*2] [expr $C*$M_rec_2_3] [expr $D*$M_rec_2_3] $zero $zero $zero $zero 
	mass 40[expr $EjeV*2] [expr $C*$M_rec_2_4] [expr $D*$M_rec_2_4] $zero $zero $zero $zero 
	mass 50[expr $EjeV*2] [expr $C*$M_C_1_5] [expr $D*$M_C_1_5]  $zero $zero $zero $zero 
	mass 60[expr $EjeV*2] [expr $C*$M_C_1_6] [expr $D*$M_C_1_6] $zero $zero $zero $zero 
	mass 70[expr $EjeV*2] [expr $C*$M_C_1_7] [expr $D*$M_C_1_7] $zero $zero $zero $zero
	mass 80[expr $EjeV*2] [expr $C*$M_C_2_8] [expr $D*$M_C_2_8] $zero $zero $zero $zero 
	mass 90[expr $EjeV*2] [expr $C*$M_C_2_9] [expr $D*$M_C_2_9] $zero $zero $zero $zero  	 
	mass 100[expr $EjeV*2] [expr $C*$M_C_2_10] [expr $D*$M_C_2_10] $zero $zero $zero $zero 
	mass 110[expr $EjeV*2] [expr $C*$M_C_1_11] [expr $D*$M_C_1_11] $zero $zero $zero $zero 
	mass 120[expr $EjeV*2] [expr $C*$M_C_1_12] [expr $D*$M_C_1_12] $zero $zero $zero $zero 
	mass 130[expr $EjeV*2] [expr $C*$M_C_1_13] [expr $D*$M_C_1_13]  $zero $zero $zero $zero 
	mass 140[expr $EjeV*2] [expr $C*$M_C_2_14] [expr $D*$M_C_2_14] $zero $zero $zero $zero 
	mass 150[expr $EjeV*2] [expr $C*$M_C_2_15] [expr $D*$M_C_2_15] $zero $zero $zero $zero
	mass 160[expr $EjeV*2] [expr $C*$M_C_2_16] [expr $D*$M_C_2_16] $zero $zero $zero $zero 
	mass 170[expr $EjeV*2] [expr $C*$M_rec_3_17] [expr $D*$M_rec_3_17] $zero $zero $zero $zero  	 
	mass 180[expr $EjeV*2] [expr $C*$M_rec_3_18] [expr $D*$M_rec_3_18] $zero $zero $zero $zero 
	mass 190[expr $EjeV*2] [expr $C*$M_rec_4_19] [expr $D*$M_rec_4_19] $zero $zero $zero $zero 
	mass 200[expr $EjeV*2] [expr $C*$M_rec_4_20] [expr $D*$M_rec_4_20] $zero $zero $zero $zero
	mass 410[expr $EjeV*2] $M_col_41 $M_col_41 $zero $zero $zero $zero
	mass 420[expr $EjeV*2] $M_col_42 $M_col_42 $zero $zero $zero $zero
	mass 430[expr $EjeV*2] $M_col_43 $M_col_43 $zero $zero $zero $zero
	mass 440[expr $EjeV*2] $M_col_44 $M_col_44 $zero $zero $zero $zero
	mass 450[expr $EjeV*2] $M_col_45 $M_col_45 $zero $zero $zero $zero
	mass 460[expr $EjeV*2] $M_col_46 $M_col_46 $zero $zero $zero $zero
	mass 470[expr $EjeV*2] $M_col_47 $M_col_47 $zero $zero $zero $zero
	mass 480[expr $EjeV*2] $M_col_48 $M_col_48 $zero $zero $zero $zero 
	
}

 

