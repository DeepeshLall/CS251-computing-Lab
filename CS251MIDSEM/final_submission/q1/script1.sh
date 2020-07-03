#!/bin/bash
touch passwd
touch out
touch error
for i in {A..Z};do
	for j in {a..z};do
		for k in {0..9};do
			echo $i$j$k
			string="$i$j@$k"
			unzip -o -P $string question.zip 1>>out 2>>error
			if [ $? == 0 ]; then
				echo $string >> passwd
			fi
			string="$i$j#$k"
			unzip -o -P $string question.zip 1>>out 2>>error
			if [ $? == 0 ]; then
				echo $string >> passwd
			fi
		done
	done
done
rm error out
