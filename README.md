# Usage
The repository BashDataManagement provides key elements and training exercises to manage genomics data and dataframes through Bash (Bourne Again Shell) in the framework of a imaginary collaborative project between lab units dealing with fictitious input data.
- The Bash script BashDataManagement.sh aims at presenting the most useful Bash commands to manage genomics data and dataframes from different sources.
- The R script BashDataManagement.R aims at performing statistical analyses from the output of the Bash script BashDataManagement.sh.
# Dependencies
## Bash commands
- awk (Alfred Aho, Peter Weinberger, Brian Kernighan)
- cat (concatenate)
- cut (cut)
- cd (change current working directory)
- chmod (change mode)
- cp (copy)
- echo (prints text to the terminal)
- for (for)
- gedit (text editor)
- git
- grep (global regular expression print)
- head (head)
- join (join)
- ls (list)
- mkdir (make directory)
- more (more)
- mv (move)
- pwd (print working directory)
- rm (remove)
- sed (stream editor)
- sort (sort)
- scp (secure copy protocol)
- ssh (secure shell)
- touch (update the access date)
- unzip (extract files from a ZIP archive)
## R libraries
- ggplot2
- ggpmisc
- plyr
- reshape2
# Objectives
The objectives of three laboratory units aim at answering the questions below.
- Is there a correlation between the expected and estimated depth of coverage?
- Are there significance differences between GC% of genome types?
# Available input
The three laboratory units provided genomics data and dataframes.
- The unit 1 is a bacteriological unit providing results of genome typing (i.e. dataframe-unit1-transposed.tsv)
- The unit 2 is a sequencing unit providing reads with expected depth of coverage (i.e. dataframe-unit2.csv)
- The unit 3 is a bioinformatics unit estimating the depth of coverage and GC content (i.e. files with the extension .unit3)
# Launch the commands one after the other, then adapt the paths of working directories and comment the commands of connection
## From the Bash script with Gedit
```
gedit BashDataManagement.sh
```
## From the R script with RStudio
```
rstudio BashDataManagement.R
```
# Launch the whole scripts after having adapted the paths of working directories and commented the commands of connection
## From the Bash script with sh
```
sh BashDataManagement.sh
```
## From the R script with R
```
r BashDataManagement.R
```
# Expected output
The expected conclusions are described below.
- There is a significant (p-value < 2.2e-16) correlation (R2=99.98%) between the expected and estimated depth of coverage
- There is not significant differences (p-value = 0.8125) of GC content between genomes of type A (38.132±0.013) and B (38.134±0.011)
- There is significant differences (p-value = 0.05791) of GC content between genomes of type C (37.910±0.012) and B (38.134±0.011)
- There is significant differences (p-value = 0.05447) of GC content between genomes of type C (37.910±0.012) and A (38.132±0.013)

# Illustration
![PCA figure](https://github.com/Nicolas-Radomski/BashDataManagement/blob/main/illustration.png)
# Reference
Project learning genomics for food safety (LEGO): https://www.learngenomics.eu/
# Acknowledgment
My former colleagues with whom I learned a lot about Bash and R
# Author
Nicolas Radomski
