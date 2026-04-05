# Example Module 1
# Units: [N,m]
#
# Written: Claudio Sepulveda
# Created: 05/2020
# Revision: A
#
# Purpose: Simple example of the structure of a typical model
# ------------------------------
# Start of model generation
# ------------------------------
wipe; # Limpia la memoria
puts "Limpieza de la memoria hecha.";
defaultUnits -force N -length m -time sec -temp C;	# Unidades default a utilizar
set Name_Folder Results;			# Define nombre de la carpeta en que se guardarán los resultados
file mkdir $Name_Folder; 					# Crea la carpeta
logFile "$Name_Folder/Results.log"; 	# Guarda en un archivo de texto todo lo que aparece en la ventana de OpenSees.exe (útil cuando aparecen errores)
source LibUnits.tcl;						# Define variables de conversión de unidades
set 	g 	9.8;							# Aceleracion de gravedad
set withGravity 1;							# 1: verdadero - 0: falso

set GravityAnalysisDone "no";				# Variable que indica si el caso gravitacional ya está corrido


# Definición del tipo de dimensiones y grados de libertad del modelo
# ndm: dimensiones - Modelo 2D: -ndm 2
# ndf: Grados de libertad por nodo - modelo de elementos viga-columna 2D: -ndf 3
model BasicBuilder -ndm 3 -ndf 6;


puts "Open Nodes"
source Nodes.tcl
puts "Nodes OK"

puts "Open Materials"
source Materials.tcl
puts "Materials OK"


puts "Open Sections"
source Sections.tcl
puts "Sections OK"

puts "Open Elements"
source Elements.tcl
puts "Elements OK"




puts "Open Mass"
source Mass.tcl
puts "Mass OK"

puts "Open Modal"
source Analysis_Modal.tcl
puts "Modal OK"

puts "Model Built"



if {$withGravity} {
	puts "Opening Gravity"
    source Gravity.tcl
	puts "Gravity OK"
}

puts "RegistroGeometria"
source RegistroGeometria.tcl
puts "Registro Ok"
puts "Open Modal"
source Analysis_Modal.tcl
puts "Modal OK"
puts "Opening Analysis"

source Analysis_TH.tcl

puts "Analysis OK"

wipe; # Limpia la memoria
#exit; # Cierra la ventana luego de terminado el analisis
# --------------------------------
# End of analysis
# --------------------------------
