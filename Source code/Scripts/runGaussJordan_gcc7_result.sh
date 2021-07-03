#!/bin/bash
echo "Gauss Jordan"
gcc-7 --version >> GaussJordan_gcc7_result.txt
gcc-7 GaussJordan.c -o GaussJordan -lm
echo "N = 5000 - standard" >> GaussJordan_gcc7_result.txt
echo "N = 5000 - standard"
./GaussJordan < matrix5000x5000.dat >> GaussJordan_gcc7_result.txt
gcc-7 GaussJordan.c -o GaussJordan -lm -O
echo "N = 5000 - O" >> GaussJordan_gcc7_result.txt
echo "N = 5000 - O"
./GaussJordan < matrix5000x5000.dat >> GaussJordan_gcc7_result.txt
gcc-7 GaussJordan.c -o GaussJordan -lm -O1
echo "N = 5000 - O1" >> GaussJordan_gcc7_result.txt
echo "N = 5000 - O1"
./GaussJordan < matrix5000x5000.dat >> GaussJordan_gcc7_result.txt
gcc-7 GaussJordan.c -o GaussJordan -lm -O2
echo "N = 5000 - O2" >> GaussJordan_gcc7_result.txt
echo "N = 5000 - O2"
./GaussJordan < matrix5000x5000.dat >> GaussJordan_gcc7_result.txt
gcc-7 GaussJordan.c -o GaussJordan -lm -O3
echo "N = 5000 - O3" >> GaussJordan_gcc7_result.txt
echo "N = 5000 - O3"
./GaussJordan < matrix5000x5000.dat >> GaussJordan_gcc7_result.txt
gcc-7 GaussJordan.c -o GaussJordan -lm -Ofast
echo "N = 5000 - Ofast" >> GaussJordan_gcc7_result.txt
echo "N = 5000 - Ofast"
./GaussJordan < matrix5000x5000.dat >> GaussJordan_gcc7_result.txt
gcc-7 GaussJordan.c -o GaussJordan -lm -Og
echo "N = 5000 - Og" >> GaussJordan_gcc7_result.txt
echo "N = 5000 - Og"
./GaussJordan < matrix5000x5000.dat >> GaussJordan_gcc7_result.txt
gcc-7 GaussJordan.c -o GaussJordan -lm -Os
echo "N = 5000 - Os" >> GaussJordan_gcc7_result.txt
echo "N = 5000 - Os"
./GaussJordan < matrix5000x5000.dat >> GaussJordan_gcc7_result.txt
