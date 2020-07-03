#!/bin/bash
gcc -g -c add.c sub.c ltll.c ltf.c lteqf.c swap.c
gcc -g -fPIC -Wall -shared add.o sub.o ltll.o ltf.o lteqf.o swap.o -o libop.so
export LD_LIBRARY_PATH=.
./prog
