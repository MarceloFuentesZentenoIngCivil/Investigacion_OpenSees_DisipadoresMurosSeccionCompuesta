##########################################################################################################
##--------------------------------- 1.- Directorio de resultados.
##########################################################################################################
set Modoj 12; #Modos a considerar en la respuesta estructural.
set ModalAnalysisDirectory "Modal"

set ModalAnalysisDirectory "Modal"

set PreGravityModalDirectory  "Pre-Gravity"
set PostGravityModalDirectory "Post-Gravity"

file mkdir $Name_Folder/$ModalAnalysisDirectory
file mkdir $Name_Folder/$ModalAnalysisDirectory/$PreGravityModalDirectory
file mkdir $Name_Folder/$ModalAnalysisDirectory/$PostGravityModalDirectory

##########################################################################################################
##--------------------------------- 2.- Obtencion de parametros modales.
##########################################################################################################

set omega {};
set F {};
set T {};
set lambda [eigen $Modoj];
foreach lam $lambda {
         lappend omega [expr sqrt($lam)];
         lappend F [expr sqrt($lam)/(2.*$PI)];
         lappend T [expr (2.0*$PI)/sqrt($lam)];
}

if {$GravityAnalysisDone == "no"} {
    set PeriodFile [open "$Name_Folder/$ModalAnalysisDirectory/$PreGravityModalDirectory/Periods.txt" "w"];
    puts $PeriodFile "$T";
} else {
    set PeriodFile [open "$Name_Folder/$ModalAnalysisDirectory/$PostGravityModalDirectory/Periods.txt" "w"];
    puts $PeriodFile "$T";
}
close $PeriodFile;


##########################################################################################################
##--------------------------------- 40.- Periodos fundamentales obtenidos.
##########################################################################################################

puts "-----------------------------------------------"
puts "Modal Analysis Results: Periodos fundamentales:"
puts "-----------------------------------------------"

puts " "

for {set i 1} {$i <= 6} {incr i 1} {
    puts "T$i = [lindex $T [expr $i-1]]s";
}

puts " "