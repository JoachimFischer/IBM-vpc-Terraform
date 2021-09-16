#---------------------------------------------------------
# Connect Server via SSH and port 22
#---------------------------------------------------------
#

resource "ibm_is_network_acl" "default_all_acl" {
  name = "${var.vpc-name}-default-all-acl"
  vpc  = ibm_is_vpc.vpc1
}

resource "ibm_is_network_acl" "is-vpc-acl" {
  name = "is-vpc-acl-1"
  vpc  = ibm_is_vpc.vpc1
  rules {
    name        = "outbound"
    action      = "allow"
    source      = "0.0.0.0/0"
    destination = "0.0.0.0/0"
    direction   = "outbound"
    icmp {
      code = 1
      type = 1
    }
  }
  rules {
    name        = "inbound"
    action      = "allow"
    source      = "0.0.0.0/0"
    destination = var.server-subnet-zone-1
    direction   = "inbound"
    tcp = {
        port_max = 22
        port_min = 22
      }
  }
}

