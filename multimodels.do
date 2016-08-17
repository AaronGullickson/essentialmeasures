/*****************************
* multimodels.do
* Aaron Gullickson
* 
* Run the multilevel models which calculate ancestry variation within 
* each big race group for college completion. 
*
* IMPORTANT NOTE: In the published paper, I use the person weights in the 
* models. However, it appears that Stata 14 now does not allow person weights
* in the xtmelogit command, so I have removed them. It has no substantial
* effect on the estimated variance parameters. 
******************************/

use output/individual, clear

log using logs/log_multimodels2.txt, replace text

/**WHITE**/
/*keep if rancestry1s==1
xtmelogit college agectr agectrsq i.yearint female foreign || ancestr1d: 
*/
    
/**BLACK**/
/*use output/individual, clear
keep if rancestry1s==2
xtmelogit college agectr agectrsq i.yearint female foreign || ancestr1d:
*/
    
/**INDIAN**/
/*use output/individual, clear
keep if rancestry1s==3
xtmelogit college agectr agectrsq i.yearint female foreign || ancestr1d:
*/

/**ASIAN**/
/*use output/individual, clear
keep if rancestry1s==4
xtmelogit college agectr agectrsq i.yearint female foreign || ancestr1d:
*/

/**LATINO**/
use output/individual, clear
keep if rancestry1s==5
xtmelogit college agectr agectrsq i.yearint female foreign || ancestr1d:

log close
