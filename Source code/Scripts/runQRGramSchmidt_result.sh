#!/bin/bash
echo " QR"
gcc --version >> QRGramSchmidt_result.txt
gcc QRGramSchmidt.c -o QRGramSchmidt -lm
echo "N = 5000 - standard" >> QRGramSchmidt_result.txt
echo "N = 5000 - standard"
./QRGramSchmidt < matrix5000x5000.dat >> QRGramSchmidt_result.txt
gcc QRGramSchmidt.c -o QRGramSchmidt -lm -O
echo "N = 5000 - O" >> QRGramSchmidt_result.txt
echo "N = 5000 - O"
./QRGramSchmidt < matrix5000x5000.dat >> QRGramSchmidt_result.txt
gcc QRGramSchmidt.c -o QRGramSchmidt -lm -O1
echo "N = 5000 - O1" >> QRGramSchmidt_result.txt
echo "N = 5000 - O1"
./QRGramSchmidt < matrix5000x5000.dat >> QRGramSchmidt_result.txt
gcc QRGramSchmidt.c -o QRGramSchmidt -lm -O2
echo "N = 5000 - O2" >> QRGramSchmidt_result.txt
echo "N = 5000 - O2"
./QRGramSchmidt < matrix5000x5000.dat >> QRGramSchmidt_result.txt
gcc QRGramSchmidt.c -o QRGramSchmidt -lm -O3
echo "N = 5000 - O3" >> QRGramSchmidt_result.txt
echo "N = 5000 - O3"
./QRGramSchmidt < matrix5000x5000.dat >> QRGramSchmidt_result.txt
gcc QRGramSchmidt.c -o QRGramSchmidt -lm -Ofast
echo "N = 5000 - Ofast" >> QRGramSchmidt_result.txt
echo "N = 5000 - Ofast"
./QRGramSchmidt < matrix5000x5000.dat >> QRGramSchmidt_result.txt
gcc QRGramSchmidt.c -o QRGramSchmidt -lm -Og
echo "N = 5000 - Og" >> QRGramSchmidt_result.txt
echo "N = 5000 - Og"
./QRGramSchmidt < matrix5000x5000.dat >> QRGramSchmidt_result.txt
gcc QRGramSchmidt.c -o QRGramSchmidt -lm -Os
echo "N = 5000 - Os" >> QRGramSchmidt_result.txt
echo "N = 5000 - Os"
./QRGramSchmidt < matrix5000x5000.dat >> QRGramSchmidt_result.txt
