resource "oci_objectstorage_bucket" "LT-Bucket" {
  compartment_id = var.compartment_id
  name           = "LT-OCI-ObjectStorage-Bucket"
  namespace      = data.oci_objectstorage_namespace.LTObjectStorage-namespace.namespace

  storage_tier = "Standard"
  access_type  = "ObjectRead"
  #freeform_tags = { "${var.tags_key}" = "Create Object Storage for ${var.instance_name}" }
}