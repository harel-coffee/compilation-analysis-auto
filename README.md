# Analysis of TUXML builds (including failures)

Analysis of 125K+ configurations

## Learning and querying data 

pre-requisite: download `config_bdd30-100.pkl` here https://filesender.renater.fr/?s=download&token=556ae671-4546-493e-f96f-3cd3c1919724# 

 * TUXML-analysis.ipynb: learning and some exploration of bugs out of `config_bdd30-100.pkl`
 * bdd-tuxml-facility: database facilities (e.g., logs) typically to analyze configuration (failures)
 * ClusterAnalysis.ipynb: analysis of the log messages based on pre-defined patterns (here pre-requisite is `errlogs.pkl` available here: https://filesender.renater.fr/?s=download&token=703257a5-0830-8e86-c087-bc6d2025e906)
 
## Extraction

### database-to-CSV.py (and genCSV.py + DBCredentials.py) 

script to extract configuration data from database (CSV file, only configuration and compilation status/sizes)
   * the script can be parameterized with From and To (cids to start and top). 
   * normally you don't need to use it and beware it's bandwith/time consuming. 
   * we use it to extract different CSVs that are then assembled into one 
   
see also https://github.com/TuxML/tuxml-datasets for getting data using [git-lfs](https://git-lfs.github.com/)

### TUXML-csv-building.ipynb

script to assemble CSV files into one (aggregation), export using the pickle format (https://pandas.pydata.org/pandas-docs/stable/user_guide/io.html) 


## deprecated 

* TUXML-basic.ipynb: learning and some exploration of bugs (out of config_10K.csv, see below)
   * if you want to process config_50K.csv, just change `TUXML_CSV_FILENAME= './config_bdd10K.csv'`
   * there is also a part about kernel sizes, but it's out of the scope right now
excerpt: config_bdd10K.csv 
https://filesender.renater.fr/?s=download&token=1e3dfbc4-73a4-90be-49f5-9c8d6da4dce4 
excerpt: config_bdd50K.csv 
https://filesender.renater.fr/?s=download&token=23444e96-7d15-2ff0-99f6-a14796291ea0
