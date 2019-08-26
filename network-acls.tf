resource "ibm_is_network_acl" "default_all_acl" {
  name = "${var.vpc-name}-default-all-acl"

  rules = [
    {
      name        = "${var.vpc-name}-default-allow-all-ingress"
      action      = "allow"
      source      = "0.0.0.0/0"
      destination = "0.0.0.0/0"
      direction   = "ingress"
    },
    {
      name        = "${var.vpc-name}-default-allow-all-egress"
      action      = "allow"
      source      = "0.0.0.0/0"
      destination = "0.0.0.0/0"
      direction   = "egress"
    },
  ]
}

