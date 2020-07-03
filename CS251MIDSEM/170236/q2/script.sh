#!/bin/bash

gcc -g -c swap.c lteqf.c ltf.c add.c sub.c ltll.c
gcc -g -fPIC -Wall -shared swap.o lteqf.o ltf.o add.o sub.o ltll.o -o libop.so
export LD_LIBRARY_PATH=.
./prog