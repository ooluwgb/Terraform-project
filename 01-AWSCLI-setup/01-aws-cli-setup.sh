#!/bin/bash

# Function to install necessary utilities
install_utilities() {
    if [[ "$1" == "apt-get" ]]; then
        sudo apt-get update
        sudo apt-get install -y curl unzip
    elif [[ "$1" == "yum" ]]; then
        sudo yum install -y curl unzip
    elif [[ "$1" == "dnf" ]]; then
        sudo dnf install -y curl unzip
    fi
}

# Determine the package manager and install utilities if needed
check_install_utilities() {
    if command -v apt-get &> /dev/null; then
        install_utilities "apt-get"
    elif command -v yum &> /dev/null; then
        install_utilities "yum"
    elif command -v dnf &> /dev/null; then
        install_utilities "dnf"
    else
        echo "No supported package manager found. Please install curl and unzip manually."
        exit 1
    fi
}

# Check if AWS CLI is already installed and display the version
if command -v aws &> /dev/null; then
    echo "AWS CLI is already installed."
    aws --version
else
    echo "AWS CLI is not installed. Installing..."

    # Check and install utilities before proceeding
    check_install_utilities

    # Determine architecture and download appropriate AWS CLI version
    ARCH=$(uname -m)
    if [ "$ARCH" = "x86_64" ]; then
        echo "Detected x86_64 architecture."
        curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
    elif [ "$ARCH" = "aarch64" ]; then
        echo "Detected ARM architecture."
        curl "https://awscli.amazonaws.com/awscli-exe-linux-aarch64.zip" -o "awscliv2.zip"
    else
        echo "Unsupported architecture: $ARCH"
        exit 1
    fi

    # Unzip and install AWS CLI
    unzip awscliv2.zip
    sudo ./aws/install

    # Check if AWS CLI was installed successfully
    if command -v aws &> /dev/null; then
        echo "AWS CLI installed successfully."
        aws --version
	rm -f awscliv2.zip
    else
        echo "Failed to install AWS CLI."
	rm -f awscliv2.zip
        exit 1
    fi
fi

