# Linux-Terraform
This is a simple project designed to create and automate provisioning of infrastructure through execution of a script. The target cloud platforms in this project will be Amazon Web Services (AWS) and Oracle Cloud Infrastructure (OCI). This script will check whether Terraform, AWS CLI and OCI CLI are installed either on the local machine (running on a Debian-based OS) or on a remote server, running on a Debian-based OS.

Terraform modules will not be currently be used for infrastructure provision.

## Prerequisites
1. Ubuntu version 24.04 or later.
2. An AWS account
3. An OCI account

For the cloud accounts, either one or both will work just fine.

## Steps
1. Clone the repo and navigate to the Linux-Terraform directory.
```bash
git clone github.com/Muturi-002/Linux-Terraform.git
cd Linux-Terraform
```
2. Change the file permissions on the script file (ends with '.sh')
```bash
sudo chmod 700 infra.sh
```
3. Run the file.
```bash
# if the script file is executable
./infra.sh
# If the script file is non-executable
bash infra.sh
```

