#!/usr/bin/env python3

# import os
import subprocess
import pyfiglet
import time
from colorama import Fore, init

# Initialize colorama
init(autoreset=True)

# Function to check dependencies
def check_dependencies():
    try:
        import pyfiglet
        import colorama
    except ImportError:
        print(Fore.RED + "Missing required modules. Installing them now...")
        subprocess.run(["pip", "install", "pyfiglet", "colorama"], check=True)
        print(Fore.GREEN + "Dependencies installed. Please re-run the script.")
        exit()

# Check dependencies before running
check_dependencies()

# Clear the terminal
subprocess.run(["clear"], check=True)

# Print banner using figlet
banner = pyfiglet.figlet_format("Bobos Recipe", font="big")
print(Fore.CYAN + banner)
print("Welcome to Bobo's Recipe!")

# Recipe List
recipe = [
    "20ml Vegetable Cooking Oil",
    "Two Large Red Onions",
    "Two Large Tomatoes",
    "One Can of Tomato Paste (Optional)",
    "Several Cloves of Garlic",
    "Large Piece of Ginger",
    "Several Potatoes",
    "2 to 3 Cups of Yellow Beans",
    "Add Seasoning as Preferred",
    "1 Piece Coconut",
    "2 Large Pieces Capsicum (Hoho)",
    "Chilli to Your Liking (Optional)",
    "Carrots",
    "Zucchini (Courgette)",
]

# Print Recipe with Colors
print(Fore.YELLOW + "\n<== Ingredients ==>\n")
for item in recipe:
    print(Fore.GREEN + "✓ " + item)
    time.sleep(0.5)

print("\n" + Fore.CYAN + "=" * 50)  # Divider

# Coconut Preparation Steps
coconut = [
    "Remove the coconut shell and put the content in the blender",
    "Add 1/2L Boiling hot water",
    "Blend until smooth",
    "Strain the mixture (Label it as Coconut Milk 1)",
    "Put the blended coconut residue back in the blender",
    "Add another 1/2L Boiling hot water",
    "Blend again and strain (Label it as Coconut Milk 2)",
]

# Print Coconut Preparation Section
subprocess.run(["toilet", "-t", "Coconut Preparation"])
print(Fore.MAGENTA + "\n<== Coconut Preparation ==>\n")
for step in coconut:
    print(Fore.MAGENTA + "» " + step)
    time.sleep(0.5)

print("\n" + Fore.CYAN + "=" * 50)  # Divider

# Procedure Steps
procedure = [
    "Heat 20ml Vegetable Cooking Oil in a Large Pan",
    "Add 2 Large Red Onions and cook until golden brown",
    "Add 2 Large Tomatoes",
    "Add Several Cloves of Garlic",
    "Add Large Piece of Ginger",
    "Add 1/8 Can of Tomato Paste (Optional)",
    "Simmer for a few minutes",
    "Add Several Potatoes and Coconut Milk 2",
    "When almost ready, add Yellow Beans",
    "Add Seasoning and Chilli (Optional)",
    "Add the remaining Coconut Milk 2",
    "Simmer, then add Coconut Milk 1",
    "Let it cool for an hour and serve with Chapatis",
]

# Print Procedure
subprocess.run(["toilet", "-t", "Procedure"])
for step in procedure:
    print(Fore.BLUE + "➤ " + step)
    time.sleep(1)  # Pause for clarity

print("\n" + Fore.CYAN + "=" * 50)  # Divider

# Cooking Animation
print(Fore.LIGHTRED_EX + "\nCooking in progress...\n")

loading_chars = ["⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏"]
for _ in range(15):  # Run animation for a few seconds
    for char in loading_chars:
        print(Fore.YELLOW + f"\r{char} Cooking...", end="", flush=True)
        time.sleep(0.2)

print(Fore.GREEN + "\n\nDone! Ready to serve. 🍽️\n")

# Print "End" Banner
banner = pyfiglet.figlet_format("End", font="roman")
print(Fore.LIGHTCYAN_EX + banner)
print("Thank you for using Bobo's Recipe!")
