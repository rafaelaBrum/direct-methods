#!/bin/bash
echo " LU"
gcc --version >> LU.txt
gcc LU.c -o LU
echo "N = 5000" >> LU.txt
echo "N = 5000"
COUNTER=1
while [  $COUNTER -lt 11 ]; do
	echo "Counter = $COUNTER"
	COUNTER=$((COUNTER+1))
	./LU < matrix5000x5000.dat >> LU.txt
done
echo "N = 10000" >> LU.txt
echo "N = 10000"
COUNTER=1
while [  $COUNTER -lt 11 ]; do
	echo "Counter = $COUNTER"
	COUNTER=$((COUNTER+1))
	./LU < matrix10000x10000.dat >> LU.txt
done
echo "N = 15000" >> LU.txt
echo "N = 15000"
COUNTER=1
while [  $COUNTER -lt 11 ]; do
	echo "Counter = $COUNTER"
	COUNTER=$((COUNTER+1))
	./LU < matrix15000x15000.dat >> LU.txt
done
echo "N = 20000" >> LU.txt
echo "N = 20000"
COUNTER=1
while [  $COUNTER -lt 11 ]; do
	echo "Counter = $COUNTER"
	COUNTER=$((COUNTER+1))
	./LU < matrix20000x20000.dat >> LU.txt
done
