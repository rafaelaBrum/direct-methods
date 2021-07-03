#!/bin/bash
echo "Gaussian"
gcc --version >> Gaussian.txt
gcc Gaussian.c -o Gaussian -lm
echo "N = 5000 - standard" >> Gaussian.txt
echo "N = 5000 - standard"
COUNTER=1
while [  $COUNTER -lt 6 ]; do
	echo "Counter = $COUNTER"
	COUNTER=$((COUNTER+1))
	./Gaussian < matrix5000x5000.dat >> Gaussian.txt
done
gcc Gaussian.c -o Gaussian -lm -O
echo "N = 5000 - O" >> Gaussian.txt
echo "N = 5000 - O"
COUNTER=1
while [  $COUNTER -lt 6 ]; do
	echo "Counter = $COUNTER"
	COUNTER=$((COUNTER+1))
	./Gaussian < matrix5000x5000.dat >> Gaussian.txt
done
gcc Gaussian.c -o Gaussian -lm -O1
echo "N = 5000 - O1" >> Gaussian.txt
echo "N = 5000 - O1"
COUNTER=1
while [  $COUNTER -lt 6 ]; do
	echo "Counter = $COUNTER"
	COUNTER=$((COUNTER+1))
	./Gaussian < matrix5000x5000.dat >> Gaussian.txt
done
gcc Gaussian.c -o Gaussian -lm -O2
echo "N = 5000 - O2" >> Gaussian.txt
echo "N = 5000 - O2"
COUNTER=1
while [  $COUNTER -lt 6 ]; do
	echo "Counter = $COUNTER"
	COUNTER=$((COUNTER+1))
	./Gaussian < matrix5000x5000.dat >> Gaussian.txt
done
gcc Gaussian.c -o Gaussian -lm -O3
echo "N = 5000 - O3" >> Gaussian.txt
echo "N = 5000 - O3"
COUNTER=1
while [  $COUNTER -lt 6 ]; do
	echo "Counter = $COUNTER"
	COUNTER=$((COUNTER+1))
	./Gaussian < matrix5000x5000.dat >> Gaussian.txt
done
gcc Gaussian.c -o Gaussian -lm -Ofast
echo "N = 5000 - Ofast" >> Gaussian.txt
echo "N = 5000 - Ofast"
COUNTER=1
while [  $COUNTER -lt 6 ]; do
	echo "Counter = $COUNTER"
	COUNTER=$((COUNTER+1))
	./Gaussian < matrix5000x5000.dat >> Gaussian.txt
done
gcc Gaussian.c -o Gaussian -lm -Og
echo "N = 5000 - Og" >> Gaussian.txt
echo "N = 5000 - Og"
COUNTER=1
while [  $COUNTER -lt 6 ]; do
	echo "Counter = $COUNTER"
	COUNTER=$((COUNTER+1))
	./Gaussian < matrix5000x5000.dat >> Gaussian.txt
done
gcc Gaussian.c -o Gaussian -lm -Os
echo "N = 5000 - Os" >> Gaussian.txt
echo "N = 5000 - Os"
COUNTER=1
while [  $COUNTER -lt 6 ]; do
	echo "Counter = $COUNTER"
	COUNTER=$((COUNTER+1))
	./Gaussian < matrix5000x5000.dat >> Gaussian.txt
done
