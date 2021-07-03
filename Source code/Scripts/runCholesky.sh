#!/bin/bash
echo "Cholesky"
gcc --version >> Cholesky.txt
gcc Cholesky.c -o Cholesky -lm
echo "N = 5000" >> Cholesky.txt
echo "N = 5000"
COUNTER=1
while [  $COUNTER -lt 11 ]; do
	echo "Counter = $COUNTER"
	COUNTER=$((COUNTER+1))
	./Cholesky < matrix5000x5000.dat >> Cholesky.txt
done
echo "N = 10000" >> Cholesky.txt
echo "N = 10000"
COUNTER=1
while [  $COUNTER -lt 11 ]; do
	echo "Counter = $COUNTER"
	COUNTER=$((COUNTER+1))
	./Cholesky < matrix10000x10000.dat >> Cholesky.txt
done
echo "N = 15000" >> Cholesky.txt
echo "N = 15000"
COUNTER=1
while [  $COUNTER -lt 11 ]; do
	echo "Counter = $COUNTER"
	COUNTER=$((COUNTER+1))
	./Cholesky < matrix15000x15000.dat >> Cholesky.txt
done
echo "N = 20000" >> Cholesky.txt
echo "N = 20000"
COUNTER=1
while [  $COUNTER -lt 11 ]; do
	echo "Counter = $COUNTER"
	COUNTER=$((COUNTER+1))
	./Cholesky < matrix20000x20000.dat >> Cholesky.txt
done
