#!/bin/bash

# Source the test configuration
source "$(dirname "$0")/test_config.sh"

# Check if ROM file exists
if ! check_rom_exists; then
    exit 1
fi

# Check if a program file was provided
if [ -z "$1" ]; then
    echo "Usage: ./quick_test.sh [program.8xp]"
    echo "       ./quick_test.sh all       (to send all programs)"
    exit 1
fi

# If parameter is "all", send all programs
if [ "$1" == "all" ]; then
    echo "Launching CEmu with all programs..."
    
    # Build the command with all program files
    CMD="$CEMU_GUI_PATH --rom=$ROM_PATH"
    for prog in "${PROGRAM_FILES[@]}"; do
        CMD="$CMD --send=$prog"
    done
    
    # Execute the command
    eval "$CMD"
else
    # Check if the specified program exists
    if [ ! -f "$1" ]; then
        echo "Error: File $1 not found!"
        exit 1
    fi
    
    echo "Launching CEmu with $1..."
    "$CEMU_GUI_PATH" --rom="$ROM_PATH" --send="$1"
fi
