
#!/bin/bash

clear

echo -e "\e[1;32m"
echo "╔══════════════════════════════════════════════════╗"
echo "║        🚀 Welcome to Python Environment 🚀       ║"
echo "╠══════════════════════════════════════════════════╣"
echo "║ Setting up your Python virtual environment...    ║"
echo "╚══════════════════════════════════════════════════╝"
echo -e "\e[0m"

sleep 2

echo "Creating The Directory '$1'..."
mkdir $1
cd $1
sleep 1

echo "Creating a virtual environment..."
python3 -m venv .venv 
sleep 1

echo "✅ Virtual environment created!"

echo "Activating The Virtual Environment..."
if source .env/bin/activate 2>/dev/null; then
    echo "✅ Virtual environment activated!"
else
    echo "⚠️  Could not activate the virtual environment. Try running 'source .env/bin/activate' manually."
fi

sleep 1

# touch $2
# echo "✅ Created main script file: $2"

echo -e "\n🎉 All set! You can start coding in '$1'"
