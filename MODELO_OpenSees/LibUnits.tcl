# --------------------------------------------------------------------------------------------------
# LibUnits.tcl -- define system of units
#

# define UNITS ----------------------------------------------------------------------------
set m 1.; 				# define basic units -- output units
set N 1.; 				# define basic units -- output units
set sec 1.; 			# define basic units -- output units
set LunitTXT "m";			# define basic-unit text for output
set FunitTXT "N";			# define basic-unit text for output
set TunitTXT "sec";			# define basic-unit text for output

set cm [expr $m/100.];			# centimeter, needed for displacement input in MultipleSupport excitation
set mm [expr $m/1000.];			# milimeter
set in [expr 2.54*$cm]
set pi [expr 2*asin(1.0)]; 		# define constants
set g [expr 9.806*$m/pow($sec,2)]; 	# gravitational acceleration
set Ubig 1.e10; 				# a really large number
set Usmall [expr 1./$Ubig]; 		# a really small number
set kN [expr $N*1000.]; 			# define basic units -- output units
set ft [expr 12.*$in]; 	# define engineering units
set kip [expr 4.4482*$kN]
set ksi [expr $kip/pow($in,2)];
set psi [expr $ksi/1000.];
set lbf [expr 4.4482*$N];	# pounds force
set pcf [expr $lbf/pow($ft,3)];	# pounds per cubic foot
set psf [expr $lbf/pow($ft,2)];	# pounds per square foot
set in2 [expr $in*$in]; 		# inch^2
set in4 [expr $in*$in*$in*$in]; # inch^4
set Pa [expr $N/($m*$m)];
set MPa [expr 1000000*$Pa];
set GPa [expr 1000000000*$Pa];
set kgf [expr $g*$N]; 
set tonf [expr $kgf*1000];