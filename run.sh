#!/bin/bash

start=$(date +%s.%N)
gcc main.c -o main.exe
if [ $? -eq 0 ]; then
    end=$(date +%s.%N)
    elapsed=$(awk "BEGIN {print $end - $start}")
    ./main.exe
    echo ""
    echo "Program executed in $elapsed seconds"
else
    echo "Compilation failed."
fi
read -n 1 -s -r -p "Press any key to continue..."
clear