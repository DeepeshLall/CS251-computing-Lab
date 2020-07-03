#!/bin/bash
rm -f result2.csv
gcc -g -c add.c sub.c ltll.c ltf.c lteqf.c swap.c
gcc -g -fPIC -Wall -shared add.o sub.o ltll.o ltf.o lteqf.o swap.o -o libop.so
export LD_LIBRARY_PATH=.
i=2
string="gdb -ex 'break 24' -ex 'break 26' -ex 'start' -ex 'c' -ex 'next' -ex 'info registers rax' -ex 'c' -ex 'next' -ex 'info registers rax' -ex 'c' -ex 'quit' -ex 'y' ./prog > delme"

for i in {1..10};do
	eval "echo $i | $string"
	
	val1=$( cat delme | head -n -4 | tail -n 6  | head -n 2 | tail -n 1 | awk '{print $3}')
	val2=$( cat delme | head -n -4 | tail -n 1 | awk '{print $3}')
	echo "sort1,sort2" >> result2.csv
	echo "$val1,$val2" >> result2.csv
done
rm delme
