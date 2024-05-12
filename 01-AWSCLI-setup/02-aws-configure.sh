#!/bin/bash

echo "Welcome to the AWS configuration helper script."

# Check if AWS CLI is installed
if ! command -v aws &> /dev/null; then
    echo "AWS CLI is not installed. Please install AWS CLI first and run this script again."
    exit 1
fi

# Function to prompt for input
prompt_input() {
    local prompt_message=$1
    local user_input
    read -p "$prompt_message" user_input
    echo $user_input
}

# Gather AWS credentials and configuration from the user
AWS_ACCESS_KEY_ID=$(prompt_input "Please enter your AWS Access Key ID: ")
AWS_SECRET_ACCESS_KEY=$(prompt_input "Please enter your AWS Secret Access Key: ")
AWS_DEFAULT_REGION=$(prompt_input "Please enter your default region (e.g., us-east-1): ")
AWS_DEFAULT_OUTPUT=$(prompt_input "Please enter your default output format (json, text, or table): ")

# Run aws configure commands non-interactively
echo "Configuring AWS CLI with your provided details..."
aws configure set aws_access_key_id "$AWS_ACCESS_KEY_ID"
aws configure set aws_secret_access_key "$AWS_SECRET_ACCESS_KEY"
aws configure set default.region "$AWS_DEFAULT_REGION"
aws configure set default.output "$AWS_DEFAULT_OUTPUT"

echo "AWS CLI is configured successfully."
echo "Here are the current settings:"
aws configure list

