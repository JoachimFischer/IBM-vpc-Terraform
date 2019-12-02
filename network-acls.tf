#resource "ibm_is_network_acl" "default_all_acl" {
#  name = "${var.vpc-name}-default-all-acl"

# rules = [
#    {
#      name        = "${var.vpc-name}-default-allow-all-inbound"
#      action      = "allow"
#      source      = "0.0.0.0/0"
#      destination = "0.0.0.0/0"
#      direction   = "inbound"
#    },
#    {
#      name        = "${var.vpc-name}-default-allow-all-outbound"
#      action      = "allow"
#      source      = "0.0.0.0/0"
#      destination = "0.0.0.0/0"
#      direction   = "outbound"
#    },
#  ]
#}

