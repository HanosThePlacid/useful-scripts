#!/bin/bash

# Function to check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Check if vcgencmd is installed
if ! command_exists vcgencmd; then
    echo "vcgencmd not found. Installing libraspberrypi-bin..."
    sudo apt-get update
    sudo apt-get install -y libraspberrypi-bin
fi

# Run the command
vcgencmd measure_temp
