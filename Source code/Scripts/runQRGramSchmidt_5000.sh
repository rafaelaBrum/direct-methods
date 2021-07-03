#!/bin/bash
echo " QR"
gcc --version >> QRGramSchmidt.txt
gcc QRGramSchmidt.c -o QRGramSchmidt -lm
echo "N = 5000 - standard" >> QRGramSchmidt.txt
echo "N = 5000 - standard"
COUNTER=1
while [  $COUNTER -lt 6 ]; do
	echo "Counter = $COUNTER"
	COUNTER=$((COUNTER+1))
	./QRGramSchmidt < matrix5000x5000.dat >> QRGramSchmidt.txt
done
gcc QRGramSchmidt.c -o QRGramSchmidt -lm -O
echo "N = 5000 - O" >> QRGramSchmidt.txt
echo "N = 5000 - O"
COUNTER=1
while [  $COUNTER -lt 6 ]; do
	echo "Counter = $COUNTER"
	COUNTER=$((COUNTER+1))
	./QRGramSchmidt < matrix5000x5000.dat >> QRGramSchmidt.txt
done
gcc QRGramSchmidt.c -o QRGramSchmidt -lm -O1
echo "N = 5000 - O1" >> QRGramSchmidt.txt
echo "N = 5000 - O1"
COUNTER=1
while [  $COUNTER -lt 6 ]; do
	echo "Counter = $COUNTER"
	COUNTER=$((COUNTER+1))
	./QRGramSchmidt < matrix5000x5000.dat >> QRGramSchmidt.txt
done
gcc QRGramSchmidt.c -o QRGramSchmidt -lm -O2
echo "N = 5000 - O2" >> QRGramSchmidt.txt
echo "N = 5000 - O2"
COUNTER=1
while [  $COUNTER -lt 6 ]; do
	echo "Counter = $COUNTER"
	COUNTER=$((COUNTER+1))
	./QRGramSchmidt < matrix5000x5000.dat >> QRGramSchmidt.txt
done
gcc QRGramSchmidt.c -o QRGramSchmidt -lm -O3
echo "N = 5000 - O3" >> QRGramSchmidt.txt
echo "N = 5000 - O3"
COUNTER=1
while [  $COUNTER -lt 6 ]; do
	echo "Counter = $COUNTER"
	COUNTER=$((COUNTER+1))
	./QRGramSchmidt < matrix5000x5000.dat >> QRGramSchmidt.txt
done
gcc QRGramSchmidt.c -o QRGramSchmidt -lm -Ofast
echo "N = 5000 - Ofast" >> QRGramSchmidt.txt
echo "N = 5000 - Ofast"
COUNTER=1
while [  $COUNTER -lt 6 ]; do
	echo "Counter = $COUNTER"
	COUNTER=$((COUNTER+1))
	./QRGramSchmidt < matrix5000x5000.dat >> QRGramSchmidt.txt
done
gcc QRGramSchmidt.c -o QRGramSchmidt -lm -Og
echo "N = 5000 - Og" >> QRGramSchmidt.txt
echo "N = 5000 - Og"
COUNTER=1
while [  $COUNTER -lt 6 ]; do
	echo "Counter = $COUNTER"
	COUNTER=$((COUNTER+1))
	./QRGramSchmidt < matrix5000x5000.dat >> QRGramSchmidt.txt
done
gcc QRGramSchmidt.c -o QRGramSchmidt -lm -Os
echo "N = 5000 - Os" >> QRGramSchmidt.txt
echo "N = 5000 - Os"
COUNTER=1
while [  $COUNTER -lt 6 ]; do
	echo "Counter = $COUNTER"
	COUNTER=$((COUNTER+1))
	./QRGramSchmidt < matrix5000x5000.dat >> QRGramSchmidt.txt
done
