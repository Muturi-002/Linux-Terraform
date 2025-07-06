# Get the availability domains in the tenancy
data "oci_identity_availability_domains" "ADs" {
  compartment_id = var.tenancy_ocid
}

# Data source to get the image
data "oci_core_images" "instance_image" {
  compartment_id           = var.compartment_id
  operating_system         = var.image_OS
  operating_system_version = var.image_OS_version
  shape                    = var.instance_shape
  sort_by                  = "TIMECREATED"
  sort_order               = "DESC"
}

data "oci_objectstorage_namespace" "LTObjectStorage-namespace" {
  #Get namespace for Object Storage
  compartment_id = var.compartment_id
}

data "oci_core_services" "LT-services" {}