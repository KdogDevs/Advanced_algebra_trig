#!/bin/bash

echo "TI-BASIC Program Tester"
echo "======================="
echo "This tool helps test TI-BASIC programs without needing a calculator ROM"
echo

# Directory for test output
mkdir -p test_output

# Function to check basic TI-BASIC syntax
check_syntax() {
    local file=$1
    local errors=0
    local warnings=0
    
    echo "Checking syntax for $file..."
    
    # Check for common errors
    if grep -q "prgm[^ ]" "$file"; then
        echo "WARNING: Possible incorrect program call format in $file"
        warnings=$((warnings+1))
    fi
    
    if grep -q "Lbl" "$file" && ! grep -q "Goto" "$file"; then
        echo "WARNING: Label without Goto in $file"
        warnings=$((warnings+1))
    fi
    
    if grep -q "Goto" "$file" && ! grep -q "Lbl" "$file"; then
        echo "WARNING: Goto without Label in $file"
        warnings=$((warnings+1))
    fi
    
    # Check for balanced If-Then-End blocks
    local if_count=$(grep -c "If" "$file")
    local then_count=$(grep -c "Then" "$file")
    local end_count=$(grep -c "End" "$file")
    
    if [ $if_count -ne $then_count ]; then
        echo "ERROR: Unbalanced If-Then statements in $file"
        errors=$((errors+1))
    fi
    
    if [ $if_count -ne $end_count ]; then
        echo "WARNING: Possible unbalanced If-Then-End blocks in $file"
        warnings=$((warnings+1))
    fi
    
    # Check for missing return to main menu
    if ! grep -q "Goto MAIN" "$file" && ! grep -q "prgmTRIGMAIN" "$file"; then
        echo "WARNING: No return to main menu found in $file"
        warnings=$((warnings+1))
    fi
    
    echo "Syntax check complete: $errors errors, $warnings warnings"
    return $errors
}

# Function to simulate program execution
simulate_execution() {
    local file=$1
    local output_file="test_output/$(basename "$file" .8xp)_simulation.txt"
    
    echo "Simulating execution of $file..."
    
    echo "Virtual TI-84 Plus CE Output" > "$output_file"
    echo "===========================" >> "$output_file"
    echo "" >> "$output_file"
    
    # Extract and display menus and options
    echo "Detected Menus:" >> "$output_file"
    grep "Disp" "$file" | sed 's/Disp//' | sed 's/"//g' >> "$output_file"
    
    echo "" >> "$output_file"
    echo "Input Prompts:" >> "$output_file"
    grep "Input" "$file" | sed 's/Input//' | sed 's/"//g' >> "$output_file"
    
    echo "" >> "$output_file"
    echo "Program Flow:" >> "$output_file"
    grep -e "If" -e "Then" -e "Else" -e "End" -e "Lbl" -e "Goto" -e "prgm" "$file" >> "$output_file"
    
    echo "Simulation output saved to $output_file"
}

# Function to build a visual navigation map
build_navigation_map() {
    local output_file="test_output/navigation_map.txt"
    
    echo "Building program navigation map..."
    echo "TI-BASIC Program Navigation Map" > "$output_file"
    echo "=============================" >> "$output_file"
    
    echo "TRIGMAIN (Main Menu)" >> "$output_file"
    echo "  |" >> "$output_file"
    
    # Extract program links from TRIGCONF
    for i in $(seq 1 10); do
        prog=$(grep "→L2($i)" TRIGCONF.8xp | cut -d'"' -f2)
        menu=$(grep "→L1($i)" TRIGCONF.8xp | cut -d'"' -f2)
        
        if [ -n "$prog" ]; then
            echo "  ├─ $menu ($prog)" >> "$output_file"
        fi
    done
    
    echo "" >> "$output_file"
    echo "Cross-references between programs:" >> "$output_file"
    
    for file in *.8xp; do
        if [ "$file" != "TRIGMAIN.8xp" ]; then
            echo "$(basename "$file" .8xp) references:" >> "$output_file"
            grep "prgm" "$file" | sed 's/prgm/  → /' >> "$output_file"
        fi
    done
    
    echo "Navigation map saved to $output_file"
}

# Function to check for TI-BASIC specific errors
check_tibasic_errors() {
    local output_file="test_output/error_report.txt"
    
    echo "Checking for common TI-BASIC errors..."
    echo "TI-BASIC Error Report" > "$output_file"
    echo "===================" >> "$output_file"
    echo "" >> "$output_file"
    
    for file in *.8xp; do
        echo "Checking $file..." 
        echo "## $(basename "$file" .8xp):" >> "$output_file"
        
        # Check for variable naming conflicts
        if grep -q "→[^ ]" "$file"; then
            echo "  - Variable naming may cause conflicts (no space after →)" >> "$output_file"
        fi
        
        # Check for list usage
        if grep -q "L[0-9]" "$file"; then
            echo "  - Uses lists: $(grep -o "L[0-9]\+" "$file" | sort | uniq | tr '\n' ' ')" >> "$output_file"
        fi
        
        # Check for string usage
        if grep -q "Str[0-9]" "$file"; then
            echo "  - Uses strings: $(grep -o "Str[0-9]\+" "$file" | sort | uniq | tr '\n' ' ')" >> "$output_file"
        fi
        
        # Check code size (approximate)
        size=$(wc -c < "$file")
        echo "  - Approximate size: $size bytes" >> "$output_file"
        
        if (( size > 8000 )); then
            echo "  - WARNING: File size may be too large for calculator memory" >> "$output_file"
        fi
        
        echo "" >> "$output_file"
    done
    
    echo "Error report saved to $output_file"
}

# Main execution
echo "Running tests on all .8xp files..."
errors=0

for file in *.8xp; do
    check_syntax "$file"
    errors=$((errors+$?))
    simulate_execution "$file"
done

build_navigation_map
check_tibasic_errors

echo ""
echo "All tests completed. Total errors: $errors"
echo "Test outputs have been saved to the test_output directory"

# Generate a mock screenshot
echo ""
echo "Generating mock screenshots to visualize programs..."

for file in TRIGMAIN.8xp TRIGSRT.8xp TRIGUNIT.8xp TRIGRTS.8xp TRIGFUNC.8xp TRIGAPPL.8xp TRIGNOTE.8xp; do
    base=$(basename "$file" .8xp)
    output="test_output/${base}_screen.txt"
    
    echo "┌────────────────────┐" > "$output"
    echo "│ TI-84 Plus CE      │" >> "$output"
    echo "├────────────────────┤" >> "$output"
    
    # Read first few Disp lines from the file
    grep "Disp" "$file" | head -5 | sed 's/Disp //g' | sed 's/"//g' | while read -r line; do
        printf "│ %-18s │\n" "$line" >> "$output"
    done
    
    # Fill remaining lines
    for i in {1..7}; do
        echo "│                    │" >> "$output"
    done
    
    echo "└────────────────────┘" >> "$output"
    echo "Generated mock screen for $base"
done

echo ""
echo "To view the results, run: cat test_output/*"
