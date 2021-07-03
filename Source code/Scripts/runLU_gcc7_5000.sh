#!/bin/bash
echo " LU"
gcc-7 --version >> LU_gcc7.txt
gcc-7 LU.c -o LU -lm
echo "N = 5000 - standard" >> LU_gcc7.txt
echo "N = 5000 - standard"
COUNTER=1
while [  $COUNTER -lt 6 ]; do
	echo "Counter = $COUNTER"
	COUNTER=$((COUNTER+1))
	./LU < matrix5000x5000.dat >> LU_gcc7.txt
done
gcc-7 LU.c -o LU -lm -O
echo "N = 5000 - O" >> LU_gcc7.txt
echo "N = 5000 - O"
COUNTER=1
while [  $COUNTER -lt 6 ]; do
	echo "Counter = $COUNTER"
	COUNTER=$((COUNTER+1))
	./LU < matrix5000x5000.dat >> LU_gcc7.txt
done
gcc-7 LU.c -o LU -lm -O1
echo "N = 5000 - O1" >> LU_gcc7.txt
echo "N = 5000 - O1"
COUNTER=1
while [  $COUNTER -lt 6 ]; do
	echo "Counter = $COUNTER"
	COUNTER=$((COUNTER+1))
	./LU < matrix5000x5000.dat >> LU_gcc7.txt
done
gcc-7 LU.c -o LU -lm -O2
echo "N = 5000 - O2" >> LU_gcc7.txt
echo "N = 5000 - O2"
COUNTER=1
while [  $COUNTER -lt 6 ]; do
	echo "Counter = $COUNTER"
	COUNTER=$((COUNTER+1))
	./LU < matrix5000x5000.dat >> LU_gcc7.txt
done
gcc-7 LU.c -o LU -lm -O3
echo "N = 5000 - O3" >> LU_gcc7.txt
echo "N = 5000 - O3"
COUNTER=1
while [  $COUNTER -lt 6 ]; do
	echo "Counter = $COUNTER"
	COUNTER=$((COUNTER+1))
	./LU < matrix5000x5000.dat >> LU_gcc7.txt
done
gcc-7 LU.c -o LU -lm -Ofast
echo "N = 5000 - Ofast" >> LU_gcc7.txt
echo "N = 5000 - Ofast"
COUNTER=1
while [  $COUNTER -lt 6 ]; do
	echo "Counter = $COUNTER"
	COUNTER=$((COUNTER+1))
	./LU < matrix5000x5000.dat >> LU_gcc7.txt
done
gcc-7 LU.c -o LU -lm -Og
echo "N = 5000 - Og" >> LU_gcc7.txt
echo "N = 5000 - Og"
COUNTER=1
while [  $COUNTER -lt 6 ]; do
	echo "Counter = $COUNTER"
	COUNTER=$((COUNTER+1))
	./LU < matrix5000x5000.dat >> LU_gcc7.txt
done
gcc-7 LU.c -o LU -lm -Os
echo "N = 5000 - Os" >> LU_gcc7.txt
echo "N = 5000 - Os"
COUNTER=1
while [  $COUNTER -lt 6 ]; do
	echo "Counter = $COUNTER"
	COUNTER=$((COUNTER+1))
	./LU < matrix5000x5000.dat >> LU_gcc7.txt
done
