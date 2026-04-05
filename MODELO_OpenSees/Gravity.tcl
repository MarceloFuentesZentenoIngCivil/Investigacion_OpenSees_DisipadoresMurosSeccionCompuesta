# Caso de Carga - Gravedad
# --------------------
# Create a Plain load pattern with a Linear TimeSeries
set A [expr -1.0*(0.058823529)];
pattern Plain 1 "Linear" { ; # Caso 1
set W_rec_1_1 [expr $A*3505626.81]; #Estos son valores obtenidos del modelo en ETABS, reacciones basales luego de quitar apoyo intermedio / n° pisos 
set W_rec_1_2 [expr $A*3497041.3]; 
set W_rec_2_3 [expr $A*3534537.55];
set W_rec_2_4 [expr $A*3471164.94];
set W_C_1_5 [expr $A*11723604.83*0.5];
set W_C_1_6 [expr $A*11723604.83*0.5];
set W_C_1_7 [expr $A*3994756.83];
set W_C_1_11 [expr $A*11723604.83*0.5];
set W_C_1_12 [expr $A*11723604.83*0.5];
set W_C_1_13 [expr $A*3994756.83];
set W_C_2_8 [expr $A*2571267.15];
set W_C_2_9 [expr $A*10899888.17*0.5];
set W_C_2_10 [expr $A*10899888.17*0.5];
set W_C_2_14 [expr $A*2571267.15];
set W_C_2_15 [expr $A*10899888.17*0.5];
set W_C_2_16 [expr $A*10899888.17*0.5];
set W_rec_3_17 [expr $A*3505626.81]; #Estos son valores obtenidos del modelo en ETABS, reacciones basales luego de quitar apoyo intermedio / n° pisos 
set W_rec_3_18 [expr $A*3497041.3]; 
set W_rec_4_19 [expr $A*3534537.55];
set W_rec_4_20 [expr $A*3471164.94];
set W_col_41 [expr $A*4175247.23];
set W_col_42 [expr $A*6046799.78];
set W_col_43 [expr $A*6046799.78];
set W_col_44 [expr $A*4175247.23];
set W_col_45 [expr $A*4178101.42];
set W_col_46 [expr $A*5996611.91];
set W_col_47 [expr $A*5996611.91];
set W_col_48 [expr $A*4178101.42];
#Definicion de pesos en los nodos
#Piso 1 Fx Fy Fz Mx My Mz
for {set EjeV $nZ1} {$EjeV <= $Npisos} {incr EjeV $nZ1} {
	load 10[expr $EjeV*2] $zero $zero $W_rec_1_1 $zero $zero $zero  	 
	load 20[expr $EjeV*2] $zero $zero $W_rec_1_2 $zero $zero $zero 
	load 30[expr $EjeV*2] $zero $zero $W_rec_2_3 $zero $zero $zero 
	load 40[expr $EjeV*2] $zero $zero $W_rec_2_4 $zero $zero $zero 
	load 50[expr $EjeV*2] $zero $zero $W_C_1_5 $zero $zero $zero 
	load 60[expr $EjeV*2] $zero $zero $W_C_1_6 $zero $zero $zero 
	load 70[expr $EjeV*2] $zero $zero $W_C_1_7 $zero $zero $zero
	load 80[expr $EjeV*2] $zero $zero $W_C_2_8 $zero $zero $zero 
	load 90[expr $EjeV*2] $zero $zero $W_C_2_9 $zero $zero $zero  	 
	load 100[expr $EjeV*2] $zero $zero $W_C_2_10 $zero $zero $zero 
	load 110[expr $EjeV*2] $zero $zero $W_C_1_11 $zero $zero $zero 
	load 120[expr $EjeV*2] $zero $zero $W_C_1_12 $zero $zero $zero 
	load 130[expr $EjeV*2] $zero $zero $W_C_1_13 $zero $zero $zero 
	load 140[expr $EjeV*2] $zero $zero $W_C_2_14 $zero $zero $zero 
	load 150[expr $EjeV*2] $zero $zero $W_C_2_15 $zero $zero $zero
	load 160[expr $EjeV*2] $zero $zero $W_C_2_16 $zero $zero $zero 
	load 170[expr $EjeV*2] $zero $zero $W_rec_3_17 $zero $zero $zero  	 
	load 180[expr $EjeV*2] $zero $zero $W_rec_3_18 $zero $zero $zero 
	load 190[expr $EjeV*2] $zero $zero $W_rec_4_19 $zero $zero $zero 
	load 200[expr $EjeV*2] $zero $zero $W_rec_4_20 $zero $zero $zero
	load 410[expr $EjeV*2] $zero $zero $W_col_41 $zero $zero $zero
	load 420[expr $EjeV*2] $zero $zero $W_col_42 $zero $zero $zero
	load 430[expr $EjeV*2] $zero $zero $W_col_43 $zero $zero $zero
	load 440[expr $EjeV*2] $zero $zero $W_col_44 $zero $zero $zero
	load 450[expr $EjeV*2] $zero $zero $W_col_45 $zero $zero $zero 
	load 460[expr $EjeV*2] $zero $zero $W_col_46 $zero $zero $zero 
	load 470[expr $EjeV*2] $zero $zero $W_col_47 $zero $zero $zero 
	load 480[expr $EjeV*2] $zero $zero $W_col_48 $zero $zero $zero 

}
	 


# Create nodal loads
#load  	nd    	FX       FY  		MZ 
#load 	11 		0.	-[expr $W/2] 	0.
#load	21 		0.	-[expr $W/2] 	0.
#load	12 		0.	-[expr $W/2]	0.
#load	22 		0.	-[expr $W/2]	0.
#}
set GravityAnalysisDirectory "Gravity"

file mkdir $Name_Folder/$GravityAnalysisDirectory
recorder Node -file $Name_Folder/$GravityAnalysisDirectory/ReaccionVert_Gravity.txt -node 100 200 300 400 500 600 700 800 900 1000 1100 1200 1300 1400 1500 1600 1700 1800 1900 2000 4100 4200 4300 4400 4500 4600 4700 4800 -dof 3 reaction
#for {set EjeV $nZ} {$EjeV <= $Ejes_Vert} {incr EjeV $nZ} #{
	#recorder Node -file $Name_Folder/$GravityAnalysisDirectory/DispZ_1_2_Piso[expr $EjeV/$nZ].txt -time -node 1041[expr $EjeV/$nZ] -dof 1 2 3 disp
	#recorder Node -file $Name_Folder/$GravityAnalysisDirectory/DispZ_3_4_Piso[expr $EjeV/$nZ].txt -time -node 1042[expr $EjeV/$nZ] -dof 1 2 3 disp
	#recorder Node -file $Name_Folder/$GravityAnalysisDirectory/DispZ_5_6_7_11_12_13_Piso[expr $EjeV/$nZ].txt -time -node 1043[expr $EjeV/$nZ] 1044[expr $EjeV/$nZ] 1045[expr $EjeV/$nZ] -dof 1 2 3 disp
	#recorder Node -file $Name_Folder/$GravityAnalysisDirectory/DispZ_17_18_Piso[expr $EjeV/$nZ].txt -time -node 1046[expr $EjeV/$nZ] -dof 1 2 3 disp
	#recorder Node -file $Name_Folder/$GravityAnalysisDirectory/DispZ_19_20_Piso[expr $EjeV/$nZ].txt -time -node 1047[expr $EjeV/$nZ] -dof 1 2 3 disp
	#recorder Node -file $Name_Folder/$GravityAnalysisDirectory/DispZ_8_9_10_14_15_16_Piso[expr $EjeV/$nZ].txt -time -node 1048[expr $EjeV/$nZ] -dof 1 2 3 disp
#} 

set steps_grav 1

    # ------------------------------
    # Start of analysis generation
    # ------------------------------
    # Create the system of equation
	wipeAnalysis
    system BandGeneral
	#system ProfileSPD
    # Create the DOF numberer
    #numberer Plain; # Para modelos pequeños #CONSULTAR
	numberer RCM
    # Create the constraint handler
	#constraints Plain  
	constraints Transformation
    # Create the convergence test
	#test NormUnbalance 1.0e-2 200
	#test NormUnbalance 1.0e-3 1000
	#test EnergyIncr 1.0e-4 500 
	test RelativeNormUnbalance 1.0e-8 200;
    # Create the integration scheme
    integrator LoadControl [expr 1./$steps_grav]; #Load applied in 1 steps
    # Create the solution algorithm
    algorithm Newton 
    # Create the analysis object
    analysis Static
    # ------------------------------
    # End of analysis generation
    # ------------------------------



    # ------------------------------
    # Perform the gravity analysis
    # ------------------------------
	set ok [analyze $steps_grav]

	if {$ok == 0} {
		puts "Gravity Analysis COMPLETE!"
		set GravityAnalysisDone "Yes";
		remove recorders 
	} else {
		puts "Gravity Analysis FAILED!"
	}
	# ------------------------------
    # Start of model generation
    # ------------------------------
    # Set the gravity loads to be constant & reset the time in the domain
    loadConst -time 0.0; #MUY IMPORTANTE. NO OLVIDAR NUNCA
