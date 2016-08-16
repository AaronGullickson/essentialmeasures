###############################################################################
# calculate_entropy.R
# Aaron Gullickson
#
# 
# This program will read in the counts of observations by race and ancestry
# and output the entropy score for each ancestry. This is done for three
# different types of input. 
#
#  (1) anc.single - each row is an individual ancestry response for all single
#      ancestry respondents from 2000 on.
#  (2) anc.big - each row is a big racial ancestry response including 
#      multiracial ancestry respondents from 2000 on.
#  (3) anc.time - The same as anc.big but separate for each year, including 
#      census 1990
# 
# PLEASE NOTE: The preferred way to calculate entropy is to use the entropy.py
# script which uses THOTH to get a bootstrapped estimate that better adjusts for 
# sampling bias and calculates 95% confidence intervals for the sample estimate. 
# The current script is only for those who have difficulty or don't want to go to
# the trouble of installing THOTH (which can be tricky). In most cases, the results
# here will be quite close to those for THOTH, because the sampling bias issue is small
# here since it is only large when there is a large number of categories relative to the number
# of observations. The only noticeable differences will tend to be for single ancestries with 
# a small number of observations. 
#
# Two methods are used here. Users should preferably install the entropy package and then the 
# program will use the Miller-Madow method which also adjusts for potential sampling bias. If 
# that is not installed the script here will estimate entropy the basic way. 
###############################################################################

anc.single <- read.csv("output/raceancestryd_single_2000_weighted.csv")
anc.big <- read.csv("output/raceancestryomb_2000_weighted.csv")
anc.time <- read.csv("output/raceancestryomb_byyear_weighted.csv")

if(require("entropy")) {
  
  #change scale so that entropy goes from 0 to 1
  scale <- 1/(-1*log(1/7))
  
  anc.single$entropy <- scale * apply(anc.single[,2:8],1,entropy.MillerMadow)
  anc.big$entropy <- scale * apply(anc.big[,2:8],1,entropy.MillerMadow)
  
  #scale needs to vary for over time analysis to adjust for 1990 which had no multiracial category
  scale <- rep(1/(-1*log(1/7,2)), nrow(anc.time))
  scale[anc.time$year<2000] <- 1/(-1*log(1/6,2))
  anc.time$entropy <- scale * apply(anc.time[,2:8],1,entropy.MillerMadow)
  
} else {
  
  cat("Note: please install entropy package in order to calculate entropy with Miller Madow correction for sampling bias.")
  anc.single$entropy <- -1 * apply((anc.single[,2:8]/apply(anc.single[,2:8],1,sum))*
                               log((anc.single[,2:8]/apply(anc.single[,2:8],1,sum)),7),
                             1,sum, na.rm=T)
  anc.big$entropy <- -1 * apply((anc.big[,2:8]/apply(anc.big[,2:8],1,sum))*
                                     log((anc.big[,2:8]/apply(anc.big[,2:8],1,sum)),7),
                                   1,sum, na.rm=T)
  
  #log-base needs to vary for over time analysis to adjust for 1990 which had no multiracial category
  anc.time$entropy <- -1 * apply((anc.time[,2:8]/apply(anc.time[,2:8],1,sum))*
                                   log((anc.time[,2:8]/apply(anc.time[,2:8],1,sum)),7),
                                 1,sum, na.rm=T)
  #recalculate for 1990 with base 6
  TF <- anc.time$year < 2000
  anc.time$entropy[TF] <- -1 * apply((anc.time[TF,2:8]/apply(anc.time[TF,2:8],1,sum))*
                                   log((anc.time[TF,2:8]/apply(anc.time[TF,2:8],1,sum)),6),
                                 1,sum, na.rm=T)
}

colnames(anc.single) <- c('ancestry','white','black','indig','asian','latino','mixed','other','N','meso','big','entropy')
colnames(anc.big) <- c('rancestry','white','black','indig','asian','latino','mixed','other','N','entropy')
colnames(anc.time) <- c('rancestry','year','white','black','indig','asian','latino','mixed','other','N','entropy')

write.csv(anc.single, file="output/entropy_single_2000.csv", row.names=FALSE)
write.csv(anc.big, file="output/entropy_omb_2000.csv", row.names=FALSE)
write.csv(anc.time, file="output/entropy_omb_byyear.csv", row.names=FALSE)
