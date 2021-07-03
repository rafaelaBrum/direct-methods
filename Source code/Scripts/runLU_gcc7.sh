#!/bin/bash
echo " LU"
gcc-7 --version >> LU_gcc7.txt
gcc-7 LU.c -o LU_gcc7
echo "N = 5000" >> LU_gcc7.txt
echo "N = 5000"
COUNTER=1
while [  $COUNTER -lt 11 ]; do
	echo "Counter = $COUNTER"
	COUNTER=$((COUNTER+1))
	./LU_gcc7 < matrix5000x5000.dat >> LU_gcc7.txt
done
echo "N = 10000" >> LU_gcc7.txt
echo "N = 10000"
COUNTER=1
while [  $COUNTER -lt 11 ]; do
	echo "Counter = $COUNTER"
	COUNTER=$((COUNTER+1))
	./LU_gcc7 < matrix10000x10000.dat >> LU_gcc7.txt
done
echo "N = 15000" >> LU_gcc7.txt
echo "N = 15000"
COUNTER=1
while [  $COUNTER -lt 11 ]; do
	echo "Counter = $COUNTER"
	COUNTER=$((COUNTER+1))
	./LU_gcc7 < matrix15000x15000.dat >> LU_gcc7.txt
done
echo "N = 20000" >> LU_gcc7.txt
echo "N = 20000"
COUNTER=1
while [  $COUNTER -lt 11 ]; do
	echo "Counter = $COUNTER"
	COUNTER=$((COUNTER+1))
	./LU_gcc7 < matrix20000x20000.dat >> LU_gcc7.txt
done
