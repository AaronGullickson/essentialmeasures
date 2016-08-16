/************************************
organizedata.do
Aaron Gullickson
1/26/2015

This program does the initial processing of the 
raw IPUMS data. Most importantly it does all of the coding
of ancestry and race for the analysis that follows.
It produces a variety of datasets that will be processed later.

Here are the important ancestry and race variables that are created:

(1) ancestr1d, ancestr2d - These are the detailed ancestry codes with a
few cases collapsed (see code for details). I also switch the first
and second responses if if the first response is American, Mixed, or
None and the second response is not one of those cases. I also retain
the general ancestry codes (ancestr1, ancestr2) and do the same
switching there.

(2) rancestry1, rancestry2 - These are the meso-racial ancestry
categories coded from the ancestr1d and ancestr2d codes. I keep the
American, Mixed, and None categories here.

(3) rancestry1s, rancestry2s - These are the big-racial ancestry
categories coded from the meso categories (2). American, Mixed, and
None are coded as missing values here.

(4) raceanc - This is a single big-racial ancestry variable that
combines rancestry1s and rancestry2s. Any case where these don't match
is coded as "Multiple." By dropping cases with missing values or
Multiple, the dataset can be limited to individuals who only gave a
single big-racial ancestry even if they provided two specific
ancestries.

(5) raceancd - This is an extension of raceanc that breaks the
multiple category up into all 10 distinct big-racial ancestry
combinations.

(6) raceshort - This is the actual race and Hispanicity questions coded
into the same big race categories as raceanc. Multiple responses are
collapsed into a single multiple category.

(7) raceombd - this is an extension of raceshort that breaks up the
multiple category into all distinct big-racial ancestry combos. Note
that, unlike the ancestry version we can't get latino multiples here.

Here are the important files produced:

(1) fulldata.dta - This is the full data at the individual level,
including people with American, Mixed, and No ancestry.

(2) collapsed.dta - A dataset that shows the weighted frequency across
the detailed big race and ancestry codes by year.

(3) modeldata.dta - A dataset similar to fulldata but with sample
restrictions for the data that will be used in the models. This data
is not ready to run the models yet, because entropy values need to be
merged back in which is done in createdataset.R.

************************************/

set more off

//Read in the raw data
do rawdata_ancestry_ipums.do

log using logs/log_organizedata.txt, text replace

/****
Spit out some tables showing where flags were indicated on race,
hispanicity, and ancestry
*****/
tabulate year qancest1, row
tabulate year qancest2, row
tabulate year qrace, row
tabulate year qhispan, row

/***
Replace any allocations with missing values and drop allocated race
****/
replace race=. if (qrace!=0 & qrace!=.)
replace ancestr1=. if (qancest1!=0 & qancest1!=.)
replace ancestr1d=. if (qancest1!=0 & qancest1!=.)
replace ancestr2=. if  (qancest2!=0 & qancest2!=.)
replace ancestr2d=. if (qancest2!=0 & qancest2!=.)
replace hispand=. if (qhispan!=0 & qhispan!=.)                        

//remove any responses that had race (ancestry will just show up as none)
drop if race==. | hispand==.

/*********************
Before I code the ancestry groups, I want to do a little collapsing of
the detailed ancestries. The general code collapses too many cases
that could mark important distinctions (e.g. German vs. Pennsylvania
German) so I think the goal should be to not aggregate unless
necessary from the detailed codes. (see the testancestry.csv for
details on where collapsing happends between the general and detailed
codes in the data I have here). However, some ancestries are either so
small that they really need to be collapsed if possible (e.g. Occitan
has one person, so should be collapsed to French) or cases that seem
to be alternate ways to say the same thing (e.g. German and Germanic).

Please note that this collapsing is only done for ancestries that I
actually have from 1990-2012, not on the logical set of all possible
cases, so if this analysis is extended to other years, this will need
to be checked again.
*********************/

//Occitan (1 case) becomes French
replace ancestr1d = 261 if ancestr1d==262
replace ancestr2d = 261 if ancestr2d==262

//Germanic becomes German
replace ancestr1d = 321 if ancestr1d==329
replace ancestr2d = 321 if ancestr2d==329

//Rusyn becomes Carpatho Rusyn
replace ancestr1d = 1051 if ancestr1d==1052
replace ancestr2d = 1051 if ancestr2d==1052

//Canal Zone (2 cases) become Panamanian
replace ancestr1d = 2251 if ancestr1d==2252
replace ancestr2d = 2251 if ancestr2d==2252

//Arabic becomes Arab
replace ancestr1d = 4950 if ancestr1d==4951
replace ancestr2d = 4950 if ancestr2d==4951

//East Indian becomes India
replace ancestr1d = 6151 if ancestr1d==6152
replace ancestr2d = 6151 if ancestr2d==6152

/********
Here I will drop any problematic ancestries for whom race is particularly 
ambiguous. This will not include the "American" and "Mixture" groups, but 
small groups of other national origins groups who themselves are diverse.  

Based on an examination of the hispanicity responses, I decided to drop Basque,
Spanish Basque, Spaniard, and Spanish. In each case, the majority did
not write in a consistent hispanic identification and in some cases,
substantial numbers of Mexicans identified as only Spaniard or
Spanish. I think this reflects the uncertainty of the hispanicity
question and we are getting a heterogenous mix here of ancestral
meaning, so I am dropping these cases. For similar reasons, I am
dropping Brazilians. I have them listed as hispanic on big race, but
very few actually report as such and the Census doesn't want them
too. Plus, this country is internally diverse in a way that isn't
written over by latino ancestry as it is for Columbians and Dominicans
for example. Finally, I am also going to drop a few categories that
are actually "not elsewhere classified" responses because these are
heterogenous groupings.

********/
drop if ancestr1d==53 | ancestr1d==54 | (ancestr1d>=2000 & ancestr1d<=2062) | ancestr1d==2910 | ancestr2d==53 | ancestr2d==54 | (ancestr2d>=2000 & ancestr2d<=2062) | ancestr2d==2910 //spanish ancestries (including basque)
drop if (ancestr1>=570 & ancestr1<=572) | (ancestr2>=570 & ancestr2<=572) //South Africans
drop if ancestr1d==3600 | ancestr2d==3600 //Brazilian
drop if (ancestr1d>=1810 & ancestr1d<=1950) | (ancestr2d>=1810 & ancestr2d<=1950) //european NEC
drop if ancestr1d==2960 | ancestr2d==2960 //Other Hispanic
drop if ancestr1d==3370 | ancestr2d==3370 //Other West Indian
drop if ancestr1d==5950 | ancestr2d==5950 //Other SS African
drop if ancestr1d==7960 | ancestr2d==7960 //Other Asian
drop if ancestr1d==8700 | ancestr2d==8700 //Other PI

/**************
MESO-RACIAL ANCESTRY CODES
1 - European including Spanish
2 - African American
3 - American Indian (including South, Central American Indian, Inuit, Eskimo, etc.)
4 - East and Southeast Asian
5 - Pacific Islander (put Australian and New Zealander into European category)
6 - Latin America
7 - non-Latin Caribbean
8 - North African and Middle Eastern
9 - Sub-Saharan African
10- South Asian
11- American or other ambigious (including Canadian)
12- mixture
13 - None
*/

generate rancestry1=13
replace rancestry1=1 if ancestr1d<2100 | ancestr1d==2910 | ancestr1d==8000 | ancestr1d==8030 | (ancestr1d>=9240 & ancestr1d<=9362) //European
replace rancestry1=7 if ancestr1d>=3000 & ancestr1d<4000 //non-Latin Caribbean
replace rancestry1=6 if (ancestr1d>=2100 & ancestr1d<3000 & ancestr1d!=2910) | ancestr1d==3600 //Latin American
replace rancestry1=8 if (ancestr1d>=4000 & ancestr1d<5000) //North Africa/Middle East
replace rancestry1=9 if (ancestr1d>=5000 & ancestr1d<6000) //Sub-Saharan African
replace rancestry1=10 if (ancestr1d>=6000 & ancestr1d<7000) //South Asian
replace rancestry1=4 if (ancestr1d>=7000 & ancestr1d<8000) //East and SE Asian
replace rancestry1=5 if (ancestr1d>8000 & ancestr1d<9000) & ancestr1d!=8030 //Pacific Islander
replace rancestry1=2 if (ancestr1d>=9000 & ancestr1d<=9020) //African American
replace rancestry1=3 if (ancestr1d>=9130 & ancestr1d<=9230) //American Indian
replace rancestry1=11 if (ancestr1d>=9390 & ancestr1d<=9940) | (ancestr1d>=9310 & ancestr1d<9350) //American
replace rancestry1=12 if (ancestr1d==9950) //Mixed

generate rancestry2=13
replace rancestry2=1 if ancestr2d<2100 | ancestr2d==2910 | ancestr2d==8000 | ancestr2d==8030 | (ancestr2d>=9240 & ancestr2d<=9362)
replace rancestry2=7 if ancestr2d>=3000 & ancestr2d<4000
replace rancestry2=6 if (ancestr2d>=2100 & ancestr2d<3000 & ancestr2d!=2910) | ancestr2d==3600
replace rancestry2=8 if (ancestr2d>=4000 & ancestr2d<5000)
replace rancestry2=9 if (ancestr2d>=5000 & ancestr2d<6000)
replace rancestry2=10 if (ancestr2d>=6000 & ancestr2d<7000)
replace rancestry2=4 if (ancestr2d>=7000 & ancestr2d<8000)
replace rancestry2=5 if (ancestr2d>8000 & ancestr2d<9000) & ancestr2d!=8030
replace rancestry2=2 if (ancestr2d>=9000 & ancestr2d<=9020) 
replace rancestry2=3 if (ancestr2d>=9130 & ancestr2d<=9230)
replace rancestry2=11 if (ancestr2d>=9390 & ancestr2d<=9940) | (ancestr2d>=9310 & ancestr2d<9350)
replace rancestry2=12 if (ancestr2d==9950)
label define ancestryshort 1 "W" 6 "H" 7 "C" 8 "ME" 9 "SSA" 10 "SA" 4 "EA" 5 "PI" 2 "B" 3 "AI" 11 "A" 12 "M" 13 "None"
label values rancestry1 ancestryshort
label values rancestry2 ancestryshort

//check to see if we have a 13 for first ancestry and not for second and switch them if so
//We also need to be sure to switch the underlying individual ancestries
gen switchanc = rancestry1==13 & rancestry2!=13
replace rancestry1=rancestry2 if switchanc
replace rancestry2=13 if switchanc
replace ancestr1=ancestr2 if switchanc
replace ancestr2=. if switchanc
replace ancestr1d=ancestr2d if switchanc
replace ancestr2d=. if switchanc
drop switchanc

//I also want to switch it so that any American or Mixed comes after a valid ancestry
gen rancestry1dupe = rancestry1
gen ancestr1dupe = ancestr1
gen ancestr1ddupe = ancestr1d
gen switchanc = (rancestry1==11 | rancestry1==12) & rancestry2<11
replace rancestry1=rancestry2 if switchanc
replace rancestry2=rancestry1dupe if switchanc
replace ancestr1=ancestr2 if switchanc
replace ancestr2=ancestr1dupe if switchanc
replace ancestr1d=ancestr2d if switchanc
replace ancestr2d=ancestr1ddupe if switchanc
drop rancestry1dupe ancestr1dupe ancestr1ddupe switchanc

/*******
BIG RACIAL ANCESTRY CODES
1 - White - European +Middle East/North Africa
2 - Black - African American+African+Afro-Caribbean
3 - Indigenous - AmIndian+PacIslander
4 - Asian - East/Se Asian + South Asian
5 - Latino - Latino
*******/
generate rancestry1s = .
replace rancestry1s = 1 if rancestry1==1 | rancestry1==8 //White from European and Middle East/North African
replace rancestry1s = 2 if rancestry1==2 | rancestry1==9 | rancestry1==7 //Black from African-American, African, and Afro-Caribbean
replace rancestry1s = 3 if rancestry1==3 | rancestry1==5 //Indigenous from American Indian and Pacific Islander
replace rancestry1s = 4 if rancestry1==4 | rancestry1==10 //Asian from East/SE Asian and South Asian
replace rancestry1s = 5 if rancestry1==6 //Latino from Latino

generate rancestry2s = .
replace rancestry2s = 1 if rancestry2==1 | rancestry2==8
replace rancestry2s = 2 if rancestry2==2 | rancestry2==9 | rancestry2==7
replace rancestry2s = 3 if rancestry2==3 | rancestry2==5 
replace rancestry2s = 4 if rancestry2==4 | rancestry2==10
replace rancestry2s = 5 if rancestry2==6

//now do a combined racial ancestry where the person is listed as Multiple if the
//second big race ancestry is not missing and isn't the same as the first.
generate raceanc = rancestry1s
replace raceanc=6 if rancestry1s!=. & rancestry2s!=. & rancestry1s!=rancestry2s
label define sracelbl 1 "White" 2 "Black" 3 "Indigenous" 4 "Asian" 5 "Latino" 6 "Multiple"
label values rancestry1s sracelbl
label values rancestry2s sracelbl
label values raceanc sracelbl

//lets to another big racial ancestry varaible that breaks out
//the multiple category into each specific combo
generate raceancd = raceanc
replace raceancd = 16 if raceancd==6 //initially put all multiples here
replace raceancd = 6 if (rancestry1s==1 & rancestry2s==2) | (rancestry1s==2 & rancestry2s==1) //White/Black
replace raceancd = 7 if (rancestry1s==1 & rancestry2s==3) | (rancestry1s==3 & rancestry2s==1) //White/Indig
replace raceancd = 8 if (rancestry1s==1 & rancestry2s==4) | (rancestry1s==4 & rancestry2s==1) //White/Asian
replace raceancd = 9 if (rancestry1s==1 & rancestry2s==5) | (rancestry1s==5 & rancestry2s==1) //White/Latino
replace raceancd = 10 if (rancestry1s==2 & rancestry2s==3) | (rancestry1s==3 & rancestry2s==2) //Black/Indig
replace raceancd = 11 if (rancestry1s==2 & rancestry2s==4) | (rancestry1s==4 & rancestry2s==2) //Black/Asian
replace raceancd = 12 if (rancestry1s==2 & rancestry2s==5) | (rancestry1s==5 & rancestry2s==2) //Black/Latino
replace raceancd = 13 if (rancestry1s==3 & rancestry2s==4) | (rancestry1s==4 & rancestry2s==3) //Indig/Asian
replace raceancd = 14 if (rancestry1s==3 & rancestry2s==5) | (rancestry1s==5 & rancestry2s==3) //Indig/Latino
replace raceancd = 15 if (rancestry1s==4 & rancestry2s==5) | (rancest ry1s==5 & rancestry2s==4) //Asian/Latino
replace raceancd = . if rancestry1s==. & rancestry2s==.
label define raceancdlbl 1 "White" 2 "Black" 3 "Indig" 4 "Asian" 5 "Latino" 6 "White/Black" 7 "White/Indig" 8 "White/Asian" 9 "White/Latino" 10 "Black/Indig" 11 "Black/Asian" 12 "Black/Latino" 13 "Indig/Asian" 14 "Indig/Latino" 15 "Asian/Latino" 16 "Other"
label values raceancd raceancdlbl

/******
Now code in the detailed race codes that correspond to the same big
race groups. Just like for ancestry, I will code one that just
collapses multiple races and one that breaks them out into combos
*******/

//First code a simple latino dummy
//Note, I take out the Spaniard categories from this variable
generate latino = hispand!=0 & (hispand<450 | hispand>459)

//first code the detailed one and then use that to code back the short one
//including cases of Big race/other, and whether that constitutes a multiracial response
//also make sure I pick up all asian and PI responses that are same big race
generate raceombd = .
replace raceombd = 1 if raced<200 //White
replace raceombd = 2 if raced>=200 & raced<300 //Black
replace raceombd = 4 if (raced>=400 & race<700) | raced==869 | raced==887 //Asian (take out PIs later)
replace raceombd = 3 if (raced>=300 & raced<400) | raced==630 | raced==634 | raced==652 | (raced>=680 & raced<=699) | raced==855 //Indig
replace raceombd = 16 if raced>=700 //others and other multiples
//Now break out the multiples
replace raceombd = 6 if raced==801 //White/black
replace raceombd = 7 if raced==802 | (raced>=820 & raced<=825) //White/Indig
replace raceombd = 8 if raced>=810 & raced<=819 //White/Asian
replace raceombd = 10 if raced==830 | (raced>=840 & raced<=842) //Black/Indig
replace raceombd = 11 if raced>=831 & raced<=838 //Black/Asian
replace raceombd = 13 if (raced>=850 & raced<=854) | (raced>=861 & raced<=868) //Indig/Asian
//one drop latinos
replace raceombd = 5 if latino

/**
Now I am going to do something a bit hacky. Multiracial ancestry
latinos who check a race box (or more than one) and hispanic may be
trying to indicate a multiracial ancestry, but we can't tell given the
way the question is worded. I am going to check the actual race
response for these individuals and if they indicated a race that was
consistent with their multiracial ancestry then assign them taht
multiracial category. This is not perfect, but I think will allow a
closer comparison between multiple latino ancestry responses and other
multiple ancestry respones. An alternative would be to code each of
the six responses into latino and non-latino versions, but I feel that
will artificially inflate entropy for latino groups, relative to what
I am trying to get at. 
**/

//White/Latino
replace raceombd=9 if raceancd==9 & latino & (raced==100 | (raced>=801 & raced<=827) | (raced>=901 & raced<=926) | (raced>=950 & raced<=964) | (raced>=980 & raced<=981) | (raced>=990 & raced<=991))
//Black/Latino
replace raceombd=12 if raceancd==12 & latino & (raced==200 | raced==801 | (raced>=830 & raced<=845) | (raced>=901 & raced<=903) | (raced>=930 & raced<=935) | (raced>=950 & raced<=955) | (raced>=970 & raced<=973) | (raced>=980 & raced<=983) | raced==986 | raced==990 | raced==991)
//Indig/Latino
replace raceombd=14 if raceancd==14 & latino & ((raced>=300 & raced<=399) | (raced>=680 & raced<=699) | raced==802 | (raced>=820 & raced<=825) | raced==830 | (raced>=840 & raced<=842) | raced==855 | (raced>=860 & raced<=868) | (raced>=890 & raced<=899) | raced==901 | raced==903 | (raced>=906 & raced<=907) | (raced>=910 & raced<=915) | raced==925 | (raced>=930 & raced<=933) | (raced>=940 & raced<=944) | (raced>=950 & raced<=953) | (raced>=955 & raced<=976) | (raced>=980 & raced<=986) | raced==990 | raced==991)
//Asian/Latino
replace raceombd=15 if raceancd==15 & latino & ((raced>=400 & raced<=679) | (raced>=810 & raced<=819) | (raced>=831 & raced<=838) | (raced>=850 & raced<=854) | (raced>=860 & raced<=887) | raced==902 | raced==905 | (raced>=910 & raced<=930) | (raced>=933 & raced<=934) | (raced>=940 & raced<=941) | (raced>=943 & raced<=944) | raced==950 | (raced>=953 & raced<=954) | (raced>=960 & raced<=961) | (raced>=963 & raced<=971) | (raced>=973 & raced<=981) | (raced>=983 & raced<=985) | raced==990 | raced==991)

label values raceombd raceancdlbl

generate raceshort = raceombd
//collapse multiples
replace raceshort = 6 if raceshort>=6
//take back out the non-latino others
replace raceshort = 7 if raced==700 & !latino
label define srace2lbl 1 "White" 2 "Black" 3 "Indigenous" 4 "Asian" 5 "Latino" 6 "Multiple" 7 "Other"
label values raceshort srace2lbl

/*********
Now code some other variables
and save the full data
*********/
generate yearint = year
replace yearint=2002 if year==2001 | year==2002 | year==2003
replace yearint=2005 if year==2004 | year==2005 | year==2006
replace yearint=2008 if year==2007 | year==2008 | year==2009
replace yearint=2011 if year>2009
generate college = educd>=101
replace college = . if educd<2
generate female = sex==2
generate noancestry = rancestry1==13
generate agectr = age-25
generate agectrsq = agectr^2
generate foreign = bpl>120
replace bpl=0 if bpl<120


//Create a weight variable that divides by the mean of perwt in each year
//this is useful for some aggregations to give aggregated counts that add up
//to the actual sample total
gen samwt=.
replace samwt = perwt/20 if year==1980
replace samwt = perwt/19.84695 if year==1990
replace samwt = perwt/19.98527 if year==2000
replace samwt = perwt/232.406 if year==2001
replace samwt = perwt/261.2228 if year==2002
replace samwt = perwt/236.8774 if year==2003
replace samwt = perwt/239.1879 if year==2004
replace samwt = perwt/100.1948 if year==2005
replace samwt = perwt/100.8164 if year==2006
replace samwt = perwt/100.7196 if year==2007
replace samwt = perwt/100.3311 if year==2008
replace samwt = perwt/101.298 if year==2009
replace samwt = perwt/101.0388 if year==2010
replace samwt = perwt/100.1254 if year==2011
replace samwt = perwt/100.8387 if year==2012

//an adjusted weight for the collapsed years
generate perwtint = perwt
replace perwtint = perwt/3 if year>2000


/**********
Output some tables for checking
*********/
    
//get frequency of number of ancestries for figure
gen nanc = 0
replace nanc = 1 if rancestry1!=13 & rancestry2==13
replace nanc = 2 if rancestry1!=13 & rancestry2!=13
tabulate yearint nanc, row

//now put together some tables that check and make sure everything is coming out as expected
table raced raceshort, missing
table raced raceombd, missing
table raceshort latino, missing
table race raceshort, missing
table raceombd raceshort, missing
table raceancd raceanc, missing
table raceancd raceombd, missing
table rancestry1 rancestry1s, missing
table rancestry2 rancestry2s, missing
table rancestry1s rancestry2s, missing
table raceanc rancestry1s rancestry2s, missing
table rancestry1, missing
table rancestry2, missing

//keep the variables I might need and save the full data at this point
keep year yearint perwt samwt raceshort raceombd raceancd raceanc ancestr1 ancestr2 ancestr1d ancestr2d rancestry1 rancestry2 rancestry1s rancestry2s foreign college female noancestry agectr agectrsq region
save output/fulldata, replace

//Collapse to see the weighted counts for each category by period
collapse (sum) samwt , by(raceombd raceancd yearint)
save output/collapsed, replace

/********
I also want to save the preliminary individual level data for the
models. This data will need to be merged back with the aggregate data
later to add in entropy scores before running models. But here, I can
make all the necessary restrictions to make the data more manageable.
********/
use output/fulldata, clear

//25+ age for 2000 and later
drop if yearint<2000 | agectr<0
//drop is missing dependent variable
drop if college==.
//Drop american, mixed, no ancestry and those with mixed big racial ancestries
drop if raceanc==. | raceanc==6

keep yearint perwt agectr agectrsq foreign female region raceshort ancestr* rancestry* college

//use saveold command so that R can read this data in
saveold output/modeldata, replace v(12)

log close
