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
### To deploy on OCI only, do the following.
2. Navigate to the OCI directory.
```bash
cd OCI
```
3. Replace the values in the file `terraform.tfvars` with your respective values.
```hcl
tenancy_ocid      = "<your_tenancy_id>"
user_ocid         = "<your_user_id>"
fingerprint       = "<your_api_fingerprint>"
private_key_path  = "<path_to_your_private_key>"
region            = "<your_region>"
compartment_id    = "<your_compartment_id>"
ssh_key           = "<your_ssh_public_key>" # contents of your public SSH key
instance_shape    = "<instance_shape_of_your_choice>"
```
> **Note:** To ease your configuration, you can store your OCI credentials in a file named `oci-config-values`.

4. Change file permissions on `oci-setup.sh` and run.
```bash
chmod +x oci-setup.sh
./oci-setup.sh
```
### To deploy on AWS, do the following
5. Navigate to the AWS directory.
```bash
cd AWS
```
6. Replace the values in the `terraform.tfvars` with your respective values.
```hcl

```
7. Change file permissions on `aws-setup.sh` and run.
```bash
chmod +x aws-setup.sh
./aws-setup.sh
```
### To deploy on both cloud platforms, do the following.
8. Follow steps 3 and 6.
9. Change file permissions on `infra.sh` and run
```bash 
chmod +x infra.sh
./infra.sh
```