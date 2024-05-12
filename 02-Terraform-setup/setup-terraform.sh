#!/bin/bash

# Function to install Terraform on Debian-based systems
install_terraform_debian() {
    sudo apt-get update && sudo apt-get install -y gnupg software-properties-common
    wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg > /dev/null
    echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
    sudo apt update
    sudo apt-get install -y terraform
    echo "Terraform installed successfully on Debian-based system."
}

# Function to install Terraform on RHEL-based systems
install_terraform_rhel() {
    sudo yum install -y yum-utils
    sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
    sudo yum -y install terraform
    echo "Terraform installed successfully on RHEL-based system."
}

# Function to install Terraform on Fedora
install_terraform_fedora() {
    sudo dnf install -y dnf-plugins-core
    sudo dnf config-manager --add-repo https://rpm.releases.hashicorp.com/fedora/hashicorp.repo
    sudo dnf -y install terraform
    echo "Terraform installed successfully on Fedora."
}

# Function to install Terraform on Amazon Linux
install_terraform_amazon() {
    sudo yum install -y yum-utils
    sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
    sudo yum -y install terraform
    echo "Terraform installed successfully on Amazon Linux."
}

# Determine the OS distribution and version to decide the installation method
if [ -f /etc/os-release ]; then
    . /etc/os-release
    case "$ID" in
        ubuntu|debian)
            echo "Detected Ubuntu/Debian"
            install_terraform_debian
            ;;
        centos|rhel)
            echo "Detected CentOS/RHEL"
            install_terraform_rhel
            ;;
        fedora)
            echo "Detected Fedora"
            install_terraform_fedora
            ;;
        amzn)
            echo "Detected Amazon Linux"
            install_terraform_amazon
            ;;
        *)
            echo "Unsupported distribution"
            exit 1
            ;;
    esac
else
    echo "Could not determine the OS or your OS is not supported."
    exit 1
fi

# Verify the installation
if command -v terraform &> /dev/null; then
    echo "Terraform version $(terraform version) has been installed successfully."
else
    echo "Failed to install Terraform."
    exit 1
fi

