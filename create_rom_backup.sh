#!/bin/bash

# Source the test configuration
source "$(dirname "$0")/test_config.sh"

echo "TI-84 Plus CE ROM Backup Helper"
echo "==============================="
echo
echo "This script will help you create a ROM backup from your TI-84 Plus CE calculator."
echo "You'll need to have your calculator connected via USB."
echo
echo "Steps:"
echo "1. Make sure CEmu is installed and your calculator is connected"
echo "2. The ROM will be saved to: $DEFAULT_ROM_PATH"
echo

read -p "Do you want to continue? (y/n): " CONTINUE

if [[ ! "$CONTINUE" =~ ^[Yy]$ ]]; then
    echo "Operation cancelled."
    exit 0
fi

echo
echo "Attempting to create ROM backup..."
echo "Please ensure your calculator is connected and in the correct mode."
echo "This may take a few moments."

# Launch CEmu's ROM dumper
"$CEMU_GUI_PATH" --rom-dump="$DEFAULT_ROM_PATH"

# Check if ROM was created
if [ -f "$DEFAULT_ROM_PATH" ]; then
    echo
    echo "Success! ROM backup created at: $DEFAULT_ROM_PATH"
    echo "You can now use the testing scripts with this ROM file."
else
    echo
    echo "Error: ROM backup failed."
    echo "Please check that your calculator is properly connected and try again."
    echo "You may need to run CEmu manually to create the ROM backup."
fi
