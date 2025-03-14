# Contributing to TI-84 Plus CE Advanced Trigonometry Suite

Thank you for your interest in contributing to this project! This document provides guidelines and instructions for contributing.

## Development Environment Setup

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/ti84-trig-suite.git
   cd ti84-trig-suite
   ```

2. Make the testing scripts executable:
   ```bash
   chmod +x *.sh
   ```

3. Set up testing:
   - For ROM-free testing: `./ti_basic_tester.sh`
   - For CEmu testing: Follow instructions in README.txt

## Project Structure

- `TRIGMAIN.8xp`: Main menu and program loader
- `TRIGCONF.8xp`: Configuration and menu structure
- Modules:
  - `TRIGSRT.8xp`: Special Right Triangles
  - `TRIGUNIT.8xp`: Unit Circle Reference
  - `TRIGRTS.8xp`: Right Triangle Solver
  - `TRIGFUNC.8xp`: Trig Functions Calculator
  - `TRIGAPPL.8xp`: Applications
  - `TRIGNOTE.8xp`: Notes & Reference

## Adding New Features

1. **Adding a new module:**
   - Create a new .8xp file following the module template
   - Update TRIGCONF.8xp to add your module to the menu
   - Update test_config.sh to include your module in testing

2. **Enhancing existing modules:**
   - Maintain consistent UI patterns
   - Include "Show Work" options
   - Keep error handling consistent

## Testing

Before submitting pull requests, test your changes:

1. Run syntax checking: `./ti_basic_tester.sh`
2. Review the navigation map in test_output
3. If you have a ROM file or calculator, test the actual execution

## Submitting Changes

1. Create a branch: `git checkout -b feature/your-feature-name`
2. Make changes following the project guidelines
3. Push to your branch
4. Submit a pull request with a clear description of the changes

## Coding Guidelines

- Keep variable usage consistent (A-E for menu selections)
- Use L1-L3 for configuration information only
- Use Str1-Str9 for text storage
- Ensure all modules have proper navigation back to the main menu
- Comment your code, especially complex calculations

Thank you for contributing!
