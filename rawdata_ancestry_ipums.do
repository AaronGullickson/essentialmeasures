* NOTE: You need to set the Stata working directory to the path
* where the data file is located.

set more off

clear
quietly infix               ///
  int     year       1-4    ///
  byte    datanum    5-6    ///
  double  serial     7-14   ///
  float   hhwt       15-24  ///
  byte    region     25-26  ///
  byte    gq         27-27  ///
  int     pernum     28-31  ///
  float   perwt      32-41  ///
  byte    sex        42-42  ///
  int     age        43-45  ///
  byte    race       46-46  ///
  int     raced      47-49  ///
  byte    hispan     50-50  ///
  int     hispand    51-53  ///
  int     bpl        54-56  ///
  long    bpld       57-61  ///
  int     ancestr1   62-64  ///
  int     ancestr1d  65-68  ///
  int     ancestr2   69-71  ///
  int     ancestr2d  72-75  ///
  byte    educ       76-77  ///
  int     educd      78-80  ///
  byte    qancest1   81-81  ///
  byte    qancest2   82-82  ///
  byte    qhispan    83-83  ///
  byte    qrace      84-84  ///
  using `"rawdata_ancestry_ipums.dat"'

replace hhwt      = hhwt      / 100
replace perwt     = perwt     / 100

format serial    %8.0f
format hhwt      %10.2f
format perwt     %10.2f

label var year      `"Census year"'
label var datanum   `"Data set number"'
label var serial    `"Household serial number"'
label var hhwt      `"Household weight"'
label var region    `"Census region and division"'
label var gq        `"Group quarters status"'
label var pernum    `"Person number in sample unit"'
label var perwt     `"Person weight"'
label var sex       `"Sex"'
label var age       `"Age"'
label var race      `"Race [general version]"'
label var raced     `"Race [detailed version]"'
label var hispan    `"Hispanic origin [general version]"'
label var hispand   `"Hispanic origin [detailed version]"'
label var bpl       `"Birthplace [general version]"'
label var bpld      `"Birthplace [detailed version]"'
label var ancestr1  `"Ancestry, first response [general version]"'
label var ancestr1d `"Ancestry, first response [detailed version]"'
label var ancestr2  `"Ancestry, second response [general version]"'
label var ancestr2d `"Ancestry, second response [detailed version]"'
label var educ      `"Educational attainment [general version]"'
label var educd     `"Educational attainment [detailed version]"'
label var qancest1  `"Flag for Ancestr1"'
label var qancest2  `"Flag for Ancestr2"'
label var qhispan   `"Flag for Hispan"'
label var qrace     `"Flag for Race, Racamind, Racasian, Racblk, Racpais, Racwht, Racoth, Racnum, Race"'

label define region_lbl 11 `"New England Division"'
label define region_lbl 12 `"Middle Atlantic Division"', add
label define region_lbl 13 `"Mixed Northeast Divisions (1970 Metro)"', add
label define region_lbl 21 `"East North Central Div."', add
label define region_lbl 22 `"West North Central Div."', add
label define region_lbl 23 `"Mixed Midwest Divisions (1970 Metro)"', add
label define region_lbl 31 `"South Atlantic Division"', add
label define region_lbl 32 `"East South Central Div."', add
label define region_lbl 33 `"West South Central Div."', add
label define region_lbl 34 `"Mixed Southern Divisions (1970 Metro)"', add
label define region_lbl 41 `"Mountain Division"', add
label define region_lbl 42 `"Pacific Division"', add
label define region_lbl 43 `"Mixed Western Divisions (1970 Metro)"', add
label define region_lbl 91 `"Military/Military reservations"', add
label define region_lbl 92 `"PUMA boundaries cross state lines-1% sample"', add
label define region_lbl 97 `"State not identified"', add
label define region_lbl 99 `"Not identified"', add
label values region region_lbl

label define gq_lbl 0 `"Vacant unit"'
label define gq_lbl 1 `"Households under 1970 definition"', add
label define gq_lbl 2 `"Additional households under 1990 definition"', add
label define gq_lbl 3 `"Group quarters--Institutions"', add
label define gq_lbl 4 `"Other group quarters"', add
label define gq_lbl 5 `"Additional households under 2000 definition"', add
label define gq_lbl 6 `"Fragment"', add
label values gq gq_lbl

label define sex_lbl 1 `"Male"'
label define sex_lbl 2 `"Female"', add
label values sex sex_lbl

label define race_lbl 1 `"White"'
label define race_lbl 2 `"Black/Negro"', add
label define race_lbl 3 `"American Indian or Alaska Native"', add
label define race_lbl 4 `"Chinese"', add
label define race_lbl 5 `"Japanese"', add
label define race_lbl 6 `"Other Asian or Pacific Islander"', add
label define race_lbl 7 `"Other race, nec"', add
label define race_lbl 8 `"Two major races"', add
label define race_lbl 9 `"Three or more major races"', add
label values race race_lbl

label define raced_lbl 100 `"White"'
label define raced_lbl 110 `"Spanish write_in"', add
label define raced_lbl 120 `"Blank (white) (1850)"', add
label define raced_lbl 130 `"Portuguese"', add
label define raced_lbl 140 `"Mexican (1930)"', add
label define raced_lbl 150 `"Puerto Rican (1910 Hawaii)"', add
label define raced_lbl 200 `"Black/Negro"', add
label define raced_lbl 210 `"Mulatto"', add
label define raced_lbl 300 `"American Indian/Alaska Native"', add
label define raced_lbl 302 `"Apache"', add
label define raced_lbl 303 `"Blackfoot"', add
label define raced_lbl 304 `"Cherokee"', add
label define raced_lbl 305 `"Cheyenne"', add
label define raced_lbl 306 `"Chickasaw"', add
label define raced_lbl 307 `"Chippewa"', add
label define raced_lbl 308 `"Choctaw"', add
label define raced_lbl 309 `"Comanche"', add
label define raced_lbl 310 `"Creek"', add
label define raced_lbl 311 `"Crow"', add
label define raced_lbl 312 `"Iroquois"', add
label define raced_lbl 313 `"Kiowa"', add
label define raced_lbl 314 `"Lumbee"', add
label define raced_lbl 315 `"Navajo"', add
label define raced_lbl 316 `"Osage"', add
label define raced_lbl 317 `"Paiute"', add
label define raced_lbl 318 `"Pima"', add
label define raced_lbl 319 `"Potawatomi"', add
label define raced_lbl 320 `"Pueblo"', add
label define raced_lbl 321 `"Seminole"', add
label define raced_lbl 322 `"Shoshone"', add
label define raced_lbl 323 `"Sioux"', add
label define raced_lbl 324 `"Tlingit (Tlingit_Haida, 2000/ACS)"', add
label define raced_lbl 325 `"Tohono O Odham"', add
label define raced_lbl 326 `"All other tribes (1990)"', add
label define raced_lbl 328 `"Hopi"', add
label define raced_lbl 329 `"Central American Indian"', add
label define raced_lbl 330 `"Spanish American Indian"', add
label define raced_lbl 350 `"Delaware"', add
label define raced_lbl 351 `"Latin American Indian"', add
label define raced_lbl 352 `"Puget Sound Salish"', add
label define raced_lbl 353 `"Yakama"', add
label define raced_lbl 354 `"Yaqui"', add
label define raced_lbl 355 `"Colville"', add
label define raced_lbl 356 `"Houma"', add
label define raced_lbl 357 `"Menominee"', add
label define raced_lbl 358 `"Yuman"', add
label define raced_lbl 359 `"South American Indian"', add
label define raced_lbl 360 `"Mexican American Indian"', add
label define raced_lbl 361 `"Other Amer. Indian tribe (2000,ACS)"', add
label define raced_lbl 362 `"2+ Amer. Indian tribes (2000,ACS)"', add
label define raced_lbl 370 `"Alaskan Athabaskan"', add
label define raced_lbl 371 `"Aleut"', add
label define raced_lbl 372 `"Eskimo"', add
label define raced_lbl 373 `"Alaskan mixed"', add
label define raced_lbl 374 `"Inupiat"', add
label define raced_lbl 375 `"Yup'ik"', add
label define raced_lbl 379 `"Other Alaska Native tribe(s) (2000,ACS)"', add
label define raced_lbl 398 `"Both Am. Ind. and Alaska Native (2000,ACS)"', add
label define raced_lbl 399 `"Tribe not specified"', add
label define raced_lbl 400 `"Chinese"', add
label define raced_lbl 410 `"Taiwanese"', add
label define raced_lbl 420 `"Chinese and Taiwanese"', add
label define raced_lbl 500 `"Japanese"', add
label define raced_lbl 600 `"Filipino"', add
label define raced_lbl 610 `"Asian Indian (Hindu 1920_1940)"', add
label define raced_lbl 620 `"Korean"', add
label define raced_lbl 630 `"Hawaiian"', add
label define raced_lbl 631 `"Hawaiian and Asian (1900,1920)"', add
label define raced_lbl 632 `"Hawaiian and European (1900,1920)"', add
label define raced_lbl 634 `"Hawaiian mixed"', add
label define raced_lbl 640 `"Vietnamese"', add
label define raced_lbl 641 `"   Bhutanese"', add
label define raced_lbl 642 `"   Mongolian "', add
label define raced_lbl 643 `"   Nepalese"', add
label define raced_lbl 650 `"Other Asian or Pacific Islander (1920,1980)"', add
label define raced_lbl 651 `"Asian only (CPS)"', add
label define raced_lbl 652 `"Pacific Islander only (CPS)"', add
label define raced_lbl 653 `"Asian or Pacific Islander, n.s. (1990 Internal Census files)"', add
label define raced_lbl 660 `"Cambodian"', add
label define raced_lbl 661 `"Hmong"', add
label define raced_lbl 662 `"Laotian"', add
label define raced_lbl 663 `"Thai"', add
label define raced_lbl 664 `"Bangladeshi"', add
label define raced_lbl 665 `"Burmese"', add
label define raced_lbl 666 `"Indonesian"', add
label define raced_lbl 667 `"Malaysian"', add
label define raced_lbl 668 `"Okinawan"', add
label define raced_lbl 669 `"Pakistani"', add
label define raced_lbl 670 `"Sri Lankan"', add
label define raced_lbl 671 `"Other Asian, n.e.c."', add
label define raced_lbl 672 `"Asian, not specified"', add
label define raced_lbl 673 `"Chinese and Japanese"', add
label define raced_lbl 674 `"Chinese and Filipino"', add
label define raced_lbl 675 `"Chinese and Vietnamese"', add
label define raced_lbl 676 `"Chinese and Asian write_in"', add
label define raced_lbl 677 `"Japanese and Filipino"', add
label define raced_lbl 678 `"Asian Indian and Asian write_in"', add
label define raced_lbl 679 `"Other Asian race combinations"', add
label define raced_lbl 680 `"Samoan"', add
label define raced_lbl 681 `"Tahitian"', add
label define raced_lbl 682 `"Tongan"', add
label define raced_lbl 683 `"Other Polynesian (1990)"', add
label define raced_lbl 684 `"1+ other Polynesian races (2000,ACS)"', add
label define raced_lbl 685 `"Guamanian/Chamorro"', add
label define raced_lbl 686 `"Northern Mariana Islander"', add
label define raced_lbl 687 `"Palauan"', add
label define raced_lbl 688 `"Other Micronesian (1990)"', add
label define raced_lbl 689 `"1+ other Micronesian races (2000,ACS)"', add
label define raced_lbl 690 `"Fijian"', add
label define raced_lbl 691 `"Other Melanesian (1990)"', add
label define raced_lbl 692 `"1+ other Melanesian races (2000,ACS)"', add
label define raced_lbl 698 `"2+ PI races from 2+ PI regions"', add
label define raced_lbl 699 `"Pacific Islander, n.s."', add
label define raced_lbl 700 `"Other race, n.e.c."', add
label define raced_lbl 801 `"White and Black"', add
label define raced_lbl 802 `"White and AIAN"', add
label define raced_lbl 810 `"White and Asian"', add
label define raced_lbl 811 `"White and Chinese"', add
label define raced_lbl 812 `"White and Japanese"', add
label define raced_lbl 813 `"White and Filipino"', add
label define raced_lbl 814 `"White and Asian Indian"', add
label define raced_lbl 815 `"White and Korean"', add
label define raced_lbl 816 `"White and Vietnamese"', add
label define raced_lbl 817 `"White and Asian write_in"', add
label define raced_lbl 818 `"White and other Asian race(s)"', add
label define raced_lbl 819 `"White and two or more Asian groups"', add
label define raced_lbl 820 `"White and PI  "', add
label define raced_lbl 821 `"White and Native Hawaiian"', add
label define raced_lbl 822 `"White and Samoan"', add
label define raced_lbl 823 `"White and Guamanian"', add
label define raced_lbl 824 `"White and PI write_in"', add
label define raced_lbl 825 `"White and other PI race(s)"', add
label define raced_lbl 826 `"White and other race write_in"', add
label define raced_lbl 827 `"White and other race, n.e.c."', add
label define raced_lbl 830 `"Black and AIAN"', add
label define raced_lbl 831 `"Black and Asian"', add
label define raced_lbl 832 `"Black and Chinese"', add
label define raced_lbl 833 `"Black and Japanese"', add
label define raced_lbl 834 `"Black and Filipino"', add
label define raced_lbl 835 `"Black and Asian Indian"', add
label define raced_lbl 836 `"Black and Korean"', add
label define raced_lbl 837 `"Black and Asian write_in"', add
label define raced_lbl 838 `"Black and other Asian race(s)"', add
label define raced_lbl 840 `"Black and PI"', add
label define raced_lbl 841 `"Black and PI write_in"', add
label define raced_lbl 842 `"Black and other PI race(s)"', add
label define raced_lbl 845 `"Black and other race write_in"', add
label define raced_lbl 850 `"AIAN and Asian"', add
label define raced_lbl 851 `"AIAN and Filipino (2000 1%)"', add
label define raced_lbl 852 `"AIAN and Asian Indian"', add
label define raced_lbl 853 `"AIAN and Asian write_in (2000 1%)"', add
label define raced_lbl 854 `"AIAN and other Asian race(s)"', add
label define raced_lbl 855 `"AIAN and PI"', add
label define raced_lbl 856 `"AIAN and other race write_in"', add
label define raced_lbl 860 `"Asian and PI"', add
label define raced_lbl 861 `"Chinese and Hawaiian"', add
label define raced_lbl 862 `"Chinese, Filipino, Hawaiian (2000 1%)"', add
label define raced_lbl 863 `"Japanese and Hawaiian (2000 1%)"', add
label define raced_lbl 864 `"Filipino and Hawaiian"', add
label define raced_lbl 865 `"Filipino and PI write_in"', add
label define raced_lbl 866 `"Asian Indian and PI write_in (2000 1%)"', add
label define raced_lbl 867 `"Asian write_in and PI write_in"', add
label define raced_lbl 868 `"Other Asian race(s) and PI race(s)"', add
label define raced_lbl 869 `"Japanese and Korean (ACS)"', add
label define raced_lbl 880 `"Asian and other race write_in"', add
label define raced_lbl 881 `"Chinese and other race write_in"', add
label define raced_lbl 882 `"Japanese and other race write_in"', add
label define raced_lbl 883 `"Filipino and other race write_in"', add
label define raced_lbl 884 `"Asian Indian and other race write_in"', add
label define raced_lbl 885 `"Asian write_in and other race write_in"', add
label define raced_lbl 886 `"Other Asian race(s) and other race write_in"', add
label define raced_lbl 887 `"      Chinese and Korean"', add
label define raced_lbl 890 `"PI and other race write_in: "', add
label define raced_lbl 891 `"PI write_in and other race write_in"', add
label define raced_lbl 892 `"Other PI race(s) and other race write_in"', add
label define raced_lbl 893 `"         Native Hawaiian or PI other race(s)"', add
label define raced_lbl 899 `"API and other race write_in"', add
label define raced_lbl 901 `"White, Black, AIAN"', add
label define raced_lbl 902 `"White, Black, Asian"', add
label define raced_lbl 903 `"White, Black, PI"', add
label define raced_lbl 904 `"White, Black, other race write_in"', add
label define raced_lbl 905 `"White, AIAN, Asian"', add
label define raced_lbl 906 `"White, AIAN, PI"', add
label define raced_lbl 907 `"White, AIAN, other race write_in"', add
label define raced_lbl 910 `"White, Asian, PI "', add
label define raced_lbl 911 `"White, Chinese, Hawaiian"', add
label define raced_lbl 912 `"White, Chinese, Filipino, Hawaiian (2000 1%)"', add
label define raced_lbl 913 `"White, Japanese, Hawaiian (2000 1%)"', add
label define raced_lbl 914 `"White, Filipino, Hawaiian"', add
label define raced_lbl 915 `"Other White, Asian race(s), PI race(s)"', add
label define raced_lbl 916 `"      White, AIAN and Filipino"', add
label define raced_lbl 917 `"      White, Black, and Filipino"', add
label define raced_lbl 920 `"White, Asian, other race write_in"', add
label define raced_lbl 921 `"White, Filipino, other race write_in (2000 1%)"', add
label define raced_lbl 922 `"White, Asian write_in, other race write_in (2000 1%)"', add
label define raced_lbl 923 `"Other White, Asian race(s), other race write_in (2000 1%)"', add
label define raced_lbl 925 `"White, PI, other race write_in"', add
label define raced_lbl 930 `"Black, AIAN, Asian"', add
label define raced_lbl 931 `"Black, AIAN, PI"', add
label define raced_lbl 932 `"Black, AIAN, other race write_in"', add
label define raced_lbl 933 `"Black, Asian, PI"', add
label define raced_lbl 934 `"Black, Asian, other race write_in"', add
label define raced_lbl 935 `"Black, PI, other race write_in"', add
label define raced_lbl 940 `"AIAN, Asian, PI"', add
label define raced_lbl 941 `"AIAN, Asian, other race write_in"', add
label define raced_lbl 942 `"AIAN, PI, other race write_in"', add
label define raced_lbl 943 `"Asian, PI, other race write_in"', add
label define raced_lbl 944 `"Asian (Chinese, Japanese, Korean, Vietnamese); and Native Hawaiian or PI; and Other"', add
label define raced_lbl 949 `"2 or 3 races (CPS)"', add
label define raced_lbl 950 `"White, Black, AIAN, Asian"', add
label define raced_lbl 951 `"White, Black, AIAN, PI"', add
label define raced_lbl 952 `"White, Black, AIAN, other race write_in"', add
label define raced_lbl 953 `"White, Black, Asian, PI"', add
label define raced_lbl 954 `"White, Black, Asian, other race write_in"', add
label define raced_lbl 955 `"White, Black, PI, other race write_in"', add
label define raced_lbl 960 `"White, AIAN, Asian, PI"', add
label define raced_lbl 961 `"White, AIAN, Asian, other race write_in"', add
label define raced_lbl 962 `"White, AIAN, PI, other race write_in"', add
label define raced_lbl 963 `"White, Asian, PI, other race write_in"', add
label define raced_lbl 964 `"White, Chinese, Japanese, Native Hawaiian"', add
label define raced_lbl 970 `"Black, AIAN, Asian, PI"', add
label define raced_lbl 971 `"Black, AIAN, Asian, other race write_in"', add
label define raced_lbl 972 `"Black, AIAN, PI, other race write_in"', add
label define raced_lbl 973 `"Black, Asian, PI, other race write_in"', add
label define raced_lbl 974 `"AIAN, Asian, PI, other race write_in"', add
label define raced_lbl 975 `"AIAN, Asian, PI, Hawaiian other race write_in"', add
label define raced_lbl 976 `"Two specified Asian  (Chinese and other Asian, Chinese and Japanese, Japanese and other Asian, Korean and other Asian); Native Hawaiian/PI; and Other Race"', add
label define raced_lbl 980 `"White, Black, AIAN, Asian, PI"', add
label define raced_lbl 981 `"White, Black, AIAN, Asian, other race write_in"', add
label define raced_lbl 982 `"White, Black, AIAN, PI, other race write_in"', add
label define raced_lbl 983 `"White, Black, Asian, PI, other race write_in"', add
label define raced_lbl 984 `"White, AIAN, Asian, PI, other race write_in"', add
label define raced_lbl 985 `"Black, AIAN, Asian, PI, other race write_in"', add
label define raced_lbl 986 `"Black, AIAN, Asian, PI, Hawaiian, other race write_in"', add
label define raced_lbl 989 `"4 or 5 races (CPS)"', add
label define raced_lbl 990 `"White, Black, AIAN, Asian, PI, other race write_in"', add
label define raced_lbl 991 `"White race; Some other race; Black or African American race and/or American Indian and Alaska Native race and/or Asian groups and/or Native Hawaiian and Other Pacific Islander groups"', add
label define raced_lbl 996 `"2+ races, n.e.c. (CPS)"', add
label values raced raced_lbl

label define hispan_lbl 0 `"Not Hispanic"'
label define hispan_lbl 1 `"Mexican"', add
label define hispan_lbl 2 `"Puerto Rican"', add
label define hispan_lbl 3 `"Cuban"', add
label define hispan_lbl 4 `"Other"', add
label define hispan_lbl 9 `"Not Reported"', add
label values hispan hispan_lbl

label define hispand_lbl 000 `"Not Hispanic"'
label define hispand_lbl 100 `"Mexican"', add
label define hispand_lbl 102 `"Mexican American"', add
label define hispand_lbl 103 `"Mexicano/Mexicana"', add
label define hispand_lbl 104 `"Chicano/Chicana"', add
label define hispand_lbl 105 `"La Raza"', add
label define hispand_lbl 106 `"Mexican American Indian"', add
label define hispand_lbl 107 `"Mexico"', add
label define hispand_lbl 200 `"Puerto Rican"', add
label define hispand_lbl 300 `"Cuban"', add
label define hispand_lbl 401 `"Central American Indian"', add
label define hispand_lbl 402 `"Canal Zone"', add
label define hispand_lbl 411 `"Costa Rican"', add
label define hispand_lbl 412 `"Guatemalan"', add
label define hispand_lbl 413 `"Honduran"', add
label define hispand_lbl 414 `"Nicaraguan"', add
label define hispand_lbl 415 `"Panamanian"', add
label define hispand_lbl 416 `"Salvadoran"', add
label define hispand_lbl 417 `"Central American, n.e.c."', add
label define hispand_lbl 420 `"Argentinean"', add
label define hispand_lbl 421 `"Bolivian"', add
label define hispand_lbl 422 `"Chilean"', add
label define hispand_lbl 423 `"Colombian"', add
label define hispand_lbl 424 `"Ecuadorian"', add
label define hispand_lbl 425 `"Paraguayan"', add
label define hispand_lbl 426 `"Peruvian"', add
label define hispand_lbl 427 `"Uruguayan"', add
label define hispand_lbl 428 `"Venezuelan"', add
label define hispand_lbl 429 `"South American Indian"', add
label define hispand_lbl 430 `"Criollo"', add
label define hispand_lbl 431 `"South American, n.e.c."', add
label define hispand_lbl 450 `"Spaniard"', add
label define hispand_lbl 451 `"Andalusian"', add
label define hispand_lbl 452 `"Asturian"', add
label define hispand_lbl 453 `"Castillian"', add
label define hispand_lbl 454 `"Catalonian"', add
label define hispand_lbl 455 `"Balearic Islander"', add
label define hispand_lbl 456 `"Gallego"', add
label define hispand_lbl 457 `"Valencian"', add
label define hispand_lbl 458 `"Canarian"', add
label define hispand_lbl 459 `"Spanish Basque"', add
label define hispand_lbl 460 `"Dominican"', add
label define hispand_lbl 465 `"Latin American"', add
label define hispand_lbl 470 `"Hispanic"', add
label define hispand_lbl 480 `"Spanish"', add
label define hispand_lbl 490 `"Californio"', add
label define hispand_lbl 491 `"Tejano"', add
label define hispand_lbl 492 `"Nuevo Mexicano"', add
label define hispand_lbl 493 `"Spanish American"', add
label define hispand_lbl 494 `"Spanish American Indian"', add
label define hispand_lbl 495 `"Meso American Indian"', add
label define hispand_lbl 496 `"Mestizo"', add
label define hispand_lbl 498 `"Other, n.s. "', add
label define hispand_lbl 499 `"Other, n.e.c."', add
label define hispand_lbl 900 `"Not Reported"', add
label values hispand hispand_lbl

label define bpl_lbl 001 `"Alabama"'
label define bpl_lbl 002 `"Alaska"', add
label define bpl_lbl 004 `"Arizona"', add
label define bpl_lbl 005 `"Arkansas"', add
label define bpl_lbl 006 `"California"', add
label define bpl_lbl 008 `"Colorado"', add
label define bpl_lbl 009 `"Connecticut"', add
label define bpl_lbl 010 `"Delaware"', add
label define bpl_lbl 011 `"District of Columbia"', add
label define bpl_lbl 012 `"Florida"', add
label define bpl_lbl 013 `"Georgia"', add
label define bpl_lbl 015 `"Hawaii"', add
label define bpl_lbl 016 `"Idaho"', add
label define bpl_lbl 017 `"Illinois"', add
label define bpl_lbl 018 `"Indiana"', add
label define bpl_lbl 019 `"Iowa"', add
label define bpl_lbl 020 `"Kansas"', add
label define bpl_lbl 021 `"Kentucky"', add
label define bpl_lbl 022 `"Louisiana"', add
label define bpl_lbl 023 `"Maine"', add
label define bpl_lbl 024 `"Maryland"', add
label define bpl_lbl 025 `"Massachusetts"', add
label define bpl_lbl 026 `"Michigan"', add
label define bpl_lbl 027 `"Minnesota"', add
label define bpl_lbl 028 `"Mississippi"', add
label define bpl_lbl 029 `"Missouri"', add
label define bpl_lbl 030 `"Montana"', add
label define bpl_lbl 031 `"Nebraska"', add
label define bpl_lbl 032 `"Nevada"', add
label define bpl_lbl 033 `"New Hampshire"', add
label define bpl_lbl 034 `"New Jersey"', add
label define bpl_lbl 035 `"New Mexico"', add
label define bpl_lbl 036 `"New York"', add
label define bpl_lbl 037 `"North Carolina"', add
label define bpl_lbl 038 `"North Dakota"', add
label define bpl_lbl 039 `"Ohio"', add
label define bpl_lbl 040 `"Oklahoma"', add
label define bpl_lbl 041 `"Oregon"', add
label define bpl_lbl 042 `"Pennsylvania"', add
label define bpl_lbl 044 `"Rhode Island"', add
label define bpl_lbl 045 `"South Carolina"', add
label define bpl_lbl 046 `"South Dakota"', add
label define bpl_lbl 047 `"Tennessee"', add
label define bpl_lbl 048 `"Texas"', add
label define bpl_lbl 049 `"Utah"', add
label define bpl_lbl 050 `"Vermont"', add
label define bpl_lbl 051 `"Virginia"', add
label define bpl_lbl 053 `"Washington"', add
label define bpl_lbl 054 `"West Virginia"', add
label define bpl_lbl 055 `"Wisconsin"', add
label define bpl_lbl 056 `"Wyoming"', add
label define bpl_lbl 090 `"Native American"', add
label define bpl_lbl 099 `"United States, ns"', add
label define bpl_lbl 100 `"American Samoa"', add
label define bpl_lbl 105 `"Guam"', add
label define bpl_lbl 110 `"Puerto Rico"', add
label define bpl_lbl 115 `"U.S. Virgin Islands"', add
label define bpl_lbl 120 `"Other US Possessions"', add
label define bpl_lbl 150 `"Canada"', add
label define bpl_lbl 155 `"St. Pierre and Miquelon"', add
label define bpl_lbl 160 `"Atlantic Islands"', add
label define bpl_lbl 199 `"North America, ns"', add
label define bpl_lbl 200 `"Mexico"', add
label define bpl_lbl 210 `"Central America"', add
label define bpl_lbl 250 `"Cuba"', add
label define bpl_lbl 260 `"West Indies"', add
label define bpl_lbl 299 `"Americas, n.s."', add
label define bpl_lbl 300 `"SOUTH AMERICA"', add
label define bpl_lbl 400 `"Denmark"', add
label define bpl_lbl 401 `"Finland"', add
label define bpl_lbl 402 `"Iceland"', add
label define bpl_lbl 403 `"Lapland, n.s."', add
label define bpl_lbl 404 `"Norway"', add
label define bpl_lbl 405 `"Sweden"', add
label define bpl_lbl 410 `"England"', add
label define bpl_lbl 411 `"Scotland"', add
label define bpl_lbl 412 `"Wales"', add
label define bpl_lbl 413 `"United Kingdom, ns"', add
label define bpl_lbl 414 `"Ireland"', add
label define bpl_lbl 419 `"Northern Europe, ns"', add
label define bpl_lbl 420 `"Belgium"', add
label define bpl_lbl 421 `"France"', add
label define bpl_lbl 422 `"Liechtenstein"', add
label define bpl_lbl 423 `"Luxembourg"', add
label define bpl_lbl 424 `"Monaco"', add
label define bpl_lbl 425 `"Netherlands"', add
label define bpl_lbl 426 `"Swizterland"', add
label define bpl_lbl 429 `"Western Europe, ns"', add
label define bpl_lbl 430 `"Albania"', add
label define bpl_lbl 431 `"Andorra"', add
label define bpl_lbl 432 `"Gibraltar"', add
label define bpl_lbl 433 `"Greece"', add
label define bpl_lbl 434 `"Italy"', add
label define bpl_lbl 435 `"Malta"', add
label define bpl_lbl 436 `"Portugal"', add
label define bpl_lbl 437 `"San Marino"', add
label define bpl_lbl 438 `"Spain"', add
label define bpl_lbl 439 `"Vatican City"', add
label define bpl_lbl 440 `"Southern Europe, ns"', add
label define bpl_lbl 450 `"Austria"', add
label define bpl_lbl 451 `"Bulgaria"', add
label define bpl_lbl 452 `"Czechoslovakia"', add
label define bpl_lbl 453 `"Germany"', add
label define bpl_lbl 454 `"Hungary"', add
label define bpl_lbl 455 `"Poland"', add
label define bpl_lbl 456 `"Romania"', add
label define bpl_lbl 457 `"Yugoslavia"', add
label define bpl_lbl 458 `"Central Europe, ns"', add
label define bpl_lbl 459 `"Eastern Europe, ns"', add
label define bpl_lbl 460 `"Estonia"', add
label define bpl_lbl 461 `"Latvia"', add
label define bpl_lbl 462 `"Lithuania"', add
label define bpl_lbl 463 `"Baltic States, ns"', add
label define bpl_lbl 465 `"Other USSR/Russia"', add
label define bpl_lbl 499 `"Europe, ns"', add
label define bpl_lbl 500 `"China"', add
label define bpl_lbl 501 `"Japan"', add
label define bpl_lbl 502 `"Korea"', add
label define bpl_lbl 509 `"East Asia, ns"', add
label define bpl_lbl 510 `"Brunei"', add
label define bpl_lbl 511 `"Cambodia (Kampuchea)"', add
label define bpl_lbl 512 `"Indonesia"', add
label define bpl_lbl 513 `"Laos"', add
label define bpl_lbl 514 `"Malaysia"', add
label define bpl_lbl 515 `"Philippines"', add
label define bpl_lbl 516 `"Singapore"', add
label define bpl_lbl 517 `"Thailand"', add
label define bpl_lbl 518 `"Vietnam"', add
label define bpl_lbl 519 `"Southeast Asia, ns"', add
label define bpl_lbl 520 `"Afghanistan"', add
label define bpl_lbl 521 `"India"', add
label define bpl_lbl 522 `"Iran"', add
label define bpl_lbl 523 `"Maldives"', add
label define bpl_lbl 524 `"Nepal"', add
label define bpl_lbl 530 `"Bahrain"', add
label define bpl_lbl 531 `"Cyprus"', add
label define bpl_lbl 532 `"Iraq"', add
label define bpl_lbl 533 `"Iraq/Saudi Arabia"', add
label define bpl_lbl 534 `"Israel/Palestine"', add
label define bpl_lbl 535 `"Jordan"', add
label define bpl_lbl 536 `"Kuwait"', add
label define bpl_lbl 537 `"Lebanon"', add
label define bpl_lbl 538 `"Oman"', add
label define bpl_lbl 539 `"Qatar"', add
label define bpl_lbl 540 `"Saudi Arabia"', add
label define bpl_lbl 541 `"Syria"', add
label define bpl_lbl 542 `"Turkey"', add
label define bpl_lbl 543 `"United Arab Emirates"', add
label define bpl_lbl 544 `"Yemen Arab Republic (North)"', add
label define bpl_lbl 545 `"Yemen, PDR (South)"', add
label define bpl_lbl 546 `"Persian Gulf States, n.s."', add
label define bpl_lbl 547 `"Middle East, ns"', add
label define bpl_lbl 548 `"Southwest Asia, nec/ns"', add
label define bpl_lbl 549 `"Asia Minor, ns"', add
label define bpl_lbl 550 `"South Asia, nec"', add
label define bpl_lbl 599 `"Asia, nec/ns"', add
label define bpl_lbl 600 `"AFRICA"', add
label define bpl_lbl 700 `"Australia and New Zealand"', add
label define bpl_lbl 710 `"Pacific Islands"', add
label define bpl_lbl 800 `"Antarctica, ns/nec"', add
label define bpl_lbl 900 `"Abroad (unknown) or at sea"', add
label define bpl_lbl 950 `"Other, nec"', add
label define bpl_lbl 999 `"Missing/blank"', add
label values bpl bpl_lbl

label define bpld_lbl 00100 `"Alabama"'
label define bpld_lbl 00200 `"Alaska"', add
label define bpld_lbl 00400 `"Arizona"', add
label define bpld_lbl 00500 `"Arkansas"', add
label define bpld_lbl 00600 `"California"', add
label define bpld_lbl 00800 `"Colorado"', add
label define bpld_lbl 00900 `"Connecticut"', add
label define bpld_lbl 01000 `"Delaware"', add
label define bpld_lbl 01100 `"District of Columbia"', add
label define bpld_lbl 01200 `"Florida"', add
label define bpld_lbl 01300 `"Georgia"', add
label define bpld_lbl 01500 `"Hawaii"', add
label define bpld_lbl 01600 `"Idaho"', add
label define bpld_lbl 01610 `"Idaho Territory"', add
label define bpld_lbl 01700 `"Illinois"', add
label define bpld_lbl 01800 `"Indiana"', add
label define bpld_lbl 01900 `"Iowa"', add
label define bpld_lbl 02000 `"Kansas"', add
label define bpld_lbl 02100 `"Kentucky"', add
label define bpld_lbl 02200 `"Louisiana"', add
label define bpld_lbl 02300 `"Maine"', add
label define bpld_lbl 02400 `"Maryland"', add
label define bpld_lbl 02500 `"Massachusetts"', add
label define bpld_lbl 02600 `"Michigan"', add
label define bpld_lbl 02700 `"Minnesota"', add
label define bpld_lbl 02800 `"Mississippi"', add
label define bpld_lbl 02900 `"Missouri"', add
label define bpld_lbl 03000 `"Montana"', add
label define bpld_lbl 03100 `"Nebraska"', add
label define bpld_lbl 03200 `"Nevada"', add
label define bpld_lbl 03300 `"New Hampshire"', add
label define bpld_lbl 03400 `"New Jersey"', add
label define bpld_lbl 03500 `"New Mexico"', add
label define bpld_lbl 03510 `"New Mexico Territory"', add
label define bpld_lbl 03600 `"New York"', add
label define bpld_lbl 03700 `"North Carolina"', add
label define bpld_lbl 03800 `"North Dakota"', add
label define bpld_lbl 03900 `"Ohio"', add
label define bpld_lbl 04000 `"Oklahoma"', add
label define bpld_lbl 04010 `"Indian Territory"', add
label define bpld_lbl 04100 `"Oregon"', add
label define bpld_lbl 04200 `"Pennsylvania"', add
label define bpld_lbl 04400 `"Rhode Island"', add
label define bpld_lbl 04500 `"South Carolina"', add
label define bpld_lbl 04600 `"South Dakota"', add
label define bpld_lbl 04610 `"Dakota Territory"', add
label define bpld_lbl 04700 `"Tennessee"', add
label define bpld_lbl 04800 `"Texas"', add
label define bpld_lbl 04900 `"Utah"', add
label define bpld_lbl 04910 `"Utah Territory"', add
label define bpld_lbl 05000 `"Vermont"', add
label define bpld_lbl 05100 `"Virginia"', add
label define bpld_lbl 05300 `"Washington"', add
label define bpld_lbl 05400 `"West Virginia"', add
label define bpld_lbl 05500 `"Wisconsin"', add
label define bpld_lbl 05600 `"Wyoming"', add
label define bpld_lbl 05610 `"Wyoming Territory"', add
label define bpld_lbl 09000 `"Native American"', add
label define bpld_lbl 09900 `"United States, ns"', add
label define bpld_lbl 10000 `"American Samoa"', add
label define bpld_lbl 10010 `"Samoa, 1940-1950"', add
label define bpld_lbl 10500 `"Guam"', add
label define bpld_lbl 11000 `"Puerto Rico"', add
label define bpld_lbl 11500 `"U.S. Virgin Islands"', add
label define bpld_lbl 11510 `"St. Croix"', add
label define bpld_lbl 11520 `"St. John"', add
label define bpld_lbl 11530 `"St. Thomas"', add
label define bpld_lbl 12000 `"Other US Possessions:"', add
label define bpld_lbl 12010 `"Johnston Atoll"', add
label define bpld_lbl 12020 `"Midway Islands"', add
label define bpld_lbl 12030 `"Wake Island"', add
label define bpld_lbl 12040 `"Other US Caribbean Islands"', add
label define bpld_lbl 12041 `"Navassa Island"', add
label define bpld_lbl 12050 `"Other US Pacific Islands"', add
label define bpld_lbl 12051 `"Baker Island"', add
label define bpld_lbl 12052 `"Howland Island"', add
label define bpld_lbl 12053 `"Jarvis Island"', add
label define bpld_lbl 12054 `"Kingman Reef"', add
label define bpld_lbl 12055 `"Palmyra Atoll"', add
label define bpld_lbl 12090 `"US outlying areas, ns"', add
label define bpld_lbl 12091 `"US possessions, ns"', add
label define bpld_lbl 12092 `"US territory, ns"', add
label define bpld_lbl 15000 `"Canada"', add
label define bpld_lbl 15010 `"English Canada"', add
label define bpld_lbl 15011 `"British Columbia"', add
label define bpld_lbl 15013 `"Alberta"', add
label define bpld_lbl 15015 `"Saskatchewan"', add
label define bpld_lbl 15017 `"Northwest"', add
label define bpld_lbl 15019 `"Ruperts Land"', add
label define bpld_lbl 15020 `"Manitoba"', add
label define bpld_lbl 15021 `"Red River"', add
label define bpld_lbl 15030 `"Ontario/Upper Canada"', add
label define bpld_lbl 15031 `"Upper Canada"', add
label define bpld_lbl 15032 `"Canada West"', add
label define bpld_lbl 15040 `"New Brunswick"', add
label define bpld_lbl 15050 `"Nova Scotia"', add
label define bpld_lbl 15051 `"Cape Breton"', add
label define bpld_lbl 15052 `"Halifax"', add
label define bpld_lbl 15060 `"Prince Edward Island"', add
label define bpld_lbl 15070 `"Newfoundland"', add
label define bpld_lbl 15080 `"French Canada"', add
label define bpld_lbl 15081 `"Quebec"', add
label define bpld_lbl 15082 `"Lower Canada"', add
label define bpld_lbl 15083 `"Canada East"', add
label define bpld_lbl 15500 `"St. Pierre and Miquelon"', add
label define bpld_lbl 16000 `"Atlantic Islands"', add
label define bpld_lbl 16010 `"Bermuda"', add
label define bpld_lbl 16020 `"Cape Verde"', add
label define bpld_lbl 16030 `"Falkland Islands"', add
label define bpld_lbl 16040 `"Greenland"', add
label define bpld_lbl 16050 `"St. Helena and Ascension"', add
label define bpld_lbl 16060 `"Canary Islands"', add
label define bpld_lbl 19900 `"North America, ns"', add
label define bpld_lbl 20000 `"Mexico"', add
label define bpld_lbl 21000 `"Central America"', add
label define bpld_lbl 21010 `"Belize/British Honduras"', add
label define bpld_lbl 21020 `"Costa Rica"', add
label define bpld_lbl 21030 `"El Salvador"', add
label define bpld_lbl 21040 `"Guatemala"', add
label define bpld_lbl 21050 `"Honduras"', add
label define bpld_lbl 21060 `"Nicaragua"', add
label define bpld_lbl 21070 `"Panama"', add
label define bpld_lbl 21071 `"Canal Zone"', add
label define bpld_lbl 21090 `"Central America, ns"', add
label define bpld_lbl 25000 `"Cuba"', add
label define bpld_lbl 26000 `"West Indies"', add
label define bpld_lbl 26010 `"Dominican Republic"', add
label define bpld_lbl 26020 `"Haiti"', add
label define bpld_lbl 26030 `"Jamaica"', add
label define bpld_lbl 26040 `"British West Indies"', add
label define bpld_lbl 26041 `"Anguilla"', add
label define bpld_lbl 26042 `"Antigua-Barbuda"', add
label define bpld_lbl 26043 `"Bahamas"', add
label define bpld_lbl 26044 `"Barbados"', add
label define bpld_lbl 26045 `"British Virgin Islands"', add
label define bpld_lbl 26046 `"Anegada"', add
label define bpld_lbl 26047 `"Cooper"', add
label define bpld_lbl 26048 `"Jost Van Dyke"', add
label define bpld_lbl 26049 `"Peter"', add
label define bpld_lbl 26050 `"Tortola"', add
label define bpld_lbl 26051 `"Virgin Gorda"', add
label define bpld_lbl 26052 `"Br. Virgin Islands, ns"', add
label define bpld_lbl 26053 `"Cayman Islands"', add
label define bpld_lbl 26054 `"Dominica"', add
label define bpld_lbl 26055 `"Grenada"', add
label define bpld_lbl 26056 `"Montserrat"', add
label define bpld_lbl 26057 `"St. Kitts-Nevis"', add
label define bpld_lbl 26058 `"St. Lucia"', add
label define bpld_lbl 26059 `"St. Vincent"', add
label define bpld_lbl 26060 `"Trinidad and Tobago"', add
label define bpld_lbl 26061 `"Turks and Caicos"', add
label define bpld_lbl 26069 `"British West Indies, ns"', add
label define bpld_lbl 26070 `"Other West Indies"', add
label define bpld_lbl 26071 `"Aruba"', add
label define bpld_lbl 26072 `"Netherlands Antilles"', add
label define bpld_lbl 26073 `"Bonaire"', add
label define bpld_lbl 26074 `"Curacao"', add
label define bpld_lbl 26075 `"Dutch St. Maarten"', add
label define bpld_lbl 26076 `"Saba"', add
label define bpld_lbl 26077 `"St. Eustatius"', add
label define bpld_lbl 26079 `"Dutch Caribbean, ns"', add
label define bpld_lbl 26080 `"French St. Maarten"', add
label define bpld_lbl 26081 `"Guadeloupe"', add
label define bpld_lbl 26082 `"Martinique"', add
label define bpld_lbl 26083 `"St. Barthelemy"', add
label define bpld_lbl 26089 `"French Caribbean, ns"', add
label define bpld_lbl 26090 `"Antilles, n.s."', add
label define bpld_lbl 26091 `"Caribbean, ns"', add
label define bpld_lbl 26092 `"Latin America, ns"', add
label define bpld_lbl 26093 `"Leeward Islands, ns"', add
label define bpld_lbl 26094 `"West Indies, ns"', add
label define bpld_lbl 26095 `"Windward Islands, ns"', add
label define bpld_lbl 29900 `"Americas, ns"', add
label define bpld_lbl 30000 `"South America"', add
label define bpld_lbl 30005 `"Argentina"', add
label define bpld_lbl 30010 `"Bolivia"', add
label define bpld_lbl 30015 `"Brazil"', add
label define bpld_lbl 30020 `"Chile"', add
label define bpld_lbl 30025 `"Colombia"', add
label define bpld_lbl 30030 `"Ecuador"', add
label define bpld_lbl 30035 `"French Guiana"', add
label define bpld_lbl 30040 `"Guyana/British Guiana"', add
label define bpld_lbl 30045 `"Paraguay"', add
label define bpld_lbl 30050 `"Peru"', add
label define bpld_lbl 30055 `"Suriname"', add
label define bpld_lbl 30060 `"Uruguay"', add
label define bpld_lbl 30065 `"Venezuela"', add
label define bpld_lbl 30090 `"South America, ns"', add
label define bpld_lbl 30091 `"South and Central America, n.s."', add
label define bpld_lbl 40000 `"Denmark"', add
label define bpld_lbl 40010 `"Faeroe Islands"', add
label define bpld_lbl 40100 `"Finland"', add
label define bpld_lbl 40200 `"Iceland"', add
label define bpld_lbl 40300 `"Lapland, ns"', add
label define bpld_lbl 40400 `"Norway"', add
label define bpld_lbl 40410 `"Svalbard and Jan Meyen"', add
label define bpld_lbl 40411 `"Svalbard"', add
label define bpld_lbl 40412 `"Jan Meyen"', add
label define bpld_lbl 40500 `"Sweden"', add
label define bpld_lbl 41000 `"England"', add
label define bpld_lbl 41010 `"Channel Islands"', add
label define bpld_lbl 41011 `"Guernsey"', add
label define bpld_lbl 41012 `"Jersey"', add
label define bpld_lbl 41020 `"Isle of Man"', add
label define bpld_lbl 41100 `"Scotland"', add
label define bpld_lbl 41200 `"Wales"', add
label define bpld_lbl 41300 `"United Kingdom, ns"', add
label define bpld_lbl 41400 `"Ireland"', add
label define bpld_lbl 41410 `"Northern Ireland"', add
label define bpld_lbl 41900 `"Northern Europe, ns"', add
label define bpld_lbl 42000 `"Belgium"', add
label define bpld_lbl 42100 `"France"', add
label define bpld_lbl 42110 `"Alsace-Lorraine"', add
label define bpld_lbl 42111 `"Alsace"', add
label define bpld_lbl 42112 `"Lorraine"', add
label define bpld_lbl 42200 `"Liechtenstein"', add
label define bpld_lbl 42300 `"Luxembourg"', add
label define bpld_lbl 42400 `"Monaco"', add
label define bpld_lbl 42500 `"Netherlands"', add
label define bpld_lbl 42600 `"Switzerland"', add
label define bpld_lbl 42900 `"Western Europe, ns"', add
label define bpld_lbl 43000 `"Albania"', add
label define bpld_lbl 43100 `"Andorra"', add
label define bpld_lbl 43200 `"Gibraltar"', add
label define bpld_lbl 43300 `"Greece"', add
label define bpld_lbl 43310 `"Dodecanese Islands"', add
label define bpld_lbl 43320 `"Turkey Greece"', add
label define bpld_lbl 43330 `"Macedonia"', add
label define bpld_lbl 43400 `"Italy"', add
label define bpld_lbl 43500 `"Malta"', add
label define bpld_lbl 43600 `"Portugal"', add
label define bpld_lbl 43610 `"Azores"', add
label define bpld_lbl 43620 `"Madeira Islands"', add
label define bpld_lbl 43630 `"Cape Verde Islands"', add
label define bpld_lbl 43640 `"St. Miguel"', add
label define bpld_lbl 43700 `"San Marino"', add
label define bpld_lbl 43800 `"Spain"', add
label define bpld_lbl 43900 `"Vatican City"', add
label define bpld_lbl 44000 `"Southern Europe, ns"', add
label define bpld_lbl 45000 `"Austria"', add
label define bpld_lbl 45010 `"Austria-Hungary"', add
label define bpld_lbl 45020 `"Austria-Graz"', add
label define bpld_lbl 45030 `"Austria-Linz"', add
label define bpld_lbl 45040 `"Austria-Salzburg"', add
label define bpld_lbl 45050 `"Austria-Tyrol"', add
label define bpld_lbl 45060 `"Austria-Vienna"', add
label define bpld_lbl 45070 `"Austria-Kaernsten"', add
label define bpld_lbl 45080 `"Austria-Neustadt"', add
label define bpld_lbl 45100 `"Bulgaria"', add
label define bpld_lbl 45200 `"Czechoslovakia"', add
label define bpld_lbl 45210 `"Bohemia"', add
label define bpld_lbl 45211 `"Bohemia-Moravia"', add
label define bpld_lbl 45212 `"Slovakia"', add
label define bpld_lbl 45213 `"Czech Republic"', add
label define bpld_lbl 45300 `"Germany"', add
label define bpld_lbl 45301 `"Berlin"', add
label define bpld_lbl 45302 `"West Berlin"', add
label define bpld_lbl 45303 `"East Berlin"', add
label define bpld_lbl 45310 `"West Germany"', add
label define bpld_lbl 45311 `"Baden"', add
label define bpld_lbl 45312 `"Bavaria"', add
label define bpld_lbl 45313 `"Braunschweig"', add
label define bpld_lbl 45314 `"Bremen"', add
label define bpld_lbl 45315 `"Hamburg"', add
label define bpld_lbl 45316 `"Hanover"', add
label define bpld_lbl 45317 `"Hessen"', add
label define bpld_lbl 45318 `"Hessen Nassau"', add
label define bpld_lbl 45319 `"Holstein"', add
label define bpld_lbl 45320 `"Lippe"', add
label define bpld_lbl 45321 `"Lubeck"', add
label define bpld_lbl 45322 `"Oldenburg"', add
label define bpld_lbl 45323 `"Rhine Province"', add
label define bpld_lbl 45324 `"Schleswig"', add
label define bpld_lbl 45325 `"Schleswig-Holstein"', add
label define bpld_lbl 45327 `"Waldeck"', add
label define bpld_lbl 45328 `"Wurttemberg"', add
label define bpld_lbl 45329 `"Waldecker"', add
label define bpld_lbl 45330 `"Wittenberg"', add
label define bpld_lbl 45331 `"Frankfurt"', add
label define bpld_lbl 45332 `"Saarland"', add
label define bpld_lbl 45333 `"Nordheim-Westfalen"', add
label define bpld_lbl 45340 `"East Germany"', add
label define bpld_lbl 45341 `"Anhalt"', add
label define bpld_lbl 45342 `"Brandenburg"', add
label define bpld_lbl 45344 `"Mecklenburg"', add
label define bpld_lbl 45345 `"Sachsen-Altenburg"', add
label define bpld_lbl 45346 `"Sachsen-Coburg"', add
label define bpld_lbl 45347 `"Sachsen-Gotha"', add
label define bpld_lbl 45350 `"Probable Saxony"', add
label define bpld_lbl 45351 `"Schwerin"', add
label define bpld_lbl 45353 `"Probably Thuringian States"', add
label define bpld_lbl 45360 `"Prussia, nec"', add
label define bpld_lbl 45361 `"Hohenzollern"', add
label define bpld_lbl 45362 `"Niedersachsen"', add
label define bpld_lbl 45400 `"Hungary"', add
label define bpld_lbl 45500 `"Poland"', add
label define bpld_lbl 45510 `"Austrian Poland"', add
label define bpld_lbl 45511 `"Galicia"', add
label define bpld_lbl 45520 `"German Poland"', add
label define bpld_lbl 45521 `"East Prussia"', add
label define bpld_lbl 45522 `"Pomerania"', add
label define bpld_lbl 45523 `"Posen"', add
label define bpld_lbl 45524 `"Prussian Poland"', add
label define bpld_lbl 45525 `"Silesia"', add
label define bpld_lbl 45526 `"West Prussia"', add
label define bpld_lbl 45530 `"Russian Poland"', add
label define bpld_lbl 45600 `"Romania"', add
label define bpld_lbl 45610 `"Transylvania"', add
label define bpld_lbl 45700 `"Yugoslavia"', add
label define bpld_lbl 45710 `"Croatia"', add
label define bpld_lbl 45720 `"Montenegro"', add
label define bpld_lbl 45730 `"Serbia"', add
label define bpld_lbl 45740 `"Bosnia"', add
label define bpld_lbl 45750 `"Dalmatia"', add
label define bpld_lbl 45760 `"Slovonia"', add
label define bpld_lbl 45770 `"Carniola"', add
label define bpld_lbl 45780 `"Slovenia"', add
label define bpld_lbl 45790 `"Kosovo"', add
label define bpld_lbl 45800 `"Central Europe, ns"', add
label define bpld_lbl 45900 `"Eastern Europe, ns"', add
label define bpld_lbl 46000 `"Estonia"', add
label define bpld_lbl 46100 `"Latvia"', add
label define bpld_lbl 46200 `"Lithuania"', add
label define bpld_lbl 46300 `"Baltic States, ns"', add
label define bpld_lbl 46500 `"Other USSR/Russia"', add
label define bpld_lbl 46510 `"Byelorussia"', add
label define bpld_lbl 46520 `"Moldavia"', add
label define bpld_lbl 46521 `"Bessarabia"', add
label define bpld_lbl 46530 `"Ukraine"', add
label define bpld_lbl 46540 `"Armenia"', add
label define bpld_lbl 46541 `"Azerbaijan"', add
label define bpld_lbl 46542 `"Republic of Georgia"', add
label define bpld_lbl 46543 `"Kazakhstan"', add
label define bpld_lbl 46544 `"Kirghizia"', add
label define bpld_lbl 46545 `"Tadzhik"', add
label define bpld_lbl 46546 `"Turkmenistan"', add
label define bpld_lbl 46547 `"Uzbekistan"', add
label define bpld_lbl 46548 `"Siberia"', add
label define bpld_lbl 46590 `"USSR, ns"', add
label define bpld_lbl 49900 `"Europe, ns."', add
label define bpld_lbl 50000 `"China"', add
label define bpld_lbl 50010 `"Hong Kong"', add
label define bpld_lbl 50020 `"Macau"', add
label define bpld_lbl 50030 `"Mongolia"', add
label define bpld_lbl 50040 `"Taiwan"', add
label define bpld_lbl 50100 `"Japan"', add
label define bpld_lbl 50200 `"Korea"', add
label define bpld_lbl 50210 `"North Korea"', add
label define bpld_lbl 50220 `"South Korea"', add
label define bpld_lbl 50900 `"East Asia, ns"', add
label define bpld_lbl 51000 `"Brunei"', add
label define bpld_lbl 51100 `"Cambodia (Kampuchea)"', add
label define bpld_lbl 51200 `"Indonesia"', add
label define bpld_lbl 51210 `"East Indies"', add
label define bpld_lbl 51220 `"East Timor"', add
label define bpld_lbl 51300 `"Laos"', add
label define bpld_lbl 51400 `"Malaysia"', add
label define bpld_lbl 51500 `"Philippines"', add
label define bpld_lbl 51600 `"Singapore"', add
label define bpld_lbl 51700 `"Thailand"', add
label define bpld_lbl 51800 `"Vietnam"', add
label define bpld_lbl 51900 `"Southeast Asia, ns"', add
label define bpld_lbl 51910 `"Indochina, ns"', add
label define bpld_lbl 52000 `"Afghanistan"', add
label define bpld_lbl 52100 `"India"', add
label define bpld_lbl 52110 `"Bangladesh"', add
label define bpld_lbl 52120 `"Bhutan"', add
label define bpld_lbl 52130 `"Burma (Myanmar)"', add
label define bpld_lbl 52140 `"Pakistan"', add
label define bpld_lbl 52150 `"Sri Lanka (Ceylon)"', add
label define bpld_lbl 52200 `"Iran"', add
label define bpld_lbl 52300 `"Maldives"', add
label define bpld_lbl 52400 `"Nepal"', add
label define bpld_lbl 53000 `"Bahrain"', add
label define bpld_lbl 53100 `"Cyprus"', add
label define bpld_lbl 53200 `"Iraq"', add
label define bpld_lbl 53210 `"Mesopotamia"', add
label define bpld_lbl 53300 `"Iraq/Saudi Arabia"', add
label define bpld_lbl 53400 `"Israel/Palestine"', add
label define bpld_lbl 53410 `"Gaza Strip"', add
label define bpld_lbl 53420 `"Palestine"', add
label define bpld_lbl 53430 `"West Bank"', add
label define bpld_lbl 53440 `"Israel"', add
label define bpld_lbl 53500 `"Jordan"', add
label define bpld_lbl 53600 `"Kuwait"', add
label define bpld_lbl 53700 `"Lebanon"', add
label define bpld_lbl 53800 `"Oman"', add
label define bpld_lbl 53900 `"Qatar"', add
label define bpld_lbl 54000 `"Saudi Arabia"', add
label define bpld_lbl 54100 `"Syria"', add
label define bpld_lbl 54200 `"Turkey"', add
label define bpld_lbl 54210 `"European Turkey"', add
label define bpld_lbl 54220 `"Asian Turkey"', add
label define bpld_lbl 54300 `"United Arab Emirates"', add
label define bpld_lbl 54400 `"Yemen Arab Republic (North)"', add
label define bpld_lbl 54500 `"Yemen, PDR (South)"', add
label define bpld_lbl 54600 `"Persian Gulf States, ns"', add
label define bpld_lbl 54700 `"Middle East, ns"', add
label define bpld_lbl 54800 `"Southwest Asia, nec/ns"', add
label define bpld_lbl 54900 `"Asia Minor, ns"', add
label define bpld_lbl 55000 `"South Asia, nec"', add
label define bpld_lbl 59900 `"Asia, nec/ns"', add
label define bpld_lbl 60000 `"Africa"', add
label define bpld_lbl 60010 `"Northern Africa"', add
label define bpld_lbl 60011 `"Algeria"', add
label define bpld_lbl 60012 `"Egypt/United Arab Rep."', add
label define bpld_lbl 60013 `"Libya"', add
label define bpld_lbl 60014 `"Morocco"', add
label define bpld_lbl 60015 `"Sudan"', add
label define bpld_lbl 60016 `"Tunisia"', add
label define bpld_lbl 60017 `"Western Sahara"', add
label define bpld_lbl 60019 `"North Africa, ns"', add
label define bpld_lbl 60020 `"Benin"', add
label define bpld_lbl 60021 `"Burkina Faso"', add
label define bpld_lbl 60022 `"Gambia"', add
label define bpld_lbl 60023 `"Ghana"', add
label define bpld_lbl 60024 `"Guinea"', add
label define bpld_lbl 60025 `"Guinea-Bissau"', add
label define bpld_lbl 60026 `"Ivory Coast"', add
label define bpld_lbl 60027 `"Liberia"', add
label define bpld_lbl 60028 `"Mali"', add
label define bpld_lbl 60029 `"Mauritania"', add
label define bpld_lbl 60030 `"Niger"', add
label define bpld_lbl 60031 `"Nigeria"', add
label define bpld_lbl 60032 `"Senegal"', add
label define bpld_lbl 60033 `"Sierra Leone"', add
label define bpld_lbl 60034 `"Togo"', add
label define bpld_lbl 60038 `"Western Africa, ns"', add
label define bpld_lbl 60039 `"French West Africa, ns"', add
label define bpld_lbl 60040 `"British Indian Ocean Territory"', add
label define bpld_lbl 60041 `"Burundi"', add
label define bpld_lbl 60042 `"Comoros"', add
label define bpld_lbl 60043 `"Djibouti"', add
label define bpld_lbl 60044 `"Ethiopia"', add
label define bpld_lbl 60045 `"Kenya"', add
label define bpld_lbl 60046 `"Madagascar"', add
label define bpld_lbl 60047 `"Malawi"', add
label define bpld_lbl 60048 `"Mauritius"', add
label define bpld_lbl 60049 `"Mozambique"', add
label define bpld_lbl 60050 `"Reunion"', add
label define bpld_lbl 60051 `"Rwanda"', add
label define bpld_lbl 60052 `"Seychelles"', add
label define bpld_lbl 60053 `"Somalia"', add
label define bpld_lbl 60054 `"Tanzania"', add
label define bpld_lbl 60055 `"Uganda"', add
label define bpld_lbl 60056 `"Zambia"', add
label define bpld_lbl 60057 `"Zimbabwe"', add
label define bpld_lbl 60058 `"Bassas de India"', add
label define bpld_lbl 60059 `"Europa"', add
label define bpld_lbl 60060 `"Gloriosos"', add
label define bpld_lbl 60061 `"Juan de Nova"', add
label define bpld_lbl 60062 `"Mayotte"', add
label define bpld_lbl 60063 `"Tromelin"', add
label define bpld_lbl 60064 `"Eastern Africa, nec/ns"', add
label define bpld_lbl 60065 `"Eritrea"', add
label define bpld_lbl 60070 `"Central Africa"', add
label define bpld_lbl 60071 `"Angola"', add
label define bpld_lbl 60072 `"Cameroon"', add
label define bpld_lbl 60073 `"Central African Republic"', add
label define bpld_lbl 60074 `"Chad"', add
label define bpld_lbl 60075 `"Congo"', add
label define bpld_lbl 60076 `"Equatorial Guinea"', add
label define bpld_lbl 60077 `"Gabon"', add
label define bpld_lbl 60078 `"Sao Tome and Principe"', add
label define bpld_lbl 60079 `"Zaire"', add
label define bpld_lbl 60080 `"Central Africa, ns"', add
label define bpld_lbl 60081 `"Equatorial Africa, ns"', add
label define bpld_lbl 60082 `"French Equatorial Africa, ns"', add
label define bpld_lbl 60090 `"Southern Africa:"', add
label define bpld_lbl 60091 `"Botswana"', add
label define bpld_lbl 60092 `"Lesotho"', add
label define bpld_lbl 60093 `"Namibia"', add
label define bpld_lbl 60094 `"South Africa (Union of)"', add
label define bpld_lbl 60095 `"Swaziland"', add
label define bpld_lbl 60096 `"Southern Africa, ns"', add
label define bpld_lbl 60099 `"Africa, ns/nec"', add
label define bpld_lbl 70000 `"Australia and New Zealand"', add
label define bpld_lbl 70010 `"Australia"', add
label define bpld_lbl 70011 `"Ashmore and Cartier Islands"', add
label define bpld_lbl 70012 `"Coral Sea Islands Territory"', add
label define bpld_lbl 70013 `"Christmas Island"', add
label define bpld_lbl 70014 `"Cocos Islands"', add
label define bpld_lbl 70020 `"New Zealand"', add
label define bpld_lbl 71000 `"Pacific Islands"', add
label define bpld_lbl 71010 `"New Caledonia"', add
label define bpld_lbl 71012 `"Papua New Guinea"', add
label define bpld_lbl 71013 `"Solomon Islands"', add
label define bpld_lbl 71014 `"Vanuatu (New Hebrides)"', add
label define bpld_lbl 71015 `"Fiji"', add
label define bpld_lbl 71016 `"Melanesia, ns"', add
label define bpld_lbl 71017 `"Norfolk Islands"', add
label define bpld_lbl 71018 `"Niue"', add
label define bpld_lbl 71020 `"Cook Islands"', add
label define bpld_lbl 71022 `"French Polynesia"', add
label define bpld_lbl 71023 `"Tonga"', add
label define bpld_lbl 71024 `"Wallis and Futuna Islands"', add
label define bpld_lbl 71025 `"Western Samoa"', add
label define bpld_lbl 71026 `"Pitcairn Island"', add
label define bpld_lbl 71027 `"Tokelau"', add
label define bpld_lbl 71028 `"Tuvalu"', add
label define bpld_lbl 71029 `"Polynesia, ns"', add
label define bpld_lbl 71032 `"Kiribati"', add
label define bpld_lbl 71033 `"Canton and Enderbury"', add
label define bpld_lbl 71034 `"Nauru"', add
label define bpld_lbl 71039 `"Micronesia, ns"', add
label define bpld_lbl 71040 `"US Pacific Trust Territories"', add
label define bpld_lbl 71041 `"Marshall Islands"', add
label define bpld_lbl 71042 `"Micronesia"', add
label define bpld_lbl 71043 `"Kosrae"', add
label define bpld_lbl 71044 `"Pohnpei"', add
label define bpld_lbl 71045 `"Truk"', add
label define bpld_lbl 71046 `"Yap"', add
label define bpld_lbl 71047 `"Northern Mariana Islands"', add
label define bpld_lbl 71048 `"Palau"', add
label define bpld_lbl 71049 `"Pacific Trust Terr, ns"', add
label define bpld_lbl 71050 `"Clipperton Island"', add
label define bpld_lbl 71090 `"Oceania, ns/nec"', add
label define bpld_lbl 80000 `"Antarctica, ns/nec"', add
label define bpld_lbl 80010 `"Bouvet Islands"', add
label define bpld_lbl 80020 `"British Antarctic Terr."', add
label define bpld_lbl 80030 `"Dronning Maud Land"', add
label define bpld_lbl 80040 `"French Southern and Antarctic Lands"', add
label define bpld_lbl 80050 `"Heard and McDonald Islands"', add
label define bpld_lbl 90000 `"Abroad (unknown) or at sea"', add
label define bpld_lbl 90010 `"Abroad, ns"', add
label define bpld_lbl 90011 `"Abroad (US citizen)"', add
label define bpld_lbl 90020 `"At sea"', add
label define bpld_lbl 90021 `"At sea (US citizen)"', add
label define bpld_lbl 90022 `"At sea or abroad (U.S. citizen)"', add
label define bpld_lbl 95000 `"Other, nec"', add
label define bpld_lbl 99900 `"Missing/blank"', add
label values bpld bpld_lbl

label define ancestr1_lbl 001 `"Alsatian, Alsace-Lorraine"'
label define ancestr1_lbl 002 `"Andorran"', add
label define ancestr1_lbl 003 `"Austrian"', add
label define ancestr1_lbl 004 `"Tirolean"', add
label define ancestr1_lbl 005 `"Basque"', add
label define ancestr1_lbl 006 `"French Basque"', add
label define ancestr1_lbl 008 `"Belgian"', add
label define ancestr1_lbl 009 `"Flemish"', add
label define ancestr1_lbl 010 `"Walloon"', add
label define ancestr1_lbl 011 `"British"', add
label define ancestr1_lbl 012 `"British Isles"', add
label define ancestr1_lbl 013 `"Channel Islander"', add
label define ancestr1_lbl 014 `"Gibraltan"', add
label define ancestr1_lbl 015 `"Cornish"', add
label define ancestr1_lbl 016 `"Corsican"', add
label define ancestr1_lbl 017 `"Cypriot"', add
label define ancestr1_lbl 018 `"Greek Cypriote"', add
label define ancestr1_lbl 019 `"Turkish Cypriote"', add
label define ancestr1_lbl 020 `"Danish"', add
label define ancestr1_lbl 021 `"Dutch"', add
label define ancestr1_lbl 022 `"English"', add
label define ancestr1_lbl 023 `"Faeroe Islander"', add
label define ancestr1_lbl 024 `"Finnish"', add
label define ancestr1_lbl 025 `"Karelian"', add
label define ancestr1_lbl 026 `"French"', add
label define ancestr1_lbl 027 `"Lorrainian"', add
label define ancestr1_lbl 028 `"Breton"', add
label define ancestr1_lbl 029 `"Frisian"', add
label define ancestr1_lbl 030 `"Friulian"', add
label define ancestr1_lbl 032 `"German"', add
label define ancestr1_lbl 033 `"Bavarian"', add
label define ancestr1_lbl 034 `"Berliner"', add
label define ancestr1_lbl 035 `"Hamburger"', add
label define ancestr1_lbl 036 `"Hanoverian"', add
label define ancestr1_lbl 037 `"Hessian"', add
label define ancestr1_lbl 038 `"Lubecker"', add
label define ancestr1_lbl 039 `"Pomeranian"', add
label define ancestr1_lbl 040 `"Prussian"', add
label define ancestr1_lbl 041 `"Saxon"', add
label define ancestr1_lbl 042 `"Sudetenlander"', add
label define ancestr1_lbl 043 `"Westphalian"', add
label define ancestr1_lbl 046 `"Greek"', add
label define ancestr1_lbl 047 `"Cretan"', add
label define ancestr1_lbl 048 `"Cycladic Islander"', add
label define ancestr1_lbl 049 `"Icelander"', add
label define ancestr1_lbl 050 `"Irish"', add
label define ancestr1_lbl 051 `"Italian"', add
label define ancestr1_lbl 053 `"Abruzzi"', add
label define ancestr1_lbl 054 `"Apulian"', add
label define ancestr1_lbl 055 `"Basilicata"', add
label define ancestr1_lbl 056 `"Calabrian"', add
label define ancestr1_lbl 057 `"Amalfin"', add
label define ancestr1_lbl 058 `"Emilia Romagna"', add
label define ancestr1_lbl 059 `"Rome"', add
label define ancestr1_lbl 060 `"Ligurian"', add
label define ancestr1_lbl 061 `"Lombardian"', add
label define ancestr1_lbl 062 `"Marches"', add
label define ancestr1_lbl 063 `"Molise"', add
label define ancestr1_lbl 064 `"Neapolitan"', add
label define ancestr1_lbl 065 `"Piedmontese"', add
label define ancestr1_lbl 066 `"Puglia"', add
label define ancestr1_lbl 067 `"Sardinian"', add
label define ancestr1_lbl 068 `"Sicilian"', add
label define ancestr1_lbl 069 `"Tuscan"', add
label define ancestr1_lbl 070 `"Trentino"', add
label define ancestr1_lbl 071 `"Umbrian"', add
label define ancestr1_lbl 072 `"Valle dAosta"', add
label define ancestr1_lbl 073 `"Venetian"', add
label define ancestr1_lbl 075 `"Lapp"', add
label define ancestr1_lbl 076 `"Liechtensteiner"', add
label define ancestr1_lbl 077 `"Luxemburger"', add
label define ancestr1_lbl 078 `"Maltese"', add
label define ancestr1_lbl 079 `"Manx"', add
label define ancestr1_lbl 080 `"Monegasque"', add
label define ancestr1_lbl 081 `"Northern Irelander"', add
label define ancestr1_lbl 082 `"Norwegian"', add
label define ancestr1_lbl 084 `"Portuguese"', add
label define ancestr1_lbl 085 `"Azorean"', add
label define ancestr1_lbl 086 `"Madeiran"', add
label define ancestr1_lbl 087 `"Scotch Irish"', add
label define ancestr1_lbl 088 `"Scottish"', add
label define ancestr1_lbl 089 `"Swedish"', add
label define ancestr1_lbl 090 `"Aland Islander"', add
label define ancestr1_lbl 091 `"Swiss"', add
label define ancestr1_lbl 092 `"Suisse"', add
label define ancestr1_lbl 095 `"Romansch"', add
label define ancestr1_lbl 096 `"Suisse Romane"', add
label define ancestr1_lbl 097 `"Welsh"', add
label define ancestr1_lbl 098 `"Scandinavian, Nordic"', add
label define ancestr1_lbl 100 `"Albanian"', add
label define ancestr1_lbl 101 `"Azerbaijani"', add
label define ancestr1_lbl 102 `"Belourussian"', add
label define ancestr1_lbl 103 `"Bulgarian"', add
label define ancestr1_lbl 105 `"Carpathian"', add
label define ancestr1_lbl 108 `"Cossack"', add
label define ancestr1_lbl 109 `"Croatian"', add
label define ancestr1_lbl 111 `"Czechoslovakian"', add
label define ancestr1_lbl 112 `"Bohemian"', add
label define ancestr1_lbl 115 `"Estonian"', add
label define ancestr1_lbl 116 `"Livonian"', add
label define ancestr1_lbl 117 `"Finno Ugrian"', add
label define ancestr1_lbl 118 `"Mordovian"', add
label define ancestr1_lbl 119 `"Voytak"', add
label define ancestr1_lbl 120 `"Georgian"', add
label define ancestr1_lbl 122 `"Germans from Russia"', add
label define ancestr1_lbl 123 `"Gruziia"', add
label define ancestr1_lbl 124 `"Rom"', add
label define ancestr1_lbl 125 `"Hungarian"', add
label define ancestr1_lbl 126 `"Magyar"', add
label define ancestr1_lbl 128 `"Latvian"', add
label define ancestr1_lbl 129 `"Lithuanian"', add
label define ancestr1_lbl 130 `"Macedonian"', add
label define ancestr1_lbl 132 `"North Caucasian"', add
label define ancestr1_lbl 133 `"North Caucasian Turkic"', add
label define ancestr1_lbl 140 `"Ossetian"', add
label define ancestr1_lbl 142 `"Polish"', add
label define ancestr1_lbl 143 `"Kashubian"', add
label define ancestr1_lbl 144 `"Romanian"', add
label define ancestr1_lbl 145 `"Bessarabian"', add
label define ancestr1_lbl 146 `"Moldavian"', add
label define ancestr1_lbl 147 `"Wallachian"', add
label define ancestr1_lbl 148 `"Russian"', add
label define ancestr1_lbl 150 `"Muscovite"', add
label define ancestr1_lbl 152 `"Serbian"', add
label define ancestr1_lbl 153 `"Slovak"', add
label define ancestr1_lbl 154 `"Slovene"', add
label define ancestr1_lbl 155 `"Sorb/Wend"', add
label define ancestr1_lbl 156 `"Soviet Turkic"', add
label define ancestr1_lbl 157 `"Bashkir"', add
label define ancestr1_lbl 158 `"Chevash"', add
label define ancestr1_lbl 159 `"Gagauz"', add
label define ancestr1_lbl 160 `"Mesknetian"', add
label define ancestr1_lbl 163 `"Yakut"', add
label define ancestr1_lbl 164 `"Soviet Union, nec"', add
label define ancestr1_lbl 165 `"Tatar"', add
label define ancestr1_lbl 169 `"Uzbek"', add
label define ancestr1_lbl 171 `"Ukrainian"', add
label define ancestr1_lbl 176 `"Yugoslavian"', add
label define ancestr1_lbl 178 `"Slav"', add
label define ancestr1_lbl 179 `"Slavonian"', add
label define ancestr1_lbl 181 `"Central European, nec"', add
label define ancestr1_lbl 183 `"Northern European, nec"', add
label define ancestr1_lbl 185 `"Southern European, nec"', add
label define ancestr1_lbl 187 `"Western European, nec"', add
label define ancestr1_lbl 190 `"Eastern European, nec"', add
label define ancestr1_lbl 195 `"European, nec"', add
label define ancestr1_lbl 200 `"Spaniard"', add
label define ancestr1_lbl 201 `"Andalusian"', add
label define ancestr1_lbl 202 `"Astorian"', add
label define ancestr1_lbl 204 `"Catalonian"', add
label define ancestr1_lbl 205 `"Balearic Islander"', add
label define ancestr1_lbl 206 `"Galician"', add
label define ancestr1_lbl 210 `"Mexican"', add
label define ancestr1_lbl 211 `"Mexican American"', add
label define ancestr1_lbl 213 `"Chicano/Chicana"', add
label define ancestr1_lbl 218 `"Nuevo Mexicano"', add
label define ancestr1_lbl 219 `"Californio"', add
label define ancestr1_lbl 221 `"Costa Rican"', add
label define ancestr1_lbl 222 `"Guatemalan"', add
label define ancestr1_lbl 223 `"Honduran"', add
label define ancestr1_lbl 224 `"Nicaraguan"', add
label define ancestr1_lbl 225 `"Panamanian"', add
label define ancestr1_lbl 226 `"Salvadoran"', add
label define ancestr1_lbl 227 `"Latin American"', add
label define ancestr1_lbl 231 `"Argentinean"', add
label define ancestr1_lbl 232 `"Bolivian"', add
label define ancestr1_lbl 233 `"Chilean"', add
label define ancestr1_lbl 234 `"Colombian"', add
label define ancestr1_lbl 235 `"Ecuadorian"', add
label define ancestr1_lbl 236 `"Paraguayan"', add
label define ancestr1_lbl 237 `"Peruvian"', add
label define ancestr1_lbl 238 `"Uruguayan"', add
label define ancestr1_lbl 239 `"Venezuelan"', add
label define ancestr1_lbl 248 `"South American"', add
label define ancestr1_lbl 261 `"Puerto Rican"', add
label define ancestr1_lbl 271 `"Cuban"', add
label define ancestr1_lbl 275 `"Dominican"', add
label define ancestr1_lbl 290 `"Hispanic"', add
label define ancestr1_lbl 291 `"Spanish"', add
label define ancestr1_lbl 295 `"Spanish American"', add
label define ancestr1_lbl 296 `"Other Spanish/Hispanic"', add
label define ancestr1_lbl 300 `"Bahamian"', add
label define ancestr1_lbl 301 `"Barbadian"', add
label define ancestr1_lbl 302 `"Belizean"', add
label define ancestr1_lbl 303 `"Bermudan"', add
label define ancestr1_lbl 304 `"Cayman Islander"', add
label define ancestr1_lbl 308 `"Jamaican"', add
label define ancestr1_lbl 310 `"Dutch West Indies"', add
label define ancestr1_lbl 311 `"Aruba Islander"', add
label define ancestr1_lbl 312 `"St Maarten Islander"', add
label define ancestr1_lbl 314 `"Trinidadian/Tobagonian"', add
label define ancestr1_lbl 315 `"Trinidadian"', add
label define ancestr1_lbl 316 `"Tobagonian"', add
label define ancestr1_lbl 317 `"U.S. Virgin Islander"', add
label define ancestr1_lbl 321 `"British Virgin Islander"', add
label define ancestr1_lbl 322 `"British West Indian"', add
label define ancestr1_lbl 323 `"Turks and Caicos Islander"', add
label define ancestr1_lbl 324 `"Anguilla Islander"', add
label define ancestr1_lbl 328 `"Dominica Islander"', add
label define ancestr1_lbl 329 `"Grenadian"', add
label define ancestr1_lbl 331 `"St Lucia Islander"', add
label define ancestr1_lbl 332 `"French West Indies"', add
label define ancestr1_lbl 333 `"Guadeloupe Islander"', add
label define ancestr1_lbl 334 `"Cayenne"', add
label define ancestr1_lbl 335 `"West Indian"', add
label define ancestr1_lbl 336 `"Haitian"', add
label define ancestr1_lbl 337 `"Other West Indian"', add
label define ancestr1_lbl 360 `"Brazilian"', add
label define ancestr1_lbl 365 `"San Andres"', add
label define ancestr1_lbl 370 `"Guyanese/British Guiana"', add
label define ancestr1_lbl 375 `"Providencia"', add
label define ancestr1_lbl 380 `"Surinam/Dutch Guiana"', add
label define ancestr1_lbl 400 `"Algerian"', add
label define ancestr1_lbl 402 `"Egyptian"', add
label define ancestr1_lbl 404 `"Libyan"', add
label define ancestr1_lbl 406 `"Moroccan"', add
label define ancestr1_lbl 407 `"Ifni"', add
label define ancestr1_lbl 408 `"Tunisian"', add
label define ancestr1_lbl 411 `"North African"', add
label define ancestr1_lbl 412 `"Alhucemas"', add
label define ancestr1_lbl 413 `"Berber"', add
label define ancestr1_lbl 414 `"Rio de Oro"', add
label define ancestr1_lbl 415 `"Bahraini"', add
label define ancestr1_lbl 416 `"Iranian"', add
label define ancestr1_lbl 417 `"Iraqi"', add
label define ancestr1_lbl 419 `"Israeli"', add
label define ancestr1_lbl 421 `"Jordanian"', add
label define ancestr1_lbl 423 `"Kuwaiti"', add
label define ancestr1_lbl 425 `"Lebanese"', add
label define ancestr1_lbl 427 `"Saudi Arabian"', add
label define ancestr1_lbl 429 `"Syrian"', add
label define ancestr1_lbl 431 `"Armenian"', add
label define ancestr1_lbl 434 `"Turkish"', add
label define ancestr1_lbl 435 `"Yemeni"', add
label define ancestr1_lbl 436 `"Omani"', add
label define ancestr1_lbl 437 `"Muscat"', add
label define ancestr1_lbl 438 `"Trucial Oman"', add
label define ancestr1_lbl 439 `"Qatar"', add
label define ancestr1_lbl 442 `"Kurdish"', add
label define ancestr1_lbl 444 `"Kuria Muria Islander"', add
label define ancestr1_lbl 465 `"Palestinian"', add
label define ancestr1_lbl 466 `"Gazan"', add
label define ancestr1_lbl 467 `"West Bank"', add
label define ancestr1_lbl 470 `"South Yemeni"', add
label define ancestr1_lbl 471 `"Aden"', add
label define ancestr1_lbl 480 `"United Arab Emirates"', add
label define ancestr1_lbl 482 `"Assyrian/Chaldean/Syriac"', add
label define ancestr1_lbl 490 `"Middle Eastern"', add
label define ancestr1_lbl 495 `"Arab"', add
label define ancestr1_lbl 496 `"Other Arab"', add
label define ancestr1_lbl 500 `"Angolan"', add
label define ancestr1_lbl 502 `"Benin"', add
label define ancestr1_lbl 504 `"Botswana"', add
label define ancestr1_lbl 506 `"Burundian"', add
label define ancestr1_lbl 508 `"Cameroonian"', add
label define ancestr1_lbl 510 `"Cape Verdean"', add
label define ancestr1_lbl 513 `"Chadian"', add
label define ancestr1_lbl 515 `"Congolese"', add
label define ancestr1_lbl 516 `"Congo-Brazzaville"', add
label define ancestr1_lbl 519 `"Djibouti"', add
label define ancestr1_lbl 520 `"Equatorial Guinea"', add
label define ancestr1_lbl 522 `"Ethiopian"', add
label define ancestr1_lbl 523 `"Eritrean"', add
label define ancestr1_lbl 525 `"Gabonese"', add
label define ancestr1_lbl 527 `"Gambian"', add
label define ancestr1_lbl 529 `"Ghanian"', add
label define ancestr1_lbl 530 `"Guinean"', add
label define ancestr1_lbl 531 `"Guinea Bissau"', add
label define ancestr1_lbl 532 `"Ivory Coast"', add
label define ancestr1_lbl 534 `"Kenyan"', add
label define ancestr1_lbl 538 `"Lesotho"', add
label define ancestr1_lbl 541 `"Liberian"', add
label define ancestr1_lbl 543 `"Madagascan"', add
label define ancestr1_lbl 545 `"Malawian"', add
label define ancestr1_lbl 546 `"Malian"', add
label define ancestr1_lbl 549 `"Mozambican"', add
label define ancestr1_lbl 550 `"Namibian"', add
label define ancestr1_lbl 551 `"Niger"', add
label define ancestr1_lbl 553 `"Nigerian"', add
label define ancestr1_lbl 554 `"Fulani"', add
label define ancestr1_lbl 555 `"Hausa"', add
label define ancestr1_lbl 556 `"Ibo"', add
label define ancestr1_lbl 557 `"Tiv"', add
label define ancestr1_lbl 561 `"Rwandan"', add
label define ancestr1_lbl 564 `"Senegalese"', add
label define ancestr1_lbl 566 `"Sierra Leonean"', add
label define ancestr1_lbl 568 `"Somalian"', add
label define ancestr1_lbl 569 `"Swaziland"', add
label define ancestr1_lbl 570 `"South African"', add
label define ancestr1_lbl 571 `"Union of South Africa"', add
label define ancestr1_lbl 572 `"Afrikaner"', add
label define ancestr1_lbl 573 `"Natalian"', add
label define ancestr1_lbl 574 `"Zulu"', add
label define ancestr1_lbl 576 `"Sudanese"', add
label define ancestr1_lbl 577 `"Dinka"', add
label define ancestr1_lbl 578 `"Nuer"', add
label define ancestr1_lbl 579 `"Fur"', add
label define ancestr1_lbl 582 `"Tanzanian"', add
label define ancestr1_lbl 583 `"Tanganyikan"', add
label define ancestr1_lbl 584 `"Zanzibar Islande"', add
label define ancestr1_lbl 586 `"Togo"', add
label define ancestr1_lbl 588 `"Ugandan"', add
label define ancestr1_lbl 589 `"Upper Voltan"', add
label define ancestr1_lbl 591 `"Zairian"', add
label define ancestr1_lbl 592 `"Zambian"', add
label define ancestr1_lbl 593 `"Zimbabwean"', add
label define ancestr1_lbl 594 `"African Islands"', add
label define ancestr1_lbl 595 `"Other Subsaharan Africa"', add
label define ancestr1_lbl 596 `"Central African"', add
label define ancestr1_lbl 597 `"East African"', add
label define ancestr1_lbl 598 `"West African"', add
label define ancestr1_lbl 599 `"African"', add
label define ancestr1_lbl 600 `"Afghan"', add
label define ancestr1_lbl 601 `"Baluchi"', add
label define ancestr1_lbl 602 `"Pathan"', add
label define ancestr1_lbl 603 `"Bengali"', add
label define ancestr1_lbl 607 `"Bhutanese"', add
label define ancestr1_lbl 609 `"Nepali"', add
label define ancestr1_lbl 615 `"Asian Indian"', add
label define ancestr1_lbl 622 `"Andaman Islander"', add
label define ancestr1_lbl 624 `"Andhra Pradesh"', add
label define ancestr1_lbl 626 `"Assamese"', add
label define ancestr1_lbl 628 `"Goanese"', add
label define ancestr1_lbl 630 `"Gujarati"', add
label define ancestr1_lbl 632 `"Karnatakan"', add
label define ancestr1_lbl 634 `"Keralan"', add
label define ancestr1_lbl 638 `"Maharashtran"', add
label define ancestr1_lbl 640 `"Madrasi"', add
label define ancestr1_lbl 642 `"Mysore"', add
label define ancestr1_lbl 644 `"Naga"', add
label define ancestr1_lbl 648 `"Pondicherry"', add
label define ancestr1_lbl 650 `"Punjabi"', add
label define ancestr1_lbl 656 `"Tamil"', add
label define ancestr1_lbl 675 `"East Indies"', add
label define ancestr1_lbl 680 `"Pakistani"', add
label define ancestr1_lbl 690 `"Sri Lankan"', add
label define ancestr1_lbl 691 `"Singhalese"', add
label define ancestr1_lbl 692 `"Veddah"', add
label define ancestr1_lbl 695 `"Maldivian"', add
label define ancestr1_lbl 700 `"Burmese"', add
label define ancestr1_lbl 702 `"Shan"', add
label define ancestr1_lbl 703 `"Cambodian"', add
label define ancestr1_lbl 704 `"Khmer"', add
label define ancestr1_lbl 706 `"Chinese"', add
label define ancestr1_lbl 707 `"Cantonese"', add
label define ancestr1_lbl 708 `"Manchurian"', add
label define ancestr1_lbl 709 `"Mandarin"', add
label define ancestr1_lbl 712 `"Mongolian"', add
label define ancestr1_lbl 714 `"Tibetan"', add
label define ancestr1_lbl 716 `"Hong Kong"', add
label define ancestr1_lbl 718 `"Macao"', add
label define ancestr1_lbl 720 `"Filipino"', add
label define ancestr1_lbl 730 `"Indonesian"', add
label define ancestr1_lbl 740 `"Japanese"', add
label define ancestr1_lbl 746 `"Ryukyu Islander"', add
label define ancestr1_lbl 748 `"Okinawan"', add
label define ancestr1_lbl 750 `"Korean"', add
label define ancestr1_lbl 765 `"Laotian"', add
label define ancestr1_lbl 766 `"Meo"', add
label define ancestr1_lbl 768 `"Hmong"', add
label define ancestr1_lbl 770 `"Malaysian"', add
label define ancestr1_lbl 774 `"Singaporean"', add
label define ancestr1_lbl 776 `"Thai"', add
label define ancestr1_lbl 777 `"Black Thai"', add
label define ancestr1_lbl 778 `"Western Lao"', add
label define ancestr1_lbl 782 `"Taiwanese"', add
label define ancestr1_lbl 785 `"Vietnamese"', add
label define ancestr1_lbl 786 `"Katu"', add
label define ancestr1_lbl 787 `"Ma"', add
label define ancestr1_lbl 788 `"Mnong"', add
label define ancestr1_lbl 790 `"Montagnard"', add
label define ancestr1_lbl 792 `"Indochinese"', add
label define ancestr1_lbl 793 `"Eurasian"', add
label define ancestr1_lbl 795 `"Asian"', add
label define ancestr1_lbl 796 `"Other Asian"', add
label define ancestr1_lbl 800 `"Australian"', add
label define ancestr1_lbl 801 `"Tasmanian"', add
label define ancestr1_lbl 802 `"Australian Aborigine"', add
label define ancestr1_lbl 803 `"New Zealander"', add
label define ancestr1_lbl 808 `"Polynesian"', add
label define ancestr1_lbl 810 `"Maori"', add
label define ancestr1_lbl 811 `"Hawaiian"', add
label define ancestr1_lbl 813 `"Part Hawaiian"', add
label define ancestr1_lbl 814 `"Samoan"', add
label define ancestr1_lbl 815 `"Tongan"', add
label define ancestr1_lbl 816 `"Tokelauan"', add
label define ancestr1_lbl 817 `"Cook Islander"', add
label define ancestr1_lbl 818 `"Tahitian"', add
label define ancestr1_lbl 819 `"Niuean"', add
label define ancestr1_lbl 820 `"Micronesian"', add
label define ancestr1_lbl 821 `"Guamanian"', add
label define ancestr1_lbl 822 `"Chamorro Islander"', add
label define ancestr1_lbl 823 `"Saipanese"', add
label define ancestr1_lbl 824 `"Palauan"', add
label define ancestr1_lbl 825 `"Marshall Islander"', add
label define ancestr1_lbl 826 `"Kosraean"', add
label define ancestr1_lbl 827 `"Ponapean"', add
label define ancestr1_lbl 828 `"Chuukese"', add
label define ancestr1_lbl 829 `"Yap Islander"', add
label define ancestr1_lbl 830 `"Caroline Islander"', add
label define ancestr1_lbl 831 `"Kiribatese"', add
label define ancestr1_lbl 832 `"Nauruan"', add
label define ancestr1_lbl 833 `"Tarawa Islander"', add
label define ancestr1_lbl 834 `"Tinian Islander"', add
label define ancestr1_lbl 840 `"Melanesian Islander"', add
label define ancestr1_lbl 841 `"Fijian"', add
label define ancestr1_lbl 843 `"New Guinean"', add
label define ancestr1_lbl 844 `"Papuan"', add
label define ancestr1_lbl 845 `"Solomon Islander"', add
label define ancestr1_lbl 846 `"New Caledonian Islander"', add
label define ancestr1_lbl 847 `"Vanuatuan"', add
label define ancestr1_lbl 850 `"Pacific Islander"', add
label define ancestr1_lbl 860 `"Oceania"', add
label define ancestr1_lbl 862 `"Chamolinian"', add
label define ancestr1_lbl 863 `"Reserved Codes"', add
label define ancestr1_lbl 870 `"Other Pacific"', add
label define ancestr1_lbl 900 `"Afro-American"', add
label define ancestr1_lbl 902 `"African-American"', add
label define ancestr1_lbl 913 `"Central American Indian"', add
label define ancestr1_lbl 914 `"South American Indian"', add
label define ancestr1_lbl 920 `"American Indian  (all tribes)"', add
label define ancestr1_lbl 921 `"Aleut"', add
label define ancestr1_lbl 922 `"Eskimo"', add
label define ancestr1_lbl 923 `"Inuit"', add
label define ancestr1_lbl 924 `"White/Caucasian"', add
label define ancestr1_lbl 930 `"Greenlander"', add
label define ancestr1_lbl 931 `"Canadian"', add
label define ancestr1_lbl 933 `"Newfoundland"', add
label define ancestr1_lbl 934 `"Nova Scotian"', add
label define ancestr1_lbl 935 `"French Canadian"', add
label define ancestr1_lbl 936 `"Acadian"', add
label define ancestr1_lbl 939 `"American"', add
label define ancestr1_lbl 940 `"United States"', add
label define ancestr1_lbl 941 `"Alabama"', add
label define ancestr1_lbl 942 `"Alaska"', add
label define ancestr1_lbl 943 `"Arizona"', add
label define ancestr1_lbl 944 `"Arkansas"', add
label define ancestr1_lbl 945 `"California"', add
label define ancestr1_lbl 946 `"Colorado"', add
label define ancestr1_lbl 947 `"Connecticut"', add
label define ancestr1_lbl 948 `"District of Columbia"', add
label define ancestr1_lbl 949 `"Delaware"', add
label define ancestr1_lbl 950 `"Florida"', add
label define ancestr1_lbl 951 `"Georgia"', add
label define ancestr1_lbl 952 `"Idaho"', add
label define ancestr1_lbl 953 `"Illinois"', add
label define ancestr1_lbl 954 `"Indiana"', add
label define ancestr1_lbl 955 `"Iowa"', add
label define ancestr1_lbl 956 `"Kansas"', add
label define ancestr1_lbl 957 `"Kentucky"', add
label define ancestr1_lbl 958 `"Louisiana"', add
label define ancestr1_lbl 959 `"Maine"', add
label define ancestr1_lbl 960 `"Maryland"', add
label define ancestr1_lbl 961 `"Massachusetts"', add
label define ancestr1_lbl 962 `"Michigan"', add
label define ancestr1_lbl 963 `"Minnesota"', add
label define ancestr1_lbl 964 `"Mississippi"', add
label define ancestr1_lbl 965 `"Missouri"', add
label define ancestr1_lbl 966 `"Montana"', add
label define ancestr1_lbl 967 `"Nebraska"', add
label define ancestr1_lbl 968 `"Nevada"', add
label define ancestr1_lbl 969 `"New Hampshire"', add
label define ancestr1_lbl 970 `"New Jersey"', add
label define ancestr1_lbl 971 `"New Mexico"', add
label define ancestr1_lbl 972 `"New York"', add
label define ancestr1_lbl 973 `"North Carolina"', add
label define ancestr1_lbl 974 `"North Dakota"', add
label define ancestr1_lbl 975 `"Ohio"', add
label define ancestr1_lbl 976 `"Oklahoma"', add
label define ancestr1_lbl 977 `"Oregon"', add
label define ancestr1_lbl 978 `"Pennsylvania"', add
label define ancestr1_lbl 979 `"Rhode Island"', add
label define ancestr1_lbl 980 `"South Carolina"', add
label define ancestr1_lbl 981 `"South Dakota"', add
label define ancestr1_lbl 982 `"Tennessee"', add
label define ancestr1_lbl 983 `"Texas"', add
label define ancestr1_lbl 984 `"Utah"', add
label define ancestr1_lbl 985 `"Vermont"', add
label define ancestr1_lbl 986 `"Virginia"', add
label define ancestr1_lbl 987 `"Washington"', add
label define ancestr1_lbl 988 `"West Virginia"', add
label define ancestr1_lbl 989 `"Wisconsin"', add
label define ancestr1_lbl 990 `"Wyoming"', add
label define ancestr1_lbl 993 `"Southerner"', add
label define ancestr1_lbl 994 `"North American"', add
label define ancestr1_lbl 995 `"Mixture"', add
label define ancestr1_lbl 996 `"Uncodable"', add
label define ancestr1_lbl 998 `"Other"', add
label define ancestr1_lbl 999 `"Not Reported"', add
label values ancestr1 ancestr1_lbl

label define ancestr1d_lbl 0010 `"Alsatian"'
label define ancestr1d_lbl 0020 `"Andorran"', add
label define ancestr1d_lbl 0030 `"Austrian"', add
label define ancestr1d_lbl 0040 `"Tirolean"', add
label define ancestr1d_lbl 0051 `"Basque (1980)"', add
label define ancestr1d_lbl 0052 `"Spanish Basque (1980)"', add
label define ancestr1d_lbl 0053 `"Basque (1990-2000,ACS)"', add
label define ancestr1d_lbl 0054 `"Spanish Basque (1990-2000, 2001-2004 ACS)"', add
label define ancestr1d_lbl 0060 `"French Basque"', add
label define ancestr1d_lbl 0080 `"Belgian"', add
label define ancestr1d_lbl 0090 `"Flemish"', add
label define ancestr1d_lbl 0100 `"Walloon"', add
label define ancestr1d_lbl 0110 `"British"', add
label define ancestr1d_lbl 0120 `"British Isles"', add
label define ancestr1d_lbl 0130 `"Channel Islander"', add
label define ancestr1d_lbl 0140 `"Gibraltan"', add
label define ancestr1d_lbl 0150 `"Cornish"', add
label define ancestr1d_lbl 0160 `"Corsican"', add
label define ancestr1d_lbl 0170 `"Cypriot"', add
label define ancestr1d_lbl 0180 `"Greek Cypriote"', add
label define ancestr1d_lbl 0190 `"Turkish Cypriote"', add
label define ancestr1d_lbl 0200 `"Danish"', add
label define ancestr1d_lbl 0210 `"Dutch"', add
label define ancestr1d_lbl 0211 `"Dutch-French-Irish"', add
label define ancestr1d_lbl 0212 `"Dutch-German-Irish"', add
label define ancestr1d_lbl 0213 `"Dutch-Irish-Scotch"', add
label define ancestr1d_lbl 0220 `"English"', add
label define ancestr1d_lbl 0221 `"English-French-German"', add
label define ancestr1d_lbl 0222 `"English-French-Irish"', add
label define ancestr1d_lbl 0223 `"English-German-Irish"', add
label define ancestr1d_lbl 0224 `"English-German-Swedish"', add
label define ancestr1d_lbl 0225 `"English-Irish-Scotch"', add
label define ancestr1d_lbl 0226 `"English-Scotch-Welsh"', add
label define ancestr1d_lbl 0230 `"Faeroe Islander"', add
label define ancestr1d_lbl 0240 `"Finnish"', add
label define ancestr1d_lbl 0250 `"Karelian"', add
label define ancestr1d_lbl 0260 `"French (1980)"', add
label define ancestr1d_lbl 0261 `"French (1990-2000,ACS, PRCS)"', add
label define ancestr1d_lbl 0262 `"Occitan (1990-2000)"', add
label define ancestr1d_lbl 0270 `"Lorrainian"', add
label define ancestr1d_lbl 0280 `"Breton"', add
label define ancestr1d_lbl 0290 `"Frisian"', add
label define ancestr1d_lbl 0300 `"Friulian"', add
label define ancestr1d_lbl 0320 `"German (1980)"', add
label define ancestr1d_lbl 0321 `"German (1990-2000, ACS, PRCS)"', add
label define ancestr1d_lbl 0322 `"Pennsylvania German (1990-2000, ACS, PRCS)"', add
label define ancestr1d_lbl 0323 `"East German (1990-2000)"', add
label define ancestr1d_lbl 0324 `"West German (1990-2000)"', add
label define ancestr1d_lbl 0325 `"German-French-Irish"', add
label define ancestr1d_lbl 0326 `"German-Irish-Italian"', add
label define ancestr1d_lbl 0327 `"German-Irish-Scotch"', add
label define ancestr1d_lbl 0328 `"German-Irish-Swedish"', add
label define ancestr1d_lbl 0329 `"Germanic"', add
label define ancestr1d_lbl 0330 `"Bavarian"', add
label define ancestr1d_lbl 0340 `"Berliner"', add
label define ancestr1d_lbl 0350 `"Hamburger"', add
label define ancestr1d_lbl 0360 `"Hanoverian"', add
label define ancestr1d_lbl 0370 `"Hessian"', add
label define ancestr1d_lbl 0380 `"Lubecker"', add
label define ancestr1d_lbl 0390 `"Pomeranian (1980)"', add
label define ancestr1d_lbl 0391 `"Pomeranian (1990-2000)"', add
label define ancestr1d_lbl 0392 `"Silesian (1990-2000)"', add
label define ancestr1d_lbl 0400 `"Prussian"', add
label define ancestr1d_lbl 0410 `"Saxon"', add
label define ancestr1d_lbl 0420 `"Sudetenlander"', add
label define ancestr1d_lbl 0430 `"Westphalian"', add
label define ancestr1d_lbl 0460 `"Greek"', add
label define ancestr1d_lbl 0470 `"Cretan"', add
label define ancestr1d_lbl 0480 `"Cycladic Islander, Dodecanese Islander, Peloponnesian"', add
label define ancestr1d_lbl 0490 `"Icelander"', add
label define ancestr1d_lbl 0500 `"Irish, various subheads,"', add
label define ancestr1d_lbl 0501 `"Celtic"', add
label define ancestr1d_lbl 0502 `"Irish Scotch"', add
label define ancestr1d_lbl 0510 `"Italian (1980)"', add
label define ancestr1d_lbl 0511 `"Italian (1990-2000, ACS, PRCS)"', add
label define ancestr1d_lbl 0512 `"Trieste (1990-2000)"', add
label define ancestr1d_lbl 0513 `"San Marino (1990-2000)"', add
label define ancestr1d_lbl 0530 `"Abruzzi"', add
label define ancestr1d_lbl 0540 `"Apulian"', add
label define ancestr1d_lbl 0550 `"Basilicata, Lucanian"', add
label define ancestr1d_lbl 0560 `"Calabrian"', add
label define ancestr1d_lbl 0570 `"Amalfin"', add
label define ancestr1d_lbl 0580 `"Emilia Romagna"', add
label define ancestr1d_lbl 0590 `"Rome"', add
label define ancestr1d_lbl 0600 `"Ligurian"', add
label define ancestr1d_lbl 0610 `"Lombardian"', add
label define ancestr1d_lbl 0620 `"Marches"', add
label define ancestr1d_lbl 0630 `"Molise"', add
label define ancestr1d_lbl 0640 `"Neapolitan"', add
label define ancestr1d_lbl 0650 `"Piedmontese"', add
label define ancestr1d_lbl 0660 `"Puglia"', add
label define ancestr1d_lbl 0670 `"Sardinian"', add
label define ancestr1d_lbl 0680 `"Sicilian"', add
label define ancestr1d_lbl 0690 `"Tuscan"', add
label define ancestr1d_lbl 0700 `"Trentino"', add
label define ancestr1d_lbl 0710 `"Umbrian"', add
label define ancestr1d_lbl 0720 `"Valle dAosta"', add
label define ancestr1d_lbl 0730 `"Venetian"', add
label define ancestr1d_lbl 0750 `"Lapp"', add
label define ancestr1d_lbl 0760 `"Liechtensteiner"', add
label define ancestr1d_lbl 0770 `"Luxemburger"', add
label define ancestr1d_lbl 0780 `"Maltese"', add
label define ancestr1d_lbl 0790 `"Manx"', add
label define ancestr1d_lbl 0800 `"Monegasque"', add
label define ancestr1d_lbl 0810 `"Northern Irelander"', add
label define ancestr1d_lbl 0820 `"Norwegian"', add
label define ancestr1d_lbl 0840 `"Portuguese"', add
label define ancestr1d_lbl 0850 `"Azorean"', add
label define ancestr1d_lbl 0860 `"Madeiran"', add
label define ancestr1d_lbl 0870 `"Scotch Irish"', add
label define ancestr1d_lbl 0880 `"Scottish"', add
label define ancestr1d_lbl 0890 `"Swedish"', add
label define ancestr1d_lbl 0900 `"Aland Islander"', add
label define ancestr1d_lbl 0910 `"Swiss"', add
label define ancestr1d_lbl 0920 `"Suisse (1980)"', add
label define ancestr1d_lbl 0921 `"Suisse (1990-2000)"', add
label define ancestr1d_lbl 0922 `"Switzer (1990-2000)"', add
label define ancestr1d_lbl 0950 `"Romansch (1980)"', add
label define ancestr1d_lbl 0951 `"Romansch (1990-2000)"', add
label define ancestr1d_lbl 0952 `"Ladin (1990-2000)"', add
label define ancestr1d_lbl 0960 `"Suisse Romane (1990-2000)"', add
label define ancestr1d_lbl 0961 `"Suisse Romane (1980)"', add
label define ancestr1d_lbl 0962 `"Ticino"', add
label define ancestr1d_lbl 0970 `"Welsh"', add
label define ancestr1d_lbl 0980 `"Scandinavian, Nordic"', add
label define ancestr1d_lbl 1000 `"Albanian"', add
label define ancestr1d_lbl 1010 `"Azerbaijani"', add
label define ancestr1d_lbl 1020 `"Belourussian"', add
label define ancestr1d_lbl 1030 `"Bulgarian"', add
label define ancestr1d_lbl 1050 `"Carpathian"', add
label define ancestr1d_lbl 1051 `"Carpatho Rusyn"', add
label define ancestr1d_lbl 1052 `"Rusyn"', add
label define ancestr1d_lbl 1080 `"Cossack (1990-2000)"', add
label define ancestr1d_lbl 1081 `"Cossack (1980)"', add
label define ancestr1d_lbl 1082 `"Turkestani (1990-2000, 2012 ACS)"', add
label define ancestr1d_lbl 1083 `"Kirghiz (1980)"', add
label define ancestr1d_lbl 1084 `"Turcoman (1980)"', add
label define ancestr1d_lbl 1090 `"Croatian"', add
label define ancestr1d_lbl 1110 `"Czechoslovakian"', add
label define ancestr1d_lbl 1111 `"Czech"', add
label define ancestr1d_lbl 1120 `"Bohemian (1980)"', add
label define ancestr1d_lbl 1121 `"Bohemian (1990-2000, ACS, PRCS)"', add
label define ancestr1d_lbl 1122 `"Moravian (1990-2000)"', add
label define ancestr1d_lbl 1150 `"Estonian"', add
label define ancestr1d_lbl 1160 `"Livonian"', add
label define ancestr1d_lbl 1170 `"Finno Ugrian (1990-2000)"', add
label define ancestr1d_lbl 1171 `"Udmert"', add
label define ancestr1d_lbl 1180 `"Mordovian"', add
label define ancestr1d_lbl 1190 `"Voytak"', add
label define ancestr1d_lbl 1200 `"Georgian"', add
label define ancestr1d_lbl 1220 `"Germans from Russia"', add
label define ancestr1d_lbl 1221 `"Volga"', add
label define ancestr1d_lbl 1222 `"German from Russia (1990-2000); German Russian (ACS)"', add
label define ancestr1d_lbl 1230 `"Gruziia (1990-2000)"', add
label define ancestr1d_lbl 1240 `"Rom"', add
label define ancestr1d_lbl 1250 `"Hungarian"', add
label define ancestr1d_lbl 1260 `"Magyar"', add
label define ancestr1d_lbl 1280 `"Latvian"', add
label define ancestr1d_lbl 1290 `"Lithuanian"', add
label define ancestr1d_lbl 1300 `"Macedonian"', add
label define ancestr1d_lbl 1320 `"North Caucasian"', add
label define ancestr1d_lbl 1330 `"North Caucasian Turkic (1990-2000)"', add
label define ancestr1d_lbl 1400 `"Ossetian"', add
label define ancestr1d_lbl 1420 `"Polish"', add
label define ancestr1d_lbl 1430 `"Kashubian"', add
label define ancestr1d_lbl 1440 `"Romanian (1990-2000, ACS, PRCS)"', add
label define ancestr1d_lbl 1441 `"Romanian (1980)"', add
label define ancestr1d_lbl 1442 `"Transylvanian"', add
label define ancestr1d_lbl 1450 `"Bessarabian (1980)"', add
label define ancestr1d_lbl 1451 `"Bessarabian (1990-2000)"', add
label define ancestr1d_lbl 1452 `"Bucovina"', add
label define ancestr1d_lbl 1460 `"Moldavian"', add
label define ancestr1d_lbl 1470 `"Wallachian"', add
label define ancestr1d_lbl 1480 `"Russian"', add
label define ancestr1d_lbl 1500 `"Muscovite"', add
label define ancestr1d_lbl 1520 `"Serbian (1980)"', add
label define ancestr1d_lbl 1521 `"Serbian (1990-2000, ACS, PRCS)"', add
label define ancestr1d_lbl 1522 `"Bosnian (1990), Herzegovinian (2000, ACS, PRCS) "', add
label define ancestr1d_lbl 1523 `"Montenegrin (1990-2000, 2012 ACS)"', add
label define ancestr1d_lbl 1530 `"Slovak"', add
label define ancestr1d_lbl 1540 `"Slovene"', add
label define ancestr1d_lbl 1550 `"Sorb/Wend"', add
label define ancestr1d_lbl 1560 `"Soviet Turkic (1990-2000)"', add
label define ancestr1d_lbl 1570 `"Bashkir"', add
label define ancestr1d_lbl 1580 `"Chevash"', add
label define ancestr1d_lbl 1590 `"Gagauz (1990-2000)"', add
label define ancestr1d_lbl 1600 `"Mesknetian (1990-2000)"', add
label define ancestr1d_lbl 1630 `"Yakut"', add
label define ancestr1d_lbl 1640 `"Soviet Union, nec"', add
label define ancestr1d_lbl 1650 `"Tatar (1990-2000)"', add
label define ancestr1d_lbl 1651 `"Tatar (1980)"', add
label define ancestr1d_lbl 1652 `"Crimean (1980)"', add
label define ancestr1d_lbl 1653 `"Tuvinian (1990-2000)"', add
label define ancestr1d_lbl 1654 `"Soviet Central Asian (1990-2000)"', add
label define ancestr1d_lbl 1655 `"Tadzhik (1980, 2000)"', add
label define ancestr1d_lbl 1690 `"Uzbek"', add
label define ancestr1d_lbl 1710 `"Ukrainian (1980)"', add
label define ancestr1d_lbl 1711 `"Ukrainian (1990-2000, ACS, PRCS)"', add
label define ancestr1d_lbl 1712 `"Ruthenian (1980)"', add
label define ancestr1d_lbl 1713 `"Ruthenian (1990-2000)"', add
label define ancestr1d_lbl 1714 `"Lemko"', add
label define ancestr1d_lbl 1715 `"Bioko"', add
label define ancestr1d_lbl 1716 `"Hesel"', add
label define ancestr1d_lbl 1717 `"Windish"', add
label define ancestr1d_lbl 1760 `"Yugoslavian"', add
label define ancestr1d_lbl 1780 `"Slav"', add
label define ancestr1d_lbl 1790 `"Slavonian"', add
label define ancestr1d_lbl 1810 `"Central European, nec"', add
label define ancestr1d_lbl 1830 `"Northern European, nec"', add
label define ancestr1d_lbl 1850 `"Southern European, nec"', add
label define ancestr1d_lbl 1870 `"Western European, nec"', add
label define ancestr1d_lbl 1900 `"Eastern European, nec"', add
label define ancestr1d_lbl 1950 `"European, nec"', add
label define ancestr1d_lbl 2000 `"Spaniard (1980)"', add
label define ancestr1d_lbl 2001 `"Spaniard (1990-2000, ACS, PRCS)"', add
label define ancestr1d_lbl 2002 `"Castillan (1990-2000)"', add
label define ancestr1d_lbl 2003 `"Velencian (1990-2000)"', add
label define ancestr1d_lbl 2010 `"Andalusian (1990-2000)"', add
label define ancestr1d_lbl 2020 `"Asturian (1990-2000)"', add
label define ancestr1d_lbl 2040 `"Catalonian"', add
label define ancestr1d_lbl 2050 `"Balearic Islander (1980)"', add
label define ancestr1d_lbl 2051 `"Balearic Islander (1990-2000)"', add
label define ancestr1d_lbl 2052 `"Canary Islander (1990-2000)"', add
label define ancestr1d_lbl 2060 `"Galician (1980)"', add
label define ancestr1d_lbl 2061 `"Gallego (1990-2000)"', add
label define ancestr1d_lbl 2062 `"Galician (1990-2000)"', add
label define ancestr1d_lbl 2100 `"Mexican"', add
label define ancestr1d_lbl 2101 `"Mexican (1990-2000, ACS, PRCS)"', add
label define ancestr1d_lbl 2102 `"Mexicano/Mexicana (1990-2000, ACS, PRCS)"', add
label define ancestr1d_lbl 2103 `"Mexican Indian"', add
label define ancestr1d_lbl 2110 `"Mexican American"', add
label define ancestr1d_lbl 2111 `"Mexican American Indian"', add
label define ancestr1d_lbl 2130 `"Chicano/Chicana"', add
label define ancestr1d_lbl 2180 `"Nuevo Mexicano"', add
label define ancestr1d_lbl 2181 `"Nuevo Mexicano (1990-2000)"', add
label define ancestr1d_lbl 2182 `"La Raza (1990-2000)"', add
label define ancestr1d_lbl 2183 `"Mexican state (1990-2000, ACS, PRCS)"', add
label define ancestr1d_lbl 2184 `"Tejano/Tejana (1990-2000)"', add
label define ancestr1d_lbl 2190 `"Californio"', add
label define ancestr1d_lbl 2210 `"Costa Rican"', add
label define ancestr1d_lbl 2220 `"Guatemalan"', add
label define ancestr1d_lbl 2230 `"Honduran"', add
label define ancestr1d_lbl 2240 `"Nicaraguan"', add
label define ancestr1d_lbl 2250 `"Panamanian (1980)"', add
label define ancestr1d_lbl 2251 `"Panamanian (1990-2000, ACS, PRCS)"', add
label define ancestr1d_lbl 2252 `"Canal Zone (1990-2000)"', add
label define ancestr1d_lbl 2260 `"Salvadoran"', add
label define ancestr1d_lbl 2270 `"Latin American (1980)"', add
label define ancestr1d_lbl 2271 `"Central American (1990-2000, ACS, PRCS)"', add
label define ancestr1d_lbl 2272 `"Latin American (1990-2000, ACS, PRCS)"', add
label define ancestr1d_lbl 2273 `"Latino/Latina (1990-2000, ACS, PRCS)"', add
label define ancestr1d_lbl 2274 `"Latin (1990-2000, ACS, PRCS)"', add
label define ancestr1d_lbl 2310 `"Argentinean"', add
label define ancestr1d_lbl 2320 `"Bolivian"', add
label define ancestr1d_lbl 2330 `"Chilean"', add
label define ancestr1d_lbl 2340 `"Colombian"', add
label define ancestr1d_lbl 2350 `"Ecuadorian"', add
label define ancestr1d_lbl 2360 `"Paraguayan"', add
label define ancestr1d_lbl 2370 `"Peruvian"', add
label define ancestr1d_lbl 2380 `"Uruguayan"', add
label define ancestr1d_lbl 2390 `"Venezuelan"', add
label define ancestr1d_lbl 2480 `"South American (1980)"', add
label define ancestr1d_lbl 2481 `"South American (1990-2000, ACS, PRCS)"', add
label define ancestr1d_lbl 2482 `"Criollo/Criolla (1990-2000)"', add
label define ancestr1d_lbl 2610 `"Puerto Rican"', add
label define ancestr1d_lbl 2710 `"Cuban"', add
label define ancestr1d_lbl 2750 `"Dominican"', add
label define ancestr1d_lbl 2900 `"Hispanic"', add
label define ancestr1d_lbl 2910 `"Spanish"', add
label define ancestr1d_lbl 2950 `"Spanish American"', add
label define ancestr1d_lbl 2960 `"Other Spanish/Hispanic"', add
label define ancestr1d_lbl 3000 `"Bahamian"', add
label define ancestr1d_lbl 3010 `"Barbadian"', add
label define ancestr1d_lbl 3020 `"Belizean"', add
label define ancestr1d_lbl 3030 `"Bermudan"', add
label define ancestr1d_lbl 3040 `"Cayman Islander"', add
label define ancestr1d_lbl 3080 `"Jamaican"', add
label define ancestr1d_lbl 3100 `"Dutch West Indies"', add
label define ancestr1d_lbl 3110 `"Aruba Islander"', add
label define ancestr1d_lbl 3120 `"St Maarten Islander"', add
label define ancestr1d_lbl 3140 `"Trinidadian/Tobagonian"', add
label define ancestr1d_lbl 3150 `"Trinidadian"', add
label define ancestr1d_lbl 3160 `"Tobagonian"', add
label define ancestr1d_lbl 3170 `"U.S. Virgin Islander (1980)"', add
label define ancestr1d_lbl 3171 `"U.S. Virgin Islander (1990-2000)"', add
label define ancestr1d_lbl 3172 `"St. Croix Islander (1990-2000)"', add
label define ancestr1d_lbl 3173 `"St. John Islander (1990-2000)"', add
label define ancestr1d_lbl 3174 `"St. Thomas Islander (1990-2000)"', add
label define ancestr1d_lbl 3210 `"British Virgin Islander (1980)"', add
label define ancestr1d_lbl 3211 `"British Virgin Islander (1990-2000)"', add
label define ancestr1d_lbl 3212 `"Antigua (1990-2000, ACS, PRCS)"', add
label define ancestr1d_lbl 3220 `"British West Indian"', add
label define ancestr1d_lbl 3230 `"Turks and Caicos Islander"', add
label define ancestr1d_lbl 3240 `"Anguilla Islander (1980)"', add
label define ancestr1d_lbl 3241 `"Anguilla Islander (1990-2000)"', add
label define ancestr1d_lbl 3242 `"Montserrat Islander (1990-2000)"', add
label define ancestr1d_lbl 3243 `"Kitts/Nevis Islander (1990-2000)"', add
label define ancestr1d_lbl 3244 `"St. Christopher (1980)"', add
label define ancestr1d_lbl 3245 `"St Vincent Islander (1990); Vincent-Grenadine Islander (2000 Census, 2005 ACS, 2005 PRCS)"', add
label define ancestr1d_lbl 3280 `"Dominica Islander"', add
label define ancestr1d_lbl 3290 `"Grenadian"', add
label define ancestr1d_lbl 3310 `"St Lucia Islander"', add
label define ancestr1d_lbl 3320 `"French West Indian"', add
label define ancestr1d_lbl 3330 `"Guadeloupe Islander"', add
label define ancestr1d_lbl 3340 `"Cayenne"', add
label define ancestr1d_lbl 3350 `"West Indian (1990-2000, ACS, PRCS)"', add
label define ancestr1d_lbl 3351 `"West Indian (1980)"', add
label define ancestr1d_lbl 3352 `"Caribbean (1980)"', add
label define ancestr1d_lbl 3353 `"Arawak (1980)"', add
label define ancestr1d_lbl 3360 `"Haitian"', add
label define ancestr1d_lbl 3370 `"Other West Indian"', add
label define ancestr1d_lbl 3600 `"Brazilian"', add
label define ancestr1d_lbl 3650 `"San Andres"', add
label define ancestr1d_lbl 3700 `"Guyanese/British Guiana"', add
label define ancestr1d_lbl 3750 `"Providencia"', add
label define ancestr1d_lbl 3800 `"Surinam/Dutch Guiana"', add
label define ancestr1d_lbl 4000 `"Algerian"', add
label define ancestr1d_lbl 4020 `"Egyptian"', add
label define ancestr1d_lbl 4040 `"Libyan"', add
label define ancestr1d_lbl 4060 `"Moroccan (1990-2000, ACS, PRCS)"', add
label define ancestr1d_lbl 4061 `"Moroccan (1980)"', add
label define ancestr1d_lbl 4062 `"Moor (1980)"', add
label define ancestr1d_lbl 4070 `"Ifni"', add
label define ancestr1d_lbl 4080 `"Tunisian"', add
label define ancestr1d_lbl 4110 `"North African"', add
label define ancestr1d_lbl 4120 `"Alhucemas"', add
label define ancestr1d_lbl 4130 `"Berber"', add
label define ancestr1d_lbl 4140 `"Rio de Oro"', add
label define ancestr1d_lbl 4150 `"Bahraini"', add
label define ancestr1d_lbl 4160 `"Iranian"', add
label define ancestr1d_lbl 4170 `"Iraqi"', add
label define ancestr1d_lbl 4190 `"Israeli"', add
label define ancestr1d_lbl 4210 `"Jordanian"', add
label define ancestr1d_lbl 4220 `"Transjordan"', add
label define ancestr1d_lbl 4230 `"Kuwaiti"', add
label define ancestr1d_lbl 4250 `"Lebanese"', add
label define ancestr1d_lbl 4270 `"Saudi Arabian"', add
label define ancestr1d_lbl 4290 `"Syrian (1990-2000, ACS, PRCS)"', add
label define ancestr1d_lbl 4291 `"Syrian (1980)"', add
label define ancestr1d_lbl 4292 `"Latakian (1980)"', add
label define ancestr1d_lbl 4293 `"Jebel Druse (1980)"', add
label define ancestr1d_lbl 4310 `"Armenian"', add
label define ancestr1d_lbl 4340 `"Turkish"', add
label define ancestr1d_lbl 4350 `"Yemeni"', add
label define ancestr1d_lbl 4360 `"Omani"', add
label define ancestr1d_lbl 4370 `"Muscat"', add
label define ancestr1d_lbl 4380 `"Trucial Oman"', add
label define ancestr1d_lbl 4390 `"Qatar"', add
label define ancestr1d_lbl 4410 `"Bedouin"', add
label define ancestr1d_lbl 4420 `"Kurdish"', add
label define ancestr1d_lbl 4440 `"Kuria Muria Islander"', add
label define ancestr1d_lbl 4650 `"Palestinian"', add
label define ancestr1d_lbl 4660 `"Gazan"', add
label define ancestr1d_lbl 4670 `"West Bank"', add
label define ancestr1d_lbl 4700 `"South Yemeni"', add
label define ancestr1d_lbl 4710 `"Aden"', add
label define ancestr1d_lbl 4800 `"United Arab Emirates"', add
label define ancestr1d_lbl 4820 `"Assyrian/Chaldean/Syriac (1990-2000)"', add
label define ancestr1d_lbl 4821 `"Assyrian "', add
label define ancestr1d_lbl 4822 `"Syriac (1980, 2000)"', add
label define ancestr1d_lbl 4823 `"Chaldean (2000, ACS, PRCS)"', add
label define ancestr1d_lbl 4900 `"Middle Eastern"', add
label define ancestr1d_lbl 4950 `"Arab"', add
label define ancestr1d_lbl 4951 `"Arabic (1990-2000, ACS, PRCS)"', add
label define ancestr1d_lbl 4960 `"Other Arab"', add
label define ancestr1d_lbl 5000 `"Angolan"', add
label define ancestr1d_lbl 5020 `"Benin"', add
label define ancestr1d_lbl 5040 `"Botswana"', add
label define ancestr1d_lbl 5060 `"Burundian"', add
label define ancestr1d_lbl 5080 `"Cameroonian"', add
label define ancestr1d_lbl 5100 `"Cape Verdean"', add
label define ancestr1d_lbl 5120 `"Central African Republic"', add
label define ancestr1d_lbl 5130 `"Chadian"', add
label define ancestr1d_lbl 5150 `"Congolese"', add
label define ancestr1d_lbl 5160 `"Congo-Brazzaville"', add
label define ancestr1d_lbl 5190 `"Djibouti"', add
label define ancestr1d_lbl 5200 `"Equatorial Guinea"', add
label define ancestr1d_lbl 5210 `"Corsico Islander"', add
label define ancestr1d_lbl 5220 `"Ethiopian"', add
label define ancestr1d_lbl 5230 `"Eritrean"', add
label define ancestr1d_lbl 5250 `"Gabonese"', add
label define ancestr1d_lbl 5270 `"Gambian"', add
label define ancestr1d_lbl 5290 `"Ghanian"', add
label define ancestr1d_lbl 5300 `"Guinean"', add
label define ancestr1d_lbl 5310 `"Guinea Bissau"', add
label define ancestr1d_lbl 5320 `"Ivory Coast"', add
label define ancestr1d_lbl 5340 `"Kenyan"', add
label define ancestr1d_lbl 5380 `"Lesotho"', add
label define ancestr1d_lbl 5410 `"Liberian"', add
label define ancestr1d_lbl 5430 `"Madagascan"', add
label define ancestr1d_lbl 5450 `"Malawian"', add
label define ancestr1d_lbl 5460 `"Malian"', add
label define ancestr1d_lbl 5470 `"Mauritanian"', add
label define ancestr1d_lbl 5490 `"Mozambican"', add
label define ancestr1d_lbl 5500 `"Namibian"', add
label define ancestr1d_lbl 5510 `"Niger"', add
label define ancestr1d_lbl 5530 `"Nigerian"', add
label define ancestr1d_lbl 5540 `"Fulani"', add
label define ancestr1d_lbl 5550 `"Hausa"', add
label define ancestr1d_lbl 5560 `"Ibo"', add
label define ancestr1d_lbl 5570 `"Tiv (1980)"', add
label define ancestr1d_lbl 5571 `"Tiv (1990-2000)"', add
label define ancestr1d_lbl 5572 `"Yoruba (1990-2000)"', add
label define ancestr1d_lbl 5610 `"Rwandan"', add
label define ancestr1d_lbl 5640 `"Senegalese"', add
label define ancestr1d_lbl 5660 `"Sierra Leonean"', add
label define ancestr1d_lbl 5680 `"Somalian"', add
label define ancestr1d_lbl 5690 `"Swaziland"', add
label define ancestr1d_lbl 5700 `"South African"', add
label define ancestr1d_lbl 5710 `"Union of South Africa"', add
label define ancestr1d_lbl 5720 `"Afrikaner"', add
label define ancestr1d_lbl 5730 `"Natalian"', add
label define ancestr1d_lbl 5740 `"Zulu"', add
label define ancestr1d_lbl 5760 `"Sudanese"', add
label define ancestr1d_lbl 5770 `"Dinka"', add
label define ancestr1d_lbl 5780 `"Nuer"', add
label define ancestr1d_lbl 5790 `"Fur"', add
label define ancestr1d_lbl 5800 `"Baggara"', add
label define ancestr1d_lbl 5820 `"Tanzanian"', add
label define ancestr1d_lbl 5830 `"Tanganyikan"', add
label define ancestr1d_lbl 5840 `"Zanzibar"', add
label define ancestr1d_lbl 5860 `"Togo"', add
label define ancestr1d_lbl 5880 `"Ugandan"', add
label define ancestr1d_lbl 5890 `"Upper Voltan"', add
label define ancestr1d_lbl 5900 `"Voltan"', add
label define ancestr1d_lbl 5910 `"Zairian"', add
label define ancestr1d_lbl 5920 `"Zambian"', add
label define ancestr1d_lbl 5930 `"Zimbabwean"', add
label define ancestr1d_lbl 5940 `"African Islands (1980)"', add
label define ancestr1d_lbl 5941 `"African Islands (1990-2000)"', add
label define ancestr1d_lbl 5942 `"Mauritius (1990-2000)"', add
label define ancestr1d_lbl 5950 `"Other Subsaharan Africa"', add
label define ancestr1d_lbl 5960 `"Central African, Middle Congo"', add
label define ancestr1d_lbl 5970 `"East African"', add
label define ancestr1d_lbl 5980 `"West African"', add
label define ancestr1d_lbl 5990 `"African"', add
label define ancestr1d_lbl 6000 `"Afghan"', add
label define ancestr1d_lbl 6010 `"Baluchi"', add
label define ancestr1d_lbl 6020 `"Pathan"', add
label define ancestr1d_lbl 6030 `"Bengali (1980)"', add
label define ancestr1d_lbl 6031 `"Bangladeshi (1990-2000, ACS, PRCS)"', add
label define ancestr1d_lbl 6032 `"Bengali (1990-2000, ACS, PRCS)"', add
label define ancestr1d_lbl 6070 `"Bhutanese"', add
label define ancestr1d_lbl 6090 `"Nepali"', add
label define ancestr1d_lbl 6150 `"Asian Indian (1980)"', add
label define ancestr1d_lbl 6151 `"India (1990-2000, ACS, PRCS)"', add
label define ancestr1d_lbl 6152 `"East Indian (1990-2000, ACS, PRCS)"', add
label define ancestr1d_lbl 6153 `"Madya Pradesh (1990-2000)"', add
label define ancestr1d_lbl 6154 `"Orissa (1990-2000)"', add
label define ancestr1d_lbl 6155 `"Rajasthani (1990-2000)"', add
label define ancestr1d_lbl 6156 `"Sikkim (1990-2000)"', add
label define ancestr1d_lbl 6157 `"Uttar Pradesh (1990-2000)"', add
label define ancestr1d_lbl 6220 `"Andaman Islander"', add
label define ancestr1d_lbl 6240 `"Andhra Pradesh"', add
label define ancestr1d_lbl 6260 `"Assamese"', add
label define ancestr1d_lbl 6280 `"Goanese"', add
label define ancestr1d_lbl 6300 `"Gujarati"', add
label define ancestr1d_lbl 6320 `"Karnatakan"', add
label define ancestr1d_lbl 6340 `"Keralan"', add
label define ancestr1d_lbl 6380 `"Maharashtran"', add
label define ancestr1d_lbl 6400 `"Madrasi"', add
label define ancestr1d_lbl 6420 `"Mysore"', add
label define ancestr1d_lbl 6440 `"Naga"', add
label define ancestr1d_lbl 6480 `"Pondicherry"', add
label define ancestr1d_lbl 6500 `"Punjabi"', add
label define ancestr1d_lbl 6560 `"Tamil"', add
label define ancestr1d_lbl 6750 `"East Indies (1990-2000)"', add
label define ancestr1d_lbl 6800 `"Pakistani (1980)"', add
label define ancestr1d_lbl 6801 `"Pakistani (1990-2000, ACS, PRCS)"', add
label define ancestr1d_lbl 6802 `"Kashmiri (1990-2000)"', add
label define ancestr1d_lbl 6900 `"Sri Lankan"', add
label define ancestr1d_lbl 6910 `"Singhalese"', add
label define ancestr1d_lbl 6920 `"Veddah"', add
label define ancestr1d_lbl 6950 `"Maldivian"', add
label define ancestr1d_lbl 7000 `"Burmese (1990-2000, ACS, PRCS)"', add
label define ancestr1d_lbl 7001 `"Burmese (1980)"', add
label define ancestr1d_lbl 7002 `"Burman (1980)"', add
label define ancestr1d_lbl 7020 `"Shan"', add
label define ancestr1d_lbl 7030 `"Cambodian"', add
label define ancestr1d_lbl 7040 `"Khmer"', add
label define ancestr1d_lbl 7060 `"Chinese"', add
label define ancestr1d_lbl 7070 `"Cantonese (1980)"', add
label define ancestr1d_lbl 7071 `"Cantonese (1990-2000, ACS, PRCS)"', add
label define ancestr1d_lbl 7072 `"Formosan (1990-2000)"', add
label define ancestr1d_lbl 7080 `"Manchurian"', add
label define ancestr1d_lbl 7090 `"Mandarin (1990-2000)"', add
label define ancestr1d_lbl 7120 `"Mongolian (1980)"', add
label define ancestr1d_lbl 7121 `"Mongolian (1990-2000, ACS, PRCS)"', add
label define ancestr1d_lbl 7122 `"Kalmyk (1990-2000)"', add
label define ancestr1d_lbl 7140 `"Tibetan"', add
label define ancestr1d_lbl 7160 `"Hong Kong (1990-2000)"', add
label define ancestr1d_lbl 7161 `"Hong Kong (1980)"', add
label define ancestr1d_lbl 7162 `"Eastern Archipelgo (1980)"', add
label define ancestr1d_lbl 7180 `"Macao"', add
label define ancestr1d_lbl 7200 `"Filipino"', add
label define ancestr1d_lbl 7300 `"Indonesian (1980)"', add
label define ancestr1d_lbl 7301 `"Indonesian (1990-2000, ACS, PRCS)"', add
label define ancestr1d_lbl 7302 `"Borneo (1990-2000)"', add
label define ancestr1d_lbl 7303 `"Java (1990-2000)"', add
label define ancestr1d_lbl 7304 `"Sumatran (1990-2000)"', add
label define ancestr1d_lbl 7400 `"Japanese (1980)"', add
label define ancestr1d_lbl 7401 `"Japanese (1990-2000, ACS, PRCS)"', add
label define ancestr1d_lbl 7402 `"Issei (1990-2000)"', add
label define ancestr1d_lbl 7403 `"Nisei (1990-2000)"', add
label define ancestr1d_lbl 7404 `"Sansei (1990-2000)"', add
label define ancestr1d_lbl 7405 `"Yonsei (1990-2000)"', add
label define ancestr1d_lbl 7406 `"Gosei (1990-2000)"', add
label define ancestr1d_lbl 7460 `"Ryukyu Islander"', add
label define ancestr1d_lbl 7480 `"Okinawan"', add
label define ancestr1d_lbl 7500 `"Korean"', add
label define ancestr1d_lbl 7650 `"Laotian"', add
label define ancestr1d_lbl 7660 `"Meo"', add
label define ancestr1d_lbl 7680 `"Hmong"', add
label define ancestr1d_lbl 7700 `"Malaysian (1980)"', add
label define ancestr1d_lbl 7701 `"Malaysian (1990-2000, ACS, PRCS)"', add
label define ancestr1d_lbl 7702 `"North Borneo (1990-2000)"', add
label define ancestr1d_lbl 7740 `"Singaporean"', add
label define ancestr1d_lbl 7760 `"Thai"', add
label define ancestr1d_lbl 7770 `"Black Thai"', add
label define ancestr1d_lbl 7780 `"Western Lao"', add
label define ancestr1d_lbl 7820 `"Taiwanese"', add
label define ancestr1d_lbl 7850 `"Vietnamese, Annamese"', add
label define ancestr1d_lbl 7860 `"Katu"', add
label define ancestr1d_lbl 7870 `"Ma"', add
label define ancestr1d_lbl 7880 `"Mnong"', add
label define ancestr1d_lbl 7900 `"Montagnard"', add
label define ancestr1d_lbl 7920 `"Indochinese"', add
label define ancestr1d_lbl 7930 `"Eurasian"', add
label define ancestr1d_lbl 7931 `"Amerasian (1990-2000, ACS, PRCS)"', add
label define ancestr1d_lbl 7950 `"Asian"', add
label define ancestr1d_lbl 7960 `"Other Asian"', add
label define ancestr1d_lbl 8000 `"Australian"', add
label define ancestr1d_lbl 8010 `"Tasmanian"', add
label define ancestr1d_lbl 8020 `"Australian Aborigine (1990-2000)"', add
label define ancestr1d_lbl 8030 `"New Zealander"', add
label define ancestr1d_lbl 8080 `"Polynesian (1990-2000, ACS, PRCS)"', add
label define ancestr1d_lbl 8081 `"Polynesian (1980)"', add
label define ancestr1d_lbl 8082 `"Norfolk Islander (1980)"', add
label define ancestr1d_lbl 8090 `"Kapinagamarangan (1990-2000)"', add
label define ancestr1d_lbl 8091 `"Kapinagamarangan (1980)"', add
label define ancestr1d_lbl 8092 `"Nukuoroan (1980)"', add
label define ancestr1d_lbl 8100 `"Maori"', add
label define ancestr1d_lbl 8110 `"Hawaiian"', add
label define ancestr1d_lbl 8130 `"Part Hawaiian"', add
label define ancestr1d_lbl 8140 `"Samoan (1990-2000, ACS, PRCS)"', add
label define ancestr1d_lbl 8141 `"Samoan (1980)"', add
label define ancestr1d_lbl 8142 `"American Samoan (1980)"', add
label define ancestr1d_lbl 8143 `"French Samoan"', add
label define ancestr1d_lbl 8144 `"Part Samoan (1990-2000)"', add
label define ancestr1d_lbl 8150 `"Tongan"', add
label define ancestr1d_lbl 8160 `"Tokelauan"', add
label define ancestr1d_lbl 8170 `"Cook Islander"', add
label define ancestr1d_lbl 8180 `"Tahitian, French Polynesian, Society Islander"', add
label define ancestr1d_lbl 8190 `"Niuean"', add
label define ancestr1d_lbl 8200 `"Micronesian (1990-2000, ACS, PRCS)"', add
label define ancestr1d_lbl 8201 `"Micronesian (1980)"', add
label define ancestr1d_lbl 8202 `"U.S. Trust Terr of the Pacific (1980)"', add
label define ancestr1d_lbl 8210 `"Guamanian"', add
label define ancestr1d_lbl 8220 `"Chamorro Islander"', add
label define ancestr1d_lbl 8230 `"Saipanese (1990-2000)"', add
label define ancestr1d_lbl 8231 `"Saipanese (1980)"', add
label define ancestr1d_lbl 8232 `"Norther Marianas (1980)"', add
label define ancestr1d_lbl 8240 `"Palauan"', add
label define ancestr1d_lbl 8250 `"Marshall Islander"', add
label define ancestr1d_lbl 8260 `"Kosraean"', add
label define ancestr1d_lbl 8270 `"Ponapean (1990-2000)"', add
label define ancestr1d_lbl 8271 `"Ponapean (1980)"', add
label define ancestr1d_lbl 8272 `"Mokilese (1980)"', add
label define ancestr1d_lbl 8273 `"Ngatikese (1980)"', add
label define ancestr1d_lbl 8274 `"Pingelapese (1980)"', add
label define ancestr1d_lbl 8280 `"Chuukese (1990-2000)"', add
label define ancestr1d_lbl 8281 `"Hall Islander (1980)"', add
label define ancestr1d_lbl 8282 `"Mortlockese (1980)"', add
label define ancestr1d_lbl 8283 `"Namanouito (1980)"', add
label define ancestr1d_lbl 8284 `"Pulawatese (1980)"', add
label define ancestr1d_lbl 8285 `"Truk Islander"', add
label define ancestr1d_lbl 8290 `"Yap Islander"', add
label define ancestr1d_lbl 8300 `"Caroline Islander (1990-2000)"', add
label define ancestr1d_lbl 8301 `"Caroline Islander (1980)"', add
label define ancestr1d_lbl 8302 `"Lamotrekese (1980)"', add
label define ancestr1d_lbl 8303 `"Ulithian (1980)"', add
label define ancestr1d_lbl 8304 `"Woleaian (1980)"', add
label define ancestr1d_lbl 8310 `"Kiribatese"', add
label define ancestr1d_lbl 8320 `"Nauruan"', add
label define ancestr1d_lbl 8330 `"Tarawa Islander (1990-2000)"', add
label define ancestr1d_lbl 8340 `"Tinian Islander (1990-2000)"', add
label define ancestr1d_lbl 8400 `"Melanesian Islander"', add
label define ancestr1d_lbl 8410 `"Fijian"', add
label define ancestr1d_lbl 8430 `"New Guinean"', add
label define ancestr1d_lbl 8440 `"Papuan"', add
label define ancestr1d_lbl 8450 `"Solomon Islander"', add
label define ancestr1d_lbl 8460 `"New Caledonian Islander"', add
label define ancestr1d_lbl 8470 `"Vanuatuan"', add
label define ancestr1d_lbl 8500 `"Pacific Islander (1990-2000, ACS, PRCS)"', add
label define ancestr1d_lbl 8501 `"Campbell Islander (1980)"', add
label define ancestr1d_lbl 8502 `"Christmas Islander (1980)"', add
label define ancestr1d_lbl 8503 `"Kermadec Islander (1980)"', add
label define ancestr1d_lbl 8504 `"Midway Islander (1980)"', add
label define ancestr1d_lbl 8505 `"Phoenix Islander (1980)"', add
label define ancestr1d_lbl 8506 `"Wake Islander (1980)"', add
label define ancestr1d_lbl 8600 `"Oceania"', add
label define ancestr1d_lbl 8620 `"Chamolinian (1990-2000)"', add
label define ancestr1d_lbl 8630 `"Reserved Codes"', add
label define ancestr1d_lbl 8700 `"Other Pacific"', add
label define ancestr1d_lbl 9000 `"Afro-American"', add
label define ancestr1d_lbl 9001 `"Afro-American (1990-2000, ACS, PRCS)"', add
label define ancestr1d_lbl 9002 `"Black (1990-2000, ACS, PRCS)"', add
label define ancestr1d_lbl 9003 `"Negro (1990-2000, ACS, PRCS)"', add
label define ancestr1d_lbl 9004 `"Nonwhite (1990-2000)"', add
label define ancestr1d_lbl 9005 `"Colored (1990-2000)"', add
label define ancestr1d_lbl 9006 `"Creole (1990-2000, ACS, PRCS)"', add
label define ancestr1d_lbl 9007 `"Mulatto (1990-2000)"', add
label define ancestr1d_lbl 9008 `"Afro"', add
label define ancestr1d_lbl 9020 `"African-American (1990-2000, ACS, PRCS)"', add
label define ancestr1d_lbl 9130 `"Central American Indian (1990-2000, ACS, PRCS)"', add
label define ancestr1d_lbl 9140 `"South Amerianc Indian (1990-2000, ACS, PRCS)"', add
label define ancestr1d_lbl 9200 `"American Indian  (all tribes)"', add
label define ancestr1d_lbl 9201 `"American Indian-English-French"', add
label define ancestr1d_lbl 9202 `"American Indian-English-German"', add
label define ancestr1d_lbl 9203 `"American Indian-English-Irish"', add
label define ancestr1d_lbl 9204 `"American Indian-German-Irish"', add
label define ancestr1d_lbl 9205 `"Cherokee"', add
label define ancestr1d_lbl 9206 `"Native American"', add
label define ancestr1d_lbl 9207 `"Indian"', add
label define ancestr1d_lbl 9210 `"Aleut"', add
label define ancestr1d_lbl 9220 `"Eskimo"', add
label define ancestr1d_lbl 9230 `"Inuit"', add
label define ancestr1d_lbl 9240 `"White/Caucasian"', add
label define ancestr1d_lbl 9241 `"White/Caucasian (1990-2000, ACS, PRCS)"', add
label define ancestr1d_lbl 9242 `"Anglo (1990-2000, ACS, PRCS)"', add
label define ancestr1d_lbl 9243 `"Appalachian (1990-2000, ACS, PRCS)"', add
label define ancestr1d_lbl 9244 `"Aryan (1990-2000)"', add
label define ancestr1d_lbl 9300 `"Greenlander"', add
label define ancestr1d_lbl 9310 `"Canadian"', add
label define ancestr1d_lbl 9330 `"Newfoundland"', add
label define ancestr1d_lbl 9340 `"Nova Scotian"', add
label define ancestr1d_lbl 9350 `"French Canadian"', add
label define ancestr1d_lbl 9360 `"Acadian"', add
label define ancestr1d_lbl 9361 `"Acadian (1990-2000, ACS, PRCS)"', add
label define ancestr1d_lbl 9362 `"Cajun (1990-2000, ACS, PRCS)"', add
label define ancestr1d_lbl 9390 `"American"', add
label define ancestr1d_lbl 9391 `"American/United States"', add
label define ancestr1d_lbl 9400 `"United States"', add
label define ancestr1d_lbl 9410 `"Alabama"', add
label define ancestr1d_lbl 9420 `"Alaska"', add
label define ancestr1d_lbl 9430 `"Arizona"', add
label define ancestr1d_lbl 9440 `"Arkansas"', add
label define ancestr1d_lbl 9450 `"California"', add
label define ancestr1d_lbl 9460 `"Colorado"', add
label define ancestr1d_lbl 9470 `"Connecticut"', add
label define ancestr1d_lbl 9480 `"District of Columbia"', add
label define ancestr1d_lbl 9490 `"Delaware"', add
label define ancestr1d_lbl 9500 `"Florida"', add
label define ancestr1d_lbl 9510 `"Georgia"', add
label define ancestr1d_lbl 9520 `"Idaho"', add
label define ancestr1d_lbl 9530 `"Illinois"', add
label define ancestr1d_lbl 9540 `"Indiana"', add
label define ancestr1d_lbl 9550 `"Iowa"', add
label define ancestr1d_lbl 9560 `"Kansas"', add
label define ancestr1d_lbl 9570 `"Kentucky"', add
label define ancestr1d_lbl 9580 `"Louisiana"', add
label define ancestr1d_lbl 9590 `"Maine"', add
label define ancestr1d_lbl 9600 `"Maryland"', add
label define ancestr1d_lbl 9610 `"Massachusetts"', add
label define ancestr1d_lbl 9620 `"Michigan"', add
label define ancestr1d_lbl 9630 `"Minnesota"', add
label define ancestr1d_lbl 9640 `"Mississippi"', add
label define ancestr1d_lbl 9650 `"Missouri"', add
label define ancestr1d_lbl 9660 `"Montana"', add
label define ancestr1d_lbl 9670 `"Nebraska"', add
label define ancestr1d_lbl 9680 `"Nevada"', add
label define ancestr1d_lbl 9690 `"New Hampshire"', add
label define ancestr1d_lbl 9700 `"New Jersey"', add
label define ancestr1d_lbl 9710 `"New Mexico"', add
label define ancestr1d_lbl 9720 `"New York"', add
label define ancestr1d_lbl 9730 `"North Carolina"', add
label define ancestr1d_lbl 9740 `"North Dakota"', add
label define ancestr1d_lbl 9750 `"Ohio"', add
label define ancestr1d_lbl 9760 `"Oklahoma"', add
label define ancestr1d_lbl 9770 `"Oregon"', add
label define ancestr1d_lbl 9780 `"Pennsylvania"', add
label define ancestr1d_lbl 9790 `"Rhode Island"', add
label define ancestr1d_lbl 9800 `"South Carolina"', add
label define ancestr1d_lbl 9810 `"South Dakota"', add
label define ancestr1d_lbl 9820 `"Tennessee"', add
label define ancestr1d_lbl 9830 `"Texas"', add
label define ancestr1d_lbl 9840 `"Utah"', add
label define ancestr1d_lbl 9850 `"Vermont"', add
label define ancestr1d_lbl 9860 `"Virginia"', add
label define ancestr1d_lbl 9870 `"Washington"', add
label define ancestr1d_lbl 9880 `"West Virginia"', add
label define ancestr1d_lbl 9890 `"Wisconsin"', add
label define ancestr1d_lbl 9900 `"Wyoming"', add
label define ancestr1d_lbl 9930 `"Southerner"', add
label define ancestr1d_lbl 9940 `"North American"', add
label define ancestr1d_lbl 9950 `"Mixture"', add
label define ancestr1d_lbl 9960 `"Uncodable"', add
label define ancestr1d_lbl 9961 `"Not Classified"', add
label define ancestr1d_lbl 9980 `"Other"', add
label define ancestr1d_lbl 9990 `"Not Reported"', add
label values ancestr1d ancestr1d_lbl

label define ancestr2_lbl 001 `"Alsatian, Alsace-Lorraine"'
label define ancestr2_lbl 002 `"Andorran"', add
label define ancestr2_lbl 003 `"Austrian"', add
label define ancestr2_lbl 004 `"Tirolean"', add
label define ancestr2_lbl 005 `"Basque"', add
label define ancestr2_lbl 006 `"French Basque"', add
label define ancestr2_lbl 008 `"Belgian"', add
label define ancestr2_lbl 009 `"Flemish"', add
label define ancestr2_lbl 010 `"Walloon"', add
label define ancestr2_lbl 011 `"British"', add
label define ancestr2_lbl 012 `"British Isles"', add
label define ancestr2_lbl 013 `"Channel Islander"', add
label define ancestr2_lbl 014 `"Gibraltan"', add
label define ancestr2_lbl 015 `"Cornish"', add
label define ancestr2_lbl 016 `"Corsican"', add
label define ancestr2_lbl 017 `"Cypriot"', add
label define ancestr2_lbl 018 `"Greek Cypriote"', add
label define ancestr2_lbl 019 `"Turkish Cypriote"', add
label define ancestr2_lbl 020 `"Danish"', add
label define ancestr2_lbl 021 `"Dutch"', add
label define ancestr2_lbl 022 `"English"', add
label define ancestr2_lbl 023 `"Faeroe Islander"', add
label define ancestr2_lbl 024 `"Finnish"', add
label define ancestr2_lbl 025 `"Karelian"', add
label define ancestr2_lbl 026 `"French"', add
label define ancestr2_lbl 027 `"Lorrainian"', add
label define ancestr2_lbl 028 `"Breton"', add
label define ancestr2_lbl 029 `"Frisian"', add
label define ancestr2_lbl 030 `"Friulian"', add
label define ancestr2_lbl 032 `"German"', add
label define ancestr2_lbl 033 `"Bavarian"', add
label define ancestr2_lbl 034 `"Berliner"', add
label define ancestr2_lbl 035 `"Hamburger"', add
label define ancestr2_lbl 036 `"Hanoverian"', add
label define ancestr2_lbl 037 `"Hessian"', add
label define ancestr2_lbl 038 `"Lubecker"', add
label define ancestr2_lbl 039 `"Pomeranian"', add
label define ancestr2_lbl 040 `"Prussian"', add
label define ancestr2_lbl 041 `"Saxon"', add
label define ancestr2_lbl 042 `"Sudetenlander"', add
label define ancestr2_lbl 043 `"Westphalian"', add
label define ancestr2_lbl 046 `"Greek"', add
label define ancestr2_lbl 047 `"Cretan"', add
label define ancestr2_lbl 048 `"Cycladic Islander"', add
label define ancestr2_lbl 049 `"Icelander"', add
label define ancestr2_lbl 050 `"Irish"', add
label define ancestr2_lbl 051 `"Italian"', add
label define ancestr2_lbl 053 `"Abruzzi"', add
label define ancestr2_lbl 054 `"Apulian"', add
label define ancestr2_lbl 055 `"Basilicata"', add
label define ancestr2_lbl 056 `"Calabrian"', add
label define ancestr2_lbl 057 `"Amalfin"', add
label define ancestr2_lbl 058 `"Emilia Romagna"', add
label define ancestr2_lbl 059 `"Rome"', add
label define ancestr2_lbl 060 `"Ligurian"', add
label define ancestr2_lbl 061 `"Lombardian"', add
label define ancestr2_lbl 062 `"Marches"', add
label define ancestr2_lbl 063 `"Molise"', add
label define ancestr2_lbl 064 `"Neapolitan"', add
label define ancestr2_lbl 065 `"Piedmontese"', add
label define ancestr2_lbl 066 `"Puglia"', add
label define ancestr2_lbl 067 `"Sardinian"', add
label define ancestr2_lbl 068 `"Sicilian"', add
label define ancestr2_lbl 069 `"Tuscan"', add
label define ancestr2_lbl 070 `"Trentino"', add
label define ancestr2_lbl 071 `"Umbrian"', add
label define ancestr2_lbl 072 `"Valle dAosta"', add
label define ancestr2_lbl 073 `"Venetian"', add
label define ancestr2_lbl 075 `"Lapp"', add
label define ancestr2_lbl 076 `"Liechtensteiner"', add
label define ancestr2_lbl 077 `"Luxemburger"', add
label define ancestr2_lbl 078 `"Maltese"', add
label define ancestr2_lbl 079 `"Manx"', add
label define ancestr2_lbl 080 `"Monegasque"', add
label define ancestr2_lbl 081 `"Northern Irelander"', add
label define ancestr2_lbl 082 `"Norwegian"', add
label define ancestr2_lbl 084 `"Portuguese"', add
label define ancestr2_lbl 085 `"Azorean"', add
label define ancestr2_lbl 086 `"Madeiran"', add
label define ancestr2_lbl 087 `"Scotch Irish"', add
label define ancestr2_lbl 088 `"Scottish"', add
label define ancestr2_lbl 089 `"Swedish"', add
label define ancestr2_lbl 090 `"Aland Islander"', add
label define ancestr2_lbl 091 `"Swiss"', add
label define ancestr2_lbl 092 `"Suisse"', add
label define ancestr2_lbl 095 `"Romansch"', add
label define ancestr2_lbl 096 `"Suisse Romane"', add
label define ancestr2_lbl 097 `"Welsh"', add
label define ancestr2_lbl 098 `"Scandinavian, Nordic"', add
label define ancestr2_lbl 100 `"Albanian"', add
label define ancestr2_lbl 101 `"Azerbaijani"', add
label define ancestr2_lbl 102 `"Belourussian"', add
label define ancestr2_lbl 103 `"Bulgarian"', add
label define ancestr2_lbl 105 `"Carpathian"', add
label define ancestr2_lbl 108 `"Cossack"', add
label define ancestr2_lbl 109 `"Croatian"', add
label define ancestr2_lbl 111 `"Czechoslovakian"', add
label define ancestr2_lbl 112 `"Bohemian"', add
label define ancestr2_lbl 115 `"Estonian"', add
label define ancestr2_lbl 116 `"Livonian"', add
label define ancestr2_lbl 117 `"Finno Ugrian"', add
label define ancestr2_lbl 118 `"Mordovian"', add
label define ancestr2_lbl 119 `"Voytak"', add
label define ancestr2_lbl 120 `"Georgian"', add
label define ancestr2_lbl 122 `"Germans from Russia"', add
label define ancestr2_lbl 123 `"Gruziia"', add
label define ancestr2_lbl 124 `"Rom"', add
label define ancestr2_lbl 125 `"Hungarian"', add
label define ancestr2_lbl 126 `"Magyar"', add
label define ancestr2_lbl 128 `"Latvian"', add
label define ancestr2_lbl 129 `"Lithuanian"', add
label define ancestr2_lbl 130 `"Macedonian"', add
label define ancestr2_lbl 132 `"North Caucasian"', add
label define ancestr2_lbl 133 `"North Caucasian Turkic"', add
label define ancestr2_lbl 140 `"Ossetian"', add
label define ancestr2_lbl 142 `"Polish"', add
label define ancestr2_lbl 143 `"Kashubian"', add
label define ancestr2_lbl 144 `"Romanian"', add
label define ancestr2_lbl 145 `"Bessarabian"', add
label define ancestr2_lbl 146 `"Moldavian"', add
label define ancestr2_lbl 147 `"Wallachian"', add
label define ancestr2_lbl 148 `"Russian"', add
label define ancestr2_lbl 150 `"Muscovite"', add
label define ancestr2_lbl 152 `"Serbian"', add
label define ancestr2_lbl 153 `"Slovak"', add
label define ancestr2_lbl 154 `"Slovene"', add
label define ancestr2_lbl 155 `"Sorb/Wend"', add
label define ancestr2_lbl 156 `"Soviet Turkic"', add
label define ancestr2_lbl 157 `"Bashkir"', add
label define ancestr2_lbl 158 `"Chevash"', add
label define ancestr2_lbl 159 `"Gagauz"', add
label define ancestr2_lbl 160 `"Mesknetian"', add
label define ancestr2_lbl 163 `"Yakut"', add
label define ancestr2_lbl 164 `"Soviet Union, nec"', add
label define ancestr2_lbl 165 `"Tatar"', add
label define ancestr2_lbl 169 `"Uzbek"', add
label define ancestr2_lbl 171 `"Ukrainian"', add
label define ancestr2_lbl 176 `"Yugoslavian"', add
label define ancestr2_lbl 178 `"Slav"', add
label define ancestr2_lbl 179 `"Slavonian"', add
label define ancestr2_lbl 181 `"Central European, nec"', add
label define ancestr2_lbl 183 `"Northern European, nec"', add
label define ancestr2_lbl 185 `"Southern European, nec"', add
label define ancestr2_lbl 187 `"Western European, nec"', add
label define ancestr2_lbl 190 `"Eastern European, nec"', add
label define ancestr2_lbl 195 `"European, nec"', add
label define ancestr2_lbl 200 `"Spaniard"', add
label define ancestr2_lbl 201 `"Andalusian"', add
label define ancestr2_lbl 202 `"Astorian"', add
label define ancestr2_lbl 204 `"Catalonian"', add
label define ancestr2_lbl 205 `"Balearic Islander"', add
label define ancestr2_lbl 206 `"Galician"', add
label define ancestr2_lbl 210 `"Mexican"', add
label define ancestr2_lbl 211 `"Mexican American"', add
label define ancestr2_lbl 213 `"Chicano/Chicana"', add
label define ancestr2_lbl 218 `"Nuevo Mexicano"', add
label define ancestr2_lbl 219 `"Californio"', add
label define ancestr2_lbl 221 `"Costa Rican"', add
label define ancestr2_lbl 222 `"Guatemalan"', add
label define ancestr2_lbl 223 `"Honduran"', add
label define ancestr2_lbl 224 `"Nicaraguan"', add
label define ancestr2_lbl 225 `"Panamanian"', add
label define ancestr2_lbl 226 `"Salvadoran"', add
label define ancestr2_lbl 227 `"Latin American"', add
label define ancestr2_lbl 231 `"Argentinean"', add
label define ancestr2_lbl 232 `"Bolivian"', add
label define ancestr2_lbl 233 `"Chilean"', add
label define ancestr2_lbl 234 `"Colombian"', add
label define ancestr2_lbl 235 `"Ecuadorian"', add
label define ancestr2_lbl 236 `"Paraguayan"', add
label define ancestr2_lbl 237 `"Peruvian"', add
label define ancestr2_lbl 238 `"Uruguayan"', add
label define ancestr2_lbl 239 `"Venezuelan"', add
label define ancestr2_lbl 248 `"South American"', add
label define ancestr2_lbl 261 `"Puerto Rican"', add
label define ancestr2_lbl 271 `"Cuban"', add
label define ancestr2_lbl 275 `"Dominican"', add
label define ancestr2_lbl 290 `"Hispanic"', add
label define ancestr2_lbl 291 `"Spanish"', add
label define ancestr2_lbl 295 `"Spanish American"', add
label define ancestr2_lbl 296 `"Other Spanish/Hispanic"', add
label define ancestr2_lbl 300 `"Bahamian"', add
label define ancestr2_lbl 301 `"Barbadian"', add
label define ancestr2_lbl 302 `"Belizean"', add
label define ancestr2_lbl 303 `"Bermudan"', add
label define ancestr2_lbl 304 `"Cayman Islander"', add
label define ancestr2_lbl 308 `"Jamaican"', add
label define ancestr2_lbl 310 `"Dutch West Indies"', add
label define ancestr2_lbl 311 `"Aruba Islander"', add
label define ancestr2_lbl 312 `"St Maarten Islander"', add
label define ancestr2_lbl 314 `"Trinidadian/Tobagonian"', add
label define ancestr2_lbl 315 `"Trinidadian"', add
label define ancestr2_lbl 316 `"Tobagonian"', add
label define ancestr2_lbl 317 `"U.S. Virgin Islander"', add
label define ancestr2_lbl 321 `"British Virgin Islander"', add
label define ancestr2_lbl 322 `"British West Indian"', add
label define ancestr2_lbl 323 `"Turks and Caicos Islander"', add
label define ancestr2_lbl 324 `"Anguilla Islander"', add
label define ancestr2_lbl 328 `"Dominica Islander"', add
label define ancestr2_lbl 329 `"Grenadian"', add
label define ancestr2_lbl 331 `"St Lucia Islander"', add
label define ancestr2_lbl 332 `"French West Indies"', add
label define ancestr2_lbl 333 `"Guadeloupe Islander"', add
label define ancestr2_lbl 334 `"Cayenne"', add
label define ancestr2_lbl 335 `"West Indian"', add
label define ancestr2_lbl 336 `"Haitian"', add
label define ancestr2_lbl 337 `"Other West Indian"', add
label define ancestr2_lbl 360 `"Brazilian"', add
label define ancestr2_lbl 365 `"San Andres"', add
label define ancestr2_lbl 370 `"Guyanese/British Guiana"', add
label define ancestr2_lbl 375 `"Providencia"', add
label define ancestr2_lbl 380 `"Surinam/Dutch Guiana"', add
label define ancestr2_lbl 400 `"Algerian"', add
label define ancestr2_lbl 402 `"Egyptian"', add
label define ancestr2_lbl 404 `"Libyan"', add
label define ancestr2_lbl 406 `"Moroccan"', add
label define ancestr2_lbl 407 `"Ifni"', add
label define ancestr2_lbl 408 `"Tunisian"', add
label define ancestr2_lbl 411 `"North African"', add
label define ancestr2_lbl 412 `"Alhucemas"', add
label define ancestr2_lbl 413 `"Berber"', add
label define ancestr2_lbl 414 `"Rio de Oro"', add
label define ancestr2_lbl 415 `"Bahraini"', add
label define ancestr2_lbl 416 `"Iranian"', add
label define ancestr2_lbl 417 `"Iraqi"', add
label define ancestr2_lbl 419 `"Israeli"', add
label define ancestr2_lbl 421 `"Jordanian"', add
label define ancestr2_lbl 422 `"Transjordan"', add
label define ancestr2_lbl 423 `"Kuwaiti"', add
label define ancestr2_lbl 425 `"Lebanese"', add
label define ancestr2_lbl 427 `"Saudi Arabian"', add
label define ancestr2_lbl 429 `"Syrian"', add
label define ancestr2_lbl 431 `"Armenian"', add
label define ancestr2_lbl 434 `"Turkish"', add
label define ancestr2_lbl 435 `"Yemeni"', add
label define ancestr2_lbl 436 `"Omani"', add
label define ancestr2_lbl 437 `"Muscat"', add
label define ancestr2_lbl 438 `"Trucial Oman"', add
label define ancestr2_lbl 439 `"Qatar"', add
label define ancestr2_lbl 441 `"Bedouin"', add
label define ancestr2_lbl 442 `"Kurdish"', add
label define ancestr2_lbl 444 `"Kuria Muria Islander"', add
label define ancestr2_lbl 465 `"Palestinian"', add
label define ancestr2_lbl 466 `"Gazan"', add
label define ancestr2_lbl 467 `"West Bank"', add
label define ancestr2_lbl 470 `"South Yemeni"', add
label define ancestr2_lbl 471 `"Aden"', add
label define ancestr2_lbl 480 `"United Arab Emirates"', add
label define ancestr2_lbl 482 `"Assyrian/Chaldean/Syriac"', add
label define ancestr2_lbl 490 `"Middle Eastern"', add
label define ancestr2_lbl 495 `"Arab"', add
label define ancestr2_lbl 496 `"Other Arab"', add
label define ancestr2_lbl 500 `"Angolan"', add
label define ancestr2_lbl 502 `"Benin"', add
label define ancestr2_lbl 504 `"Botswana"', add
label define ancestr2_lbl 506 `"Burundian"', add
label define ancestr2_lbl 508 `"Cameroonian"', add
label define ancestr2_lbl 510 `"Cape Verdean"', add
label define ancestr2_lbl 513 `"Chadian"', add
label define ancestr2_lbl 515 `"Congolese"', add
label define ancestr2_lbl 516 `"Congo-Brazzaville"', add
label define ancestr2_lbl 519 `"Djibouti"', add
label define ancestr2_lbl 520 `"Equatorial Guinea"', add
label define ancestr2_lbl 521 `"Corsico Islander"', add
label define ancestr2_lbl 522 `"Ethiopian"', add
label define ancestr2_lbl 523 `"Eritrean"', add
label define ancestr2_lbl 525 `"Gabonese"', add
label define ancestr2_lbl 527 `"Gambian"', add
label define ancestr2_lbl 529 `"Ghanian"', add
label define ancestr2_lbl 530 `"Guinean"', add
label define ancestr2_lbl 531 `"Guinea Bissau"', add
label define ancestr2_lbl 532 `"Ivory Coast"', add
label define ancestr2_lbl 534 `"Kenyan"', add
label define ancestr2_lbl 538 `"Lesotho"', add
label define ancestr2_lbl 541 `"Liberian"', add
label define ancestr2_lbl 543 `"Madagascan"', add
label define ancestr2_lbl 545 `"Malawian"', add
label define ancestr2_lbl 546 `"Malian"', add
label define ancestr2_lbl 547 `"Mauritanian"', add
label define ancestr2_lbl 549 `"Mozambican"', add
label define ancestr2_lbl 550 `"Namibian"', add
label define ancestr2_lbl 551 `"Niger"', add
label define ancestr2_lbl 553 `"Nigerian"', add
label define ancestr2_lbl 554 `"Fulani"', add
label define ancestr2_lbl 555 `"Hausa"', add
label define ancestr2_lbl 556 `"Ibo"', add
label define ancestr2_lbl 557 `"Tiv"', add
label define ancestr2_lbl 561 `"Rwandan"', add
label define ancestr2_lbl 564 `"Senegalese"', add
label define ancestr2_lbl 566 `"Sierra Leonean"', add
label define ancestr2_lbl 568 `"Somalian"', add
label define ancestr2_lbl 569 `"Swaziland"', add
label define ancestr2_lbl 570 `"South African"', add
label define ancestr2_lbl 571 `"Union of South Africa"', add
label define ancestr2_lbl 572 `"Afrikaner"', add
label define ancestr2_lbl 573 `"Natalian"', add
label define ancestr2_lbl 574 `"Zulu"', add
label define ancestr2_lbl 576 `"Sudanese"', add
label define ancestr2_lbl 577 `"Dinka"', add
label define ancestr2_lbl 578 `"Nuer"', add
label define ancestr2_lbl 579 `"Fur"', add
label define ancestr2_lbl 580 `"Baggara"', add
label define ancestr2_lbl 582 `"Tanzanian"', add
label define ancestr2_lbl 583 `"Tanganyikan"', add
label define ancestr2_lbl 584 `"Zanzibar Islande"', add
label define ancestr2_lbl 586 `"Togo"', add
label define ancestr2_lbl 588 `"Ugandan"', add
label define ancestr2_lbl 589 `"Upper Voltan"', add
label define ancestr2_lbl 590 `"Voltan"', add
label define ancestr2_lbl 591 `"Zairian"', add
label define ancestr2_lbl 592 `"Zambian"', add
label define ancestr2_lbl 593 `"Zimbabwean"', add
label define ancestr2_lbl 594 `"African Islands"', add
label define ancestr2_lbl 595 `"Other Subsaharan Africa"', add
label define ancestr2_lbl 596 `"Central African"', add
label define ancestr2_lbl 597 `"East African"', add
label define ancestr2_lbl 598 `"West African"', add
label define ancestr2_lbl 599 `"African"', add
label define ancestr2_lbl 600 `"Afghan"', add
label define ancestr2_lbl 601 `"Baluchi"', add
label define ancestr2_lbl 602 `"Pathan"', add
label define ancestr2_lbl 603 `"Bengali"', add
label define ancestr2_lbl 607 `"Bhutanese"', add
label define ancestr2_lbl 609 `"Nepali"', add
label define ancestr2_lbl 615 `"Asian Indian"', add
label define ancestr2_lbl 622 `"Andaman Islander"', add
label define ancestr2_lbl 624 `"Andhra Pradesh"', add
label define ancestr2_lbl 626 `"Assamese"', add
label define ancestr2_lbl 628 `"Goanese"', add
label define ancestr2_lbl 630 `"Gujarati"', add
label define ancestr2_lbl 632 `"Karnatakan"', add
label define ancestr2_lbl 634 `"Keralan"', add
label define ancestr2_lbl 638 `"Maharashtran"', add
label define ancestr2_lbl 640 `"Madrasi"', add
label define ancestr2_lbl 642 `"Mysore"', add
label define ancestr2_lbl 644 `"Naga"', add
label define ancestr2_lbl 648 `"Pondicherry"', add
label define ancestr2_lbl 650 `"Punjabi"', add
label define ancestr2_lbl 656 `"Tamil"', add
label define ancestr2_lbl 675 `"East Indies"', add
label define ancestr2_lbl 680 `"Pakistani"', add
label define ancestr2_lbl 690 `"Sri Lankan"', add
label define ancestr2_lbl 691 `"Singhalese"', add
label define ancestr2_lbl 692 `"Veddah"', add
label define ancestr2_lbl 695 `"Maldivian"', add
label define ancestr2_lbl 700 `"Burmese"', add
label define ancestr2_lbl 702 `"Shan"', add
label define ancestr2_lbl 703 `"Cambodian"', add
label define ancestr2_lbl 704 `"Khmer"', add
label define ancestr2_lbl 706 `"Chinese"', add
label define ancestr2_lbl 707 `"Cantonese"', add
label define ancestr2_lbl 708 `"Manchurian"', add
label define ancestr2_lbl 709 `"Mandarin"', add
label define ancestr2_lbl 712 `"Mongolian"', add
label define ancestr2_lbl 714 `"Tibetan"', add
label define ancestr2_lbl 716 `"Hong Kong"', add
label define ancestr2_lbl 718 `"Macao"', add
label define ancestr2_lbl 720 `"Filipino"', add
label define ancestr2_lbl 730 `"Indonesian"', add
label define ancestr2_lbl 740 `"Japanese"', add
label define ancestr2_lbl 746 `"Ryukyu Islander"', add
label define ancestr2_lbl 748 `"Okinawan"', add
label define ancestr2_lbl 750 `"Korean"', add
label define ancestr2_lbl 765 `"Laotian"', add
label define ancestr2_lbl 766 `"Meo"', add
label define ancestr2_lbl 768 `"Hmong"', add
label define ancestr2_lbl 770 `"Malaysian"', add
label define ancestr2_lbl 774 `"Singaporean"', add
label define ancestr2_lbl 776 `"Thai"', add
label define ancestr2_lbl 777 `"Black Thai"', add
label define ancestr2_lbl 778 `"Western Lao"', add
label define ancestr2_lbl 782 `"Taiwanese"', add
label define ancestr2_lbl 785 `"Vietnamese"', add
label define ancestr2_lbl 786 `"Katu"', add
label define ancestr2_lbl 787 `"Ma"', add
label define ancestr2_lbl 788 `"Mnong"', add
label define ancestr2_lbl 790 `"Montagnard"', add
label define ancestr2_lbl 792 `"Indochinese"', add
label define ancestr2_lbl 793 `"Eurasian"', add
label define ancestr2_lbl 795 `"Asian"', add
label define ancestr2_lbl 796 `"Other Asian"', add
label define ancestr2_lbl 800 `"Australian"', add
label define ancestr2_lbl 801 `"Tasmanian"', add
label define ancestr2_lbl 802 `"Australian Aborigine"', add
label define ancestr2_lbl 803 `"New Zealander"', add
label define ancestr2_lbl 808 `"Polynesian"', add
label define ancestr2_lbl 809 `"Kapinagamarangan"', add
label define ancestr2_lbl 810 `"Maori"', add
label define ancestr2_lbl 811 `"Hawaiian"', add
label define ancestr2_lbl 813 `"Part Hawaiian"', add
label define ancestr2_lbl 814 `"Samoan"', add
label define ancestr2_lbl 815 `"Tongan"', add
label define ancestr2_lbl 816 `"Tokelauan"', add
label define ancestr2_lbl 817 `"Cook Islander"', add
label define ancestr2_lbl 818 `"Tahitian"', add
label define ancestr2_lbl 819 `"Niuean"', add
label define ancestr2_lbl 820 `"Micronesian"', add
label define ancestr2_lbl 821 `"Guamanian"', add
label define ancestr2_lbl 822 `"Chamorro Islander"', add
label define ancestr2_lbl 823 `"Saipanese"', add
label define ancestr2_lbl 824 `"Palauan"', add
label define ancestr2_lbl 825 `"Marshall Islander"', add
label define ancestr2_lbl 826 `"Kosraean"', add
label define ancestr2_lbl 827 `"Ponapean"', add
label define ancestr2_lbl 828 `"Chuukese"', add
label define ancestr2_lbl 829 `"Yap Islander"', add
label define ancestr2_lbl 830 `"Caroline Islander"', add
label define ancestr2_lbl 831 `"Kiribatese"', add
label define ancestr2_lbl 832 `"Nauruan"', add
label define ancestr2_lbl 833 `"Tarawa Islander"', add
label define ancestr2_lbl 834 `"Tinian Islander"', add
label define ancestr2_lbl 840 `"Melanesian Islander"', add
label define ancestr2_lbl 841 `"Fijian"', add
label define ancestr2_lbl 843 `"New Guinean"', add
label define ancestr2_lbl 844 `"Papuan"', add
label define ancestr2_lbl 845 `"Solomon Islander"', add
label define ancestr2_lbl 846 `"New Caledonian Islander"', add
label define ancestr2_lbl 847 `"Vanuatuan"', add
label define ancestr2_lbl 850 `"Pacific Islander"', add
label define ancestr2_lbl 860 `"Oceania"', add
label define ancestr2_lbl 862 `"Chamolinian"', add
label define ancestr2_lbl 863 `"Reserved Codes"', add
label define ancestr2_lbl 870 `"Other Pacific"', add
label define ancestr2_lbl 900 `"Afro-American"', add
label define ancestr2_lbl 902 `"African-American"', add
label define ancestr2_lbl 913 `"Central American Indian"', add
label define ancestr2_lbl 914 `"South American Indian"', add
label define ancestr2_lbl 920 `"American Indian  (all tribes)"', add
label define ancestr2_lbl 921 `"Aleut"', add
label define ancestr2_lbl 922 `"Eskimo"', add
label define ancestr2_lbl 923 `"Inuit"', add
label define ancestr2_lbl 924 `"White/Caucasian"', add
label define ancestr2_lbl 930 `"Greenlander"', add
label define ancestr2_lbl 931 `"Canadian (most provinces)"', add
label define ancestr2_lbl 933 `"Newfoundland"', add
label define ancestr2_lbl 934 `"Nova Scotian"', add
label define ancestr2_lbl 935 `"French Canadian"', add
label define ancestr2_lbl 936 `"Acadian"', add
label define ancestr2_lbl 939 `"American"', add
label define ancestr2_lbl 940 `"United States"', add
label define ancestr2_lbl 941 `"Alabama"', add
label define ancestr2_lbl 942 `"Alaska"', add
label define ancestr2_lbl 943 `"Arizona"', add
label define ancestr2_lbl 944 `"Arkansas"', add
label define ancestr2_lbl 945 `"California"', add
label define ancestr2_lbl 946 `"Colorado"', add
label define ancestr2_lbl 947 `"Connecticut"', add
label define ancestr2_lbl 948 `"District of Columbia"', add
label define ancestr2_lbl 949 `"Delaware"', add
label define ancestr2_lbl 950 `"Florida"', add
label define ancestr2_lbl 951 `"Georgia"', add
label define ancestr2_lbl 952 `"Idaho"', add
label define ancestr2_lbl 953 `"Illinois"', add
label define ancestr2_lbl 954 `"Indiana"', add
label define ancestr2_lbl 955 `"Iowa"', add
label define ancestr2_lbl 956 `"Kansas"', add
label define ancestr2_lbl 957 `"Kentucky"', add
label define ancestr2_lbl 958 `"Louisiana"', add
label define ancestr2_lbl 959 `"Maine"', add
label define ancestr2_lbl 960 `"Maryland"', add
label define ancestr2_lbl 961 `"Massachusetts"', add
label define ancestr2_lbl 962 `"Michigan"', add
label define ancestr2_lbl 963 `"Minnesota"', add
label define ancestr2_lbl 964 `"Mississippi"', add
label define ancestr2_lbl 965 `"Missouri"', add
label define ancestr2_lbl 966 `"Montana"', add
label define ancestr2_lbl 967 `"Nebraska"', add
label define ancestr2_lbl 968 `"Nevada"', add
label define ancestr2_lbl 969 `"New Hampshire"', add
label define ancestr2_lbl 970 `"New Jersey"', add
label define ancestr2_lbl 971 `"New Mexico"', add
label define ancestr2_lbl 972 `"New York"', add
label define ancestr2_lbl 973 `"North Carolina"', add
label define ancestr2_lbl 974 `"North Dakota"', add
label define ancestr2_lbl 975 `"Ohio"', add
label define ancestr2_lbl 976 `"Oklahoma"', add
label define ancestr2_lbl 977 `"Oregon"', add
label define ancestr2_lbl 978 `"Pennsylvania"', add
label define ancestr2_lbl 979 `"Rhode Island"', add
label define ancestr2_lbl 980 `"South Carolina"', add
label define ancestr2_lbl 981 `"South Dakota"', add
label define ancestr2_lbl 982 `"Tennessee"', add
label define ancestr2_lbl 983 `"Texas"', add
label define ancestr2_lbl 984 `"Utah"', add
label define ancestr2_lbl 985 `"Vermont"', add
label define ancestr2_lbl 986 `"Virginia"', add
label define ancestr2_lbl 987 `"Washington"', add
label define ancestr2_lbl 988 `"West Virginia"', add
label define ancestr2_lbl 989 `"Wisconsin"', add
label define ancestr2_lbl 990 `"Wyoming"', add
label define ancestr2_lbl 993 `"Southerner"', add
label define ancestr2_lbl 994 `"North American"', add
label define ancestr2_lbl 995 `"Mixture"', add
label define ancestr2_lbl 996 `"Uncodable"', add
label define ancestr2_lbl 997 `"Deferred Cases"', add
label define ancestr2_lbl 998 `"Other (Usually a Religion)"', add
label define ancestr2_lbl 999 `"Not Reported"', add
label values ancestr2 ancestr2_lbl

label define ancestr2d_lbl 0010 `"Alsatian"'
label define ancestr2d_lbl 0020 `"Andorran"', add
label define ancestr2d_lbl 0030 `"Austrian"', add
label define ancestr2d_lbl 0040 `"Tirolean"', add
label define ancestr2d_lbl 0051 `"Basque (1980)"', add
label define ancestr2d_lbl 0052 `"Spanish Basque (1980)"', add
label define ancestr2d_lbl 0053 `"Basque (1990-2000, ACS, PRCS)"', add
label define ancestr2d_lbl 0054 `"Spanish Basque (1990-2000,2001-2004 ACS)"', add
label define ancestr2d_lbl 0060 `"French Basque"', add
label define ancestr2d_lbl 0080 `"Belgian"', add
label define ancestr2d_lbl 0090 `"Flemish"', add
label define ancestr2d_lbl 0100 `"Walloon"', add
label define ancestr2d_lbl 0110 `"British"', add
label define ancestr2d_lbl 0120 `"British Isles"', add
label define ancestr2d_lbl 0130 `"Channel Islander"', add
label define ancestr2d_lbl 0140 `"Gibraltan"', add
label define ancestr2d_lbl 0150 `"Cornish"', add
label define ancestr2d_lbl 0160 `"Corsican"', add
label define ancestr2d_lbl 0170 `"Cypriot"', add
label define ancestr2d_lbl 0180 `"Greek Cypriote"', add
label define ancestr2d_lbl 0190 `"Turkish Cypriote"', add
label define ancestr2d_lbl 0200 `"Danish"', add
label define ancestr2d_lbl 0210 `"Dutch"', add
label define ancestr2d_lbl 0211 `"Dutch-French-Irish"', add
label define ancestr2d_lbl 0212 `"Dutch-German-Irish"', add
label define ancestr2d_lbl 0213 `"Dutch-Irish-Scotch"', add
label define ancestr2d_lbl 0220 `"English"', add
label define ancestr2d_lbl 0221 `"English-French-German (1980)"', add
label define ancestr2d_lbl 0222 `"English-French-Irish (1980)"', add
label define ancestr2d_lbl 0223 `"English-German-Irish (1980)"', add
label define ancestr2d_lbl 0224 `"English-German-Swedish (1980)"', add
label define ancestr2d_lbl 0225 `"English-Irish-Scotch (1980)"', add
label define ancestr2d_lbl 0226 `"English-Scotch-Welsh (1980)"', add
label define ancestr2d_lbl 0230 `"Faeroe Islander"', add
label define ancestr2d_lbl 0240 `"Finnish"', add
label define ancestr2d_lbl 0250 `"Karelian"', add
label define ancestr2d_lbl 0260 `"French (1980)"', add
label define ancestr2d_lbl 0261 `"French (1990-2000, ACS, PRCS)"', add
label define ancestr2d_lbl 0262 `"Occitan (1990-2000)"', add
label define ancestr2d_lbl 0270 `"Lorrainian"', add
label define ancestr2d_lbl 0280 `"Breton"', add
label define ancestr2d_lbl 0290 `"Frisian"', add
label define ancestr2d_lbl 0300 `"Friulian"', add
label define ancestr2d_lbl 0320 `"German (1980)"', add
label define ancestr2d_lbl 0321 `"German (1990-2000, ACS, PRCS)"', add
label define ancestr2d_lbl 0322 `"Pennsylvania German (1990-2000, ACS, PRCS)"', add
label define ancestr2d_lbl 0323 `"East German (1990-2000)"', add
label define ancestr2d_lbl 0324 `"West German (1990-2000)"', add
label define ancestr2d_lbl 0325 `"German-French-Irish (1980)"', add
label define ancestr2d_lbl 0326 `"German-Irish-Italian (1980)"', add
label define ancestr2d_lbl 0327 `"German-Irish-Scotch (1980)"', add
label define ancestr2d_lbl 0328 `"German-Irish-Swedish (1980)"', add
label define ancestr2d_lbl 0329 `"Germanic"', add
label define ancestr2d_lbl 0330 `"Bavarian"', add
label define ancestr2d_lbl 0340 `"Berliner"', add
label define ancestr2d_lbl 0350 `"Hamburger"', add
label define ancestr2d_lbl 0360 `"Hanoverian"', add
label define ancestr2d_lbl 0370 `"Hessian"', add
label define ancestr2d_lbl 0380 `"Lubecker"', add
label define ancestr2d_lbl 0390 `"Pomeranian (1980)"', add
label define ancestr2d_lbl 0391 `"Pomeranian (1990-2000)"', add
label define ancestr2d_lbl 0392 `"Silesian (1990-2000)"', add
label define ancestr2d_lbl 0400 `"Prussian"', add
label define ancestr2d_lbl 0410 `"Saxon"', add
label define ancestr2d_lbl 0420 `"Sudetenlander"', add
label define ancestr2d_lbl 0430 `"Westphalian"', add
label define ancestr2d_lbl 0460 `"Greek"', add
label define ancestr2d_lbl 0470 `"Cretan"', add
label define ancestr2d_lbl 0480 `"Cycladic Islander, Dodecanese Islander, Peloponnesian"', add
label define ancestr2d_lbl 0490 `"Icelander"', add
label define ancestr2d_lbl 0500 `"Irish, various subheads,"', add
label define ancestr2d_lbl 0501 `"Celtic"', add
label define ancestr2d_lbl 0502 `"Irish Scotch"', add
label define ancestr2d_lbl 0510 `"Italian (1980)"', add
label define ancestr2d_lbl 0511 `"Italian (1990-2000, ACS, PRCS)"', add
label define ancestr2d_lbl 0512 `"Trieste (1990-2000)"', add
label define ancestr2d_lbl 0513 `"San Marino (1990-2000)"', add
label define ancestr2d_lbl 0530 `"Abruzzi"', add
label define ancestr2d_lbl 0540 `"Apulian"', add
label define ancestr2d_lbl 0550 `"Basilicata, Lucanian"', add
label define ancestr2d_lbl 0560 `"Calabrian"', add
label define ancestr2d_lbl 0570 `"Amalfin"', add
label define ancestr2d_lbl 0580 `"Emilia Romagna"', add
label define ancestr2d_lbl 0590 `"Rome"', add
label define ancestr2d_lbl 0600 `"Ligurian"', add
label define ancestr2d_lbl 0610 `"Lombardian"', add
label define ancestr2d_lbl 0620 `"Marches"', add
label define ancestr2d_lbl 0630 `"Molise"', add
label define ancestr2d_lbl 0640 `"Neapolitan"', add
label define ancestr2d_lbl 0650 `"Piedmontese"', add
label define ancestr2d_lbl 0660 `"Puglia"', add
label define ancestr2d_lbl 0670 `"Sardinian"', add
label define ancestr2d_lbl 0680 `"Sicilian"', add
label define ancestr2d_lbl 0690 `"Tuscan"', add
label define ancestr2d_lbl 0700 `"Trentino"', add
label define ancestr2d_lbl 0710 `"Umbrian"', add
label define ancestr2d_lbl 0720 `"Valle dAosta"', add
label define ancestr2d_lbl 0730 `"Venetian"', add
label define ancestr2d_lbl 0750 `"Lapp"', add
label define ancestr2d_lbl 0760 `"Liechtensteiner"', add
label define ancestr2d_lbl 0770 `"Luxemburger"', add
label define ancestr2d_lbl 0780 `"Maltese"', add
label define ancestr2d_lbl 0790 `"Manx"', add
label define ancestr2d_lbl 0800 `"Monegasque"', add
label define ancestr2d_lbl 0810 `"Northern Irelander"', add
label define ancestr2d_lbl 0820 `"Norwegian"', add
label define ancestr2d_lbl 0840 `"Portuguese"', add
label define ancestr2d_lbl 0850 `"Azorean"', add
label define ancestr2d_lbl 0860 `"Madeiran"', add
label define ancestr2d_lbl 0870 `"Scotch Irish"', add
label define ancestr2d_lbl 0880 `"Scottish"', add
label define ancestr2d_lbl 0890 `"Swedish"', add
label define ancestr2d_lbl 0900 `"Aland Islander"', add
label define ancestr2d_lbl 0910 `"Swiss"', add
label define ancestr2d_lbl 0920 `"Suisse (1980)"', add
label define ancestr2d_lbl 0921 `"Suisse (1990-2000)"', add
label define ancestr2d_lbl 0922 `"Switzer(1990-2000)"', add
label define ancestr2d_lbl 0950 `"Romansch (1980)"', add
label define ancestr2d_lbl 0951 `"Romansch (1990-2000)"', add
label define ancestr2d_lbl 0952 `"Ladin (1990-2000)"', add
label define ancestr2d_lbl 0960 `"Suisse Romane (1990-2000,ACS)"', add
label define ancestr2d_lbl 0961 `"Suisse Romane (1980)"', add
label define ancestr2d_lbl 0962 `"Ticino"', add
label define ancestr2d_lbl 0970 `"Welsh"', add
label define ancestr2d_lbl 0980 `"Scandinavian, Nordic"', add
label define ancestr2d_lbl 1000 `"Albanian"', add
label define ancestr2d_lbl 1010 `"Azerbaijani"', add
label define ancestr2d_lbl 1020 `"Belourussian"', add
label define ancestr2d_lbl 1030 `"Bulgarian"', add
label define ancestr2d_lbl 1050 `"Carpathian"', add
label define ancestr2d_lbl 1051 `"Carpatho Rusyn"', add
label define ancestr2d_lbl 1052 `"Rusyn"', add
label define ancestr2d_lbl 1080 `"Cossack (1990-2000)"', add
label define ancestr2d_lbl 1081 `"Cossack (1980)"', add
label define ancestr2d_lbl 1082 `"Turkestani (1990-2000, 2012 ACS)"', add
label define ancestr2d_lbl 1083 `"Kirghiz (1980)"', add
label define ancestr2d_lbl 1084 `"Turcoman (1980)"', add
label define ancestr2d_lbl 1090 `"Croatian"', add
label define ancestr2d_lbl 1110 `"Czechoslovakian"', add
label define ancestr2d_lbl 1111 `"Czech"', add
label define ancestr2d_lbl 1120 `"Bohemian (1980)"', add
label define ancestr2d_lbl 1121 `"Bohemian (1990-2000, ACS, PRCS)"', add
label define ancestr2d_lbl 1122 `"Moravian (1990-2000)"', add
label define ancestr2d_lbl 1150 `"Estonian"', add
label define ancestr2d_lbl 1160 `"Livonian"', add
label define ancestr2d_lbl 1170 `"Finno Ugrian (1990-2000)"', add
label define ancestr2d_lbl 1171 `"Udmert"', add
label define ancestr2d_lbl 1180 `"Mordovian"', add
label define ancestr2d_lbl 1190 `"Voytak"', add
label define ancestr2d_lbl 1200 `"Georgian"', add
label define ancestr2d_lbl 1220 `"Germans from Russia"', add
label define ancestr2d_lbl 1221 `"Volga"', add
label define ancestr2d_lbl 1222 `"German from Russia (1990-2000, ACS, PRCS)"', add
label define ancestr2d_lbl 1230 `"Gruziia (1990-2000)"', add
label define ancestr2d_lbl 1240 `"Rom"', add
label define ancestr2d_lbl 1250 `"Hungarian"', add
label define ancestr2d_lbl 1260 `"Magyar"', add
label define ancestr2d_lbl 1280 `"Latvian"', add
label define ancestr2d_lbl 1290 `"Lithuanian"', add
label define ancestr2d_lbl 1300 `"Macedonian"', add
label define ancestr2d_lbl 1320 `"North Caucasian (1990-2000)"', add
label define ancestr2d_lbl 1330 `"North Caucasian Turkic (1990-2000)"', add
label define ancestr2d_lbl 1400 `"Ossetian"', add
label define ancestr2d_lbl 1420 `"Polish"', add
label define ancestr2d_lbl 1430 `"Kashubian"', add
label define ancestr2d_lbl 1440 `"Romanian (1990-2000, ACS, PRCS)"', add
label define ancestr2d_lbl 1441 `"Romanian (1980)"', add
label define ancestr2d_lbl 1442 `"Transylvanian"', add
label define ancestr2d_lbl 1450 `"Bessarabian (1980)"', add
label define ancestr2d_lbl 1451 `"Bessarabian (1990-2000)"', add
label define ancestr2d_lbl 1452 `"Bucovina"', add
label define ancestr2d_lbl 1460 `"Moldavian"', add
label define ancestr2d_lbl 1470 `"Wallachian"', add
label define ancestr2d_lbl 1480 `"Russian"', add
label define ancestr2d_lbl 1500 `"Muscovite"', add
label define ancestr2d_lbl 1520 `"Serbian (1980)"', add
label define ancestr2d_lbl 1521 `"Serbian (1990-2000, ACS, PRCS)"', add
label define ancestr2d_lbl 1522 `"Bosnian (1990) Herzegovinian (2000, ACS, PRCS)"', add
label define ancestr2d_lbl 1523 `"Montenegin (1990-2000, 2012 ACS)"', add
label define ancestr2d_lbl 1530 `"Slovak"', add
label define ancestr2d_lbl 1540 `"Slovene"', add
label define ancestr2d_lbl 1550 `"Sorb/Wend"', add
label define ancestr2d_lbl 1560 `"Soviet Turkic (1990-2000)"', add
label define ancestr2d_lbl 1570 `"Bashkir"', add
label define ancestr2d_lbl 1580 `"Chevash"', add
label define ancestr2d_lbl 1590 `"Gagauz (1990-2000)"', add
label define ancestr2d_lbl 1600 `"Mesknetian (1990-2000)"', add
label define ancestr2d_lbl 1630 `"Yakut"', add
label define ancestr2d_lbl 1640 `"Soviet Union, nec"', add
label define ancestr2d_lbl 1650 `"Tatar (1990-2000)"', add
label define ancestr2d_lbl 1651 `"Tatar (1980)"', add
label define ancestr2d_lbl 1652 `"Crimean (1980)"', add
label define ancestr2d_lbl 1653 `"Tuvinian (1990-2000)"', add
label define ancestr2d_lbl 1654 `"Soviet Central Asian (1990-2000)"', add
label define ancestr2d_lbl 1655 `"Tadzhik (1980)"', add
label define ancestr2d_lbl 1690 `"Uzbek"', add
label define ancestr2d_lbl 1710 `"Ukrainian (1980)"', add
label define ancestr2d_lbl 1711 `"Ukrainian (1990-2000, ACS, PRCS)"', add
label define ancestr2d_lbl 1712 `"Ruthenian (1980)"', add
label define ancestr2d_lbl 1713 `"Ruthenian (1990-2000)"', add
label define ancestr2d_lbl 1714 `"Lemko"', add
label define ancestr2d_lbl 1715 `"Bioko"', add
label define ancestr2d_lbl 1716 `"Hesel"', add
label define ancestr2d_lbl 1717 `"Windish"', add
label define ancestr2d_lbl 1760 `"Yugoslavian"', add
label define ancestr2d_lbl 1780 `"Slav"', add
label define ancestr2d_lbl 1790 `"Slavonian"', add
label define ancestr2d_lbl 1810 `"Central European, nec"', add
label define ancestr2d_lbl 1830 `"Northern European, nec"', add
label define ancestr2d_lbl 1850 `"Southern European, nec"', add
label define ancestr2d_lbl 1870 `"Western European, nec"', add
label define ancestr2d_lbl 1900 `"Eastern European, nec"', add
label define ancestr2d_lbl 1950 `"European, nec"', add
label define ancestr2d_lbl 2000 `"Spaniard (1980)"', add
label define ancestr2d_lbl 2001 `"Spaniard (1990-2000, ACS, PRCS)"', add
label define ancestr2d_lbl 2002 `"Castillan (1990-2000)"', add
label define ancestr2d_lbl 2003 `"Velencian (1990-2000)"', add
label define ancestr2d_lbl 2010 `"Andalusian (1990-2000)"', add
label define ancestr2d_lbl 2020 `"Asturian (1990-2000)"', add
label define ancestr2d_lbl 2040 `"Catalonian"', add
label define ancestr2d_lbl 2050 `"Balearic Islander (1980)"', add
label define ancestr2d_lbl 2051 `"Balearic Islander (1990-2000)"', add
label define ancestr2d_lbl 2052 `"Canary Islander (1990-2000)"', add
label define ancestr2d_lbl 2060 `"Gallician (1980)"', add
label define ancestr2d_lbl 2061 `"Gallego (1990-2000)"', add
label define ancestr2d_lbl 2062 `"Galician (1990-2000)"', add
label define ancestr2d_lbl 2100 `"Mexican"', add
label define ancestr2d_lbl 2101 `"Mexican (1990-2000, ACS, PRCS)"', add
label define ancestr2d_lbl 2102 `"Mexicano/Mexicana (1990-2000, ACS, PRCS)"', add
label define ancestr2d_lbl 2103 `"Mexican Indian"', add
label define ancestr2d_lbl 2110 `"Mexican American"', add
label define ancestr2d_lbl 2111 `"Mexican American Indian"', add
label define ancestr2d_lbl 2130 `"Chicano/Chicana"', add
label define ancestr2d_lbl 2180 `"Nuevo Mexicano"', add
label define ancestr2d_lbl 2181 `"Nuevo Mexicano (1990-2000)"', add
label define ancestr2d_lbl 2182 `"La Raza (1990-2000)"', add
label define ancestr2d_lbl 2183 `"Mexican state (1990-2000, ACS, PRCS)"', add
label define ancestr2d_lbl 2184 `"Tejano/Tejana (1990-2000)"', add
label define ancestr2d_lbl 2190 `"Californio"', add
label define ancestr2d_lbl 2210 `"Costa Rican"', add
label define ancestr2d_lbl 2220 `"Guatemalan"', add
label define ancestr2d_lbl 2230 `"Honduran"', add
label define ancestr2d_lbl 2240 `"Nicaraguan"', add
label define ancestr2d_lbl 2250 `"Panamanian (1980)"', add
label define ancestr2d_lbl 2251 `"Panamanian (1990-2000, ACS, PRCS)"', add
label define ancestr2d_lbl 2252 `"Canal Zone (1990-2000)"', add
label define ancestr2d_lbl 2260 `"Salvadoran"', add
label define ancestr2d_lbl 2270 `"Latin American (1980)"', add
label define ancestr2d_lbl 2271 `"Central American (1990-2000, ACS, PRCS)"', add
label define ancestr2d_lbl 2272 `"Latin American (1990-2000, ACS, PRCS)"', add
label define ancestr2d_lbl 2273 `"Latino/Latina (1990-2000, ACS, PRCS)"', add
label define ancestr2d_lbl 2274 `"Latin (1990-2000, ACS, PRCS)"', add
label define ancestr2d_lbl 2310 `"Argentinean"', add
label define ancestr2d_lbl 2320 `"Bolivian"', add
label define ancestr2d_lbl 2330 `"Chilean"', add
label define ancestr2d_lbl 2340 `"Colombian"', add
label define ancestr2d_lbl 2350 `"Ecuadorian"', add
label define ancestr2d_lbl 2360 `"Paraguayan"', add
label define ancestr2d_lbl 2370 `"Peruvian"', add
label define ancestr2d_lbl 2380 `"Uruguayan"', add
label define ancestr2d_lbl 2390 `"Venezuelan"', add
label define ancestr2d_lbl 2480 `"South American (1980)"', add
label define ancestr2d_lbl 2481 `"South American (1990-2000, ACS, PRCS)"', add
label define ancestr2d_lbl 2482 `"Criollo/Criolla (1990-2000)"', add
label define ancestr2d_lbl 2610 `"Puerto Rican"', add
label define ancestr2d_lbl 2710 `"Cuban"', add
label define ancestr2d_lbl 2750 `"Dominican"', add
label define ancestr2d_lbl 2900 `"Hispanic"', add
label define ancestr2d_lbl 2910 `"Spanish"', add
label define ancestr2d_lbl 2950 `"Spanish American"', add
label define ancestr2d_lbl 2960 `"Other Spanish/Hispanic"', add
label define ancestr2d_lbl 3000 `"Bahamian"', add
label define ancestr2d_lbl 3010 `"Barbadian"', add
label define ancestr2d_lbl 3020 `"Belizean"', add
label define ancestr2d_lbl 3030 `"Bermudan"', add
label define ancestr2d_lbl 3040 `"Cayman Islander"', add
label define ancestr2d_lbl 3080 `"Jamaican"', add
label define ancestr2d_lbl 3100 `"Dutch West Indies"', add
label define ancestr2d_lbl 3110 `"Aruba Islander"', add
label define ancestr2d_lbl 3120 `"St Maarten Islander"', add
label define ancestr2d_lbl 3140 `"Trinidadian/Tobagonian"', add
label define ancestr2d_lbl 3150 `"Trinidadian"', add
label define ancestr2d_lbl 3160 `"Tobagonian"', add
label define ancestr2d_lbl 3170 `"U.S. Virgin Islander (1980)"', add
label define ancestr2d_lbl 3171 `"U.S. Virgin Islander (1990-2000)"', add
label define ancestr2d_lbl 3172 `"St. Croix Islander (1990-2000)"', add
label define ancestr2d_lbl 3173 `"St. John Islander (1990-2000)"', add
label define ancestr2d_lbl 3174 `"St. Thomas Islander (1990-2000)"', add
label define ancestr2d_lbl 3210 `"British Virgin Islander (1980)"', add
label define ancestr2d_lbl 3211 `"British Virgin Islander (1990-2000)"', add
label define ancestr2d_lbl 3212 `"Antigua (1990-2000, ACS, PRCS)"', add
label define ancestr2d_lbl 3220 `"British West Indian"', add
label define ancestr2d_lbl 3230 `"Turks and Caicos Islander"', add
label define ancestr2d_lbl 3240 `"Anguilla Islander (1980)"', add
label define ancestr2d_lbl 3241 `"Anguilla Islander (1990-2000)"', add
label define ancestr2d_lbl 3242 `"Montserrat Islander (1990-2000)"', add
label define ancestr2d_lbl 3243 `"Kitts/Nevis Islander (1990-2000)"', add
label define ancestr2d_lbl 3244 `"St. Christopher (1980)"', add
label define ancestr2d_lbl 3245 `"St Vincent Islander "', add
label define ancestr2d_lbl 3280 `"Dominica Islander"', add
label define ancestr2d_lbl 3290 `"Grenadian"', add
label define ancestr2d_lbl 3310 `"St Lucia Islander"', add
label define ancestr2d_lbl 3320 `"French West Indian"', add
label define ancestr2d_lbl 3330 `"Guadeloupe Islander"', add
label define ancestr2d_lbl 3340 `"Cayenne"', add
label define ancestr2d_lbl 3350 `"West Indian (1990-2000, ACS, PRCS)"', add
label define ancestr2d_lbl 3351 `"West Indian (1980)"', add
label define ancestr2d_lbl 3352 `"Caribbean (1980)"', add
label define ancestr2d_lbl 3353 `"Arawak (1980)"', add
label define ancestr2d_lbl 3360 `"Haitian"', add
label define ancestr2d_lbl 3370 `"Other West Indian"', add
label define ancestr2d_lbl 3600 `"Brazilian"', add
label define ancestr2d_lbl 3650 `"San Andres"', add
label define ancestr2d_lbl 3700 `"Guyanese/British Guiana"', add
label define ancestr2d_lbl 3750 `"Providencia"', add
label define ancestr2d_lbl 3800 `"Surinam/Dutch Guiana"', add
label define ancestr2d_lbl 4000 `"Algerian"', add
label define ancestr2d_lbl 4020 `"Egyptian"', add
label define ancestr2d_lbl 4040 `"Libyan"', add
label define ancestr2d_lbl 4060 `"Moroccan (1990-2000, ACS, PRCS)"', add
label define ancestr2d_lbl 4061 `"Moroccan (1980)"', add
label define ancestr2d_lbl 4062 `"Moor (1980)"', add
label define ancestr2d_lbl 4070 `"Ifni"', add
label define ancestr2d_lbl 4080 `"Tunisian"', add
label define ancestr2d_lbl 4110 `"North African"', add
label define ancestr2d_lbl 4120 `"Alhucemas"', add
label define ancestr2d_lbl 4130 `"Berber"', add
label define ancestr2d_lbl 4140 `"Rio de Oro"', add
label define ancestr2d_lbl 4150 `"Bahraini"', add
label define ancestr2d_lbl 4160 `"Iranian"', add
label define ancestr2d_lbl 4170 `"Iraqi"', add
label define ancestr2d_lbl 4190 `"Israeli"', add
label define ancestr2d_lbl 4210 `"Jordanian"', add
label define ancestr2d_lbl 4220 `"Transjordan"', add
label define ancestr2d_lbl 4230 `"Kuwaiti"', add
label define ancestr2d_lbl 4250 `"Lebanese"', add
label define ancestr2d_lbl 4270 `"Saudi Arabian"', add
label define ancestr2d_lbl 4290 `"Syrian (1990-2000, ACS, PRCS)"', add
label define ancestr2d_lbl 4291 `"Syrian (1980)"', add
label define ancestr2d_lbl 4292 `"Latakian (1980)"', add
label define ancestr2d_lbl 4293 `"Jebel Druse (1980)"', add
label define ancestr2d_lbl 4310 `"Armenian"', add
label define ancestr2d_lbl 4340 `"Turkish"', add
label define ancestr2d_lbl 4350 `"Yemeni"', add
label define ancestr2d_lbl 4360 `"Omani"', add
label define ancestr2d_lbl 4370 `"Muscat"', add
label define ancestr2d_lbl 4380 `"Trucial Oman"', add
label define ancestr2d_lbl 4390 `"Qatar"', add
label define ancestr2d_lbl 4410 `"Bedouin"', add
label define ancestr2d_lbl 4420 `"Kurdish"', add
label define ancestr2d_lbl 4440 `"Kuria Muria Islander"', add
label define ancestr2d_lbl 4650 `"Palestinian"', add
label define ancestr2d_lbl 4660 `"Gazan"', add
label define ancestr2d_lbl 4670 `"West Bank"', add
label define ancestr2d_lbl 4700 `"South Yemeni"', add
label define ancestr2d_lbl 4710 `"Aden"', add
label define ancestr2d_lbl 4800 `"United Arab Emirates"', add
label define ancestr2d_lbl 4820 `"Assyrian/Chaldean/Syriac (1990-2000,ACS)"', add
label define ancestr2d_lbl 4821 `"Assyrian "', add
label define ancestr2d_lbl 4822 `"Syriac (1980, 2000)"', add
label define ancestr2d_lbl 4823 `"Chaldean (2000, ACS, PRCS)"', add
label define ancestr2d_lbl 4900 `"Middle Eastern"', add
label define ancestr2d_lbl 4950 `"Arab"', add
label define ancestr2d_lbl 4951 `"Arabic (1990-2000, ACS, PRCS)"', add
label define ancestr2d_lbl 4960 `"Other Arab"', add
label define ancestr2d_lbl 5000 `"Angolan"', add
label define ancestr2d_lbl 5020 `"Benin"', add
label define ancestr2d_lbl 5040 `"Botswana"', add
label define ancestr2d_lbl 5060 `"Burundian"', add
label define ancestr2d_lbl 5080 `"Cameroonian"', add
label define ancestr2d_lbl 5100 `"Cape Verdean"', add
label define ancestr2d_lbl 5120 `"Central African Republic"', add
label define ancestr2d_lbl 5130 `"Chadian"', add
label define ancestr2d_lbl 5150 `"Congolese"', add
label define ancestr2d_lbl 5160 `"Congo-Brazzaville"', add
label define ancestr2d_lbl 5190 `"Djibouti"', add
label define ancestr2d_lbl 5200 `"Equatorial Guinea"', add
label define ancestr2d_lbl 5210 `"Corsico Islander"', add
label define ancestr2d_lbl 5220 `"Ethiopian"', add
label define ancestr2d_lbl 5230 `"Eritrean"', add
label define ancestr2d_lbl 5250 `"Gabonese"', add
label define ancestr2d_lbl 5270 `"Gambian"', add
label define ancestr2d_lbl 5290 `"Ghanian"', add
label define ancestr2d_lbl 5300 `"Guinean"', add
label define ancestr2d_lbl 5310 `"Guinea Bissau"', add
label define ancestr2d_lbl 5320 `"Ivory Coast"', add
label define ancestr2d_lbl 5340 `"Kenyan"', add
label define ancestr2d_lbl 5380 `"Lesotho"', add
label define ancestr2d_lbl 5410 `"Liberian"', add
label define ancestr2d_lbl 5430 `"Madagascan"', add
label define ancestr2d_lbl 5450 `"Malawian"', add
label define ancestr2d_lbl 5460 `"Malian"', add
label define ancestr2d_lbl 5470 `"Mauritanian"', add
label define ancestr2d_lbl 5490 `"Mozambican"', add
label define ancestr2d_lbl 5500 `"Namibian"', add
label define ancestr2d_lbl 5510 `"Niger"', add
label define ancestr2d_lbl 5530 `"Nigerian"', add
label define ancestr2d_lbl 5540 `"Fulani"', add
label define ancestr2d_lbl 5550 `"Hausa"', add
label define ancestr2d_lbl 5560 `"Ibo"', add
label define ancestr2d_lbl 5570 `"Tiv (1980)"', add
label define ancestr2d_lbl 5571 `"Tiv (1990-2000)"', add
label define ancestr2d_lbl 5572 `"Yoruba (1990-2000)"', add
label define ancestr2d_lbl 5610 `"Rwandan"', add
label define ancestr2d_lbl 5640 `"Senegalese"', add
label define ancestr2d_lbl 5660 `"Sierra Leonean"', add
label define ancestr2d_lbl 5680 `"Somalian"', add
label define ancestr2d_lbl 5690 `"Swaziland"', add
label define ancestr2d_lbl 5700 `"South African"', add
label define ancestr2d_lbl 5710 `"Union of South Africa"', add
label define ancestr2d_lbl 5720 `"Afrikaner"', add
label define ancestr2d_lbl 5730 `"Natalian"', add
label define ancestr2d_lbl 5740 `"Zulu"', add
label define ancestr2d_lbl 5760 `"Sudanese"', add
label define ancestr2d_lbl 5770 `"Dinka"', add
label define ancestr2d_lbl 5780 `"Nuer"', add
label define ancestr2d_lbl 5790 `"Fur"', add
label define ancestr2d_lbl 5800 `"Baggara"', add
label define ancestr2d_lbl 5820 `"Tanzanian"', add
label define ancestr2d_lbl 5830 `"Tanganyikan"', add
label define ancestr2d_lbl 5840 `"Zanzibar"', add
label define ancestr2d_lbl 5860 `"Togo"', add
label define ancestr2d_lbl 5880 `"Ugandan"', add
label define ancestr2d_lbl 5890 `"Upper Voltan"', add
label define ancestr2d_lbl 5900 `"Voltan"', add
label define ancestr2d_lbl 5910 `"Zairian"', add
label define ancestr2d_lbl 5920 `"Zambian"', add
label define ancestr2d_lbl 5930 `"Zimbabwean"', add
label define ancestr2d_lbl 5940 `"African Islands (1980)"', add
label define ancestr2d_lbl 5941 `"African Islands (1990-2000)"', add
label define ancestr2d_lbl 5942 `"Mauritius (1990-2000)"', add
label define ancestr2d_lbl 5950 `"Other Subsaharan Africa"', add
label define ancestr2d_lbl 5960 `"Central African, Middle Congo"', add
label define ancestr2d_lbl 5970 `"East African"', add
label define ancestr2d_lbl 5980 `"West African"', add
label define ancestr2d_lbl 5990 `"African"', add
label define ancestr2d_lbl 6000 `"Afghan"', add
label define ancestr2d_lbl 6010 `"Baluchi"', add
label define ancestr2d_lbl 6020 `"Pathan"', add
label define ancestr2d_lbl 6030 `"Bengali (1980)"', add
label define ancestr2d_lbl 6031 `"Bangladeshi (1990-2000, ACS, PRCS)"', add
label define ancestr2d_lbl 6032 `"Bengali (1990-2000, ACS, PRCS)"', add
label define ancestr2d_lbl 6070 `"Bhutanese"', add
label define ancestr2d_lbl 6090 `"Nepali"', add
label define ancestr2d_lbl 6150 `"Asian Indian (1980)"', add
label define ancestr2d_lbl 6151 `"India (1990-2000, ACS, PRCS)"', add
label define ancestr2d_lbl 6152 `"East Indian (1990-2000, ACS, PRCS)"', add
label define ancestr2d_lbl 6153 `"Madya Pradesh (1990-2000)"', add
label define ancestr2d_lbl 6154 `"Orissa (1990-2000)"', add
label define ancestr2d_lbl 6155 `"Rajasthani (1990-2000)"', add
label define ancestr2d_lbl 6156 `"Sikkim (1990-2000)"', add
label define ancestr2d_lbl 6157 `"Uttar Pradesh (1990-2000)"', add
label define ancestr2d_lbl 6220 `"Andaman Islander"', add
label define ancestr2d_lbl 6240 `"Andhra Pradesh"', add
label define ancestr2d_lbl 6260 `"Assamese"', add
label define ancestr2d_lbl 6280 `"Goanese"', add
label define ancestr2d_lbl 6300 `"Gujarati"', add
label define ancestr2d_lbl 6320 `"Karnatakan"', add
label define ancestr2d_lbl 6340 `"Keralan"', add
label define ancestr2d_lbl 6380 `"Maharashtran"', add
label define ancestr2d_lbl 6400 `"Madrasi"', add
label define ancestr2d_lbl 6420 `"Mysore"', add
label define ancestr2d_lbl 6440 `"Naga"', add
label define ancestr2d_lbl 6480 `"Pondicherry"', add
label define ancestr2d_lbl 6500 `"Punjabi"', add
label define ancestr2d_lbl 6560 `"Tamil"', add
label define ancestr2d_lbl 6750 `"East Indies (1990-2000)"', add
label define ancestr2d_lbl 6800 `"Pakistani (1980)"', add
label define ancestr2d_lbl 6801 `"Pakistani (1990-2000, ACS, PRCS)"', add
label define ancestr2d_lbl 6802 `"Kashmiri (1990-2000)"', add
label define ancestr2d_lbl 6900 `"Sri Lankan"', add
label define ancestr2d_lbl 6910 `"Singhalese"', add
label define ancestr2d_lbl 6920 `"Veddah"', add
label define ancestr2d_lbl 6950 `"Maldivian"', add
label define ancestr2d_lbl 7000 `"Burmese (1990-2000, ACS, PRCS)"', add
label define ancestr2d_lbl 7001 `"Burmese (1980)"', add
label define ancestr2d_lbl 7002 `"Burman (1980)"', add
label define ancestr2d_lbl 7020 `"Shan"', add
label define ancestr2d_lbl 7030 `"Cambodian"', add
label define ancestr2d_lbl 7040 `"Khmer"', add
label define ancestr2d_lbl 7060 `"Chinese"', add
label define ancestr2d_lbl 7070 `"Cantonese (1980)"', add
label define ancestr2d_lbl 7071 `"Cantonese (1990-2000, ACS, PRCS)"', add
label define ancestr2d_lbl 7072 `"Formosan (1990-2000)"', add
label define ancestr2d_lbl 7080 `"Manchurian"', add
label define ancestr2d_lbl 7090 `"Mandarin (1990-2000)"', add
label define ancestr2d_lbl 7120 `"Mongolian (1980)"', add
label define ancestr2d_lbl 7121 `"Mongolian (1990-2000, ACS, PRCS)"', add
label define ancestr2d_lbl 7122 `"Kalmyk (1990-2000)"', add
label define ancestr2d_lbl 7140 `"Tibetan"', add
label define ancestr2d_lbl 7160 `"Hong Kong (1990-2000)"', add
label define ancestr2d_lbl 7161 `"Hong Kong (1980)"', add
label define ancestr2d_lbl 7162 `"Eastern Archipelgo (1980)"', add
label define ancestr2d_lbl 7180 `"Macao"', add
label define ancestr2d_lbl 7200 `"Filipino"', add
label define ancestr2d_lbl 7300 `"Indonesian (1980)"', add
label define ancestr2d_lbl 7301 `"Indonesian (1990-2000, ACS, PRCS)"', add
label define ancestr2d_lbl 7302 `"Borneo (1990-2000)"', add
label define ancestr2d_lbl 7303 `"Java (1990-2000)"', add
label define ancestr2d_lbl 7304 `"Sumatran (1990-2000)"', add
label define ancestr2d_lbl 7400 `"Japanese (1980)"', add
label define ancestr2d_lbl 7401 `"Japanese (1990-2000, ACS, PRCS)"', add
label define ancestr2d_lbl 7402 `"Issei (1990-2000)"', add
label define ancestr2d_lbl 7403 `"Nisei (1990-2000)"', add
label define ancestr2d_lbl 7404 `"Sansei (1990-2000)"', add
label define ancestr2d_lbl 7405 `"Yonsei (1990-2000)"', add
label define ancestr2d_lbl 7406 `"Gosei (1990-2000)"', add
label define ancestr2d_lbl 7460 `"Ryukyu Islander"', add
label define ancestr2d_lbl 7480 `"Okinawan"', add
label define ancestr2d_lbl 7500 `"Korean"', add
label define ancestr2d_lbl 7650 `"Laotian"', add
label define ancestr2d_lbl 7660 `"Meo"', add
label define ancestr2d_lbl 7680 `"Hmong"', add
label define ancestr2d_lbl 7700 `"Malaysian (1980)"', add
label define ancestr2d_lbl 7701 `"Malaysian (1990-2000, ACS, PRCS)"', add
label define ancestr2d_lbl 7702 `"North Borneo (1990-2000)"', add
label define ancestr2d_lbl 7740 `"Singaporean"', add
label define ancestr2d_lbl 7760 `"Thai"', add
label define ancestr2d_lbl 7770 `"Black Thai"', add
label define ancestr2d_lbl 7780 `"Western Lao"', add
label define ancestr2d_lbl 7820 `"Taiwanese"', add
label define ancestr2d_lbl 7850 `"Vietnamese, Annamese"', add
label define ancestr2d_lbl 7860 `"Katu"', add
label define ancestr2d_lbl 7870 `"Ma"', add
label define ancestr2d_lbl 7880 `"Mnong"', add
label define ancestr2d_lbl 7900 `"Montagnard"', add
label define ancestr2d_lbl 7920 `"Indochinese"', add
label define ancestr2d_lbl 7930 `"Eurasian"', add
label define ancestr2d_lbl 7931 `"Amerasian"', add
label define ancestr2d_lbl 7950 `"Asian"', add
label define ancestr2d_lbl 7960 `"Other Asian"', add
label define ancestr2d_lbl 8000 `"Australian"', add
label define ancestr2d_lbl 8010 `"Tasmanian"', add
label define ancestr2d_lbl 8020 `"Australian Aborigine (1990-2000)"', add
label define ancestr2d_lbl 8030 `"New Zealander"', add
label define ancestr2d_lbl 8080 `"Polynesian (1990-2000, ACS, PRCS)"', add
label define ancestr2d_lbl 8081 `"Polynesian (1980)"', add
label define ancestr2d_lbl 8082 `"Norfolk Islander (1980)"', add
label define ancestr2d_lbl 8090 `"Kapinagamarangan (1990-2000)"', add
label define ancestr2d_lbl 8091 `"Kapinagamarangan (1980)"', add
label define ancestr2d_lbl 8092 `"Nukuoroan (1980)"', add
label define ancestr2d_lbl 8100 `"Maori"', add
label define ancestr2d_lbl 8110 `"Hawaiian"', add
label define ancestr2d_lbl 8130 `"Part Hawaiian"', add
label define ancestr2d_lbl 8140 `"Samoan (1990-2000, ACS, PRCS)"', add
label define ancestr2d_lbl 8141 `"Samoan (1980)"', add
label define ancestr2d_lbl 8142 `"American Samoan (1980)"', add
label define ancestr2d_lbl 8143 `"French Samoan"', add
label define ancestr2d_lbl 8144 `"Part Samoan (1990-2000)"', add
label define ancestr2d_lbl 8150 `"Tongan"', add
label define ancestr2d_lbl 8160 `"Tokelauan"', add
label define ancestr2d_lbl 8170 `"Cook Islander"', add
label define ancestr2d_lbl 8180 `"Tahitian, French Polynesian, Society Islander"', add
label define ancestr2d_lbl 8190 `"Niuean"', add
label define ancestr2d_lbl 8200 `"Micronesian (1990-2000, ACS, PRCS)"', add
label define ancestr2d_lbl 8201 `"Micronesian (1980)"', add
label define ancestr2d_lbl 8202 `"U.S. Trust Terr of the Pacific"', add
label define ancestr2d_lbl 8210 `"Guamanian"', add
label define ancestr2d_lbl 8220 `"Chamorro Islander"', add
label define ancestr2d_lbl 8230 `"Saipanese (1990-2000)"', add
label define ancestr2d_lbl 8231 `"Saipanese (1980)"', add
label define ancestr2d_lbl 8232 `"Norther Marianas (1980)"', add
label define ancestr2d_lbl 8240 `"Palauan"', add
label define ancestr2d_lbl 8250 `"Marshall Islander"', add
label define ancestr2d_lbl 8260 `"Kosraean"', add
label define ancestr2d_lbl 8270 `"Ponapean (1990-2000)"', add
label define ancestr2d_lbl 8271 `"Ponapean (1980)"', add
label define ancestr2d_lbl 8272 `"Mokilese (1980)"', add
label define ancestr2d_lbl 8273 `"Ngatikese (1980)"', add
label define ancestr2d_lbl 8274 `"Pingelapese (1980)"', add
label define ancestr2d_lbl 8280 `"Chuukese"', add
label define ancestr2d_lbl 8281 `"Hall Islander (1980)"', add
label define ancestr2d_lbl 8282 `"Mortlockese (1980)"', add
label define ancestr2d_lbl 8283 `"Namanouito (1980)"', add
label define ancestr2d_lbl 8284 `"Pulawatese (1980)"', add
label define ancestr2d_lbl 8285 `"Truk Islander"', add
label define ancestr2d_lbl 8290 `"Yap Islander"', add
label define ancestr2d_lbl 8300 `"Caroline Islander (1990-2000)"', add
label define ancestr2d_lbl 8301 `"Caroline Islander (1980)"', add
label define ancestr2d_lbl 8302 `"Lamotrekese (1980)"', add
label define ancestr2d_lbl 8303 `"Ulithian (1980)"', add
label define ancestr2d_lbl 8304 `"Woleaian (1980)"', add
label define ancestr2d_lbl 8310 `"Kiribatese"', add
label define ancestr2d_lbl 8320 `"Nauruan"', add
label define ancestr2d_lbl 8330 `"Tarawa Islander (1990-2000)"', add
label define ancestr2d_lbl 8340 `"Tinian Islander (1990-2000)"', add
label define ancestr2d_lbl 8400 `"Melanesian Islander"', add
label define ancestr2d_lbl 8410 `"Fijian"', add
label define ancestr2d_lbl 8430 `"New Guinean"', add
label define ancestr2d_lbl 8440 `"Papuan"', add
label define ancestr2d_lbl 8450 `"Solomon Islander"', add
label define ancestr2d_lbl 8460 `"New Caledonian Islander"', add
label define ancestr2d_lbl 8470 `"Vanuatuan"', add
label define ancestr2d_lbl 8500 `"Pacific Islander (1990-2000, ACS, PRCS)"', add
label define ancestr2d_lbl 8501 `"Campbell Islander (1980)"', add
label define ancestr2d_lbl 8502 `"Christmas Islander (1980)"', add
label define ancestr2d_lbl 8503 `"Kermadec Islander (1980)"', add
label define ancestr2d_lbl 8504 `"Midway Islander (1980)"', add
label define ancestr2d_lbl 8505 `"Phoenix Islander (1980)"', add
label define ancestr2d_lbl 8506 `"Wake Islander (1980)"', add
label define ancestr2d_lbl 8600 `"Oceania"', add
label define ancestr2d_lbl 8620 `"Chamolinian (1990-2000)"', add
label define ancestr2d_lbl 8630 `"Reserved Codes"', add
label define ancestr2d_lbl 8700 `"Other Pacific"', add
label define ancestr2d_lbl 9000 `"Afro-American"', add
label define ancestr2d_lbl 9001 `"Afro-American (1990-2000, ACS, PRCS)"', add
label define ancestr2d_lbl 9002 `"Black (1990-2000, ACS, PRCS)"', add
label define ancestr2d_lbl 9003 `"Negro (1990-2000, ACS, PRCS)"', add
label define ancestr2d_lbl 9004 `"Nonwhite (1990-2000)"', add
label define ancestr2d_lbl 9005 `"Colored (1990-2000)"', add
label define ancestr2d_lbl 9006 `"Creole (1990-2000, ACS, PRCS)"', add
label define ancestr2d_lbl 9007 `"Mulatto (1990-2000)"', add
label define ancestr2d_lbl 9008 `"Afro"', add
label define ancestr2d_lbl 9020 `"African-American (1990-2000, ACS, PRCS)"', add
label define ancestr2d_lbl 9130 `"Central American Indian (1990-2000, ACS, PRCS)"', add
label define ancestr2d_lbl 9140 `"South Amerianc Indian (1990-2000, ACS, PRCS)"', add
label define ancestr2d_lbl 9200 `"American Indian  (all tribes)"', add
label define ancestr2d_lbl 9201 `"American Indian-English-French"', add
label define ancestr2d_lbl 9202 `"American Indian-English-German"', add
label define ancestr2d_lbl 9203 `"American Indian-English-Irish"', add
label define ancestr2d_lbl 9204 `"American Indian-German-Irish"', add
label define ancestr2d_lbl 9205 `"Cherokee"', add
label define ancestr2d_lbl 9206 `"Native American"', add
label define ancestr2d_lbl 9207 `"Indian"', add
label define ancestr2d_lbl 9210 `"Aleut"', add
label define ancestr2d_lbl 9220 `"Eskimo"', add
label define ancestr2d_lbl 9230 `"Inuit"', add
label define ancestr2d_lbl 9240 `"White/Caucasian"', add
label define ancestr2d_lbl 9241 `"White/Caucasian (1990-2000, ACS, PRCS)"', add
label define ancestr2d_lbl 9242 `"Anglo (1990-2000, ACS, PRCS)"', add
label define ancestr2d_lbl 9243 `"Appalachian (1990-2000, ACS, PRCS)"', add
label define ancestr2d_lbl 9244 `"Aryan (1990-2000)"', add
label define ancestr2d_lbl 9300 `"Greenlander"', add
label define ancestr2d_lbl 9310 `"Canadian"', add
label define ancestr2d_lbl 9330 `"Newfoundland"', add
label define ancestr2d_lbl 9340 `"Nova Scotian"', add
label define ancestr2d_lbl 9350 `"French Canadian"', add
label define ancestr2d_lbl 9360 `"Acadian"', add
label define ancestr2d_lbl 9361 `"Acadian (1990-2000, ACS, PRCS)"', add
label define ancestr2d_lbl 9362 `"Cajun (1990-2000, ACS, PRCS)"', add
label define ancestr2d_lbl 9390 `"American"', add
label define ancestr2d_lbl 9391 `"American/Unites States"', add
label define ancestr2d_lbl 9400 `"United States"', add
label define ancestr2d_lbl 9410 `"Alabama"', add
label define ancestr2d_lbl 9420 `"Alaska"', add
label define ancestr2d_lbl 9430 `"Arizona"', add
label define ancestr2d_lbl 9440 `"Arkansas"', add
label define ancestr2d_lbl 9450 `"California"', add
label define ancestr2d_lbl 9460 `"Colorado"', add
label define ancestr2d_lbl 9470 `"Connecticut"', add
label define ancestr2d_lbl 9480 `"District of Columbia"', add
label define ancestr2d_lbl 9490 `"Delaware"', add
label define ancestr2d_lbl 9500 `"Florida"', add
label define ancestr2d_lbl 9510 `"Georgia"', add
label define ancestr2d_lbl 9520 `"Idaho"', add
label define ancestr2d_lbl 9530 `"Illinois"', add
label define ancestr2d_lbl 9540 `"Indiana"', add
label define ancestr2d_lbl 9550 `"Iowa"', add
label define ancestr2d_lbl 9560 `"Kansas"', add
label define ancestr2d_lbl 9570 `"Kentucky"', add
label define ancestr2d_lbl 9580 `"Louisiana"', add
label define ancestr2d_lbl 9590 `"Maine"', add
label define ancestr2d_lbl 9600 `"Maryland"', add
label define ancestr2d_lbl 9610 `"Massachusetts"', add
label define ancestr2d_lbl 9620 `"Michigan"', add
label define ancestr2d_lbl 9630 `"Minnesota"', add
label define ancestr2d_lbl 9640 `"Mississippi"', add
label define ancestr2d_lbl 9650 `"Missouri"', add
label define ancestr2d_lbl 9660 `"Montana"', add
label define ancestr2d_lbl 9670 `"Nebraska"', add
label define ancestr2d_lbl 9680 `"Nevada"', add
label define ancestr2d_lbl 9690 `"New Hampshire"', add
label define ancestr2d_lbl 9700 `"New Jersey"', add
label define ancestr2d_lbl 9710 `"New Mexico"', add
label define ancestr2d_lbl 9720 `"New York"', add
label define ancestr2d_lbl 9730 `"North Carolina"', add
label define ancestr2d_lbl 9740 `"North Dakota"', add
label define ancestr2d_lbl 9750 `"Ohio"', add
label define ancestr2d_lbl 9760 `"Oklahoma"', add
label define ancestr2d_lbl 9770 `"Oregon"', add
label define ancestr2d_lbl 9780 `"Pennsylvania"', add
label define ancestr2d_lbl 9790 `"Rhode Island"', add
label define ancestr2d_lbl 9800 `"South Carolina"', add
label define ancestr2d_lbl 9810 `"South Dakota"', add
label define ancestr2d_lbl 9820 `"Tennessee"', add
label define ancestr2d_lbl 9830 `"Texas"', add
label define ancestr2d_lbl 9840 `"Utah"', add
label define ancestr2d_lbl 9850 `"Vermont"', add
label define ancestr2d_lbl 9860 `"Virginia"', add
label define ancestr2d_lbl 9870 `"Washington"', add
label define ancestr2d_lbl 9880 `"West Virginia"', add
label define ancestr2d_lbl 9890 `"Wisconsin"', add
label define ancestr2d_lbl 9900 `"Wyoming"', add
label define ancestr2d_lbl 9930 `"Southerner"', add
label define ancestr2d_lbl 9940 `"North American"', add
label define ancestr2d_lbl 9950 `"Mixture"', add
label define ancestr2d_lbl 9960 `"Uncodable"', add
label define ancestr2d_lbl 9961 `"Not Classified"', add
label define ancestr2d_lbl 9970 `"Deferred Cases"', add
label define ancestr2d_lbl 9980 `"Other"', add
label define ancestr2d_lbl 9990 `"Not Reported"', add
label values ancestr2d ancestr2d_lbl

label define educ_lbl 00 `"N/A or no schooling"'
label define educ_lbl 01 `"Nursery school to grade 4"', add
label define educ_lbl 02 `"Grade 5, 6, 7, or 8"', add
label define educ_lbl 03 `"Grade 9"', add
label define educ_lbl 04 `"Grade 10"', add
label define educ_lbl 05 `"Grade 11"', add
label define educ_lbl 06 `"Grade 12"', add
label define educ_lbl 07 `"1 year of college"', add
label define educ_lbl 08 `"2 years of college"', add
label define educ_lbl 09 `"3 years of college"', add
label define educ_lbl 10 `"4 years of college"', add
label define educ_lbl 11 `"5+ years of college"', add
label values educ educ_lbl

label define educd_lbl 000 `"N/A or no schooling"'
label define educd_lbl 001 `"N/A"', add
label define educd_lbl 002 `"No schooling completed"', add
label define educd_lbl 010 `"Nursery school to grade 4"', add
label define educd_lbl 011 `"Nursery school, preschool"', add
label define educd_lbl 012 `"Kindergarten"', add
label define educd_lbl 013 `"Grade 1, 2, 3, or 4"', add
label define educd_lbl 014 `"Grade 1"', add
label define educd_lbl 015 `"Grade 2"', add
label define educd_lbl 016 `"Grade 3"', add
label define educd_lbl 017 `"Grade 4"', add
label define educd_lbl 020 `"Grade 5, 6, 7, or 8"', add
label define educd_lbl 021 `"Grade 5 or 6"', add
label define educd_lbl 022 `"Grade 5"', add
label define educd_lbl 023 `"Grade 6"', add
label define educd_lbl 024 `"Grade 7 or 8"', add
label define educd_lbl 025 `"Grade 7"', add
label define educd_lbl 026 `"Grade 8"', add
label define educd_lbl 030 `"Grade 9"', add
label define educd_lbl 040 `"Grade 10"', add
label define educd_lbl 050 `"Grade 11"', add
label define educd_lbl 060 `"Grade 12"', add
label define educd_lbl 061 `"12th grade, no diploma"', add
label define educd_lbl 062 `"High school graduate or GED"', add
label define educd_lbl 063 `"Regular high school diploma"', add
label define educd_lbl 064 `"GED or alternative credential"', add
label define educd_lbl 065 `"Some college, but less than 1 year"', add
label define educd_lbl 070 `"1 year of college"', add
label define educd_lbl 071 `"1 or more years of college credit, no degree"', add
label define educd_lbl 080 `"2 years of college"', add
label define educd_lbl 081 `"Associate's degree, type not specified"', add
label define educd_lbl 082 `"Associate's degree, occupational program"', add
label define educd_lbl 083 `"Associate's degree, academic program"', add
label define educd_lbl 090 `"3 years of college"', add
label define educd_lbl 100 `"4 years of college"', add
label define educd_lbl 101 `"Bachelor's degree"', add
label define educd_lbl 110 `"5+ years of college"', add
label define educd_lbl 111 `"6 years of college (6+ in 1960-1970)"', add
label define educd_lbl 112 `"7 years of college"', add
label define educd_lbl 113 `"8+ years of college"', add
label define educd_lbl 114 `"Master's degree"', add
label define educd_lbl 115 `"Professional degree beyond a bachelor's degree"', add
label define educd_lbl 116 `"Doctoral degree"', add
label define educd_lbl 999 `"Missing"', add
label values educd educd_lbl


