#!/bin/bash
echo "Gauss Jordan"
gcc --version >> GaussJordan.txt
gcc GaussJordan.c -o GaussJordan -lm
echo "N = 5000 - standard" >> GaussJordan.txt
echo "N = 5000 - standard"
COUNTER=1
while [  $COUNTER -lt 6 ]; do
	echo "Counter = $COUNTER"
	COUNTER=$((COUNTER+1))
	./GaussJordan < matrix5000x5000.dat >> GaussJordan.txt
done
gcc GaussJordan.c -o GaussJordan -lm -O
echo "N = 5000 - O" >> GaussJordan.txt
echo "N = 5000 - O"
COUNTER=1
while [  $COUNTER -lt 6 ]; do
	echo "Counter = $COUNTER"
	COUNTER=$((COUNTER+1))
	./GaussJordan < matrix5000x5000.dat >> GaussJordan.txt
done
gcc GaussJordan.c -o GaussJordan -lm -O1
echo "N = 5000 - O1" >> GaussJordan.txt
echo "N = 5000 - O1"
COUNTER=1
while [  $COUNTER -lt 6 ]; do
	echo "Counter = $COUNTER"
	COUNTER=$((COUNTER+1))
	./GaussJordan < matrix5000x5000.dat >> GaussJordan.txt
done
gcc GaussJordan.c -o GaussJordan -lm -O2
echo "N = 5000 - O2" >> GaussJordan.txt
echo "N = 5000 - O2"
COUNTER=1
while [  $COUNTER -lt 6 ]; do
	echo "Counter = $COUNTER"
	COUNTER=$((COUNTER+1))
	./GaussJordan < matrix5000x5000.dat >> GaussJordan.txt
done
gcc GaussJordan.c -o GaussJordan -lm -O3
echo "N = 5000 - O3" >> GaussJordan.txt
echo "N = 5000 - O3"
COUNTER=1
while [  $COUNTER -lt 6 ]; do
	echo "Counter = $COUNTER"
	COUNTER=$((COUNTER+1))
	./GaussJordan < matrix5000x5000.dat >> GaussJordan.txt
done
gcc GaussJordan.c -o GaussJordan -lm -Ofast
echo "N = 5000 - Ofast" >> GaussJordan.txt
echo "N = 5000 - Ofast"
COUNTER=1
while [  $COUNTER -lt 6 ]; do
	echo "Counter = $COUNTER"
	COUNTER=$((COUNTER+1))
	./GaussJordan < matrix5000x5000.dat >> GaussJordan.txt
done
gcc GaussJordan.c -o GaussJordan -lm -Og
echo "N = 5000 - Og" >> GaussJordan.txt
echo "N = 5000 - Og"
COUNTER=1
while [  $COUNTER -lt 6 ]; do
	echo "Counter = $COUNTER"
	COUNTER=$((COUNTER+1))
	./GaussJordan < matrix5000x5000.dat >> GaussJordan.txt
done
gcc GaussJordan.c -o GaussJordan -lm -Os
echo "N = 5000 - Os" >> GaussJordan.txt
echo "N = 5000 - Os"
COUNTER=1
while [  $COUNTER -lt 6 ]; do
	echo "Counter = $COUNTER"
	COUNTER=$((COUNTER+1))
	./GaussJordan < matrix5000x5000.dat >> GaussJordan.txt
done
