# Linux-Terraform
This is a simple project designed to automate creation and provisioning of infrastructure through execution of a script. The target cloud platform in this project will be Oracle Cloud Infrastructure (OCI). This script will check whether Terraform and OCI CLI are installed either on the local machine or on a remote server, both running on a Debian-based OS.

Terraform modules will not be currently be used for infrastructure provision.

## Prerequisites
1. Ubuntu version 24.04 or later.
2. An OCI account
3. OCI CLI installed (preferred)

### OCI Architecture

![OCI Architecture](<OCI Design Architecture.png>)

## Steps
1. Clone the repo and navigate to the Linux-Terraform directory.
```bash
git clone github.com/Muturi-002/Linux-Terraform.git
cd Linux-Terraform
```
### To deploy on OCI only, do the following.
2. Navigate to the OCI directory.
```bash
cd OCI
```
3. Create file `terraform.tfvars` and fill the following variables with your respective values.
```hcl
tenancy_ocid      = "<your_tenancy_id>"
user_ocid         = "<your_user_id>"
fingerprint       = "<your_api_fingerprint>"
private_key_path  = "<path_to_your_private_key>"
region            = "<your_region>"
compartment_id    = "<your_compartment_id>"
ssh_key           = "<your_ssh_public_key>" # contents of your public SSH key for use.
instance_shape    = "<instance_shape_of_your_choice>"
```

4. Change file permissions on `oci-setup.sh` and run.
```bash
chmod +x oci-setup.sh
./oci-setup.sh
```
