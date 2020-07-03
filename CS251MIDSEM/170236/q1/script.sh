#!/bin/bash
string=""
touch temp
touch passwd
touch temp2
touch temp3
for i in {A..Z};
do
	for j in {a..z};
	do
		for k in {0..9};
		do
		echo $i$j$k
		string="$i$j@$k"
		unzip -o -P $string question.zip 2>temp
		
			if (( $(cat temp | grep 'error' | wc -l) >= 1));then
           		echo $string >> temp2
            	continue;
            else
            	if (( $(cat temp | grep 'skip' | wc -l) >= 1));then
            		echo $string >> temp2
            		continue;
            	else
            		echo $string >> passwd
        		fi
        	fi

		string="$i$j#$k"
		unzip -o -P $string question.zip 2>temp
		if [ $? == 1 ]; then
			echo $string >> temp3
			continue;
		else
			if (( $(cat temp | grep 'error' | wc -l) >= 1));then
           		echo $string >> temp2
            	continue;
            else
            	if (( $(cat temp | grep 'skip' | wc -l) >= 1));then
            		echo $string >> temp2
            		continue;
            	else
            		echo $string >> passwd
        		fi
        	fi
		fi

		done
	done
done
