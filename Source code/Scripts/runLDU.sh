#!/bin/bash
echo " LDU"
gcc --version >> LDU.txt
gcc LDU.c -o LDU
echo "N = 5000" >> LDU.txt
echo "N = 5000"
COUNTER=1
while [  $COUNTER -lt 11 ]; do
	echo "Counter = $COUNTER"
	COUNTER=$((COUNTER+1))
	./LDU < matrix5000x5000.dat >> LDU.txt
done
echo "N = 10000" >> LDU.txt
echo "N = 10000"
COUNTER=1
while [  $COUNTER -lt 11 ]; do
	echo "Counter = $COUNTER"
	COUNTER=$((COUNTER+1))
	./LDU < matrix10000x10000.dat >> LDU.txt
done
echo "N = 15000" >> LDU.txt
echo "N = 15000"
COUNTER=1
while [  $COUNTER -lt 11 ]; do
	echo "Counter = $COUNTER"
	COUNTER=$((COUNTER+1))
	./LDU < matrix15000x15000.dat >> LDU.txt
done
echo "N = 20000" >> LDU.txt
echo "N = 20000"
COUNTER=1
while [  $COUNTER -lt 11 ]; do
	echo "Counter = $COUNTER"
	COUNTER=$((COUNTER+1))
	./LDU < matrix20000x20000.dat >> LDU.txt
done
