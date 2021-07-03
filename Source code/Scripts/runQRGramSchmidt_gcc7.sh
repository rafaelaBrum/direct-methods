#!/bin/bash
echo " QR"
gcc-7 --version >> QRGramSchmidt_gcc7.txt
gcc-7 QRGramSchmidt.c -o QRGramSchmidt_gcc7 -lm
echo "N = 5000" >> QRGramSchmidt_gcc7.txt
echo "N = 5000"
COUNTER=1
while [  $COUNTER -lt 11 ]; do
	echo "Counter = $COUNTER"
	COUNTER=$((COUNTER+1))
	./QRGramSchmidt_gcc7 < matrix5000x5000.dat >> QRGramSchmidt_gcc7.txt
done
echo "N = 10000" >> QRGramSchmidt_gcc7.txt
echo "N = 10000"
COUNTER=1
while [  $COUNTER -lt 11 ]; do
	echo "Counter = $COUNTER"
	COUNTER=$((COUNTER+1))
	./QRGramSchmidt_gcc7 < matrix10000x10000.dat >> QRGramSchmidt_gcc7.txt
done
echo "N = 15000" >> QRGramSchmidt_gcc7.txt
echo "N = 15000"
COUNTER=1
while [  $COUNTER -lt 11 ]; do
	echo "Counter = $COUNTER"
	COUNTER=$((COUNTER+1))
	./QRGramSchmidt_gcc7 < matrix15000x15000.dat >> QRGramSchmidt_gcc7.txt
done
echo "N = 20000" >> QRGramSchmidt_gcc7.txt
echo "N = 20000"
COUNTER=1
while [  $COUNTER -lt 11 ]; do
	echo "Counter = $COUNTER"
	COUNTER=$((COUNTER+1))
	./QRGramSchmidt_gcc7 < matrix20000x20000.dat >> QRGramSchmidt_gcc7.txt
done
