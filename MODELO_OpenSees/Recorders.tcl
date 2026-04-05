##########################################################################################################
##--------------------------------- 1.- Desplazamientos y aceleraciones de piso.
##########################################################################################################


set MuroData511 "Muro511"

file mkdir $Name_Folder/$THAnalysisDirectory/$MuroData511
recorder Element -file $Name_Folder/$THAnalysisDirectory/$MuroData511/Fiber_Strain_Piso1.txt -time -ele 501101 501102 Fiber_Strain
recorder Element -file $Name_Folder/$THAnalysisDirectory/$MuroData511/Fiber_Stress_Concrete_Piso1.txt -time -ele 501101 501102 Fiber_Stress_Concrete
recorder Element -file $Name_Folder/$THAnalysisDirectory/$MuroData511/Fiber_Stress_Steel_Piso1.txt -time -ele 501101 501102 Fiber_Stress_Steel 


set MuroData1016 "Muro1016"

file mkdir $Name_Folder/$THAnalysisDirectory/$MuroData1016
recorder Element -file $Name_Folder/$THAnalysisDirectory/$MuroData1016/Fiber_Strain_Piso1.txt -time -ele 1001601 1001602 Fiber_Strain
recorder Element -file $Name_Folder/$THAnalysisDirectory/$MuroData1016/Fiber_Stress_Concrete_Piso1.txt -time -ele 1001601 1001602 Fiber_Stress_Concrete
recorder Element -file $Name_Folder/$THAnalysisDirectory/$MuroData1016/Fiber_Stress_Steel_Piso1.txt -time -ele 1001601 1001602 Fiber_Stress_Steel


set MuroData76 "Muro76"

file mkdir $Name_Folder/$THAnalysisDirectory/$MuroData76
recorder Element -file $Name_Folder/$THAnalysisDirectory/$MuroData76/Fiber_Strain_Piso1.txt -time -ele 70601 70602 Fiber_Strain
recorder Element -file $Name_Folder/$THAnalysisDirectory/$MuroData76/Fiber_Stress_Concrete_Piso1.txt -time -ele 70601 70602 Fiber_Stress_Concrete
recorder Element -file $Name_Folder/$THAnalysisDirectory/$MuroData76/Fiber_Stress_Steel_Piso1.txt -time -ele 70601 70602 Fiber_Stress_Steel


set MuroData1415 "Muro1415"
file mkdir $Name_Folder/$THAnalysisDirectory/$MuroData1415
recorder Element -file $Name_Folder/$THAnalysisDirectory/$MuroData1415/Fiber_Strain_Piso1.txt -time -ele 1401501 1401502 Fiber_Strain
recorder Element -file $Name_Folder/$THAnalysisDirectory/$MuroData1415/Fiber_Stress_Concrete_Piso1.txt -time -ele 1401501 1401502 Fiber_Stress_Concrete
recorder Element -file $Name_Folder/$THAnalysisDirectory/$MuroData1415/Fiber_Stress_Steel_Piso1.txt -time -ele 1401501 1401502 Fiber_Stress_Steel


set MuroData89 "Muro89"
file mkdir $Name_Folder/$THAnalysisDirectory/$MuroData89
recorder Element -file $Name_Folder/$THAnalysisDirectory/$MuroData89/Fiber_Strain_Piso1.txt -time -ele 80901 80902 Fiber_Strain
recorder Element -file $Name_Folder/$THAnalysisDirectory/$MuroData89/Fiber_Stress_Concrete_Piso1.txt -time -ele 80901 80902 Fiber_Stress_Concrete
recorder Element -file $Name_Folder/$THAnalysisDirectory/$MuroData89/Fiber_Stress_Steel_Piso1.txt -time -ele 80901 80902 Fiber_Stress_Steel


set MuroData1312 "Muro1312"

file mkdir $Name_Folder/$THAnalysisDirectory/$MuroData1312
recorder Element -file $Name_Folder/$THAnalysisDirectory/$MuroData1312/Fiber_Strain_Piso1.txt -time -ele 1301201 1301202 Fiber_Strain
recorder Element -file $Name_Folder/$THAnalysisDirectory/$MuroData1312/Fiber_Stress_Concrete_Piso1.txt -time -ele 1301201 1301202 Fiber_Stress_Concrete
recorder Element -file $Name_Folder/$THAnalysisDirectory/$MuroData1312/Fiber_Stress_Steel_Piso1.txt -time -ele 1301201 1301202 Fiber_Stress_Steel



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

set FloorResultsDirectory "Floor"

file mkdir $Name_Folder/$THAnalysisDirectory/$FloorResultsDirectory

for {set EjeV $nZ1} {$EjeV <= $Npisos} {incr EjeV $nZ1} {
    recorder Node -file $Name_Folder/$THAnalysisDirectory/$FloorResultsDirectory/DespPisoXY[expr $EjeV].txt -time -node 70[expr $EjeV*2] 13[expr $EjeV*2] -dof 1 2 disp
	recorder Node -file $Name_Folder/$THAnalysisDirectory/$FloorResultsDirectory/AcelPisoXY[expr $EjeV].txt -time -node 70[expr $EjeV*2] 13[expr $EjeV*2] -dof 1 2 accel
}

set GlobalForcesDirectory "GlobalForcesWalls"

file mkdir $Name_Folder/$THAnalysisDirectory/$GlobalForcesDirectory

recorder Element -file $Name_Folder/$THAnalysisDirectory/$GlobalForcesDirectory/CurvatureMurosPiso1_810_1016_1416_75_511_1311_12_34_1718_1920.txt -time -ele 80901 1001601 1401501 70601 501101 1301201 10201 30401 1701801 1902001 80902 1001602 1401502 70602 501102 1301202 10202 30402 1701802 1902002 Curvature

set GlobalForceMuro7060and50110and130120 "Muro7060and50110and130120"

file mkdir $Name_Folder/$THAnalysisDirectory/$GlobalForcesDirectory/$GlobalForceMuro7060and50110and130120

for {set EjeV $nZ1} {$EjeV <= $Npanos} {incr EjeV $nZ1} {
    recorder Element -file $Name_Folder/$THAnalysisDirectory/$GlobalForcesDirectory/$GlobalForceMuro7060and50110and130120/GlobalForceMuroPano[expr $EjeV].txt -time -ele 7060[expr $EjeV] 50110[expr $EjeV] 130120[expr $EjeV] globalForce
	recorder Element -file $Name_Folder/$THAnalysisDirectory/$GlobalForcesDirectory/$GlobalForceMuro7060and50110and130120/Shear_Force_DeformationPano[expr $EjeV].txt -time -ele 7060[expr $EjeV] 50110[expr $EjeV] 130120[expr $EjeV] Shear_Force_Deformation
}


set GlobalForceMuro8090and100160and140150 "Muro8090and100160and140150"

file mkdir $Name_Folder/$THAnalysisDirectory/$GlobalForcesDirectory/$GlobalForceMuro8090and100160and140150

for {set EjeV $nZ1} {$EjeV <= $Npanos} {incr EjeV $nZ1} {
    recorder Element -file $Name_Folder/$THAnalysisDirectory/$GlobalForcesDirectory/$GlobalForceMuro8090and100160and140150/GlobalForceMuroPano[expr $EjeV].txt -time -ele 8090[expr $EjeV] 100160[expr $EjeV] 140150[expr $EjeV] globalForce
	recorder Element -file $Name_Folder/$THAnalysisDirectory/$GlobalForcesDirectory/$GlobalForceMuro8090and100160and140150/Shear_Force_DeformationPano[expr $EjeV].txt -time -ele 8090[expr $EjeV] 100160[expr $EjeV] 140150[expr $EjeV] Shear_Force_Deformation
}











