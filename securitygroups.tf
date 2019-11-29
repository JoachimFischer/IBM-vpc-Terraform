#---------------------------------------------------------
# Create Webapptier Security Group & Rules
#---------------------------------------------------------
resource "ibm_is_security_group" "server-securitygroup" {
  name = "${var.vpc-name}-server-securitygroup"
  vpc  = "${ibm_is_vpc.vpc1.id}"
}

resource "ibm_is_security_group_rule" "server-securitygroup-rule1" {
  group      = "${ibm_is_security_group.server-securitygroup.id}"
  direction  = "inbound"
  ip_version = "ipv4"
  remote     = "0.0.0.0/0"
}


resource "ibm_is_security_group_rule" "server-securitygroup-rule2" {
  group      = "${ibm_is_security_group.server-securitygroup.id}"
  direction  = "outbound"
  ip_version = "ipv4"
  remote     = "0.0.0.0/0"
}
