/****************************
* bigmodel.do
* Aaron Gullickson
* 
* This stata do file will read in the individual level data and will run a 
* variety of fixed effects models on college completion
****************************/

use output/individual, clear

log using logs/log_bigmodel.txt, replace text

//null model
glm college [aweight=perwt], family(binomial) link(logit)

//Model 1:Demographic
glm college i.yearint agectr agectrsq female foreign [aweight=perwt], family(binomial) link(logit)

//Model 2: OMB race
glm college i.yearint agectr agectrsq female foreign i.rancestry1s [aweight=perwt], family(binomial) link(logit)

//Model 3: expanded race
glm college i.yearint agectr agectrsq female foreign i.rancestry1 [aweight=perwt], family(binomial) link(logit)

//Model 4: specific rancestry
glm college i.yearint agectr agectrsq female foreign i.ancestr1d [aweight=perwt], family(binomial) link(logit)

//Model 5: simplify european ancestries to one block
glm college i.yearint agectr agectrsq female foreign i.ancestryE [aweight=perwt], family(binomial) link(logit)

//Model 6: simplify black ancestries to one block
glm college i.yearint agectr agectrsq female foreign i.ancestryAA [aweight=perwt], family(binomial) link(logit)

//Model 7: simplify AmIndian ancestries to one block
glm college i.yearint agectr agectrsq female foreign i.ancestryAI [aweight=perwt], family(binomial) link(logit)

//Model 8: simplify EastAsian ancestries to one block
glm college i.yearint agectr agectrsq female foreign i.ancestryEA [aweight=perwt], family(binomial) link(logit)

//Model 9: simplify latino ancestries to one block
glm college i.yearint agectr agectrsq female foreign i.ancestryL [aweight=perwt], family(binomial) link(logit)

//Model 10: simplify middle eastern ancestries to one block
glm college i.yearint agectr agectrsq female foreign i.ancestryME [aweight=perwt], family(binomial) link(logit)

//Model 11: simplify african ancestries to one block
glm college i.yearint agectr agectrsq female foreign i.ancestrySSA [aweight=perwt], family(binomial) link(logit)

//Model 12: simplify caribbean ancestries to one block
glm college i.yearint agectr agectrsq female foreign i.ancestryC [aweight=perwt], family(binomial) link(logit)

//Model 13: simplify pac islander ancestries to one block
glm college i.yearint agectr agectrsq female foreign i.ancestryPI [aweight=perwt], family(binomial) link(logit)

//Model 14: simplify south asian ancestries to one block
glm college i.yearint agectr agectrsq female foreign i.ancestrySA [aweight=perwt], family(binomial) link(logit)

log close
