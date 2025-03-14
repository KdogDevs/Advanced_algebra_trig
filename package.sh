#!/bin/bash

VERSION="1.0.0"

echo "Creating release package v$VERSION..."

# Create directories
mkdir -p release
mkdir -p screenshots

# Create a placeholder screenshot for demo
if [ ! -f screenshots/demo.png ]; then
    echo "Creating placeholder demo screenshot..."
    ./ti_basic_tester.sh > /dev/null 2>&1
    
    # Use ASCII art screenshot as a placeholder
    if [ -f test_output/TRIGMAIN_screen.txt ]; then
        echo "<!DOCTYPE html>
        <html>
        <head>
            <style>
                body { background-color: #f0f0f0; font-family: monospace; text-align: center; }
                pre { display: inline-block; background-color: #fff; padding: 20px; border: 1px solid #ccc; }
            </style>
        </head>
        <body>
            <pre>" > screenshots/demo.html
        cat test_output/TRIGMAIN_screen.txt >> screenshots/demo.html
        echo "</pre>
        </body>
        </html>" >> screenshots/demo.html
        
        # If wkhtmltoimage is available, convert HTML to PNG
        if command -v wkhtmltoimage &> /dev/null; then
            wkhtmltoimage screenshots/demo.html screenshots/demo.png
            rm screenshots/demo.html
        else
            echo "wkhtmltoimage not found. Using placeholder instead."
            echo "TI-84 Plus CE Advanced Trigonometry Suite" > screenshots/demo.png
        fi
    else
        echo "TI-84 Plus CE Advanced Trigonometry Suite" > screenshots/demo.png
    fi
fi

# Copy calculator program files
cp *.8xp release/

# Copy documentation
cp README.md release/
cp LICENSE release/
cp CHANGELOG.md release/

# Create zip file
rm -f TI84_Trig_Suite_v${VERSION}.zip
zip -r TI84_Trig_Suite_v${VERSION}.zip release/ screenshots/

echo "Package created: TI84_Trig_Suite_v${VERSION}.zip"
echo "Ready for GitHub release!"
