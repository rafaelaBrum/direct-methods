#!/bin/bash
echo "Gaussian"
gcc --version >> Gaussian.txt
gcc Gaussian.c -o Gaussian -lm
echo "N = 5000" >> Gaussian.txt
echo "N = 5000"
COUNTER=1
while [  $COUNTER -lt 11 ]; do
	echo "Counter = $COUNTER"
	COUNTER=$((COUNTER+1))
	./Gaussian < matrix5000x5000.dat >> Gaussian.txt
done
echo "N = 10000" >> Gaussian.txt
echo "N = 10000"
COUNTER=1
while [  $COUNTER -lt 11 ]; do
	echo "Counter = $COUNTER"
	COUNTER=$((COUNTER+1))
	./Gaussian < matrix10000x10000.dat >> Gaussian.txt
done
echo "N = 15000" >> Gaussian.txt
echo "N = 15000"
COUNTER=1
while [  $COUNTER -lt 11 ]; do
	echo "Counter = $COUNTER"
	COUNTER=$((COUNTER+1))
	./Gaussian < matrix15000x15000.dat >> Gaussian.txt
done
echo "N = 20000" >> Gaussian.txt
echo "N = 20000"
COUNTER=1
while [  $COUNTER -lt 11 ]; do
	echo "Counter = $COUNTER"
	COUNTER=$((COUNTER+1))
	./Gaussian < matrix20000x20000.dat >> Gaussian.txt
done
