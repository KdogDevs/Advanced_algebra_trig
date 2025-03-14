#!/bin/bash

# Source the test configuration
source "$(dirname "$0")/test_config.sh"

# Ensure we have a directory for test results
mkdir -p "$TEST_RESULTS_DIR"

# Check if ROM file exists
if ! check_rom_exists; then
    exit 1
fi

# Create a temporary test configuration with the correct ROM path
TMP_CONFIG=$(mktemp)
sed "s|{{ROM_PATH}}|$ROM_PATH|g" "$TEST_CONFIG_FILE" > "$TMP_CONFIG"

# Run the autotester
echo "Running autotester with configuration..."
"$CEMU_AUTOTESTER_PATH" "$TMP_CONFIG"

# Check if the test was successful
if [ $? -eq 0 ]; then
    echo "Test completed successfully!"
    echo "Screenshots saved in $TEST_RESULTS_DIR directory."
else
    echo "Test failed! Check the error messages above."
fi

# Clean up temporary file
rm -f "$TMP_CONFIG"
