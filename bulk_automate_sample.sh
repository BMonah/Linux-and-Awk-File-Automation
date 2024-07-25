#!/bin/bash

to_use=$(echo "cGFzc3dvcmQK" | base64 -d)
yesterday=$(date -d '-1 day' '+%Y%m%d')
today=$(date '+%Y%m%d')


fileGenerate(){
cd /path/to/file/$yesterday
ls Pay*$yesterday* | xargs wc -l | awk -v OFS=',' '{print $2,$1}' > /path/to/file/count_$yesterday.csv
sed -i '$ d' /path/to/file/count_$yesterday.csv
cd /path/to/file/payrecord/$today
ls Pay*$yesterday* | xargs wc -l | awk -v OFS=',' '{print $2,$1}' >> /path/to/file/count_$yesterday.csv
sed -i '$ d' /path/to/file/count_$yesterday.csv

}


fileGenerate2(){
cd /path/to/file/turnover/$yesterday
ls *$yesterday* | xargs wc -l | awk -v OFS=',' '{print $2,$1}' > /path/to/file/count2_$yesterday.csv
cd /path/to/file/
line=$(awk -F ',' 'NR==1{print $2; exit}' turnover_count_$yesterday.csv)
line2=$(wc -l < turnover_count_$yesterday.csv)

if ((line==0)); then
        rm -rf turnover_count_$yesterday.csv
elif((line2 > 1)); then
        sed -i '$ d' turnover_count_$yesterday.csv
fi


cd /path/to/file/turnover/$today
ls *$yesterday* | xargs wc -l | awk -v OFS=',' '{print $2,$1}' >> //path/to/file/count_$yesterday.csv
cd /path/to/file/filemonitor
line1=$(awk -F ',' 'NR==1{print $2; exit}' turnover_count_$yesterday.csv)
line3=$(wc -l < turnover_count_$yesterday.csv)
if ((line1==0)); then
        rm -rf turnover_count_$yesterday.csv
elif ((line3 > 1)); then
        sed -i '$ d' turnover_count_$yesterday.csv
fi
}


fileGenerate3(){
cd /path/to/file/expiry/$yesterday
ls *$yesterday* | xargs wc -l | awk -v OFS=',' '{print $2,$1}' > /path/to/file/expiry_count_$yesterday.csv
cd /path/to/file/
line=$(awk -F ',' 'NR==1{print $2; exit}' expiry_count_$yesterday.csv)
line2=$(wc -l < expiry_count_$yesterday.csv)

if ((line==0)); then
        rm -rf expiry_count_$yesterday.csv
elif((line2 > 1)); then
        sed -i '$ d' expiry_count_$yesterday.csv
fi


cd /path/to/file/expiry/$today
ls *$yesterday* | xargs wc -l | awk -v OFS=',' '{print $2,$1}' >> /path/to/file/count_$yesterday.csv
cd /path/to/file/
line1=$(awk -F ',' 'NR==1{print $2; exit}' expiry_count_$yesterday.csv)
line3=$(wc -l < expiry_count_$yesterday.csv)
if ((line1==0)); then
        rm -rf expiry_count_$yesterday.csv
elif ((line3 > 1)); then
        sed -i '$ d' expiry_count_$yesterday.csv
fi
}



fileGenerate4(){
cd /path/to/file/balance/$yesterday
ls | xargs wc -l | awk -v OFS=',' '{print $2,$1}' > //path/to/file/count_$yesterday.csv

}

fileGenerate

fileGenerate2

fileGenerate3

fileGenerate4
