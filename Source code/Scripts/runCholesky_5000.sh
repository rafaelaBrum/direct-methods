#!/bin/bash
echo "Cholesky"
gcc --version >> Cholesky.txt
gcc Cholesky.c -o Cholesky -lm
echo "N = 5000 - standard" >> Cholesky.txt
echo "N = 5000 - standard"
COUNTER=1
while [  $COUNTER -lt 6 ]; do
	echo "Counter = $COUNTER"
	COUNTER=$((COUNTER+1))
	./Cholesky < matrix5000x5000.dat >> Cholesky.txt
done
gcc Cholesky.c -o Cholesky -lm -O
echo "N = 5000 - O" >> Cholesky.txt
echo "N = 5000 - O"
COUNTER=1
while [  $COUNTER -lt 6 ]; do
	echo "Counter = $COUNTER"
	COUNTER=$((COUNTER+1))
	./Cholesky < matrix5000x5000.dat >> Cholesky.txt
done
gcc Cholesky.c -o Cholesky -lm -O1
echo "N = 5000 - O1" >> Cholesky.txt
echo "N = 5000 - O1"
COUNTER=1
while [  $COUNTER -lt 6 ]; do
	echo "Counter = $COUNTER"
	COUNTER=$((COUNTER+1))
	./Cholesky < matrix5000x5000.dat >> Cholesky.txt
done
gcc Cholesky.c -o Cholesky -lm -O2
echo "N = 5000 - O2" >> Cholesky.txt
echo "N = 5000 - O2"
COUNTER=1
while [  $COUNTER -lt 6 ]; do
	echo "Counter = $COUNTER"
	COUNTER=$((COUNTER+1))
	./Cholesky < matrix5000x5000.dat >> Cholesky.txt
done
gcc Cholesky.c -o Cholesky -lm -O3
echo "N = 5000 - O3" >> Cholesky.txt
echo "N = 5000 - O3"
COUNTER=1
while [  $COUNTER -lt 6 ]; do
	echo "Counter = $COUNTER"
	COUNTER=$((COUNTER+1))
	./Cholesky < matrix5000x5000.dat >> Cholesky.txt
done
gcc Cholesky.c -o Cholesky -lm -Ofast
echo "N = 5000 - Ofast" >> Cholesky.txt
echo "N = 5000 - Ofast"
COUNTER=1
while [  $COUNTER -lt 6 ]; do
	echo "Counter = $COUNTER"
	COUNTER=$((COUNTER+1))
	./Cholesky < matrix5000x5000.dat >> Cholesky.txt
done
gcc Cholesky.c -o Cholesky -lm -Og
echo "N = 5000 - Og" >> Cholesky.txt
echo "N = 5000 - Og"
COUNTER=1
while [  $COUNTER -lt 6 ]; do
	echo "Counter = $COUNTER"
	COUNTER=$((COUNTER+1))
	./Cholesky < matrix5000x5000.dat >> Cholesky.txt
done
gcc Cholesky.c -o Cholesky -lm -Os
echo "N = 5000 - Os" >> Cholesky.txt
echo "N = 5000 - Os"
COUNTER=1
while [  $COUNTER -lt 6 ]; do
	echo "Counter = $COUNTER"
	COUNTER=$((COUNTER+1))
	./Cholesky < matrix5000x5000.dat >> Cholesky.txt
done
