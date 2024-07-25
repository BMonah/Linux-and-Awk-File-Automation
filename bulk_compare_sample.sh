#!/bin/bash

yesterday=$(date -d '-1 day' '+%Y%m%d')
to_use=$(echo "cGFzc3dvcmQK" | base64 -d)
month=$(date '+%Y%m')


filecount=$(cat /path/to/file/count_$yesterday.csv | wc -l)
recordcount=$(awk -F',' '{sum+=$2;}END{print sum;}' /path/to/file/count_$yesterday.csv)



exists=$(awk -F ',' 'NR==1{print $2; exit}' /path/to/file/count_$yesterday.csv)
if ((exists > 0)); then
        turnovercount=$(cat /path/to/file/count_$yesterday.csv | wc -l)
        recordturnover=$(awk -F',' '{sum+=$2;}END{print sum;}' /path/to/file/count_$yesterday.csv)
else
        turnovercount=0
        recordturnover=0
fi



balancecount=$(cat /path/to/file/count_$yesterday.csv | wc -l)
recordbalance=$(awk -F',' '{sum+=$2;}END{print sum;}' /path/to/file/count_$yesterday.csv)


exists=$(awk -F ',' 'NR==1{print $2; exit}' /path/to/file/count_$yesterday.csv)
if ((exists > 0)); then
        expirycount=$(cat /path/to/file/count_$yesterday.csv | wc -l)
        recordexpiry=$(awk -F',' '{sum+=$2;}END{print sum;}' /path/to/file/count_$yesterday.csv)
else
        expirycount=0
        recordexpiry=0
fi



echo $yesterday,$filecount,$recordcount,PayRecord >> /path/to/file/controlfile_$month.csv
echo $yesterday,$turnovercount,$recordturnover,turnover >> /path/to/file/controlfile_$month.csv
echo $yesterday,$balancecount,$recordbalance,balance >> /path/to/file/controlfile_$month.csv
echo $yesterday,$expirycount,$recordexpiry,expiry >> /path/to/file/controlfile_$month.csv

transfer(){
expect /path/to/file/transfer.exp $to_use $yesterday $month
}

transfer
