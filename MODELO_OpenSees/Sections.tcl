
set hr [expr 0.65]; #altura viga roja
set br [expr 0.5]; #ancho viga roja  
set hc [expr 0.65]; #altura viga celeste
set bc [expr 0.3]; #ancho viga celeste
set ha [expr 0.8]; #altura viga amarilla
set ba [expr 0.4]; #ancho viga amarilla

set bc1 [expr 0.9];
set bc2 [expr 0.8];

set rec [expr 0.03];
set Jr [expr 0.0144];
set Jr1 [expr 0.0173];
set Jr2 [expr 0.0169];
set Jc [expr 0.004155];
set Jc1 [expr 0.005417];
set Jc2 [expr 0.005993];
set Jc3 [expr 0.006406]; 
set Ja [expr 0.0117];
set Ja1 [expr 0.0173];
set Ja2 [expr 0.0196];
set Jcol1 [expr 0.0924]; #0.9x0.9
set Jcol2 [expr 0.0712]; #0.8x0.9
set Acol1 [expr $bc1*$bc1];
set Icol1Z [expr 0.0833333*$bc1*$bc1*$bc1*$bc1];
set Icol1Y [expr 0.0833333*$bc1*$bc1*$bc1*$bc1];
set Acol2 [expr $bc1*$bc2];
set Icol2Z [expr 0.0833333*$bc2*$bc1*$bc1*$bc1];
set Icol2Y [expr 0.0833333*$bc1*$bc2*$bc2*$bc2];


set Avr1 0.499;
set Izr1 0.0178;
set Iyr1 0.0709;
set Avr2 0.479;
set Izr2 0.017;
set Iyr2 0.0514;
set Avc1 0.267;
set Izc1 0.009768;
set Iyc1 0.007967;
set Avc2 0.31;
set Izc2 0.0109;
set Iyc2 0.0185;
set Avc3 0.341;
set Izc3 0.0116;
set Iyc3 0.0301;
set Ava1 0.665;
set Iza1 0.0332;
set Iya1 0.1632;
set Ava2 0.84;
set Iza2 0.0366;
set Iya2 0.4532;


#COLMUNA NOESQUINA 4001
#COLUMNA ESQUINA 4002
#VIGAROJA 1000
#VIGACELESTE 2000 (2001,2002,2003)
#VIGAAMARILLO 3000 (3001,3002)



######################################################Columnas##############################################################################

section fiberSec 4001 -GJ [expr $Jcol1*$Gc1] {

    # -------------------------------------------------------------------------------------
    # Patches Rectangulares
    # -------------------------------------------------------------------------------------
    
    # Hormigon Nucleo 
	#patch rect $matTag		 $SubdivY $SubdivZ		$yi	   				$zi					$yj					$zj
    patch rect $tag_concrete02_conf 20 20 [expr -($bc1*0.5-$rec)] [expr -($bc1*0.5-$rec)] [expr $bc1*0.5-$rec] [expr $bc1*0.5-$rec] 
	#Hormigon Cubierta
	#Asuperior
	patch rect $tag_concrete02 4 20 [expr ($bc1*0.5-$rec)] [expr -($bc1*0.5-$rec)] [expr $bc1*0.5] [expr $bc1*0.5-$rec] 
	#Ainferior
	patch rect $tag_concrete02 4 20 [expr -($bc1*0.5)] [expr -($bc1*0.5-$rec)] [expr -($bc1*0.5-$rec)] [expr ($bc1*0.5-$rec)]
	#Aderecha
	patch rect $tag_concrete02 28 4 [expr -($bc1*0.5)] [expr ($bc1*0.5-$rec)] [expr ($bc1*0.5)] [expr ($bc1*0.5)]
	#Aizquierda
	patch rect $tag_concrete02 28 4 [expr -($bc1*0.5)] [expr -($bc1*0.5)] [expr ($bc1*0.5)] [expr $bc1*0.5-$rec]
      
    # -------------------------------------------------------------------------------------
    # Refuerzo Distribuido
    # -------------------------------------------------------------------------------------
    
	#layer straight $matTag  $numFibers  $As			$yi	   					$zi						$yj						$zj
	#Nivel6
    layer straight $tag_steel [expr 5] $As28 [expr ($bc1*0.5-$rec)] [expr -($bc1*0.5-$rec)] [expr ($bc1*0.5-$rec)] [expr ($bc1*0.5-$rec)]
	#Nivel5
	layer straight $tag_steel [expr 2] $As28 [expr ($bc1-2*$rec)*(1.5/5)] [expr -($bc1*0.5-$rec)] [expr ($bc1-2*$rec)*(1.5/5)] [expr ($bc1*0.5-$rec)]
	#Nivel4
	layer straight $tag_steel [expr 2] $As28 [expr ($bc1-2*$rec)*(0.5/5)] [expr -($bc1*0.5-$rec)] [expr ($bc1-2*$rec)*(0.5/5)] [expr ($bc1*0.5-$rec)]
	#Nivel3
	layer straight $tag_steel [expr 2] $As28 [expr -($bc1-2*$rec)*(0.5/5)] [expr -($bc1*0.5-$rec)] [expr -($bc1-2*$rec)*(0.5/5)] [expr ($bc1*0.5-$rec)]
	#Nivel2
	layer straight $tag_steel [expr 2] $As28 [expr -($bc1-2*$rec)*(1.5/5)] [expr -($bc1*0.5-$rec)] [expr -($bc1-2*$rec)*(1.5/5)] [expr ($bc1*0.5-$rec)]
	#Nivel1
	layer straight $tag_steel [expr 5] $As28 [expr -($bc1*0.5-$rec)] [expr -($bc1*0.5-$rec)] [expr -($bc1*0.5-$rec)] [expr ($bc1*0.5-$rec)]
}


section fiberSec 4002 -GJ [expr $Jcol2*$Gc1] {

    # -------------------------------------------------------------------------------------
    # Patches Rectangulares
    # -------------------------------------------------------------------------------------
    
    # Hormigon Nucleo 
	#patch rect $matTag		 $SubdivY $SubdivZ		$yi	   				$zi					$yj					$zj
    patch rect $tag_concrete02_conf 20 20 [expr -($bc1*0.5-$rec)] [expr -($bc2*0.5-$rec)] [expr $bc1*0.5-$rec] [expr $bc2*0.5-$rec] 
	#Hormigon Cubierta
	#Asuperior
	patch rect $tag_concrete02 4 20 [expr ($bc1*0.5-$rec)] [expr -($bc2*0.5-$rec)] [expr $bc1*0.5] [expr $bc2*0.5-$rec] 
	#Ainferior
	patch rect $tag_concrete02 4 20 [expr -($bc1*0.5)] [expr -($bc2*0.5-$rec)] [expr -($bc1*0.5-$rec)] [expr ($bc2*0.5-$rec)]
	#Aderecha
	patch rect $tag_concrete02 28 4 [expr -($bc1*0.5)] [expr ($bc2*0.5-$rec)] [expr ($bc1*0.5)] [expr ($bc2*0.5)]
	#Aizquierda
	patch rect $tag_concrete02 28 4 [expr -($bc1*0.5)] [expr -($bc2*0.5)] [expr ($bc1*0.5)] [expr $bc2*0.5-$rec]
      
    # -------------------------------------------------------------------------------------
    # Refuerzo Distribuido
    # -------------------------------------------------------------------------------------
    
	#layer straight $matTag  $numFibers  $As			$yi	   					$zi						$yj						$zj
	#Nivel5
    layer straight $tag_steel [expr 4] $As28 [expr ($bc1*0.5-$rec)] [expr -($bc2*0.5-$rec)] [expr ($bc1*0.5-$rec)] [expr ($bc2*0.5-$rec)]
	#Nivel4
	layer straight $tag_steel [expr 2] $As28 [expr ($bc1-2*$rec)*(1/4)] [expr -($bc2*0.5-$rec)] [expr ($bc1-2*$rec)*(1/4)] [expr ($bc2*0.5-$rec)]
	#Nivel3
	layer straight $tag_steel [expr 2] $As28 0 [expr -($bc2*0.5-$rec)] 0 [expr ($bc2*0.5-$rec)]
	#Nivel2
	layer straight $tag_steel [expr 2] $As28 [expr -($bc1-2*$rec)*(1/4)] [expr -($bc2*0.5-$rec)] [expr -($bc1-2*$rec)*(1/4)] [expr ($bc2*0.5-$rec)]
	#Nivel1
	layer straight $tag_steel [expr 4] $As28 [expr -($bc1*0.5-$rec)] [expr -($bc2*0.5-$rec)] [expr -($bc1*0.5-$rec)] [expr ($bc2*0.5-$rec)]
}
#####################################################################################################################################################################################################################






section fiberSec 1000 -GJ [expr $Jr*$Gc1] {

    # -------------------------------------------------------------------------------------
    # Patches Rectangulares
    # -------------------------------------------------------------------------------------
    
    # Hormigon Nucleo 
	#patch rect $matTag		 $SubdivY $SubdivZ		$yi	   				$zi					$yj					$zj
    patch rect $tag_concrete02_conf 20 20 [expr -($hr*0.5-$rec)] [expr -($br*0.5-$rec)] [expr $hr*0.5-$rec] [expr $br*0.5-$rec] 
	#Hormigon Cubierta
	#Asuperior
	patch rect $tag_concrete02 4 20 [expr ($hr*0.5-$rec)] [expr -($br*0.5-$rec)] [expr $hr*0.5] [expr $br*0.5-$rec] 
	#Ainferior
	patch rect $tag_concrete02 4 20 [expr -($hr*0.5)] [expr -($br*0.5-$rec)] [expr -($hr*0.5-$rec)] [expr ($br*0.5-$rec)]
	#Aderecha
	patch rect $tag_concrete02 28 4 [expr -($hr*0.5)] [expr ($br*0.5-$rec)] [expr ($hr*0.5)] [expr ($br*0.5)]
	#Aizquierda
	patch rect $tag_concrete02 28 4 [expr -($hr*0.5)] [expr -($br*0.5)] [expr ($hr*0.5)] [expr $br*0.5-$rec]
      
    # -------------------------------------------------------------------------------------
    # Refuerzo Distribuido
    # -------------------------------------------------------------------------------------
    
	#layer straight $matTag  $numFibers  $As			$yi	   					$zi						$yj						$zj
	
    layer straight $tag_steel [expr 5] $As28 [expr ($hr*0.5-$rec)] [expr -($br*0.5-$rec)] [expr ($hr*0.5-$rec)] [expr ($br*0.5-$rec)]
	layer straight $tag_steel [expr 5] $As18 [expr -($hr*0.5-$rec)] [expr -($br*0.5-$rec)] [expr -($hr*0.5-$rec)] [expr ($br*0.5-$rec)]
}






#section Aggregator 3 5 T -section 1000;	# combine section properties

section fiberSec 2001 -GJ [expr $Jc*$Gc1] {

    # -------------------------------------------------------------------------------------
    # Patches Rectangulares
    # -------------------------------------------------------------------------------------
    
    #Hormigon Nucleo 
	#patch rect $matTag		 $SubdivY $SubdivZ		$yi	   				$zi					$yj					$zj
    patch rect $tag_concrete02_conf 20 20 [expr -($hc*0.5-$rec)] [expr -($bc*0.5-$rec)] [expr $hc*0.5-$rec] [expr $bc*0.5-$rec] 
	#Hormigon Cubierta
	#Asuperior
	patch rect $tag_concrete02 4 20 [expr ($hc*0.5-$rec)] [expr -($bc*0.5-$rec)] [expr $hc*0.5] [expr $bc*0.5-$rec] 
	#Ainferior
	patch rect $tag_concrete02 4 20 [expr -($hc*0.5)] [expr -($bc*0.5-$rec)] [expr -($hc*0.5-$rec)] [expr ($bc*0.5-$rec)]
	#Aderecha
	patch rect $tag_concrete02 28 4 [expr -($hc*0.5)] [expr ($bc*0.5-$rec)] [expr ($hc*0.5)] [expr ($bc*0.5)]
	#Aizquierda
	patch rect $tag_concrete02 28 4 [expr -($hc*0.5)] [expr -($bc*0.5)] [expr ($hc*0.5)] [expr $bc*0.5-$rec]
      
    # -------------------------------------------------------------------------------------
    # Refuerzo Distribuido
    # -------------------------------------------------------------------------------------
    
	#layer straight $matTag  $numFibers  $As			$yi	   					$zi						$yj						$zj
	
    layer straight $tag_steel [expr 6] $As28 [expr ($hc*0.5-$rec)] [expr -($bc*0.5-$rec)] [expr ($hc*0.5-$rec)] [expr ($bc*0.5-$rec)]
	
	layer straight $tag_steel [expr 6] $As25 [expr -($hc*0.5-$rec)] [expr -($bc*0.5-$rec)] [expr -($hc*0.5-$rec)] [expr ($bc*0.5-$rec)]
}







#section Aggregator 3 5 T -section 2001;	# combine section properties
section fiberSec 2002 -GJ [expr $Jc*$Gc1] {

    # -------------------------------------------------------------------------------------
    # Patches Rectangulares
    # -------------------------------------------------------------------------------------
    
    #Hormigon Nucleo 
	#patch rect $matTag		 $SubdivY $SubdivZ		$yi	   				$zi					$yj					$zj
    patch rect $tag_concrete02_conf 20 20 [expr -($hc*0.5-$rec)] [expr -($bc*0.5-$rec)] [expr $hc*0.5-$rec] [expr $bc*0.5-$rec] 
	#Hormigon Cubierta
	#Asuperior
	patch rect $tag_concrete02 4 20 [expr ($hc*0.5-$rec)] [expr -($bc*0.5-$rec)] [expr $hc*0.5] [expr $bc*0.5-$rec] 
	#Ainferior
	patch rect $tag_concrete02 4 20 [expr -($hc*0.5)] [expr -($bc*0.5-$rec)] [expr -($hc*0.5-$rec)] [expr ($bc*0.5-$rec)]
	#Aderecha
	patch rect $tag_concrete02 28 4 [expr -($hc*0.5)] [expr ($bc*0.5-$rec)] [expr ($hc*0.5)] [expr ($bc*0.5)]
	#Aizquierda
	patch rect $tag_concrete02 28 4 [expr -($hc*0.5)] [expr -($bc*0.5)] [expr ($hc*0.5)] [expr $bc*0.5-$rec]
      
    # -------------------------------------------------------------------------------------
    # Refuerzo Distribuido
    # -------------------------------------------------------------------------------------
    
	#layer straight $matTag  $numFibers  $As			$yi	   					$zi						$yj						$zj
	
    layer straight $tag_steel [expr 4] $As28 [expr ($hc*0.5-$rec)] [expr -($bc*0.5-$rec)] [expr ($hc*0.5-$rec)] [expr ($bc*0.5-$rec)]

	layer straight $tag_steel [expr 4] $As25 [expr -($hc*0.5-$rec)] [expr -($bc*0.5-$rec)] [expr -($hc*0.5-$rec)] [expr ($bc*0.5-$rec)]
}





#section Aggregator 3 5 T -section 2002;	# combine section properties
section fiberSec 2003 -GJ [expr $Jc*$Gc1] {

    # -------------------------------------------------------------------------------------
    # Patches Rectangulares
    # -------------------------------------------------------------------------------------
    
    #Hormigon Nucleo 
	#patch rect $matTag		 $SubdivY $SubdivZ		$yi	   				$zi					$yj					$zj
    patch rect $tag_concrete02_conf 20 20 [expr -($hc*0.5-$rec)] [expr -($bc*0.5-$rec)] [expr $hc*0.5-$rec] [expr $bc*0.5-$rec] 
	#Hormigon Cubierta
	#Asuperior
	patch rect $tag_concrete02 4 20 [expr ($hc*0.5-$rec)] [expr -($bc*0.5-$rec)] [expr $hc*0.5] [expr $bc*0.5-$rec] 
	#Ainferior
	patch rect $tag_concrete02 4 20 [expr -($hc*0.5)] [expr -($bc*0.5-$rec)] [expr -($hc*0.5-$rec)] [expr ($bc*0.5-$rec)]
	#Aderecha
	patch rect $tag_concrete02 28 4 [expr -($hc*0.5)] [expr ($bc*0.5-$rec)] [expr ($hc*0.5)] [expr ($bc*0.5)]
	#Aizquierda
	patch rect $tag_concrete02 28 4 [expr -($hc*0.5)] [expr -($bc*0.5)] [expr ($hc*0.5)] [expr $bc*0.5-$rec]
      
    # -------------------------------------------------------------------------------------
    # Refuerzo Distribuido
    # -------------------------------------------------------------------------------------
    
	#layer straight $matTag  $numFibers  $As			$yi	   					$zi						$yj						$zj
	#Nivel6
    layer straight $tag_steel [expr 4] $As18 [expr ($hc*0.5-$rec)] [expr -($bc*0.5-$rec)] [expr ($hc*0.5-$rec)] [expr ($bc*0.5-$rec)]

	layer straight $tag_steel [expr 4] $As18 [expr -($hc*0.5-$rec)] [expr -($bc*0.5-$rec)] [expr -($hc*0.5-$rec)] [expr ($bc*0.5-$rec)]
}
#section Aggregator 3 5 T -section 2003;	# combine section properties





section fiberSec 3001 -GJ [expr $Ja*$Gc1] {

    # -------------------------------------------------------------------------------------
    # Patches Rectangulares
    # -------------------------------------------------------------------------------------
    
    #Hormigon Nucleo 
	#patch rect $matTag		 $SubdivY $SubdivZ		$yi	   				$zi					$yj					$zj
    patch rect $tag_concrete02_conf 20 20 [expr -($ha*0.5-$rec)] [expr -($ba*0.5-$rec)] [expr $ha*0.5-$rec] [expr $ba*0.5-$rec] 
	#Hormigon Cubierta
	#Asuperior
	patch rect $tag_concrete02 4 20 [expr ($ha*0.5-$rec)] [expr -($ba*0.5-$rec)] [expr $ha*0.5] [expr $ba*0.5-$rec] 
	#Ainferior
	patch rect $tag_concrete02 4 20 [expr -($ha*0.5)] [expr -($ba*0.5-$rec)] [expr -($ha*0.5-$rec)] [expr ($ba*0.5-$rec)]
	#Aderecha
	patch rect $tag_concrete02 28 4 [expr -($ha*0.5)] [expr ($ba*0.5-$rec)] [expr ($ha*0.5)] [expr ($ba*0.5)]
	#Aizquierda
	patch rect $tag_concrete02 28 4 [expr -($ha*0.5)] [expr -($ba*0.5)] [expr ($ha*0.5)] [expr $ba*0.5-$rec]
      
    # -------------------------------------------------------------------------------------
    # Refuerzo Distribuido
    # -------------------------------------------------------------------------------------
    
	#layer straight $matTag  $numFibers  $As			$yi	   					$zi						$yj						$zj
	#Nivel6
    layer straight $tag_steel [expr 8] $As28 [expr ($ha*0.5-$rec)] [expr -($ba*0.5-$rec)] [expr ($ha*0.5-$rec)] [expr ($ba*0.5-$rec)]
	
	layer straight $tag_steel [expr 4] $As28 [expr -($ha*0.5-$rec)] [expr -($ba*0.5-$rec)] [expr -($ha*0.5-$rec)] [expr ($ba*0.5-$rec)]
}


#section Aggregator 3 5 T -section 3001;	# combine section properties
section fiberSec 3002 -GJ [expr $Ja*$Gc1] {

    # -------------------------------------------------------------------------------------
    # Patches Rectangulares
    # -------------------------------------------------------------------------------------
    
    #Hormigon Nucleo 
	#patch rect $matTag		 $SubdivY $SubdivZ		$yi	   				$zi					$yj					$zj
    patch rect $tag_concrete02_conf 20 20 [expr -($ha*0.5-$rec)] [expr -($ba*0.5-$rec)] [expr $ha*0.5-$rec] [expr $ba*0.5-$rec] 
	#Hormigon Cubierta
	#Asuperior
	patch rect $tag_concrete02 4 20 [expr ($ha*0.5-$rec)] [expr -($ba*0.5-$rec)] [expr $ha*0.5] [expr $ba*0.5-$rec] 
	#Ainferior
	patch rect $tag_concrete02 4 20 [expr -($ha*0.5)] [expr -($ba*0.5-$rec)] [expr -($ha*0.5-$rec)] [expr ($ba*0.5-$rec)]
	#Aderecha
	patch rect $tag_concrete02 28 4 [expr -($ha*0.5)] [expr ($ba*0.5-$rec)] [expr ($ha*0.5)] [expr ($ba*0.5)]
	#Aizquierda
	patch rect $tag_concrete02 28 4 [expr -($ha*0.5)] [expr -($ba*0.5)] [expr ($ha*0.5)] [expr $ba*0.5-$rec]
      
    # -------------------------------------------------------------------------------------
    # Refuerzo Distribuido
    # -------------------------------------------------------------------------------------
    
	#layer straight $matTag  $numFibers  $As			$yi	   					$zi						$yj						$zj
	#Nivel6
    layer straight $tag_steel [expr 8] $As28 [expr ($ha*0.5-$rec)] [expr -($ba*0.5-$rec)] [expr ($ha*0.5-$rec)] [expr ($ba*0.5-$rec)]
	
	layer straight $tag_steel [expr 4] $As25 [expr -($ha*0.5-$rec)] [expr -($ba*0.5-$rec)] [expr -($ha*0.5-$rec)] [expr ($ba*0.5-$rec)]
}



