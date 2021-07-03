#!/bin/bash
echo "Eliminacao Gaussiana"
gcc --version >> Gaussian_result.txt
gcc Gaussian.c -o Gaussian -lm
echo "N = 5000 - standard" >> Gaussian_result.txt
echo "N = 5000 - standard"
./Gaussian < matrix5000x5000.dat >> Gaussian_result.txt
gcc Gaussian.c -o Gaussian -lm -O
echo "N = 5000 - O" >> Gaussian_result.txt
echo "N = 5000 - O"
./Gaussian < matrix5000x5000.dat >> Gaussian_result.txt
gcc Gaussian.c -o Gaussian -lm -O1
echo "N = 5000 - O1" >> Gaussian_result.txt
echo "N = 5000 - O1"
./Gaussian < matrix5000x5000.dat >> Gaussian_result.txt
gcc Gaussian.c -o Gaussian -lm -O2
echo "N = 5000 - O2" >> Gaussian_result.txt
echo "N = 5000 - O2"
./Gaussian < matrix5000x5000.dat >> Gaussian_result.txt
gcc Gaussian.c -o Gaussian -lm -O3
echo "N = 5000 - O3" >> Gaussian_result.txt
echo "N = 5000 - O3"
./Gaussian < matrix5000x5000.dat >> Gaussian_result.txt
gcc Gaussian.c -o Gaussian -lm -Ofast
echo "N = 5000 - Ofast" >> Gaussian_result.txt
echo "N = 5000 - Ofast"
./Gaussian < matrix5000x5000.dat >> Gaussian_result.txt
gcc Gaussian.c -o Gaussian -lm -Og
echo "N = 5000 - Og" >> Gaussian_result.txt
echo "N = 5000 - Og"
./Gaussian < matrix5000x5000.dat >> Gaussian_result.txt
gcc Gaussian.c -o Gaussian -lm -Os
echo "N = 5000 - Os" >> Gaussian_result.txt
echo "N = 5000 - Os"
./Gaussian < matrix5000x5000.dat >> Gaussian_result.txt
