#!/bin/bash

rm -f file1 result.csv
touch result.csv
touch file1

for i in {1..10};do
	echo $i
	echo $i | ./script2.sh > /dev/null

	gprof -b -p ./prog | tail -n +5 > file1
	if (( $(grep 'time' file1 | awk '{print $5}' | grep 'ms' | wc -l)==1 ));then
		time_sort1=$(grep 'sort1' file1 | awk '{print $6*$4/1000}')
		time_sort2=$(grep 'sort2' file1 | awk '{print $6*$4/1000}')
	else
		time_sort1=$(grep 'sort1' file1 | awk '{print $6*$4}')
                time_sort2=$(grep 'sort2' file1 | awk '{print $6*$4}')
	fi
	echo "Input,sort1,sort2" >> result.csv
	echo "$i,$time_sort1,$time_sort2" >> result.csv
done
