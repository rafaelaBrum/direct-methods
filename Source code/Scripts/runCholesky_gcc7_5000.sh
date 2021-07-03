#!/bin/bash
echo "Cholesky"
gcc-7 --version >> Cholesky_gcc7.txt
gcc-7 Cholesky.c -o Cholesky -lm
echo "N = 5000 - standard" >> Cholesky_gcc7.txt
echo "N = 5000 - standard"
COUNTER=1
while [  $COUNTER -lt 6 ]; do
	echo "Counter = $COUNTER"
	COUNTER=$((COUNTER+1))
	./Cholesky < matrix5000x5000.dat >> Cholesky_gcc7.txt
done
gcc-7 Cholesky.c -o Cholesky -lm -O
echo "N = 5000 - O" >> Cholesky_gcc7.txt
echo "N = 5000 - O"
COUNTER=1
while [  $COUNTER -lt 6 ]; do
	echo "Counter = $COUNTER"
	COUNTER=$((COUNTER+1))
	./Cholesky < matrix5000x5000.dat >> Cholesky_gcc7.txt
done
gcc-7 Cholesky.c -o Cholesky -lm -O1
echo "N = 5000 - O1" >> Cholesky_gcc7.txt
echo "N = 5000 - O1"
COUNTER=1
while [  $COUNTER -lt 6 ]; do
	echo "Counter = $COUNTER"
	COUNTER=$((COUNTER+1))
	./Cholesky < matrix5000x5000.dat >> Cholesky_gcc7.txt
done
gcc-7 Cholesky.c -o Cholesky -lm -O2
echo "N = 5000 - O2" >> Cholesky_gcc7.txt
echo "N = 5000 - O2"
COUNTER=1
while [  $COUNTER -lt 6 ]; do
	echo "Counter = $COUNTER"
	COUNTER=$((COUNTER+1))
	./Cholesky < matrix5000x5000.dat >> Cholesky_gcc7.txt
done
gcc-7 Cholesky.c -o Cholesky -lm -O3
echo "N = 5000 - O3" >> Cholesky_gcc7.txt
echo "N = 5000 - O3"
COUNTER=1
while [  $COUNTER -lt 6 ]; do
	echo "Counter = $COUNTER"
	COUNTER=$((COUNTER+1))
	./Cholesky < matrix5000x5000.dat >> Cholesky_gcc7.txt
done
gcc-7 Cholesky.c -o Cholesky -lm -Ofast
echo "N = 5000 - Ofast" >> Cholesky_gcc7.txt
echo "N = 5000 - Ofast"
COUNTER=1
while [  $COUNTER -lt 6 ]; do
	echo "Counter = $COUNTER"
	COUNTER=$((COUNTER+1))
	./Cholesky < matrix5000x5000.dat >> Cholesky_gcc7.txt
done
gcc-7 Cholesky.c -o Cholesky -lm -Og
echo "N = 5000 - Og" >> Cholesky_gcc7.txt
echo "N = 5000 - Og"
COUNTER=1
while [  $COUNTER -lt 6 ]; do
	echo "Counter = $COUNTER"
	COUNTER=$((COUNTER+1))
	./Cholesky < matrix5000x5000.dat >> Cholesky_gcc7.txt
done
gcc-7 Cholesky.c -o Cholesky -lm -Os
echo "N = 5000 - Os" >> Cholesky_gcc7.txt
echo "N = 5000 - Os"
COUNTER=1
while [  $COUNTER -lt 6 ]; do
	echo "Counter = $COUNTER"
	COUNTER=$((COUNTER+1))
	./Cholesky < matrix5000x5000.dat >> Cholesky_gcc7.txt
done
