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
- ggpmisc
- reshape2
- plyr
# Objectives
The objectives of three laboratory units aim at answering the questions below.
- Is there a correlation between the expected and estimated depth of coverage?
- Are there significance differences between GC% of genome types?
# Backgroud
The three laboratory units provided genomics data and dataframes.
- The unit 1 is a bacteriological unit providing results of genome typing (i.e. dataframe-unit1-transposed.tsv)
- The unit 2 is a sequencing unit providing reads with expected depth of coverage (i.e. dataframe-unit2.csv)
- The unit 3 is a bioinformatics unit estimating the depth of coverage and GC % (i.e. files with extension .unit3)
# Follow step per step the Bash script with a shell
```
gedit BashDataManagement.sh
```
# Follow step per step the R script with RStudio
```
rstudio BashDataManagement.R
```
# Expected conclusions
The expected conclusions are described below.
- There is a significant (p-value < 2.2e-16) correlation (R2=99.98%) between the expected and estimated depth of coverage
- There is not significant differences (p-value = 0.8125) of GC content between genome type A (38.132±0.013) and B (38.134±0.011)
- There is significant differences (p-value = 0.05791) of GC content between genome type C (37.910±0.012) and B (38.134±0.011)
- There is significant differences (p-value = 0.05447) of GC content between genome type C (37.910±0.012) and A (38.132±0.013)

# Illustration
![PCA figure](https://github.com/Nicolas-Radomski/BashDataManagement/blob/main/illustration.png)
# Reference
Project learning genomics for food safety (LEGO): https://www.learngenomics.eu/
# Acknowledgment
My former colleagues with whom I learned a lot about Bash and R
# Author
Nicolas Radomski
