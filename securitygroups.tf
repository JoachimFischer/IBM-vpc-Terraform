#---------------------------------------------------------
# Create Webapptier Security Group & Rules
#---------------------------------------------------------
resource "ibm_is_security_group" "server-securitygroup" {
  name = "${var.vpc-name}-server-securitygroup"
  vpc  = ibm_is_vpc.vpc1.id
}

resource "ibm_is_security_group_rule" "server-securitygroup-rule-in-tcp" {
  group      = ibm_is_security_group.server-securitygroup.id
  direction  = "inbound"
  ip_version = "ipv4"
  remote     = "0.0.0.0/0"
  tcp {
      port_min = 22
      port_max = 22
  }
  
  resource "ibm_is_security_group_rule" "server-securitygroup-rule-in-icmp" {
  group      = ibm_is_security_group.server-securitygroup.id
  direction  = "inbound"
  ip_version = "ipv4"
  remote     = "0.0.0.0/0"
  icmp {
    code = 0
    type = 8
  }
}


resource "ibm_is_security_group_rule" "server-securitygroup-rule-out-all" {
  group      = ibm_is_security_group.server-securitygroup.id
  direction  = "outbound"
  ip_version = "ipv4"
  remote     = "0.0.0.0/0"
}
