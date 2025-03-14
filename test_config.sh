#!/bin/bash

# Configuration for TI-84 Plus CE testing scripts
# Edit these variables to match your environment

# ROM file settings
# Default ROM path (can be overridden with TI84_ROM environment variable)
DEFAULT_ROM_PATH="TI84PLUSCE.rom"

# Use environment variable if set, otherwise use default
ROM_PATH=${TI84_ROM:-$DEFAULT_ROM_PATH}

# CEmu paths - adjust these if your CEmu installation is different
CEMU_GUI_PATH="CEmu/gui/qt/CEmu"
CEMU_AUTOTESTER_PATH="CEmu/tests/autotester/autotester"

# Test configuration
TEST_CONFIG_FILE="test_config.json"
TEST_RESULTS_DIR="test_results"
SCREENSHOTS_DIR="screenshots"

# Program files
PROGRAM_FILES=(
    "TRIGMAIN.8xp"
    "TRIGCONF.8xp"
    "TRIGSRT.8xp"
    "TRIGUNIT.8xp"
    "TRIGRTS.8xp"
    "TRIGFUNC.8xp"
    "TRIGAPPL.8xp"
    "TRIGNOTE.8xp"
)

# Function to check if ROM file exists
check_rom_exists() {
    if [ ! -f "$ROM_PATH" ]; then
        echo "Error: ROM file not found at: $ROM_PATH"
        echo "Options to resolve this issue:"
        echo "1. Place a valid ROM file at: $ROM_PATH"
        echo "2. Set the TI84_ROM environment variable to your ROM file location:"
        echo "   export TI84_ROM=/path/to/your/rom.rom"
        echo "   ./$(basename $0)"
        echo "3. Create a backup ROM from your calculator using CEmu's ROM dumper"
        return 1
    fi
    return 0
}
