# Terraform AWS S3 Hosting Setup

Follow the instructions below to build a Terraform configuration that sets up hosting for the provided `index.html` file.

## Prerequisites

The script is compatible with Debian, Ubuntu, RedHat, CentOS, Fedora, and Amazon Linux. However, this script has only been tested in an Ubuntu environment. If you run into any issues, please reach out to me at [danielnana.asamani@gmail.com](mailto:ooluwagbemia@gmail.com).

**Note:** The scripts assume the user has sudo access. Attempts to use the root user might run into some issues.

## Setup Instructions

### Step 1: Set Up AWS CLI

**Skip this step if you have AWS CLI setup already.**

1. Navigate into the `01-AWSCLI-setup` directory.
2. Run the `01-aws-cli-setup.sh` script. Note that this script requires sudo access.
3. Open your AWS account and retrieve the user's access ID and secret key. Ensure the user has all required permissions for creating infrastructure and for S3 bucket operations.
4. Run the `02-aws-configure.sh` script to configure AWS credentials.

### Step 2: Setup Terraform

**Skip this step if Terraform is already set up.**

1. Navigate to the `02-Terraform-setup` directory.
2. Run the `setup-terraform.sh` script for Terraform installation. Note: This script assumes the user has sudo access.

### Step 3: Deploy Application

1. Navigate to the `03-App-Deploy/terraform` directory.
2. Review the `terraform.tfvars` for the values needed.
3. Initialize Terraform with the `terraform init` command.
4. Run `terraform fmt` to fix any format issues.
5. Run `terraform plan -var-file="terraform.tfvars"` to preview what will be provisioned.
6. Run `terraform apply -var-file="terraform.tfvars"` to provision the infrastructure.
7. Copy the provided URL and test the application.

## Additional Information

For any additional help or information, please contact [danielnana.asamani@gmail.com](mailto:danielnana.asamani@gmail.com).

