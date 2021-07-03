#!/bin/bash
echo "Gauss Jordan"
gcc --version >> GaussJordan.txt
gcc GaussJordan.c -o GaussJordan -lm
echo "N = 5000" >> GaussJordan.txt
echo "N = 5000"
COUNTER=1
while [  $COUNTER -lt 11 ]; do
	echo "Counter = $COUNTER"
	COUNTER=$((COUNTER+1))
	./GaussJordan < matrix5000x5000.dat >> GaussJordan.txt
done
echo "N = 10000" >> GaussJordan.txt
echo "N = 10000"
COUNTER=1
while [  $COUNTER -lt 11 ]; do
	echo "Counter = $COUNTER"
	COUNTER=$((COUNTER+1))
	./GaussJordan < matrix10000x10000.dat >> GaussJordan.txt
done
echo "N = 15000" >> GaussJordan.txt
echo "N = 15000"
COUNTER=1
while [  $COUNTER -lt 11 ]; do
	echo "Counter = $COUNTER"
	COUNTER=$((COUNTER+1))
	./GaussJordan < matrix15000x15000.dat >> GaussJordan.txt
done
echo "N = 20000" >> GaussJordan.txt
echo "N = 20000"
COUNTER=1
while [  $COUNTER -lt 11 ]; do
	echo "Counter = $COUNTER"
	COUNTER=$((COUNTER+1))
	./GaussJordan < matrix20000x20000.dat >> GaussJordan.txt
done
