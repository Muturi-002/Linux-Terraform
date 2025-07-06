resource "oci_core_instance" "LT1" {
  #Required parameters
  availability_domain = data.oci_identity_availability_domains.ADs.availability_domains[0].name
  compartment_id      = var.compartment_id
  shape               = var.instance_shape
  display_name        = "OCI-Instance-LT1"

  create_vnic_details {
    subnet_id        = oci_core_subnet.LT-subnet.id
    assign_public_ip = true
  }
  #Optional parameters
  source_details {
    source_type = "image"
    source_id   = data.oci_core_images.instance_image.images[0].id
  }
  metadata = {
    ssh_authorized_keys = var.ssh_key
  }
  freeform_tags = { "${var.tags_key}" = "Create Instance in OCI" }

}