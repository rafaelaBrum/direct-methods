#!/bin/bash
echo "Gauss Jordan"
gcc-7 --version >> GaussJordan_gcc7.txt
gcc-7 GaussJordan.c -o GaussJordan -lm
echo "N = 5000 - standard" >> GaussJordan_gcc7.txt
echo "N = 5000 - standard"
COUNTER=1
while [  $COUNTER -lt 6 ]; do
	echo "Counter = $COUNTER"
	COUNTER=$((COUNTER+1))
	./GaussJordan < matrix5000x5000.dat >> GaussJordan_gcc7.txt
done
gcc-7 GaussJordan.c -o GaussJordan -lm -O
echo "N = 5000 - O" >> GaussJordan_gcc7.txt
echo "N = 5000 - O"
COUNTER=1
while [  $COUNTER -lt 6 ]; do
	echo "Counter = $COUNTER"
	COUNTER=$((COUNTER+1))
	./GaussJordan < matrix5000x5000.dat >> GaussJordan_gcc7.txt
done
gcc-7 GaussJordan.c -o GaussJordan -lm -O1
echo "N = 5000 - O1" >> GaussJordan_gcc7.txt
echo "N = 5000 - O1"
COUNTER=1
while [  $COUNTER -lt 6 ]; do
	echo "Counter = $COUNTER"
	COUNTER=$((COUNTER+1))
	./GaussJordan < matrix5000x5000.dat >> GaussJordan_gcc7.txt
done
gcc-7 GaussJordan.c -o GaussJordan -lm -O2
echo "N = 5000 - O2" >> GaussJordan_gcc7.txt
echo "N = 5000 - O2"
COUNTER=1
while [  $COUNTER -lt 6 ]; do
	echo "Counter = $COUNTER"
	COUNTER=$((COUNTER+1))
	./GaussJordan < matrix5000x5000.dat >> GaussJordan_gcc7.txt
done
gcc-7 GaussJordan.c -o GaussJordan -lm -O3
echo "N = 5000 - O3" >> GaussJordan_gcc7.txt
echo "N = 5000 - O3"
COUNTER=1
while [  $COUNTER -lt 6 ]; do
	echo "Counter = $COUNTER"
	COUNTER=$((COUNTER+1))
	./GaussJordan < matrix5000x5000.dat >> GaussJordan_gcc7.txt
done
gcc-7 GaussJordan.c -o GaussJordan -lm -Ofast
echo "N = 5000 - Ofast" >> GaussJordan_gcc7.txt
echo "N = 5000 - Ofast"
COUNTER=1
while [  $COUNTER -lt 6 ]; do
	echo "Counter = $COUNTER"
	COUNTER=$((COUNTER+1))
	./GaussJordan < matrix5000x5000.dat >> GaussJordan_gcc7.txt
done
gcc-7 GaussJordan.c -o GaussJordan -lm -Og
echo "N = 5000 - Og" >> GaussJordan_gcc7.txt
echo "N = 5000 - Og"
COUNTER=1
while [  $COUNTER -lt 6 ]; do
	echo "Counter = $COUNTER"
	COUNTER=$((COUNTER+1))
	./GaussJordan < matrix5000x5000.dat >> GaussJordan_gcc7.txt
done
gcc-7 GaussJordan.c -o GaussJordan -lm -Os
echo "N = 5000 - Os" >> GaussJordan_gcc7.txt
echo "N = 5000 - Os"
COUNTER=1
while [  $COUNTER -lt 6 ]; do
	echo "Counter = $COUNTER"
	COUNTER=$((COUNTER+1))
	./GaussJordan < matrix5000x5000.dat >> GaussJordan_gcc7.txt
done
