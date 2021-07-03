#!/bin/bash
echo " LDU"
gcc --version >> LDU_result.txt
gcc LDU.c -o LDU -lm
echo "N = 5000 - standard" >> LDU_result.txt
echo "N = 5000 - standard"
./LDU < matrix5000x5000.dat >> LDU_result.txt
gcc LDU.c -o LDU -lm -O
echo "N = 5000 - O" >> LDU_result.txt
echo "N = 5000 - O"
./LDU < matrix5000x5000.dat >> LDU_result.txt
gcc LDU.c -o LDU -lm -O1
echo "N = 5000 - O1" >> LDU_result.txt
echo "N = 5000 - O1"
./LDU < matrix5000x5000.dat >> LDU_result.txt
gcc LDU.c -o LDU -lm -O2
echo "N = 5000 - O2" >> LDU_result.txt
echo "N = 5000 - O2"
./LDU < matrix5000x5000.dat >> LDU_result.txt
gcc LDU.c -o LDU -lm -O3
echo "N = 5000 - O3" >> LDU_result.txt
echo "N = 5000 - O3"
./LDU < matrix5000x5000.dat >> LDU_result.txt
gcc LDU.c -o LDU -lm -Ofast
echo "N = 5000 - Ofast" >> LDU_result.txt
echo "N = 5000 - Ofast"
./LDU < matrix5000x5000.dat >> LDU_result.txt
gcc LDU.c -o LDU -lm -Og
echo "N = 5000 - Og" >> LDU_result.txt
echo "N = 5000 - Og"
./LDU < matrix5000x5000.dat >> LDU_result.txt
gcc LDU.c -o LDU -lm -Os
echo "N = 5000 - Os" >> LDU_result.txt
echo "N = 5000 - Os"
./LDU < matrix5000x5000.dat >> LDU_result.txt
