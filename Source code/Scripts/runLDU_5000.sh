#!/bin/bash
echo " LDU"
gcc --version >> LDU.txt
gcc LDU.c -o LDU -lm
echo "N = 5000 - standard" >> LDU.txt
echo "N = 5000 - standard"
COUNTER=1
while [  $COUNTER -lt 6 ]; do
	echo "Counter = $COUNTER"
	COUNTER=$((COUNTER+1))
	./LDU < matrix5000x5000.dat >> LDU.txt
done
gcc LDU.c -o LDU -lm -O
echo "N = 5000 - O" >> LDU.txt
echo "N = 5000 - O"
COUNTER=1
while [  $COUNTER -lt 6 ]; do
	echo "Counter = $COUNTER"
	COUNTER=$((COUNTER+1))
	./LDU < matrix5000x5000.dat >> LDU.txt
done
gcc LDU.c -o LDU -lm -O1
echo "N = 5000 - O1" >> LDU.txt
echo "N = 5000 - O1"
COUNTER=1
while [  $COUNTER -lt 6 ]; do
	echo "Counter = $COUNTER"
	COUNTER=$((COUNTER+1))
	./LDU < matrix5000x5000.dat >> LDU.txt
done
gcc LDU.c -o LDU -lm -O2
echo "N = 5000 - O2" >> LDU.txt
echo "N = 5000 - O2"
COUNTER=1
while [  $COUNTER -lt 6 ]; do
	echo "Counter = $COUNTER"
	COUNTER=$((COUNTER+1))
	./LDU < matrix5000x5000.dat >> LDU.txt
done
gcc LDU.c -o LDU -lm -O3
echo "N = 5000 - O3" >> LDU.txt
echo "N = 5000 - O3"
COUNTER=1
while [  $COUNTER -lt 6 ]; do
	echo "Counter = $COUNTER"
	COUNTER=$((COUNTER+1))
	./LDU < matrix5000x5000.dat >> LDU.txt
done
gcc LDU.c -o LDU -lm -Ofast
echo "N = 5000 - Ofast" >> LDU.txt
echo "N = 5000 - Ofast"
COUNTER=1
while [  $COUNTER -lt 6 ]; do
	echo "Counter = $COUNTER"
	COUNTER=$((COUNTER+1))
	./LDU < matrix5000x5000.dat >> LDU.txt
done
gcc LDU.c -o LDU -lm -Og
echo "N = 5000 - Og" >> LDU.txt
echo "N = 5000 - Og"
COUNTER=1
while [  $COUNTER -lt 6 ]; do
	echo "Counter = $COUNTER"
	COUNTER=$((COUNTER+1))
	./LDU < matrix5000x5000.dat >> LDU.txt
done
gcc LDU.c -o LDU -lm -Os
echo "N = 5000 - Os" >> LDU.txt
echo "N = 5000 - Os"
COUNTER=1
while [  $COUNTER -lt 6 ]; do
	echo "Counter = $COUNTER"
	COUNTER=$((COUNTER+1))
	./LDU < matrix5000x5000.dat >> LDU.txt
done
