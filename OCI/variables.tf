variable "tenancy_ocid" {}
variable "user_ocid" {}
variable "fingerprint" {}
variable "private_key_path" {}
variable "region" {}
variable "compartment_id" {
  description = "The OCID of the compartment where resources will be created."
}
variable "ssh_key" {
  description = "The SSH public key to be used for instances."
}
variable "instance_shape" {}

variable "instance_OS" {
  description = "The operating system to be used for the instance. Displayed with version."
  default     = "" # replace with your desired OS, e.g., "Oracle Linux 8.4"
  type        = string
}
variable "instance_name" {
  description = "The name of the instance."
  default     = "OCI-Instance-LT1"
  type        = string
}

variable "network_cidr_block" {
  description = "The CIDR block for the network."
  type        = list(string)
  default     = ["192.0.0.0/16"]
}

variable "vcn_dns_label" {
  description = "The DNS label for the VCN."
  type        = string
  default     = "OCI-VirtualCloudNetwork-LT"
}

variable "dns_label" {
  description = "The DNS label for the subnet."
  type        = string
  default     = "LT-subnet"
}

variable "tags_key" {
  description = "the key for defined tags"
  default     = "ScriptRunner"
}