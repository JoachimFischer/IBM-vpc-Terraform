#---------------------------------------------------------
# Connect Server via SSH and port 22
#---------------------------------------------------------
#

resource "ibm_is_network_acl" "is-vpc-acl" {
  name = "is-vpc-acl-1"
  vpc  = ibm_is_vpc.vpc1.id
  rules {
    name        = "outbound"
    action      = "allow"
    source      = "0.0.0.0/0"
    destination = "0.0.0.0/0"
    direction   = "outbound"
  }
  rules {
    name        = "inbound"
    action      = "allow"
    source      = "0.0.0.0/0"
    destination = var.server-subnet-zone-1
    direction   = "inbound"
    tcp {
        port_max = 22
        port_min = 22
      }
  }
  rules {
    name        = "inbound"
    action      = "allow"
    source      = "0.0.0.0/0"
    destination = var.server-subnet-zone-1
    direction   = "inbound"
    icmp {
        type = 8
        code = 0
      }
  }
}

resource "ibm_is_subnet_network_acl_attachment" attach {
  subnet      = ibm_is_subnet.server-subnet-zone1.id
  network_acl = ibm_is_network_acl.is-vpc-acl.id
}
