#!/bin/bash
echo " Cholesky"
gcc-7 --version >> Cholesky_gcc7_result.txt
gcc-7 Cholesky.c -o Cholesky -lm
echo "N = 5000 - standard" >> Cholesky_gcc7_result.txt
echo "N = 5000 - standard"
./Cholesky < matrix5000x5000.dat >> Cholesky_gcc7_result.txt
gcc-7 Cholesky.c -o Cholesky -lm -O
echo "N = 5000 - O" >> Cholesky_gcc7_result.txt
echo "N = 5000 - O"
./Cholesky < matrix5000x5000.dat >> Cholesky_gcc7_result.txt
gcc-7 Cholesky.c -o Cholesky -lm -O1
echo "N = 5000 - O1" >> Cholesky_gcc7_result.txt
echo "N = 5000 - O1"
./Cholesky < matrix5000x5000.dat >> Cholesky_gcc7_result.txt
gcc-7 Cholesky.c -o Cholesky -lm -O2
echo "N = 5000 - O2" >> Cholesky_gcc7_result.txt
echo "N = 5000 - O2"
./Cholesky < matrix5000x5000.dat >> Cholesky_gcc7_result.txt
gcc-7 Cholesky.c -o Cholesky -lm -O3
echo "N = 5000 - O3" >> Cholesky_gcc7_result.txt
echo "N = 5000 - O3"
./Cholesky < matrix5000x5000.dat >> Cholesky_gcc7_result.txt
gcc-7 Cholesky.c -o Cholesky -lm -Ofast
echo "N = 5000 - Ofast" >> Cholesky_gcc7_result.txt
echo "N = 5000 - Ofast"
./Cholesky < matrix5000x5000.dat >> Cholesky_gcc7_result.txt
gcc-7 Cholesky.c -o Cholesky -lm -Og
echo "N = 5000 - Og" >> Cholesky_gcc7_result.txt
echo "N = 5000 - Og"
./Cholesky < matrix5000x5000.dat >> Cholesky_gcc7_result.txt
gcc-7 Cholesky.c -o Cholesky -lm -Os
echo "N = 5000 - Os" >> Cholesky_gcc7_result.txt
echo "N = 5000 - Os"
./Cholesky < matrix5000x5000.dat >> Cholesky_gcc7_result.txt
