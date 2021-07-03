#!/bin/bash
echo " LDU"
gcc-7 --version >> LDU_gcc7.txt
gcc-7 LDU.c -o LDU_gcc7
echo "N = 5000" >> LDU_gcc7.txt
echo "N = 5000"
COUNTER=1
while [  $COUNTER -lt 11 ]; do
	echo "Counter = $COUNTER"
	COUNTER=$((COUNTER+1))
	./LDU_gcc7 < matrix5000x5000.dat >> LDU_gcc7.txt
done
echo "N = 10000" >> LDU_gcc7.txt
echo "N = 10000"
COUNTER=1
while [  $COUNTER -lt 11 ]; do
	echo "Counter = $COUNTER"
	COUNTER=$((COUNTER+1))
	./LDU_gcc7 < matrix10000x10000.dat >> LDU_gcc7.txt
done
echo "N = 15000" >> LDU_gcc7.txt
echo "N = 15000"
COUNTER=1
while [  $COUNTER -lt 11 ]; do
	echo "Counter = $COUNTER"
	COUNTER=$((COUNTER+1))
	./LDU_gcc7 < matrix15000x15000.dat >> LDU_gcc7.txt
done
echo "N = 20000" >> LDU_gcc7.txt
echo "N = 20000"
COUNTER=1
while [  $COUNTER -lt 11 ]; do
	echo "Counter = $COUNTER"
	COUNTER=$((COUNTER+1))
	./LDU_gcc7 < matrix20000x20000.dat >> LDU_gcc7.txt
done
