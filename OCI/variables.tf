variable tenancy_ocid{}
variable user_ocid{}
variable fingerprint{}
variable private_key_path{}
variable region{}
variable compartment_id{
  description = "The OCID of the compartment where resources will be created."
}
variable ssh_key{
  description = "The SSH public key to be used for instances."
}
variable instance_shape{}

variable instance_OS {
    description = "The operating system to be used for the instance. Displayed with version."
    default     = "" # replace with your desired OS, e.g., "Oracle Linux 8.4"
    type        = string
}