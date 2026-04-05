#MUROS

#La notacion del "eletag" es XYZ X=nodo1 en planta;Y=nodo2 en planta;Z=piso 
#Muro ML1 Rectangular inferior izquierdo entre nodos 1 en planta y nodo 2 en planta
set transfTagCol 3;
#geomTransf Linear $transfTag $vecxzX $vecxzY $vecxzZ
geomTransf PDelta $transfTagCol 1 0 0
#element forceBeamColumn $eleTag $iNode $jNode $numIntgrPts $secTag $transfTag
set nZ2 1;
set NmurosSFI [expr 17];
set t [expr 0.4];


for {set EjeV $nZ1} {$EjeV <= $Npanos} {incr EjeV $nZ1} {
	
	element MVLEM_3D 1020[expr $EjeV] 20[expr $EjeV - 1] 10[expr $EjeV - 1] 10[expr $EjeV] 20[expr $EjeV] 12 -thick $t $t $t $t $t $t $t $t $t $t $t $t -width 0.125 0.125 0.25 0.25 0.25 0.25 0.25 0.25 0.25 0.25 0.125 0.125 -rho $rho2fi22 $rho2fi22 $rhofi10a10 $rhofi10a10 $rhofi10a10 $rhofi10a10 $rhofi10a10 $rhofi10a10 $rhofi10a10 $rhofi10a10 $rho2fi22 $rho2fi22 -matConcrete $tag_concrete02muro $tag_concrete02muro $tag_concrete02muro $tag_concrete02muro $tag_concrete02muro $tag_concrete02muro $tag_concrete02muro $tag_concrete02muro $tag_concrete02muro $tag_concrete02muro $tag_concrete02muro $tag_concrete02muro -matSteel $tag_steel $tag_steel $tag_steel $tag_steel $tag_steel $tag_steel $tag_steel $tag_steel $tag_steel $tag_steel $tag_steel $tag_steel -matShear $tag_Gc
	
	
	element MVLEM_3D 3040[expr $EjeV] 40[expr $EjeV - 1] 30[expr $EjeV - 1] 30[expr $EjeV] 40[expr $EjeV] 12 -thick $t $t $t $t $t $t $t $t $t $t $t $t -width 0.125 0.125 0.25 0.25 0.25 0.25 0.25 0.25 0.25 0.25 0.125 0.125 -rho $rho2fi22 $rho2fi22 $rhofi10a10 $rhofi10a10 $rhofi10a10 $rhofi10a10 $rhofi10a10 $rhofi10a10 $rhofi10a10 $rhofi10a10 $rho2fi22 $rho2fi22 -matConcrete $tag_concrete02muro $tag_concrete02muro $tag_concrete02muro $tag_concrete02muro $tag_concrete02muro $tag_concrete02muro $tag_concrete02muro $tag_concrete02muro $tag_concrete02muro $tag_concrete02muro $tag_concrete02muro $tag_concrete02muro -matSteel $tag_steel $tag_steel $tag_steel $tag_steel $tag_steel $tag_steel $tag_steel $tag_steel $tag_steel $tag_steel $tag_steel $tag_steel -matShear $tag_Gc
	
	
	element MVLEM_3D 170180[expr $EjeV] 180[expr $EjeV - 1] 170[expr $EjeV - 1] 170[expr $EjeV] 180[expr $EjeV] 12 -thick $t $t $t $t $t $t $t $t $t $t $t $t -width 0.125 0.125 0.25 0.25 0.25 0.25 0.25 0.25 0.25 0.25 0.125 0.125 -rho $rho2fi22 $rho2fi22 $rhofi10a10 $rhofi10a10 $rhofi10a10 $rhofi10a10 $rhofi10a10 $rhofi10a10 $rhofi10a10 $rhofi10a10 $rho2fi22 $rho2fi22 -matConcrete $tag_concrete02muro $tag_concrete02muro $tag_concrete02muro $tag_concrete02muro $tag_concrete02muro $tag_concrete02muro $tag_concrete02muro $tag_concrete02muro $tag_concrete02muro $tag_concrete02muro $tag_concrete02muro $tag_concrete02muro -matSteel $tag_steel $tag_steel $tag_steel $tag_steel $tag_steel $tag_steel $tag_steel $tag_steel $tag_steel $tag_steel $tag_steel $tag_steel -matShear $tag_Gc
	
	
	element MVLEM_3D 190200[expr $EjeV] 190[expr $EjeV - 1] 200[expr $EjeV - 1] 200[expr $EjeV] 190[expr $EjeV] 12 -thick $t $t $t $t $t $t $t $t $t $t $t $t -width 0.125 0.125 0.25 0.25 0.25 0.25 0.25 0.25 0.25 0.25 0.125 0.125 -rho $rho2fi22 $rho2fi22 $rhofi10a10 $rhofi10a10 $rhofi10a10 $rhofi10a10 $rhofi10a10 $rhofi10a10 $rhofi10a10 $rhofi10a10 $rho2fi22 $rho2fi22 -matConcrete $tag_concrete02muro $tag_concrete02muro $tag_concrete02muro $tag_concrete02muro $tag_concrete02muro $tag_concrete02muro $tag_concrete02muro $tag_concrete02muro $tag_concrete02muro $tag_concrete02muro $tag_concrete02muro $tag_concrete02muro -matSteel $tag_steel $tag_steel $tag_steel $tag_steel $tag_steel $tag_steel $tag_steel $tag_steel $tag_steel $tag_steel $tag_steel $tag_steel -matShear $tag_Gc
	
	
	
	#Muro C superior
	element MVLEM_3D 8090[expr $EjeV] 80[expr $EjeV - 1] 90[expr $EjeV - 1] 90[expr $EjeV] 80[expr $EjeV] 11 -thick $t $t $t $t $t $t $t $t $t $t $t -width 0.15 0.15 0.15 0.3 0.3 0.3 0.3 0.3 0.3 0.125 0.125 -rho $rho4fi22 $rho4fi22 $rho4fi22 $rhofi10a10 $rhofi10a10 $rhofi10a10 $rhofi10a10 $rhofi10a10 $rhofi10a10 $rho3fi22 $rho3fi22 -matConcrete $tag_concrete02muro $tag_concrete02muro $tag_concrete02muro $tag_concrete02muro $tag_concrete02muro $tag_concrete02muro $tag_concrete02muro $tag_concrete02muro $tag_concrete02muro $tag_concrete02muro $tag_concrete02muro -matSteel $tag_steel $tag_steel $tag_steel $tag_steel $tag_steel $tag_steel $tag_steel $tag_steel $tag_steel $tag_steel $tag_steel -matShear $tag_Gc
	
	
	element MVLEM_3D 140150[expr $EjeV] 140[expr $EjeV - 1] 150[expr $EjeV - 1] 150[expr $EjeV] 140[expr $EjeV] 11 -thick $t $t $t $t $t $t $t $t $t $t $t -width 0.15 0.15 0.15 0.3 0.3 0.3 0.3 0.3 0.3 0.125 0.125 -rho $rho4fi22 $rho4fi22 $rho4fi22 $rhofi10a10 $rhofi10a10 $rhofi10a10 $rhofi10a10 $rhofi10a10 $rhofi10a10 $rho3fi22 $rho3fi22 -matConcrete $tag_concrete02muro $tag_concrete02muro $tag_concrete02muro $tag_concrete02muro $tag_concrete02muro $tag_concrete02muro $tag_concrete02muro $tag_concrete02muro $tag_concrete02muro $tag_concrete02muro $tag_concrete02muro -matSteel $tag_steel $tag_steel $tag_steel $tag_steel $tag_steel $tag_steel $tag_steel $tag_steel $tag_steel $tag_steel $tag_steel -matShear $tag_Gc
	
	
	element MVLEM_3D 100160[expr $EjeV] 100[expr $EjeV - 1] 160[expr $EjeV - 1] 160[expr $EjeV] 100[expr $EjeV] 14 -thick $t $t $t $t $t $t $t $t $t $t $t $t $t $t -width 0.125 0.125 0.83 0.83 0.83 0.83 0.83 0.83 0.83 0.83 0.83 0.83 0.125 0.125 -rho $rho3fi22 $rho3fi22 $rhofi10a10 $rhofi10a10 $rhofi10a10 $rhofi10a10 $rhofi10a10 $rhofi10a10 $rhofi10a10 $rhofi10a10 $rhofi10a10 $rhofi10a10 $rho3fi22 $rho3fi22 -matConcrete $tag_concrete02muro $tag_concrete02muro $tag_concrete02muro $tag_concrete02muro $tag_concrete02muro $tag_concrete02muro $tag_concrete02muro $tag_concrete02muro $tag_concrete02muro $tag_concrete02muro $tag_concrete02muro $tag_concrete02muro $tag_concrete02muro $tag_concrete02muro -matSteel $tag_steel $tag_steel $tag_steel $tag_steel $tag_steel $tag_steel $tag_steel $tag_steel $tag_steel $tag_steel $tag_steel $tag_steel $tag_steel $tag_steel -matShear $tag_Gc
	
	

	#Muro C inferior
	element MVLEM_3D 50110[expr $EjeV] 50[expr $EjeV - 1] 110[expr $EjeV - 1] 110[expr $EjeV] 50[expr $EjeV ] 14 -thick $t $t $t $t $t $t $t $t $t $t $t $t $t $t -width 0.125 0.125 0.83 0.83 0.83 0.83 0.83 0.83 0.83 0.83 0.83 0.83 0.125 0.125 -rho $rho3fi28 $rho3fi28 $rhofi12a10 $rhofi12a10 $rhofi12a10 $rhofi12a10 $rhofi12a10 $rhofi12a10 $rhofi12a10 $rhofi12a10 $rhofi12a10 $rhofi12a10 $rho3fi28 $rho3fi28 -matConcrete $tag_concrete02muro $tag_concrete02muro $tag_concrete02muro $tag_concrete02muro $tag_concrete02muro $tag_concrete02muro $tag_concrete02muro $tag_concrete02muro $tag_concrete02muro $tag_concrete02muro $tag_concrete02muro $tag_concrete02muro $tag_concrete02muro $tag_concrete02muro -matSteel $tag_steel $tag_steel $tag_steel $tag_steel $tag_steel $tag_steel $tag_steel $tag_steel $tag_steel $tag_steel $tag_steel $tag_steel $tag_steel $tag_steel -matShear $tag_Gc
	
	
	element MVLEM_3D 7060[expr $EjeV] 70[expr $EjeV - 1] 60[expr $EjeV - 1] 60[expr $EjeV] 70[expr $EjeV] 15 -thick $t $t $t $t $t $t $t $t $t $t $t $t $t $t $t -width 0.175 0.175 0.15 0.15 0.15 0.4 0.4 0.4 0.4 0.4 0.4 0.4 0.4 0.125 0.125 -rho $rho4fi28 $rho4fi28 $rho4fi22 $rho4fi22 $rho4fi22 $rhofi12a10 $rhofi12a10 $rhofi12a10 $rhofi12a10 $rhofi12a10 $rhofi12a10 $rhofi12a10 $rhofi12a10 $rho3fi28 $rho3fi28 -matConcrete $tag_concrete02muro $tag_concrete02muro $tag_concrete02muro $tag_concrete02muro $tag_concrete02muro $tag_concrete02muro $tag_concrete02muro $tag_concrete02muro $tag_concrete02muro $tag_concrete02muro $tag_concrete02muro $tag_concrete02muro $tag_concrete02muro $tag_concrete02muro $tag_concrete02muro -matSteel $tag_steel $tag_steel $tag_steel $tag_steel $tag_steel $tag_steel $tag_steel $tag_steel $tag_steel $tag_steel $tag_steel $tag_steel $tag_steel $tag_steel $tag_steel -matShear $tag_Gc
	
	
	element MVLEM_3D 130120[expr $EjeV] 130[expr $EjeV - 1] 120[expr $EjeV - 1] 120[expr $EjeV] 130[expr $EjeV] 15 -thick $t $t $t $t $t $t $t $t $t $t $t $t $t $t $t -width 0.175 0.175 0.15 0.15 0.15 0.4 0.4 0.4 0.4 0.4 0.4 0.4 0.4 0.125 0.125 -rho $rho4fi28 $rho4fi28 $rho4fi22 $rho4fi22 $rho4fi22 $rhofi12a10 $rhofi12a10 $rhofi12a10 $rhofi12a10 $rhofi12a10 $rhofi12a10 $rhofi12a10 $rhofi12a10 $rho3fi28 $rho3fi28 -matConcrete $tag_concrete02muro $tag_concrete02muro $tag_concrete02muro $tag_concrete02muro $tag_concrete02muro $tag_concrete02muro $tag_concrete02muro $tag_concrete02muro $tag_concrete02muro $tag_concrete02muro $tag_concrete02muro $tag_concrete02muro $tag_concrete02muro $tag_concrete02muro $tag_concrete02muro -matSteel $tag_steel $tag_steel $tag_steel $tag_steel $tag_steel $tag_steel $tag_steel $tag_steel $tag_steel $tag_steel $tag_steel $tag_steel $tag_steel $tag_steel $tag_steel -matShear $tag_Gc
	
}


#for {set EjeV $nZ2} {$EjeV <= $Npanos} {incr EjeV 1} {	
	#element elasticBeamColumn 41[expr $EjeV] 410[expr ($EjeV - 1)] 410[expr $EjeV] $Acol2 $Ec $Gc $Jcol2 $Icol2Y $Icol2Z $transfTagCol
	#element elasticBeamColumn 42[expr $EjeV] 420[expr ($EjeV - 1)] 420[expr $EjeV] $Acol1 $Ec $Gc $Jcol1 $Icol1Y $Icol1Z $transfTagCol
	#element elasticBeamColumn 43[expr $EjeV] 430[expr ($EjeV - 1)] 430[expr $EjeV] $Acol1 $Ec $Gc $Jcol1 $Icol1Y $Icol1Z $transfTagCol
	#element elasticBeamColumn 44[expr $EjeV] 440[expr ($EjeV - 1)] 440[expr $EjeV] $Acol2 $Ec $Gc $Jcol2 $Icol2Y $Icol2Z $transfTagCol
	#element elasticBeamColumn 45[expr $EjeV] 450[expr ($EjeV - 1)] 450[expr $EjeV] $Acol2 $Ec $Gc $Jcol2 $Icol2Y $Icol2Z $transfTagCol
	#element elasticBeamColumn 46[expr $EjeV] 460[expr ($EjeV - 1)] 460[expr $EjeV] $Acol1 $Ec $Gc $Jcol1 $Icol1Y $Icol1Z $transfTagCol
	#element elasticBeamColumn 47[expr $EjeV] 470[expr ($EjeV - 1)] 470[expr $EjeV] $Acol1 $Ec $Gc $Jcol1 $Icol1Y $Icol1Z $transfTagCol
	#element elasticBeamColumn 48[expr $EjeV] 480[expr ($EjeV - 1)] 480[expr $EjeV] $Acol2 $Ec $Gc $Jcol2 $Icol2Y $Icol2Z $transfTagCol	
	
#}

for {set EjeV $nZ2} {$EjeV <= $Npanos} {incr EjeV 1} {	
	element dispBeamColumn 41[expr $EjeV] 410[expr ($EjeV - 1)] 410[expr $EjeV] 3 4002 $transfTagCol
	element dispBeamColumn 42[expr $EjeV] 420[expr ($EjeV - 1)] 420[expr $EjeV] 3 4001 $transfTagCol
	element dispBeamColumn 43[expr $EjeV] 430[expr ($EjeV - 1)] 430[expr $EjeV] 3 4001 $transfTagCol
	element dispBeamColumn 44[expr $EjeV] 440[expr ($EjeV - 1)] 440[expr $EjeV] 3 4002 $transfTagCol
	element dispBeamColumn 45[expr $EjeV] 450[expr ($EjeV - 1)] 450[expr $EjeV] 3 4002 $transfTagCol
	element dispBeamColumn 46[expr $EjeV] 460[expr ($EjeV - 1)] 460[expr $EjeV] 3 4001 $transfTagCol
	element dispBeamColumn 47[expr $EjeV] 470[expr ($EjeV - 1)] 470[expr $EjeV] 3 4001 $transfTagCol
	element dispBeamColumn 48[expr $EjeV] 480[expr ($EjeV - 1)] 480[expr $EjeV] 3 4002 $transfTagCol	
	
}




set transfTagX 1;
set transfTagY 2;
set transfTagXY1 4;
set transfTagXY2 5;

#geomTransf Linear $transfTag $vecxzX $vecxzY $vecxzZ
geomTransf Linear $transfTagX -1 0 0
geomTransf Linear $transfTagY 0 1 0
geomTransf Linear $transfTagXY1 1 1 0 
geomTransf Linear $transfTagXY2 -1 -1 0 

for {set EjeV $nZ1} {$EjeV <= $Npisos} {incr EjeV $nZ1} {
	#HORIZONTALES
	#VIGAS ROJAS 
	#element elasticBeamColumn $eleTag $iNode $jNode $A $E $G $J $Iy $Iz $transfTag <-mass $massDens> <-cMass>
	#element elasticBeamColumn 410420[expr $EjeV] 410[expr $EjeV*2] 420[expr $EjeV*2] $Avr1 $Ec $Gc $Jr1 $Iyr1 $Izr1 $transfTagY
	#element elasticBeamColumn 420430[expr $EjeV] 420[expr $EjeV*2] 430[expr $EjeV*2] $Avr2 $Ec $Gc $Jr2 $Iyr2 $Izr2 $transfTagY
	#element elasticBeamColumn 430440[expr $EjeV] 430[expr $EjeV*2] 440[expr $EjeV*2] $Avr1 $Ec $Gc $Jr1 $Iyr1 $Izr1 $transfTagY
	#element elasticBeamColumn 450460[expr $EjeV] 450[expr $EjeV*2] 460[expr $EjeV*2] $Avr1 $Ec $Gc $Jr1 $Iyr1 $Izr1 $transfTagY
	#element elasticBeamColumn 460470[expr $EjeV] 460[expr $EjeV*2] 470[expr $EjeV*2] $Avr2 $Ec $Gc $Jr2 $Iyr2 $Izr2 $transfTagY
	#element elasticBeamColumn 470480[expr $EjeV] 470[expr $EjeV*2] 480[expr $EjeV*2] $Avr1 $Ec $Gc $Jr1 $Iyr1 $Izr1 $transfTagY
######################################################################################################################################version compleja############################
	element dispBeamColumn 410420[expr $EjeV] 410[expr $EjeV*2] 420[expr $EjeV*2] 3 1000 $transfTagY
	element dispBeamColumn 420430[expr $EjeV] 420[expr $EjeV*2] 430[expr $EjeV*2] 3 1000 $transfTagY
	element dispBeamColumn 430440[expr $EjeV] 430[expr $EjeV*2] 440[expr $EjeV*2] 3 1000 $transfTagY
	element dispBeamColumn 450460[expr $EjeV] 450[expr $EjeV*2] 460[expr $EjeV*2] 3 1000 $transfTagY
	element dispBeamColumn 460470[expr $EjeV] 460[expr $EjeV*2] 470[expr $EjeV*2] 3 1000 $transfTagY
	element dispBeamColumn 470480[expr $EjeV] 470[expr $EjeV*2] 480[expr $EjeV*2] 3 1000 $transfTagY
	
	#VIGAS AMARILLA 
	#element elasticBeamColumn $eleTag $iNode $jNode $A $E $G $J $Iy $Iz $transfTag <-mass $massDens> <-cMass>
	#element elasticBeamColumn 1050[expr $EjeV] 10[expr $EjeV*2] 50[expr $EjeV*2] $Ava2 $Ec $Gc $Ja2 $Iya2 $Iza2 $transfTagY
	#element elasticBeamColumn 110170[expr $EjeV] 110[expr $EjeV*2] 170[expr $EjeV*2] $Ava2 $Ec $Gc $Ja2 $Iya2 $Iza2 $transfTagY
	#element elasticBeamColumn 40100[expr $EjeV] 40[expr $EjeV*2] 100[expr $EjeV*2] $Ava2 $Ec $Gc $Ja2 $Iya2 $Iza2 $transfTagY
	#element elasticBeamColumn 160200[expr $EjeV] 160[expr $EjeV*2] 200[expr $EjeV*2] $Ava2 $Ec $Gc $Ja2 $Iya2 $Iza2 $transfTagY
##################################################################################################################################################version compleja#####################################
	element dispBeamColumn 1050[expr $EjeV] 10[expr $EjeV*2] 50[expr $EjeV*2] 3 3002 $transfTagY
	element dispBeamColumn 110170[expr $EjeV] 110[expr $EjeV*2] 170[expr $EjeV*2] 3 3002 $transfTagY
	element dispBeamColumn 40100[expr $EjeV] 40[expr $EjeV*2] 100[expr $EjeV*2] 3 3002 $transfTagY
	element dispBeamColumn 160200[expr $EjeV] 160[expr $EjeV*2] 200[expr $EjeV*2] 3 3002 $transfTagY
	#VIGAS CELESTE 
	#element elasticBeamColumn $eleTag $iNode $jNode $A $E $G $J $Iy $Iz $transfTag <-mass $massDens> <-cMass>
	#element elasticBeamColumn 80140[expr $EjeV] 80[expr $EjeV*2] 140[expr $EjeV*2] $Avc3 $Ec $Gc $Jc3 $Iyc3 $Izc3 $transfTagY
	#element elasticBeamColumn 70130[expr $EjeV] 70[expr $EjeV*2] 130[expr $EjeV*2] $Avc3 $Ec $Gc $Jc3 $Iyc3 $Izc3 $transfTagY
##########################################################################################################################################version compleja####################################
	element dispBeamColumn 80140[expr $EjeV] 80[expr $EjeV*2] 140[expr $EjeV*2] 3 2003 $transfTagY
	element dispBeamColumn 70130[expr $EjeV] 70[expr $EjeV*2] 130[expr $EjeV*2] 3 2003 $transfTagY
	
	
	#VERTICALES
	#VIGAS AMARILLA 
	#element elasticBeamColumn $eleTag $iNode $jNode $A $E $G $J $Iy $Iz $transfTag <-mass $massDens> <-cMass>
	#element elasticBeamColumn 42050[expr $EjeV] 420[expr $EjeV*2] 50[expr $EjeV*2] $Ava1 $Ec $Gc $Ja1 $Iya1 $Iza1 $transfTagX
	#element elasticBeamColumn 430110[expr $EjeV] 430[expr $EjeV*2] 110[expr $EjeV*2] $Ava1 $Ec $Gc $Ja1 $Iya1 $Iza1 $transfTagX
	#element elasticBeamColumn 100460[expr $EjeV] 100[expr $EjeV*2] 460[expr $EjeV*2] $Ava1 $Ec $Gc $Ja1 $Iya1 $Iza1 $transfTagX
	#element elasticBeamColumn 160470[expr $EjeV] 160[expr $EjeV*2] 470[expr $EjeV*2] $Ava1 $Ec $Gc $Ja1 $Iya1 $Iza1 $transfTagX
#################################################################################################################################################version compleja##################################################
	element dispBeamColumn 42050[expr $EjeV] 420[expr $EjeV*2] 50[expr $EjeV*2] 3 3001 $transfTagX
	element dispBeamColumn 430110[expr $EjeV] 430[expr $EjeV*2] 110[expr $EjeV*2] 3 3001 $transfTagX
	element dispBeamColumn 100460[expr $EjeV] 100[expr $EjeV*2] 460[expr $EjeV*2] 3 3001 $transfTagX
	element dispBeamColumn 160470[expr $EjeV] 160[expr $EjeV*2] 470[expr $EjeV*2] 3 3001 $transfTagX
	
	#VIGAS CELESTE 
	#element elasticBeamColumn $eleTag $iNode $jNode $A $E $G $J $Iy $Iz $transfTag <-mass $massDens> <-cMass>
	#element elasticBeamColumn 41010[expr $EjeV] 410[expr $EjeV*2] 10[expr $EjeV*2] $Avc2 $Ec $Gc $Jc2 $Iyc2 $Izc2 $transfTagX
	#element elasticBeamColumn 2030[expr $EjeV] 20[expr $EjeV*2] 30[expr $EjeV*2] $Avc1 $Ec $Gc $Jc1 $Iyc1 $Izc1 $transfTagX
	#element elasticBeamColumn 40450[expr $EjeV] 40[expr $EjeV*2] 450[expr $EjeV*2] $Avc2 $Ec $Gc $Jc2 $Iyc2 $Izc2 $transfTagX
	#element elasticBeamColumn 440170[expr $EjeV] 440[expr $EjeV*2] 170[expr $EjeV*2] $Avc2 $Ec $Gc $Jc2 $Iyc2 $Izc2 $transfTagX
	#element elasticBeamColumn 180190[expr $EjeV] 180[expr $EjeV*2] 190[expr $EjeV*2] $Avc1 $Ec $Gc $Jc1 $Iyc1 $Izc1 $transfTagX
	#element elasticBeamColumn 200480[expr $EjeV] 200[expr $EjeV*2] 480[expr $EjeV*2] $Avc2 $Ec $Gc $Jc2 $Iyc2 $Izc2 $transfTagX
####################################################################################################################################################################version compleja####################################
	element dispBeamColumn 41010[expr $EjeV] 410[expr $EjeV*2] 10[expr $EjeV*2] 3 2002 $transfTagX
	element dispBeamColumn 2030[expr $EjeV] 20[expr $EjeV*2] 30[expr $EjeV*2] 3 2001 $transfTagX
	element dispBeamColumn 40450[expr $EjeV] 40[expr $EjeV*2] 450[expr $EjeV*2] 3 2002 $transfTagX
	element dispBeamColumn 440170[expr $EjeV] 440[expr $EjeV*2] 170[expr $EjeV*2] 3 2002 $transfTagX
	element dispBeamColumn 180190[expr $EjeV] 180[expr $EjeV*2] 190[expr $EjeV*2] 3 2001 $transfTagX
	element dispBeamColumn 200480[expr $EjeV] 200[expr $EjeV*2] 480[expr $EjeV*2] 3 2002 $transfTagX
	
	
	
	
	
	
	
	


}

##################################################Interfaces ##########################################;

#Interfaz Elastica 

#for {set EjeV $nZ1} {$EjeV <= $Npanos} {incr EjeV $nZ1} {
	#element zeroLength 5060[expr $EjeV] 50[expr $EjeV] 60[expr $EjeV] -mat $tag_ElasInter -dir 3
	#element zeroLength 90100[expr $EjeV] 90[expr $EjeV] 100[expr $EjeV] -mat $tag_ElasInter -dir 3
	#element zeroLength 110120[expr $EjeV] 110[expr $EjeV] 120[expr $EjeV] -mat $tag_ElasInter -dir 3
	#element zeroLength 150160[expr $EjeV] 150[expr $EjeV] 160[expr $EjeV] -mat $tag_ElasInter -dir 3

#}


#Interfaz con disipador 
#D1
set nZ11 11;
set nZ21 21;

for {set EjeV $nZ1} {$EjeV <= 10} {incr EjeV 1} {
	element zeroLength 90100[expr $EjeV] 90[expr $EjeV] 100[expr $EjeV] -mat $tag_material_D1D2_floor1_floor5 -dir 3 
	element zeroLength 150160[expr $EjeV] 150[expr $EjeV] 160[expr $EjeV] -mat $tag_material_D1D2_floor1_floor5 -dir 3
	element zeroLength 5060[expr $EjeV] 50[expr $EjeV] 60[expr $EjeV] -mat $tag_material_D3D4_floor1_floor5 -dir 3
	element zeroLength 110120[expr $EjeV] 110[expr $EjeV] 120[expr $EjeV] -mat $tag_material_D3D4_floor1_floor5 -dir 3 
} 

for {set EjeV $nZ11} {$EjeV <=20} {incr EjeV 1} {
	element zeroLength 90100[expr $EjeV] 90[expr $EjeV] 100[expr $EjeV] -mat $tag_material_D1D2_floor6_floor10 -dir 3
	element zeroLength 150160[expr $EjeV] 150[expr $EjeV] 160[expr $EjeV] -mat $tag_material_D1D2_floor6_floor10 -dir 3
	element zeroLength 5060[expr $EjeV] 50[expr $EjeV] 60[expr $EjeV] -mat $tag_material_D3D4_floor6_floor10 -dir 3
	element zeroLength 110120[expr $EjeV] 110[expr $EjeV] 120[expr $EjeV] -mat $tag_material_D3D4_floor6_floor10 -dir 3
}

for {set EjeV $nZ21} {$EjeV <=34} {incr EjeV 1} {
	element zeroLength 90100[expr $EjeV] 90[expr $EjeV] 100[expr $EjeV] -mat $tag_material_D1D2_floor11_floor17 -dir 3 
	element zeroLength 150160[expr $EjeV] 150[expr $EjeV] 160[expr $EjeV] -mat $tag_material_D1D2_floor11_floor17 -dir 3 
	element zeroLength 5060[expr $EjeV] 50[expr $EjeV] 60[expr $EjeV] -mat $tag_material_D3D4_floor11_floor17 -dir 3
	element zeroLength 110120[expr $EjeV] 110[expr $EjeV] 120[expr $EjeV] -mat $tag_material_D3D4_floor11_floor17 -dir 3
}

















