#!/bin/bash

# Script to view test results

if [ ! -d "test_output" ]; then
    echo "Error: No test results found. Run ti_basic_tester.sh first."
    exit 1
fi

clear
echo "TI-BASIC TEST RESULTS VIEWER"
echo "==========================="
echo

# Display main menu
while true; do
    echo "Available reports:"
    echo "1. Navigation Map"
    echo "2. Error Report"
    echo "3. Program Simulations"
    echo "4. Mock Screenshots"
    echo "5. Exit"
    echo
    read -p "Select a report to view (1-5): " choice
    
    case $choice in
        1)
            clear
            echo "NAVIGATION MAP"
            echo "============="
            cat test_output/navigation_map.txt
            echo
            read -p "Press Enter to return to menu"
            clear
            ;;
        2)
            clear
            echo "ERROR REPORT"
            echo "==========="
            cat test_output/error_report.txt
            echo
            read -p "Press Enter to return to menu"
            clear
            ;;
        3)
            clear
            echo "PROGRAM SIMULATIONS"
            echo "=================="
            echo "Available simulations:"
            
            # List all simulation files
            files=(test_output/*_simulation.txt)
            for i in "${!files[@]}"; do
                base=$(basename "${files[$i]}" _simulation.txt)
                echo "$((i+1)). $base"
            done
            echo "$((${#files[@]}+1)). Back to main menu"
            
            read -p "Select a simulation to view: " sim_choice
            
            if [ "$sim_choice" -le "${#files[@]}" ]; then
                clear
                cat "${files[$((sim_choice-1))]}"
                echo
                read -p "Press Enter to return to menu"
            fi
            clear
            ;;
        4)
            clear
            echo "MOCK SCREENSHOTS"
            echo "==============="
            echo "Available screens:"
            
            # List all screen files
            files=(test_output/*_screen.txt)
            for i in "${!files[@]}"; do
                base=$(basename "${files[$i]}" _screen.txt)
                echo "$((i+1)). $base"
            done
            echo "$((${#files[@]}+1)). Back to main menu"
            
            read -p "Select a screenshot to view: " screen_choice
            
            if [ "$screen_choice" -le "${#files[@]}" ]; then
                clear
                cat "${files[$((screen_choice-1))]}"
                echo
                read -p "Press Enter to return to menu"
            fi
            clear
            ;;
        5)
            exit 0
            ;;
        *)
            echo "Invalid choice. Please try again."
            ;;
    esac
done
