##########################################################################################################
##--------------------------------- 1.- Amortiguamiento de la estructura.
##########################################################################################################

set Damp  0.025; #Razon de amortiguamiento considerada.

set Mode1 1; #Modo de mayor participacion en X o Y.
set Mode2 4; #Segundo modo de mayor participacion en X o Y.

set w1 [lindex $omega [expr $Mode1-1]];
set w2 [lindex $omega [expr $Mode2-1]];

set alphaM    [expr 2.*$Damp*$w1*$w2/($w1+$w2)];	
set betaKinit [expr 2.*$Damp/($w1+$w2)];         
set betaKcurr 0.0; 			
set betaKcomm 0.0;

rayleigh $alphaM $betaKcurr $betaKinit $betaKcomm

##########################################################################################################
##--------------------------------- 2.- Parametros del analisis Tiempo-Historia.
##########################################################################################################

set gm_Name_L   "20100227_8.8Mw_36.10S_73.08W_30KM_st11_SANTIAGO_PUENTE_ALTO_0p0100_NS_16700.txt"; #Este es el registro que se aplica en la direccion Y. Nombre del archivo con el registro longitudinal (debe contener una unica columna con el valor de aceleracion). L=2 y 2 es equivalente a Y
set gm_Name_T   "20100227_8.8Mw_36.10S_73.08W_30KM_st11_SANTIAGO_PUENTE_ALTO_0p0100_EW_16700.txt"; #Este es el registro que se aplica en la direccion X .Nombre del archivo con el registro transversal (debe contener una unica columna con el valor de aceleracion). T=1 y 1 es equivalente a X

set gm_dirctn_L 2;                 #Direccion en el modelo del sismo longitudinal. Direccion Y o Direccion NS NORTE-SUR
set gm_dirctn_T 1;                 #Direccion en el modelo del sismo transversal. Direccion X o Direccion EW

set scaleFact_L [expr 9.8];     #Factor de escala para el sismo longitudinal.
set scaleFact_T [expr 9.8];     #Factor de escala para el sismo transversal.

set dt_Reg      0.01;             #Time-step del par de registros, en segundos.

set secs        [expr 0.01*16700];             #Segundos de duracion a analizar del registro sismico, desde el segundo 0.

set TimeStep    0.01;             #Paso temporal utilizado para el analisis, en segundos.

##########################################################################################################
##--------------------------------- 3.- Directorio de resultados.
##########################################################################################################

set THAnalysisDirectory "Time-History"

file mkdir $Name_Folder/$THAnalysisDirectory

##########################################################################################################
##--------------------------------- 4.- Aplicacion de los Registros Sismicos.
##########################################################################################################

set tag_RegL 100
set tag_RegT 200

set Registro_L "Path -filePath $gm_Name_L -dt $dt_Reg -factor $scaleFact_L"
set Registro_T "Path -filePath $gm_Name_T -dt $dt_Reg -factor $scaleFact_T"

pattern UniformExcitation  $tag_RegL $gm_dirctn_L -accel $Registro_L
pattern UniformExcitation  $tag_RegT $gm_dirctn_T -accel $Registro_T

puts "Registros sismicos aplicados.\n"

##########################################################################################################
##--------------------------------- 5.- Recorders.
##########################################################################################################

source Recorders.tcl
record

puts "Recorders del Analisis Tiempo-Historia definidos.\n"

##########################################################################################################
##--------------------------------- 6.- Analisis.
##########################################################################################################
set Tole       1.0e-4
set Told       1.0e-4
set Tolf       1.0e0
set maxNumIter 50
set printFlag  0
set TestType   EnergyIncr

test $TestType $Tole $maxNumIter $printFlag

set algorithmType NewtonLineSearch ;# Algoritmo base robusto
algorithm $algorithmType

# Selección de integrador base
integrator Newmark 0.5 0.25
#integrator HHT 0.8 ;# Opcional

analysis Transient ;# Análisis dinámico

puts "------------------------------------------------------"
puts "-------------------- Running... ----------------------"
puts "------------------------------------------------------"

set Steps [expr $secs / $TimeStep]
puts " "

for {set ik 1} {$ik <= $Steps} {incr ik 1} {
    puts "Step $ik/$Steps ([expr $ik * $TimeStep]s / [expr $Steps * $TimeStep]s)"

    set ok [analyze 1 $TimeStep]

    # Estrategias de recuperación de convergencia
	
    if {$ok != 0} {
        puts "Trying KrylovNewton..."
        algorithm KrylovNewton
        test $TestType $Tole $maxNumIter $printFlag
        set ok [analyze 1 $TimeStep]
        algorithm $algorithmType
        test $TestType $Tole $maxNumIter $printFlag
    }

    if {$ok != 0} {
        puts "Trying Newton with initial stiffness..."
        algorithm Newton -initial
        test $TestType $Tole $maxNumIter $printFlag
        set ok [analyze 1 $TimeStep]
        algorithm $algorithmType
        test $TestType $Tole $maxNumIter $printFlag
    }

    if {$ok != 0} {
        puts "Trying Newton..."
        algorithm Newton
        test $TestType $Tole $maxNumIter $printFlag
        set ok [analyze 1 $TimeStep]
        algorithm $algorithmType
        test $TestType $Tole $maxNumIter $printFlag
    }

    if {$ok != 0} {
        puts "Trying Broyden..."
        algorithm Broyden
        test $TestType $Tole $maxNumIter $printFlag
        set ok [analyze 1 $TimeStep]
        algorithm $algorithmType
        test $TestType $Tole $maxNumIter $printFlag
    }

    if {$ok != 0} {
        puts "Trying BFGS..."
        algorithm BFGS
        test $TestType $Tole $maxNumIter $printFlag
        set ok [analyze 1 $TimeStep]
        algorithm $algorithmType
        test $TestType $Tole $maxNumIter $printFlag
    }

    if {$ok != 0} {
        puts "Trying HHT integrator..."
        integrator HHT 0.7
        test $TestType $Tole $maxNumIter $printFlag
        set ok [analyze 1 $TimeStep]
        integrator Newmark 0.5 0.25
        test $TestType $Tole $maxNumIter $printFlag
    }
	
	if {$ok != 0} {
        puts "Trying KrylovNewton..."
        algorithm KrylovNewton
        test NormDispIncr $Told $maxNumIter $printFlag
        set ok [analyze 1 $TimeStep]
        algorithm $algorithmType
        test $TestType $Tole $maxNumIter $printFlag
    }

    if {$ok != 0} {
        puts "Trying Newton with initial stiffness..."
        algorithm Newton -initial
        test NormDispIncr $Told  $maxNumIter $printFlag
        set ok [analyze 1 $TimeStep]
        algorithm $algorithmType
        test $TestType $Tole $maxNumIter $printFlag
    }

    if {$ok != 0} {
        puts "Trying Newton..."
        algorithm Newton
        test NormDispIncr $Told $maxNumIter $printFlag
        set ok [analyze 1 $TimeStep]
        algorithm $algorithmType
        test $TestType $Tole $maxNumIter $printFlag
    }

    if {$ok != 0} {
        puts "Trying Broyden..."
        algorithm Broyden
        test NormDispIncr $Told $maxNumIter $printFlag
        set ok [analyze 1 $TimeStep]
        algorithm $algorithmType
        test $TestType $Tole $maxNumIter $printFlag
    }

    if {$ok != 0} {
        puts "Trying BFGS..."
        algorithm BFGS
        test NormDispIncr $Told $maxNumIter $printFlag
        set ok [analyze 1 $TimeStep]
        algorithm $algorithmType
        test $TestType $Tole $maxNumIter $printFlag
    }

    if {$ok != 0} {
        puts "Trying HHT integrator..."
        integrator HHT 0.7
        test NormDispIncr $Told $maxNumIter $printFlag
        set ok [analyze 1 $TimeStep]
        integrator Newmark 0.5 0.25
        test $TestType $Tole $maxNumIter $printFlag
    }
	
	if {$ok != 0} {
        puts "Trying KrylovNewton..."
        algorithm KrylovNewton
        test NormUnbalance $Tolf $maxNumIter $printFlag
        set ok [analyze 1 $TimeStep]
        algorithm $algorithmType
        test $TestType $Tole $maxNumIter $printFlag
    }

    if {$ok != 0} {
        puts "Trying Newton with initial stiffness..."
        algorithm Newton -initial
        test NormUnbalance $Tolf  $maxNumIter $printFlag
        set ok [analyze 1 $TimeStep]
        algorithm $algorithmType
        test $TestType $Tole $maxNumIter $printFlag
    }

    if {$ok != 0} {
        puts "Trying Newton..."
        algorithm Newton
        test NormUnbalance $Tolf $maxNumIter $printFlag
        set ok [analyze 1 $TimeStep]
        algorithm $algorithmType
        test $TestType $Tole $maxNumIter $printFlag
    }

    if {$ok != 0} {
        puts "Trying Broyden..."
        algorithm Broyden
        test NormUnbalance $Tolf $maxNumIter $printFlag
        set ok [analyze 1 $TimeStep]
        algorithm $algorithmType
        test $TestType $Tole $maxNumIter $printFlag
    }

    if {$ok != 0} {
        puts "Trying BFGS..."
        algorithm BFGS
        test NormUnbalance $Tolf $maxNumIter $printFlag
        set ok [analyze 1 $TimeStep]
        algorithm $algorithmType
        test $TestType $Tole $maxNumIter $printFlag
    }

    if {$ok != 0} {
        puts "Trying HHT integrator..."
        integrator HHT 0.7
        test NormUnbalance $Tolf $maxNumIter $printFlag
        set ok [analyze 1 $TimeStep]
        integrator Newmark 0.5 0.25
        test $TestType $Tole $maxNumIter $printFlag
    }
	
    if {$ok != 0} {
        puts "Trying with more iterations..."
        test $TestType $Tole 1000 $printFlag
        set ok [analyze 1 $TimeStep]
        test $TestType $Tole $maxNumIter $printFlag
    }

    if {$ok != 0} {
        set Stepsmax [expr $ik - 1]
        break
    }
}

if {[expr $ik - 1] == $Steps} {
    set AnalysisA 1
} else {
    set AnalysisA 0
}

puts "Analysis completion = $AnalysisA"
remove recorders

