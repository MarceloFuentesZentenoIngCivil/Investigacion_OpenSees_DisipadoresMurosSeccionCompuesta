##########################################################################################################
##--------------------------------- 1.- Desplazamientos y aceleraciones de piso.
##########################################################################################################
set Fibras "Deformacion Acero y Deformacion Hormigon"
file mkdir $Name_Folder/$THAnalysisDirectory/$Fibras

set MuroDataMC1_2 "MC1.2"

file mkdir $Name_Folder/$THAnalysisDirectory/$Fibras/$MuroDataMC1_2
recorder Element -file $Name_Folder/$THAnalysisDirectory/$Fibras/$MuroDataMC1_2/Fiber_Strain_Piso1.txt -time -ele 501101 501102 Fiber_Strain
recorder Element -file $Name_Folder/$THAnalysisDirectory/$Fibras/$MuroDataMC1_2/Fiber_Stress_Concrete_Piso1.txt -time -ele 501101 501102 Fiber_Stress_Concrete
recorder Element -file $Name_Folder/$THAnalysisDirectory/$Fibras/$MuroDataMC1_2/Fiber_Stress_Steel_Piso1.txt -time -ele 501101 501102 Fiber_Stress_Steel 


set MuroDataMC2_2 "MC2.2"

file mkdir $Name_Folder/$THAnalysisDirectory/$Fibras/$MuroDataMC2_2
recorder Element -file $Name_Folder/$THAnalysisDirectory/$Fibras/$MuroDataMC2_2/Fiber_Strain_Piso1.txt -time -ele 1001601 1001602 Fiber_Strain
recorder Element -file $Name_Folder/$THAnalysisDirectory/$Fibras/$MuroDataMC2_2/Fiber_Stress_Concrete_Piso1.txt -time -ele 1001601 1001602 Fiber_Stress_Concrete
recorder Element -file $Name_Folder/$THAnalysisDirectory/$Fibras/$MuroDataMC2_2/Fiber_Stress_Steel_Piso1.txt -time -ele 1001601 1001602 Fiber_Stress_Steel


set MuroDataMC1_1 "MC1.1"

file mkdir $Name_Folder/$THAnalysisDirectory/$Fibras/$MuroDataMC1_1
recorder Element -file $Name_Folder/$THAnalysisDirectory/$Fibras/$MuroDataMC1_1/Fiber_Strain_Piso1.txt -time -ele 70601 70602 Fiber_Strain
recorder Element -file $Name_Folder/$THAnalysisDirectory/$Fibras/$MuroDataMC1_1/Fiber_Stress_Concrete_Piso1.txt -time -ele 70601 70602 Fiber_Stress_Concrete
recorder Element -file $Name_Folder/$THAnalysisDirectory/$Fibras/$MuroDataMC1_1/Fiber_Stress_Steel_Piso1.txt -time -ele 70601 70602 Fiber_Stress_Steel


set MuroDataMC2_3 "MC2.3"
file mkdir $Name_Folder/$THAnalysisDirectory/$Fibras/$MuroDataMC2_3
recorder Element -file $Name_Folder/$THAnalysisDirectory/$Fibras/$MuroDataMC2_3/Fiber_Strain_Piso1.txt -time -ele 1401501 1401502 Fiber_Strain
recorder Element -file $Name_Folder/$THAnalysisDirectory/$Fibras/$MuroDataMC2_3/Fiber_Stress_Concrete_Piso1.txt -time -ele 1401501 1401502 Fiber_Stress_Concrete
recorder Element -file $Name_Folder/$THAnalysisDirectory/$Fibras/$MuroDataMC2_3/Fiber_Stress_Steel_Piso1.txt -time -ele 1401501 1401502 Fiber_Stress_Steel


set MuroDataMC2_1 "MC2.1"
file mkdir $Name_Folder/$THAnalysisDirectory/$Fibras/$MuroDataMC2_1
recorder Element -file $Name_Folder/$THAnalysisDirectory/$Fibras/$MuroDataMC2_1/Fiber_Strain_Piso1.txt -time -ele 80901 80902 Fiber_Strain
recorder Element -file $Name_Folder/$THAnalysisDirectory/$Fibras/$MuroDataMC2_1/Fiber_Stress_Concrete_Piso1.txt -time -ele 80901 80902 Fiber_Stress_Concrete
recorder Element -file $Name_Folder/$THAnalysisDirectory/$Fibras/$MuroDataMC2_1/Fiber_Stress_Steel_Piso1.txt -time -ele 80901 80902 Fiber_Stress_Steel


set MuroDataMC1_3 "MC1.3"

file mkdir $Name_Folder/$THAnalysisDirectory/$Fibras/$MuroDataMC1_3
recorder Element -file $Name_Folder/$THAnalysisDirectory/$Fibras/$MuroDataMC1_3/Fiber_Strain_Piso1.txt -time -ele 1301201 1301202 Fiber_Strain
recorder Element -file $Name_Folder/$THAnalysisDirectory/$Fibras/$MuroDataMC1_3/Fiber_Stress_Concrete_Piso1.txt -time -ele 1301201 1301202 Fiber_Stress_Concrete
recorder Element -file $Name_Folder/$THAnalysisDirectory/$Fibras/$MuroDataMC1_3/Fiber_Stress_Steel_Piso1.txt -time -ele 1301201 1301202 Fiber_Stress_Steel



set ZLEResultsDirectory "ZLE"

file mkdir $Name_Folder/$THAnalysisDirectory/$ZLEResultsDirectory

for {set EjeV $nZ1} {$EjeV <= $Npanos} {incr EjeV $nZ1} {
	recorder Element -file $Name_Folder/$THAnalysisDirectory/$ZLEResultsDirectory/FuerzasZLE_56_Piso[expr $EjeV].txt -time -ele 5060[expr $EjeV] -dof 1 2 3 force 
	recorder Element -file $Name_Folder/$THAnalysisDirectory/$ZLEResultsDirectory/DefZLE_56_Piso[expr $EjeV].txt -time -ele 5060[expr $EjeV] -dof 1 2 3 deformation
	recorder Element -file $Name_Folder/$THAnalysisDirectory/$ZLEResultsDirectory/FuerzasZLE_910_Piso[expr $EjeV].txt -time -ele 90100[expr $EjeV] -dof 1 2 3 force
	recorder Element -file $Name_Folder/$THAnalysisDirectory/$ZLEResultsDirectory/DefZLE_910_Piso[expr $EjeV].txt -time -ele 90100[expr $EjeV] -dof 1 2 3 deformation
	recorder Element -file $Name_Folder/$THAnalysisDirectory/$ZLEResultsDirectory/FuerzasZLE_1112_Piso[expr $EjeV].txt -time -ele 110120[expr $EjeV] -dof 1 2 3 force
	recorder Element -file $Name_Folder/$THAnalysisDirectory/$ZLEResultsDirectory/DefZLE_1112_Piso[expr $EjeV].txt -time -ele 110120[expr $EjeV] -dof 1 2 3 deformation
	recorder Element -file $Name_Folder/$THAnalysisDirectory/$ZLEResultsDirectory/FuerzasZLE_1516_Piso[expr $EjeV].txt -time -ele 150160[expr $EjeV] -dof 1 2 3 force
	recorder Element -file $Name_Folder/$THAnalysisDirectory/$ZLEResultsDirectory/DefZLE_1516_Piso[expr $EjeV].txt -time -ele 150160[expr $EjeV] -dof 1 2 3 deformation
	
}

set FloorResultsDirectory1 "Drift"
set FloorResultsDirectory2 "Aceleracion absoluta"
file mkdir $Name_Folder/$THAnalysisDirectory/$FloorResultsDirectory1
file mkdir $Name_Folder/$THAnalysisDirectory/$FloorResultsDirectory2
for {set EjeV $nZ1} {$EjeV <= $Npisos} {incr EjeV $nZ1} {
    recorder Node -file $Name_Folder/$THAnalysisDirectory/$FloorResultsDirectory1/DespPisoXY[expr $EjeV].txt -time -node 70[expr $EjeV*2]  -dof 1 2 disp
	recorder Node -file $Name_Folder/$THAnalysisDirectory/$FloorResultsDirectory2/AcelPisoXY[expr $EjeV].txt -time -node 70[expr $EjeV*2]  -dof 1 2 accel
}

set GlobalForcesDirectory "Corte"

file mkdir $Name_Folder/$THAnalysisDirectory/$GlobalForcesDirectory

set GlobalForceMuroMC1 "MC1"

file mkdir $Name_Folder/$THAnalysisDirectory/$GlobalForcesDirectory/$GlobalForceMuroMC1

for {set EjeV $nZ1} {$EjeV <= $Npanos} {incr EjeV $nZ1} {
	recorder Element -file $Name_Folder/$THAnalysisDirectory/$GlobalForcesDirectory/$GlobalForceMuroMC1/Shear_Force_DeformationPano[expr $EjeV].txt -time -ele 7060[expr $EjeV] 50110[expr $EjeV] 130120[expr $EjeV] Shear_Force_Deformation
}


set GlobalForceMuroMC2 "MC2"

file mkdir $Name_Folder/$THAnalysisDirectory/$GlobalForcesDirectory/$GlobalForceMuroMC2

for {set EjeV $nZ1} {$EjeV <= $Npanos} {incr EjeV $nZ1} {
	recorder Element -file $Name_Folder/$THAnalysisDirectory/$GlobalForcesDirectory/$GlobalForceMuroMC2/Shear_Force_DeformationPano[expr $EjeV].txt -time -ele 8090[expr $EjeV] 100160[expr $EjeV] 140150[expr $EjeV] Shear_Force_Deformation
}











