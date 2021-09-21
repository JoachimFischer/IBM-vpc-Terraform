#---------------------------------------------------------
# Connect Server via SSH and port 22
#---------------------------------------------------------
#

resource "ibm_is_network_acl" "is-vpc-acl" {
  name = "is-vpc-acl-1"
  vpc  = ibm_is_vpc.vpc1.id
}

resource "ibm_is_network_acl_rule" "is-vpc-acl-out-1" {
 network_acl    = ibm_is_network_acl.is-vpc-acl.id
    name        = "outbound-1"
    action      = "allow"
    source      = "0.0.0.0/0"
    destination = "0.0.0.0/0"
    direction   = "outbound"
  }

 resource "ibm_is_network_acl_rule" "is-vpc-acl-in-1" {
 network_acl    = ibm_is_network_acl.is-vpc-acl.id
    name        = "inbound-1"
    action      = "allow"
    source      = "0.0.0.0/0"
    destination = var.server-subnet-zone-1
    direction   = "inbound"
    tcp {
        port_max = 22
        port_min = 22
      }
  }

 resource "ibm_is_network_acl_rule" "is-vpc-acl-in-2" {
 network_acl    = ibm_is_network_acl.is-vpc-acl.id
    name        = "inbound-2"
    action      = "allow"
    source      = "0.0.0.0/0"
    destination = var.server-subnet-zone-1
    direction   = "inbound"
    icmp {
        type = 8
      }
 }

resource "ibm_is_subnet_network_acl_attachment" attach {
  subnet      = ibm_is_subnet.server-subnet-zone1.id
  network_acl = ibm_is_network_acl.is-vpc-acl.id
}
