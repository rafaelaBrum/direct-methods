#!/bin/bash
echo " QR"
gcc --version >> QRGramSchmidt.txt
gcc QRGramSchmidt.c -o QRGramSchmidt -lm
echo "N = 5000" >> QRGramSchmidt.txt
echo "N = 5000"
COUNTER=1
while [  $COUNTER -lt 11 ]; do
	echo "Counter = $COUNTER"
	COUNTER=$((COUNTER+1))
	./QRGramSchmidt < matrix5000x5000.dat >> QRGramSchmidt.txt
done
echo "N = 10000" >> QRGramSchmidt.txt
echo "N = 10000"
COUNTER=1
while [  $COUNTER -lt 11 ]; do
	echo "Counter = $COUNTER"
	COUNTER=$((COUNTER+1))
	./QRGramSchmidt < matrix10000x10000.dat >> QRGramSchmidt.txt
done
echo "N = 15000" >> QRGramSchmidt.txt
echo "N = 15000"
COUNTER=1
while [  $COUNTER -lt 11 ]; do
	echo "Counter = $COUNTER"
	COUNTER=$((COUNTER+1))
	./QRGramSchmidt < matrix15000x15000.dat >> QRGramSchmidt.txt
done
echo "N = 20000" >> QRGramSchmidt.txt
echo "N = 20000"
COUNTER=1
while [  $COUNTER -lt 11 ]; do
	echo "Counter = $COUNTER"
	COUNTER=$((COUNTER+1))
	./QRGramSchmidt < matrix20000x20000.dat >> QRGramSchmidt.txt
done
