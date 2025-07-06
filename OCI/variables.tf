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

variable "image_OS" {
  default = "<image_os>" #Enter your desired OS e.g Canonical Ubuntu, Oracle-Linux, CentOS, etc.
}
variable "image_OS_version" {
  default = "<image_os_version>" #Enter your desired OS version e.g 22.04
}
variable "instance_name" {
  description = "The name of the instance."
  default     = "OCI-Instance-LT1" #Change this to your desired instance name
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
  default     = "LTnetwork"
}

variable "dns_label" {
  description = "The DNS label for the subnet."
  type        = string
  default     = "LTsubnet"
}

variable "tags_key" {
  description = "the key for defined tags"
  default     = "ScriptRunner"
}