#!/bin/bash

clear

echo -e "\e[1;32m"
echo "╔══════════════════════════════════════════════════╗"
echo "║        🚀 Welcome to Python Environment 🚀       ║"
echo "╠══════════════════════════════════════════════════╣"
echo "║ Setting up your Python virtual environment...    ║"
echo "╚══════════════════════════════════════════════════╝"
echo -e "\e[0m"

# Detect OS
OS_TYPE="Unknown"
INSTALL_CMD=""

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    OS_TYPE="Ubuntu/Linux"
    INSTALL_CMD="sudo apt install -y"
elif [[ "$OSTYPE" == "darwin"* ]]; then
    OS_TYPE="macOS"
    INSTALL_CMD="brew install"
elif [[ "$OSTYPE" == "msys" || "$OSTYPE" == "cygwin" ]]; then
    OS_TYPE="Windows"
    INSTALL_CMD="Unsupported"
else
    OS_TYPE="Unsupported OS"
fi

echo "Detected OS: $OS_TYPE"

if [[ "$OS_TYPE" == "Unsupported OS" || "$OS_TYPE" == "Windows" ]]; then
    echo "⚠️  This script is not fully supported on Windows. Consider using WSL or manually setting up a virtual environment."
    exit 1
fi

# Ensure directory name is provided
if [ -z "$1" ]; then
    echo "❌ Error: Please provide a directory name."
    exit 1
fi

sleep 2

echo "Creating the directory '$1'..."
if mkdir -p "$1"; then
    cd "$1" || { echo "❌ Failed to navigate to $1"; exit 1; }
else
    echo "❌ Error: Could not create directory."
    exit 1
fi
sleep 1

echo "Creating a virtual environment..."
if python3 -m venv .venv; then
    echo "✅ Virtual environment created!"
else
    echo "❌ Error: Could not create virtual environment."
    exit 1
fi

echo "Activating the virtual environment..."
if source .venv/bin/activate 2>/dev/null; then
    echo "✅ Virtual environment activated!"
else
    echo "⚠️  Could not activate the virtual environment. Try running 'source .venv/bin/activate' manually."
fi

sleep 1

# Install dependencies (figlet & toilet) based on OS
echo "Installing figlet and toilet..."
if [[ "$OS_TYPE" == "Ubuntu/Linux" ]]; then
    $INSTALL_CMD figlet toilet
elif [[ "$OS_TYPE" == "macOS" ]]; then
    $INSTALL_CMD figlet toilet
fi

echo "✅ figlet and toilet installed!"

# Create a main script file if provided
if [ -n "$2" ]; then
    touch "$2"
    echo "✅ Created main script file: $2"
fi

# Check if requirements.txt exists and install dependencies
if [ -f "requirements.txt" ]; then
    echo "📦 Installing dependencies from requirements.txt..."
    if pip install -r requirements.txt; then
        echo "✅ Dependencies installed successfully!"
    else
        echo "❌ Error: Failed to install dependencies."
    fi
else
    echo "ℹ️ No requirements.txt found. Skipping dependency installation."
fi

echo -e "\n🎉 All set! You can start coding in '$1'"