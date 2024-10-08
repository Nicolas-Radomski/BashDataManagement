#### Header to launch the whole Bash script with sh ####

#!/bin/bash # shebang in the first line
set -euo pipefail # exit with a non-zero status in the second line

#### Bash-based data management ####

# connect to a server and create a mounting point to a personnal working area
## connect to a server
ssh user@??.??.??.???
## move into the personal area
cd /path/to/user/
## check the position of navigation
pwd
## create a directory dedicated to the training
mkdir BashDataManagement
## create a mounting point to the directory "BashDataManagment" from your browser to have access to data independantly of the shell
sftp://??.??.??.???/path/to/user/BashDataManagement

# retrieve input data and create a directory to store output data
## move inside the working area
cd BashDataManagement
## unpack the GitHub repository into a directory called repository
git clone https://github.com/Nicolas-Radomski/BashDataManagement.git repository
## copy the file input.zip from the repository
cp repository/input.zip .
## decompress the file input.zip
unzip input.zip
## remove the useless directory called repository
rm -rf repository/
## remove the useless file called input.zip
rm input.zip
## open the reading permission to the user
chmod -R u+r input/
## open the writing permission to the user
chmod -R u+w input/
## open the execution permission to the user
chmod -R u+x input/
## check the files available into the directory input
ls input/
## create a directory to store output data
mkdir output

# clean the file dataframe-unit1.tsv
## check if the file is from windows or linux (i.e. "\r\n" for windows or "\n" for linux)
hexdump -c input/dataframe-unit1-transposed.tsv
## install dos2unix in needed
sudo apt install -y dos2unix
## pass from windows to linux if necessary
dos2unix input/dataframe-unit1-transposed.tsv
## open the file dataframe-unit1-transposed.tsv and notice that the corresponding dataframe is transposed
more input/dataframe-unit1-transposed.tsv
## transpose the file dataframe-unit1-transposed.tsv, then save it in the output directory as dataframe-unit1.tsv
rm output/dataframe-unit1.tsv
col="$(head -1 input/dataframe-unit1-transposed.tsv | wc -w)"
for i in $(seq 1 $col); do
    awk '{ print $'$i' }' input/dataframe-unit1-transposed.tsv | paste -s -d "\t"
done >> output/dataframe-unit1.tsv
## check that the file dataframe-unit1.tsv is not transposed and notice that the sample-00016 does not have results (i.e. ?)
more output/dataframe-unit1.tsv
## exclude the sample without results (i.e. sample-00016) from the file dataframe-unit1.tsv, then save it in output directory as clean-dataframe-unit1.tsv
grep -v 'sample-00016' output/dataframe-unit1.tsv > output/clean-dataframe-unit1.tsv
## check if the sample-00016 does not appear in the file clean-dataframe-unit1.tsv
more output/clean-dataframe-unit1.tsv
## check the number of lines of the file clean-dataframe-unit1.tsv (i.e. 16 lines)
cat output/clean-dataframe-unit1.tsv | wc -l
## check the number of colomns of the file clean-dataframe-unit1.tsv (i.e. 2 colomns)
awk -F'\t' '{print NF}' output/clean-dataframe-unit1.tsv | sort -nu | tail -n 1

# clean the file dataframe-unit2.tsv
## check if the file is from windows or linux (i.e. "\r\n" for windows or "\n" for linux)
hexdump -c input/dataframe-unit2.csv
## pass from windows to linux if necessary
dos2unix input/dataframe-unit2.csv
## open the file dataframe-unit2.csv and notice that the string 'SAMPLE' is in capital letters
more input/dataframe-unit2.csv
## replace the string 'sample' by 'SAMPLE' into the file dataframe-unit2.csv, then save it in the output directory as clean-dataframe-unit2.csv
sed 's@SAMPLE@sample@'g input/dataframe-unit2.csv > output/clean-dataframe-unit2.csv
## check if the string 'sample' is replaced by 'SAMPLE' into the file clean-dataframe-unit2.csv and notice that the samples are not sorted with comma separators (i.e. csv)
more output/clean-dataframe-unit2.csv
## sort per sample the file clean-dataframe-unit2.csv, replace the comma separators (i.e. csv) by tab separators (i.e. tsv), then save it in the output directory as clean-dataframe-unit2.tsv
sort -t ',' -k1,1 output/clean-dataframe-unit2.csv | tr ',' '\t' > output/clean-dataframe-unit2.tsv
## check if the samples are sorted with tab separators into the file clean-dataframe-unit2.tsv
more output/clean-dataframe-unit2.tsv
## check the number of lines of the file clean-dataframe-unit2.tsv (i.e. 16 lines)
cat output/clean-dataframe-unit2.tsv | wc -l
## check the number of colomns of the file clean-dataframe-unit2.tsv (i.e. 2 colomns)
awk -F'\t' '{print NF}' output/clean-dataframe-unit2.tsv | sort -nu | tail -n 1

# creat and clean the file dataframe-unit3.tsv
## check if the files are from windows or linux (i.e. "\r\n" for windows or "\n" for linux)
hexdump -c input/sample-00001.unit3
## pass from windows to linux if necessary
dos2unix input/*.unit3
## notice that the unit3 provided a useless sample-00016.unit3 and remove it
more input/sample-00016.unit3
rm input/sample-00016.unit3
## notice that the unit3 provided tsv files with extentions .unit3, combine them, and save it in the output directory as dataframe-unit3-V1.tsv
ll input/
grep . input/*.unit3 > output/dataframe-unit3-V1.tsv
## notice that the colomn 1 and 2 of the file dataframe-unit3-V1.tsv are separated with double dots, replace them with tab separators, then save it in the output directory as dataframe-unit3-V2.tsv
more output/dataframe-unit3-V1.tsv
sed 's@:@\t@'g output/dataframe-unit3-V1.tsv > output/dataframe-unit3-V2.tsv
## notice that the the strings 'input/' and '.init3' are useless in the sample identifiers (i.e. colomn 1), remove them, then save it in the output directory as dataframe-unit3-V3.tsv
more output/dataframe-unit3-V2.tsv
sed 's@input/@@'g output/dataframe-unit3-V2.tsv | sed 's@.unit3@@'g > output/dataframe-unit3-V3.tsv
## notice that the file dataframe-unit3-V3.tsv have multiple header, remove them (i.e. dataframe-unit3-V4.tsv), save a single header (i.e. dataframe-unit3-V4-header.tsv) and combine both (i.e. dataframe-unit3-V5.tsv)
### check the multiple headers of the file dataframe-unit3-V3.tsv
more output/dataframe-unit3-V3.tsv
### keep the lines without the string '#ID' of the file dataframe-unit3-V3.tsv, then save it in the output directory as dataframe-unit3-V4.tsv
grep -v '#ID' output/dataframe-unit3-V3.tsv > output/dataframe-unit3-V4.tsv
### keep the first line and replace the string 'sample-00001' by 'sample' of the file dataframe-unit3-V4.tsv, then save it in the output directory as dataframe-unit3-V4-header.tsv
sed -n '1p' output/dataframe-unit3-V3.tsv | sed 's@sample-00001@sample@'g > output/dataframe-unit3-V4-header.tsv
### combine the header (i.e. dataframe-unit3-V4-header.tsv) and dataframe (i.e. output/dataframe-unit3-V4.tsv)
cat output/dataframe-unit3-V4-header.tsv output/dataframe-unit3-V4.tsv > output/dataframe-unit3-V5.tsv
## identify colomns of interest: sample (i.e. colomn 1 called sample), GC% (i.e. colomn 10 called Read_GC) and depth of coverage (i.e. colomn 11 called Median_fold)
head -1 output/dataframe-unit3-V5.tsv | tr '\t' '\n' | nl
## extract the colomns of interest from the file dataframe-unit3-V5.tsv (i.e. 1, 10 and 11), correct fields of the header, then save it in output directory as dataframe-unit3-V1.tsv
cut -d$'\t' -f1,10,11 output/dataframe-unit3-V5.tsv | sed 's@Read_GC@GC@'g | sed 's@Median_fold@estimated_depth@'g > output/clean-dataframe-unit3.tsv
## check the number of lines of the file clean-dataframe-unit3.tsv (i.e. 16 lines)
cat output/clean-dataframe-unit3.tsv | wc -l
## check the number of colomns of the file clean-dataframe-unit3.tsv (i.e. 3 colomns)
awk -F'\t' '{print NF}' output/clean-dataframe-unit3.tsv | sort -nu | tail -n 1

# join the clean dataframes from the three units
## remove headers of dataframes
sed '1d' output/clean-dataframe-unit1.tsv > output/clean-dataframe-unit1-noheader.tsv
sed '1d' output/clean-dataframe-unit2.tsv > output/clean-dataframe-unit2-noheader.tsv
sed '1d' output/clean-dataframe-unit3.tsv > output/clean-dataframe-unit3-noheader.tsv
## join the files clean-dataframe-unit1-noheader.tsv and clean-dataframe-unit2-noheader.tsv
join -t $'\t' -1 1 -2 1 output/clean-dataframe-unit1-noheader.tsv output/clean-dataframe-unit2-noheader.tsv -a 2 > output/clean-dataframe-unit1-unit2-noheader.tsv
## join of the files output/clean-dataframe-unit1-unit2-noheader.tsv and clean-dataframe-unit3-noheader.tsv
join -t $'\t' -1 1 -2 1 output/clean-dataframe-unit1-unit2-noheader.tsv output/clean-dataframe-unit3-noheader.tsv -a 2 > output/clean-dataframe-unit1-unit2-unit3-noheader.tsv
## creat a header with colomns of interest
touch output/header-clean-dataframe.csv | echo sample,genome_type,expected_depth,GC_content,estimated_depth >> output/header-clean-dataframe.csv
## transform the header csv into tsv
cat output/header-clean-dataframe.csv | tr ',' '\t' > output/header-clean-dataframe.tsv
## combine the files header-clean-dataframe.tsv and clean-dataframe-unit1-unit2-unit3-noheader.tsv
cat output/header-clean-dataframe.tsv output/clean-dataframe-unit1-unit2-unit3-noheader.tsv > output/clean-dataframe.tsv
## check the structure of the file clean-dataframe.tsv
more output/clean-dataframe.tsv
## check the number of lines of the file clean-dataframe.tsv (i.e. 16 lines)
cat output/clean-dataframe.tsv | wc -l
## check the number of colomns of the file clean-dataframe.tsv (i.e. 5 colomns)
awk -F'\t' '{print NF}' output/clean-dataframe.tsv | sort -nu | tail -n 1
## rename the file clean-dataframe.tsv as dataframe.tsv
mv output/clean-dataframe.tsv output/dataframe.tsv
## save the file clean-dataframe.tsv in your computeur
scp output/dataframe.tsv user@???.???.?.??:/path/to/RstudioWorkingDirectory/BashDataManagement/.
