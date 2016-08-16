############################
# createmodeldata.R
# 
# This program will do some processing on the individual level data 
# for the models and will sample the data to create a manageable dataset
############################

library(foreign)

#load the data
individual <- read.dta("output/modeldata.dta")

##SAMPLE FROM THE FULL DATA
#there is way too much data for STATA and R to handle, so take about 1/4 of it which should give me 
#4 million obs
individual <- individual[sample(1:nrow(individual), round(nrow(individual)/4,0), replace=F),]


##CREATE ANCESTRY VARIABLE THAT BLOCKS OUT ONE GROUP

#I need to redo factors below to shrink the number of factor levels
individual$ancestr1d <- as.factor(as.character(individual$ancestr1d))
#create the ancestry factor where all european ancestries are blocked out
individual$ancestryE <- as.character(individual$ancestr1d)
individual$ancestryE[individual$rancestry1=="W"] <- "European"
individual$ancestryE <- as.factor(individual$ancestryE)

individual$ancestryAA <- as.character(individual$ancestr1d)
individual$ancestryAA[individual$rancestry1=="B"] <- "AfricanAmerican"
individual$ancestryAA <- as.factor(individual$ancestryAA)

individual$ancestryAI <- as.character(individual$ancestr1d)
individual$ancestryAI[individual$rancestry1=="AI"] <- "AmericanIndian"
individual$ancestryAI <- as.factor(individual$ancestryAI)

individual$ancestryEA <- as.character(individual$ancestr1d)
individual$ancestryEA[individual$rancestry1=="EA"] <- "EastAsian"
individual$ancestryEA <- as.factor(individual$ancestryEA)

individual$ancestryL <- as.character(individual$ancestr1d)
individual$ancestryL[individual$rancestry1=="H"] <- "Latino"
individual$ancestryL <- as.factor(individual$ancestryL)

individual$ancestryME <- as.character(individual$ancestr1d)
individual$ancestryME[individual$rancestry1=="ME"] <- "MiddleEastern"
individual$ancestryME <- as.factor(individual$ancestryME)

individual$ancestrySSA <- as.character(individual$ancestr1d)
individual$ancestrySSA[individual$rancestry1=="SSA"] <- "African"
individual$ancestrySSA <- as.factor(individual$ancestrySSA)

individual$ancestryC <- as.character(individual$ancestr1d)
individual$ancestryC[individual$rancestry1=="C"] <- "Caribbean"
individual$ancestryC <- as.factor(individual$ancestryC)

individual$ancestryPI <- as.character(individual$ancestr1d)
individual$ancestryPI[individual$rancestry1=="PI"] <- "PacIslander"
individual$ancestryPI <- as.factor(individual$ancestryPI)

individual$ancestrySA <- as.character(individual$ancestr1d)
individual$ancestrySA[individual$rancestry1=="SA"] <- "SouthAsian"
individual$ancestrySA <- as.factor(individual$ancestrySA)


#SAVE THE RESULTS
save(individual, file="output/individual.RData")
write.dta(individual, file="output/individual.dta", version=10, convert.factors="labels")

