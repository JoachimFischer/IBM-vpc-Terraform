#---------------------------------------------------------
# Create Webapptier Security Group & Rules
#---------------------------------------------------------
resource "ibm_is_security_group" "webapptier-securitygroup" {
  name = "${var.vpc-name}-webapptier-securitygroup"
  vpc  = "${ibm_is_vpc.vpc1.id}"
}

resource "ibm_is_security_group_rule" "webapptier-securitygroup-rule1" {
  group      = "${ibm_is_security_group.webapptier-securitygroup.id}"
  direction  = "inbound"
  ip_version = "ipv4"
  remote     = "0.0.0.0/0"
}


resource "ibm_is_security_group_rule" "webapptier-securitygroup-rule2" {
  group      = "${ibm_is_security_group.webapptier-securitygroup.id}"
  direction  = "outbound"
  ip_version = "ipv4"
  remote     = "0.0.0.0/0"
}
