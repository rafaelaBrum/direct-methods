#!/bin/bash
echo "Gauss Jordan"
gcc-7 --version >> GaussJordan_gcc7.txt
gcc-7 GaussJordan.c -o GaussJordan_gcc7 -lm
echo "N = 5000" >> GaussJordan_gcc7.txt
echo "N = 5000"
COUNTER=1
while [  $COUNTER -lt 11 ]; do
	echo "Counter = $COUNTER"
	COUNTER=$((COUNTER+1))
	./GaussJordan_gcc7 < matrix5000x5000.dat >> GaussJordan_gcc7.txt
done
echo "N = 10000" >> GaussJordan_gcc7.txt
echo "N = 10000"
COUNTER=1
while [  $COUNTER -lt 11 ]; do
	echo "Counter = $COUNTER"
	COUNTER=$((COUNTER+1))
	./GaussJordan_gcc7 < matrix10000x10000.dat >> GaussJordan_gcc7.txt
done
echo "N = 15000" >> GaussJordan_gcc7.txt
echo "N = 15000"
COUNTER=1
while [  $COUNTER -lt 11 ]; do
	echo "Counter = $COUNTER"
	COUNTER=$((COUNTER+1))
	./GaussJordan_gcc7 < matrix15000x15000.dat >> GaussJordan_gcc7.txt
done
echo "N = 20000" >> GaussJordan_gcc7.txt
echo "N = 20000"
COUNTER=1
while [  $COUNTER -lt 11 ]; do
	echo "Counter = $COUNTER"
	COUNTER=$((COUNTER+1))
	./GaussJordan_gcc7 < matrix20000x20000.dat >> GaussJordan_gcc7.txt
done
