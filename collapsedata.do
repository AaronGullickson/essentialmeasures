/************************************
organizedata.do
Aaron Gullickson

This program will take the fulldata.dta produced by organizedata.do and 
will collapse the individual records into the count of individuals 
in the "big race" categories based on ancestry group. This collapsed
data will then be output as CSV files. This output will be used to calculate
the entropy scores for each ancestry group. The program produces weighted
and unweighted versions of these counts. 
*************************************/

use output/fulldata, clear

log using logs/log_collapsedata.txt, text replace

//Drop them if they don't have a valid first ancestry
drop if rancestry1>10

//generate the dummy variables
generate white = raceshort==1
generate black = raceshort==2
generate indig = raceshort==3
generate asian = raceshort==4
generate latino = raceshort==5
generate mixed = raceshort==6
generate other = raceshort==7
generate secondanc = rancestry2!=13
generate multianc = raceanc!=6
keep white black indig asian latino mixed other secondanc multianc year raceshort rancestry1 rancestry2 rancestry1s samwt perwt ancestr1 ancestr1d raceancd yearint
save temp, replace

use temp, clear
drop if year<2000
gen dummy = 1
collapse (sum) dummy [pweight=perwt], by(rancestry1 rancestry2)
outsheet using output/rancestry_crosstab_2000_weighted.csv, comma replace

use temp, clear
drop if secondanc
drop if year<2000
collapse (sum) white black indig asian latino mixed other (count) raceshort (first) rancestry1 rancestry1s [aweight=perwt], by(ancestr1d)
outsheet using output/raceancestryd_single_2000_weighted.csv, comma replace

use temp, clear
drop if secondanc
drop if year<2000
collapse (sum) white black indig asian latino mixed other (count) raceshort (first) rancestry1 rancestry1s, by(ancestr1d)
outsheet using output/raceancestryd_single_2000.csv, comma replace


use temp, clear
collapse (sum) white black indig asian latino mixed other (count) raceshort [aweight=perwt], by(yearint raceancd)
outsheet using output/raceancestryomb_byyear_weighted.csv, comma replace

use temp, clear
collapse (sum) white black indig asian latino mixed other (count) raceshort, by(yearint raceancd)
outsheet using output/raceancestryomb_byyear.csv, comma replace


use temp, clear
drop if year<2000
collapse (sum) white black indig asian latino mixed other (count) raceshort [aweight=samwt], by(raceancd)
outsheet using output/raceancestryomb_2000_weighted.csv, comma replace

use temp, clear
drop if year<2000
collapse (sum) white black indig asian latino mixed other (count) raceshort, by(raceancd)
outsheet using output/raceancestryomb_2000.csv, comma replace

log close
