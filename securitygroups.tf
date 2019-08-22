#---------------------------------------------------------
# Create Webapptier Security Group & Rules
#---------------------------------------------------------
resource "ibm_is_security_group" "webapptier-securitygroup" {
  name = "${var.vpc-name}-webapptier-securitygroup"
  vpc  = "${ibm_is_vpc.vpc1.id}"
}

resource "ibm_is_security_group_rule" "webapptier-securitygroup-rule1" {
  group      = "${ibm_is_security_group.webapptier-securitygroup.id}"
  direction  = "ingress"
  ip_version = "ipv4"
  remote     = "${var.webapptier-subnet-zone-1}"
}


resource "ibm_is_security_group_rule" "webapptier-securitygroup-rule4" {
  group      = "${ibm_is_security_group.webapptier-securitygroup.id}"
  direction  = "ingress"
  ip_version = "ipv4"
  remote     = "0.0.0.0/0"

  tcp = {
    port_min = 80
    port_max = 80
  }
}

resource "ibm_is_security_group_rule" "webapptier-securitygroup-rule5" {
  group     = "${ibm_is_security_group.webapptier-securitygroup.id}"
  direction = "ingress"
  remote    = "0.0.0.0/0"

  icmp = {
    code = 0
    type = 8
  }
}

resource "ibm_is_security_group_rule" "webapptier-securitygroup-rule6" {
  group      = "${ibm_is_security_group.webapptier-securitygroup.id}"
  direction  = "egress"
  ip_version = "ipv4"
  remote     = "0.0.0.0/0"
}
