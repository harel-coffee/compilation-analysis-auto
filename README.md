# Analysis of TUXML builds (including failures)

Analysis of 95K+ configurations of the Linux kernel

## Learning and querying data 

 * pre-requisite is:
   * `errlogs.pkl` (build error logs from cid=30000 to cid=100000, only for build failures: a few gigabytes): available here https://figshare.com/s/14ecbf3ab3c42b89d1a9
   * `errlogs-100000-end.csv` (build error logs from cid=100000 to cid=127000, only for build failures: a few megabytes): available here https://figshare.com/s/3b9ea2a73dcdd57cc8ad 
   * `dataset_encoded.csv` (configuration data from cid=30000 to cid=127000, each row is a configuration with build status and options): available here https://figshare.com/s/ef16be525f0387211bf3 
 * ClusterAnalysis.ipynb: cluster analysis and statistical learning about options 
 * TUXML*.ipynb
   * sensitivity analysis of decision tree and rules extraction facilitiy 
   * clustering attempts 
 * pdf files are generated out of notebook scripts, we push them for convenience/reviewing  
 
 
## Extraction

We have a database out of which we can extract/encode some data. The following scripts serve this purpose. 

### database-to-CSV.py (and genCSV.py + DBCredentials.py) 

script to extract configuration data from database (CSV file, only configuration and compilation status/sizes)
   * the script can be parameterized with From and To (cids to start and top). 
   * normally you don't need to use it and beware it's bandwith/time consuming. 
   * we use it to extract different CSVs that are then assembled into one 
   
see also https://github.com/TuxML/tuxml-datasets for getting data using [git-lfs](https://git-lfs.github.com/)

### TUXML-csv-building.ipynb

script to assemble CSV files into one (aggregation), export using the pickle format (https://pandas.pydata.org/pandas-docs/stable/user_guide/io.html) 


## deprecated 

 * TUXML-analysis.ipynb: learning and some exploration of bugs out of `config_bdd30-100.pkl` pre-requisite: download `config_bdd30-100.pkl` 
 * bdd-tuxml-facility: database facilities (e.g., logs) typically to analyze configuration (failures)
 * TUXML-basic.ipynb: learning and some exploration of bugs (out of config_10K.csv, see below)
   * if you want to process config_50K.csv, just change `TUXML_CSV_FILENAME= './config_bdd10K.csv'`
   * there is also a part about kernel sizes, but it's out of the scope right now

