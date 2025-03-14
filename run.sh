#!/bin/bash

# Clear screen before starting
clear

# Create bin directory if it doesn't exist
mkdir -p bin

# Default action: build and run
action="build_and_run"

# Check command-line arguments
if [ "$1" == "build" ]; then
    action="build"
elif [ "$1" == "run" ]; then
    action="run"
elif [ "$1" == "clean" ]; then
    action="clean"
fi

start=$(date +%s.%N)

# Clean action: remove bin directory
if [ "$action" == "clean" ]; then
    echo "Cleaning up..."
    rm -rf bin
    echo "Bin directory cleaned."
    read -n 1 -s -r -p "Press any key to continue..."
    clear
    exit 0
fi

# Build action
if [ "$action" == "build" ] || [ "$action" == "build_and_run" ]; then
    g++ src/main.cpp lib/helper.cpp -I lib -o bin/app
    if [ $? -eq 0 ]; then
        echo "Build successful."
    else
        echo "Compilation failed."
        exit 1
    fi
fi

# Run action
if [ "$action" == "run" ] || [ "$action" == "build_and_run" ]; then
    # Clear screen after successful build
    clear
    end=$(date +%s.%N)
    elapsed=$(awk "BEGIN {print $end - $start}")
    ./bin/app
    echo ""
    echo "Program executed in $elapsed seconds"
fi

# Wait for user input to continue
read -n 1 -s -r -p "Press any key to continue..."
clear
