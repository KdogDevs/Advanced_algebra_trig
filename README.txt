# Advanced Trigonometry Program Suite

This collection of TI-BASIC programs provides a comprehensive
trigonometry reference and calculation tool for the TI-84 Plus CE.

## Installation Instructions:
1. Transfer all .8xp files to your calculator using TI Connect CE
2. Run the program by selecting prgmTRIGMAIN from the calculator's program menu

## Program Structure:
- TRIGMAIN: Main menu and program loader
- TRIGCONF: Menu configuration settings
- TRIGSRT: Special Right Triangles module
- TRIGUNIT: Unit Circle Reference module
- TRIGRTS: Right Triangle Solver module
- TRIGFUNC: Trig Functions Calculator module 
- TRIGAPPL: Angle Applications module
- TRIGNOTE: Notes Database module

## Testing with CEmu on Ubuntu:

### Prerequisites:
1. You need a valid TI-84 Plus CE ROM file for testing
2. Ensure CEmu is properly built in the CEmu directory

### Setting up a ROM File:
You have three options for providing a ROM file:
1. Create a backup ROM from your calculator using `./create_rom_backup.sh`
2. Place an existing ROM file at `TI84PLUSCE.rom` in the project directory
3. Specify a ROM path by setting the TI84_ROM environment variable:
   ```bash
   export TI84_ROM=/path/to/your/rom.rom
   ```

### Available Testing Scripts:
- `run_tests.sh`: Runs automated tests using the autotester
- `quick_test.sh`: Launches CEmu with a specific program or all programs
- `capture_screenshots.sh`: Captures screenshots of all program modules
- `create_rom_backup.sh`: Helps create a ROM backup from your calculator

### Example Usage:
```bash
# Make scripts executable
chmod +x *.sh

# Create a ROM backup from your calculator (one-time setup)
./create_rom_backup.sh

# Or specify your ROM location
export TI84_ROM=/path/to/your/rom.rom

# Run automated tests
./run_tests.sh

# Quick test a specific program
./quick_test.sh TRIGMAIN.8xp

# Test all programs at once
./quick_test.sh all

# Capture screenshots of all modules
./capture_screenshots.sh
```

### Customizing Test Settings:
Edit `test_config.sh` to adjust paths and other settings to match your environment.

## Adding New Modules:
1. Create a new .8xp file with your module code
2. Follow the template structure (see Module Template below)
3. Update TRIGCONF.8xp to include your module in the menu:
   - Add your menu name to L1
   - Add your program name to L2
4. Your module must end with "Goto MAIN" to return to the main menu
5. Add your new program to the PROGRAM_FILES array in test_config.sh for testing

## Module Template:
```
ClrHome
Disp "MODULE TITLE"
Disp "------------"
Disp "1:OPTION 1"
Disp "2:OPTION 2"
Disp "3:BACK"
Input "SELECT: ",A

If A=3
Then
  prgmTRIGMAIN
End

If A=1
Then
  // Option 1 code
End

If A=2
Then
  // Option 2 code
End

Goto MAIN
```

## Tips for Expansion:
- Keep variable usage consistent (use A-E for menu selections)
- Use L1-L3 for configuration information only
- Use Str1-Str9 for text storage
- Include "SHOW WORK" options in all calculation modules
- Always provide a way to return to the main menu

## Tips for Testing:
- Update the test_config.json file to add new tests or capture more screenshots
- Modify the sequence array to simulate different user interactions
- Use the autotester output to diagnose any issues with your programs

For questions or contributions, please contact the developer.

## Development Setup

To set up the development environment:

1. Clone this repository
2. Install CEmu from https://github.com/CE-Programming/CEmu
3. Run `./ti_basic_tester.sh` to test programs without a ROM file

