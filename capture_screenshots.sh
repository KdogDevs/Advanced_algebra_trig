#!/bin/bash

# Source the test configuration
source "$(dirname "$0")/test_config.sh"

# Ensure we have a directory for screenshots
mkdir -p "$SCREENSHOTS_DIR"

# Check if ROM file exists
if ! check_rom_exists; then
    exit 1
fi

# Function to capture a screenshot with appropriate delay
capture_screen() {
    local name=$1
    local delay=$2
    
    echo "Capturing $name..."
    sleep $delay
    "$CEMU_GUI_PATH" --rom="$ROM_PATH" --send=TRIGMAIN.8xp --screenshot="$SCREENSHOTS_DIR/$name.png" &
    
    # Give some time for the screenshot to be taken
    sleep 3
    
    # Kill the CEmu process
    pkill -f CEmu
    
    # Wait a bit to ensure process is terminated
    sleep 1
}

echo "Starting screenshot capture process..."

# Main menu
capture_screen "main_menu" 2

# Special Right Triangles
capture_screen "special_triangles" 4

# Unit Circle
capture_screen "unit_circle" 4

# Right Triangle Solver
capture_screen "right_triangle_solver" 4

# Trig Functions
capture_screen "trig_functions" 4

# Applications
capture_screen "applications" 4

# Notes & Reference
capture_screen "notes_reference" 4

echo "Screenshot capture completed. Images saved in $SCREENSHOTS_DIR directory."
