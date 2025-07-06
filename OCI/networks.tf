resource "oci_core_vcn" "LT-nw" {
  compartment_id = var.compartment_id
  cidr_blocks    = var.network_cidr_block
  dns_label      = var.vcn_dns_label
  display_name   = var.vcn_dns_label
}

resource "oci_core_internet_gateway" "LT-igw" {
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.LT-nw.id
  display_name   = "OCI-IGW-LT1"
}

resource "oci_core_route_table" "LT-rt" {
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.LT-nw.id
  display_name   = "OCI-RT-LT1"
  route_rules {
    network_entity_id = oci_core_internet_gateway.LT-igw.id
    destination       = "0.0.0.0/0"
  }
}

resource "oci_core_subnet" "LT-subnet" {
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.LT-nw.id
  cidr_block     = var.network_cidr_block[0]
  dns_label      = var.dns_label
  route_table_id = oci_core_route_table.LT-rt.id
  display_name   = "OCI-Subnet-LT1"
}

resource "oci_core_network_security_group" "LT-NSG" {
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.LT-nw.id
  display_name   = "LT-NSG"
}

resource "oci_core_network_security_group_security_rule" "allow_ssh" {
  network_security_group_id = oci_core_network_security_group.LT-NSG.id
  direction                 = "INGRESS"
  protocol                  = "6" # TCP
  source_type               = "CIDR_BLOCK"
  source                    = "0.0.0.0/0"

  tcp_options {
    destination_port_range {
      max = 22
      min = 22
    }
  }
}

resource "oci_core_network_security_group_security_rule" "allow_http" {
  network_security_group_id = oci_core_network_security_group.LT-NSG.id
  direction                 = "INGRESS"
  protocol                  = "6"
  source_type               = "CIDR_BLOCK"
  source                    = "0.0.0.0/0"

  tcp_options {
    destination_port_range {
      max = 80
      min = 80
    }
  }
}

resource "oci_core_network_security_group_security_rule" "allow_dns" {
  network_security_group_id = oci_core_network_security_group.LT-NSG.id
  direction                 = "INGRESS"
  protocol                  = "6"
  source_type               = "CIDR_BLOCK"
  source                    = "0.0.0.0/0"
  tcp_options {
    destination_port_range {
      max = 53
      min = 53
    }
  }
}

resource "oci_core_network_security_group_security_rule" "allow_https" {
  network_security_group_id = oci_core_network_security_group.LT-NSG.id
  direction                 = "INGRESS"
  protocol                  = "6"
  source_type               = "CIDR_BLOCK"
  source                    = "0.0.0.0/0"

  tcp_options {
    destination_port_range {
      max = 8080
      min = 8080
    }
  }
}

resource "oci_core_network_security_group_security_rule" "allow_outbound" {
  network_security_group_id = oci_core_network_security_group.LT-NSG.id
  direction                 = "EGRESS"
  protocol                  = "all"
  destination               = "0.0.0.0/0"
}

resource "oci_core_service_gateway" "LT-sgw" {
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.LT-nw.id

  services {
    service_id = lookup(data.oci_core_services.LT-services.services[0], "id")
  }
}