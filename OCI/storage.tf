resource "oci_objectstorage_bucket" "LT-Bucket" {
  compartment_id = var.compartment_id
  name           = "LT-OCI-ObjectStorage-Bucket"
  namespace      = "Terraform-ObjectStorage"

  storage_tier   = "Standard"
  access_type= "ObjectRead"
  defined_tags = {
    var.tags_key = "ScriptRunner"
    "Purpose"   = "Create Object Storage Bucket for ${var.instance_name}"
  }
}