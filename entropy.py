####################
# Aaron Gullickson
# entropy.py
#
#This script will calculate entropy via bootstrap (THOTH) for the ancestry data.
#For it to work it is necessary to have installed THOTH in the same directory or
#to change the pathway to a correct THOTH directory. The script uses the weighted
#population counts to calculate entropy. To change to unweighted counts, just change
#the input files accordingly.
####################

##INITIALIZATIONS##
import sys
sys.path.append('./thoth/')
import thoth.thoth as thoth
dir(thoth)
import numpy as np

##CALCULATE ENTROPY VIA BOOSTRAP FOR DETAILED ANCESTRIES##
#read in the CSV file and calculate entropy
import csv
ancestry = np.array([['ancestry','white','black','indig','asian','latino','mixed','other','N','meso','big','entropy','eplusone','eminusone','eplustwo','eminustwo']])
with open('output/raceancestryd_single_2000_weighted.csv') as csvfile:
	reader = csv.DictReader(csvfile)
	for row in reader:
		a = [float(row['white']), float(row['black']), float(row['indig']), float(row['asian']), float(row['latino']), float(row['mixed']), float(row['other'])]
		result = thoth.calc_entropy(a,10000)
                p = [[row['ancestr1d'],row['white'],row['black'],row['indig'],row['asian'],row['latino'],row['mixed'],row['other'],row['raceshort'],row['rancestry1'],row['rancestry1s'],str(result[0]),str(result[1]),str(result[2]),str(result[3]),str(result[4])]]
                print p
                ancestry = np.append(ancestry,p,0)                
#now output the results as CSV
with open('output/entropy_single_2000.csv', 'wb') as csvfile:
        writer = csv.writer(csvfile, delimiter=",", quotechar='\"')
        for row in ancestry:
                writer.writerow(row)

##CALCULATE ENTROPY VIA BOOSTRAP FOR BIG RACE CATEGORIES##
ancestry = np.array([['rancestry','white','black','indig','asian','latino','mixed','other','N','entropy','eplusone','eminusone','eplustwo','eminustwo']])
with open('output/raceancestryomb_2000_weighted.csv') as csvfile:
        reader = csv.DictReader(csvfile)
        for row in reader:
                a = [float(row['white']), float(row['black']), float(row['indig']), float(row['asian']), float(row['latino']), float(row['mixed']), float(row['other'])]
                result = thoth.calc_entropy(a,1000)
                p = [[row['raceancd'],row['white'],row['black'],row['indig'],row['asian'],row['latino'],row['mixed'],row['other'],row['raceshort'],str(result[0]),str(result[1]),str(result[2]),str(result[3]),str(result[4])]]
                print p
                ancestry = np.append(ancestry,p,0)
with open('output/entropy_omb_2000.csv', 'wb') as csvfile:
        writer = csv.writer(csvfile, delimiter=",", quotechar='\"')
        for row in ancestry:
                writer.writerow(row)

##CALCULATE ENTROYP VIA BOOTSTRAP FOR BIG RACE CATEOGORIES BY YEAR##
ancestry = np.array([['rancestry','year','white','black','indig','asian','latino','mixed','other','N','entropy','eplusone','eminusone','eplustwo','eminustwo']])
with open('output/raceancestryomb_byyear_weighted.csv') as csvfile:
        reader = csv.DictReader(csvfile)
        for row in reader:
                a = [float(row['white']), float(row['black']), float(row['indig']), float(row['asian']), float(row['latino']), float(row['mixed']), float(row['other'])]
                result = thoth.calc_entropy(a,1000)
                p = [[row['raceancd'],row['yearint'],row['white'],row['black'],row['indig'],row['asian'],row['latino'],row['mixed'],row['other'],row['raceshort'],str(result[0]),str(result[1]),str(result[2]),str(result[3]),str(result[4])]]
                print p
                ancestry = np.append(ancestry,p,0)
with open('output/entropy_omb_byyear.csv', 'wb') as csvfile:
        writer = csv.writer(csvfile, delimiter=",", quotechar='\"')
        for row in ancestry:
                writer.writerow(row)

