#!/bin/bash

#Set your stata path
stata=/usr/local/stata14/stata-mp

echo -n "Importing raw IPUMS data and organizing..."
$stata -b do organizedata.do
rm organizedata.log
echo "Done"
echo -n "Collapsing ancestry data..."
$stata -b do collapsedata.do
rm collapsedata.log
rm temp.dta
echo "Done"
echo -n "Bootstrapping entropy with THOTH..."
python entropy.py > logs/log_entropycalc.txt
echo "Done"
echo -n "Creating model data..."
R CMD BATCH createmodeldata.R logs/log_modeldata.txt
echo "Done"
echo -n "Running education models..."
$stata -b do bigmodel.do
rm bigmodel.log
echo -n "Running multilevel models..."
$stata -b do multimodels.do
rm multimodels.log
echo "Done"
echo "Analysis complete"
