# Usage
The Bash script BashDataManagement.sh aims at presenting the most useful Bash commands to manage genomics data and dataframes from different sources.
The R script BashDataManagement.R aims at performing statistical analyses from the output of the Bash script BashDataManagement.sh.
# Dependencies
## Bash commands
- ssh
- cd
- pwd
- mkdir
- cp
- unzip
- rm
- chmod
- ls
- more
- for
- awk
- grep
- cat
- sed
- sort
- head
- cut
- join
- touch
- scp
## R libraries
- ggplot2
- plyr
- reshape2
- tidyr
- AER
- spgs
- usethis
- devtools
- ggbiplot
# Objectives
The objectives of three units aims at answering the two questions below.
- Is there a correlation between the expected and estimated depth of coverage?
- Are there significance differences between GC% of genome types?
# Backgroud
Three units provided genomics data and dataframes.
- The unit 1 is a bacteriological unit providing results of genome typing (i.e. dataframe-unit1-transposed.tsv)
- The unit 2 is a sequencing unit providing reads with expected depth of coverage (i.e. dataframe-unit2.csv)
- The unit 3 is a bioinformatics unit measuring the depth of coverage and GC % (i.e. files with extension .unit3)
# Follow step per step the Bash script with a shell
```
gedit BashDataManagement.sh
```
# Follow step per step the R script with RStudio
```
rstudio BashDataManagement.R
```
# Illustration
![PCA figure](https://github.com/Nicolas-Radomski/BashDataManagement/blob/main/illustration.png)
# Reference
Mangone I., Palma F., Janowicz A., Moura A., Chiaverini A., Torresi M., Garofolo G., Criscuolo A., Brisse S., Di Pasquale A., Camma C. and N. Radomski. In vitro and in silico parameters for precise cgMLST typing of Listeria monocytogenes 2021, under reviewing
# Acknowledgment
My former colleagues with whom I learned a lot about Bash
# Author
Nicolas Radomski
