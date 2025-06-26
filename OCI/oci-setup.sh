#!/bin/bash

#This script is meant to be run on the OCI instance to set up the environment for the application. It installs necessary packages, sets up the Python environment, and configures the application.
set -e # Exit immediately if a command exits with a non-zero status

if pip --version &> /dev/null; then
    echo "python3-pip is already installed."
else
    echo "python3 is not installed.\n Installing python3-pip now..."
    sudo apt-get install python3-pip -y
fi

if oci --version  &> /dev/null; then
    echo "OCI CLI is already installed."
else
    echo "OCI CLI is not installed.\n Installing OCI CLI now..."
    sudo bash -c "$(curl -L https://raw.githubusercontent.com/oracle/oci-cli/master/scripts/install/install.sh)" -y #Installs OCI CLI
    echo "OCI CLI installed successfully."
fi

#Check and install Terraform
if terraform --version &> /dev/null; then
    echo "Terraform is already installed."
else
    echo "Terraform is not installed.\n Installing Terraform now..."
    sudo snap install terraform --classic #Installs Terraform v1.12.2
    echo "Terraform installed successfully."
fi

#Check version of Python and oci-cli
echo "Python version: $(python3 --version)"
echo "OCI CLI version: $(oci --version)"
echo "Terraform version: $(terraform --version)"

sudo apt-get update && sudo apt-get upgrade -y

# Setup your OCI CLI configuration
echo "Setting up OCI CLI configuration. Please follow the prompts, and infer the values from the file 'oci-config-setup'\n"
oci setup config

if cat ~/.oci/config &> /dev/null; then
    echo "OCI CLI configuration file created successfully.\n"
else
    echo "OCI CLI configuration file not found. Please check the setup."
    echo ""
    oci setup config
fi

echo "Generate your session token..."
oci session authenticate
# Check if the session token was generated successfully
oci session validate

# Provision the resources using Terraform
echo "Provisioning resources using Terraform..."
terraform init
terraform plan
terraform apply -auto-approve
echo "Resources provisioned successfully."