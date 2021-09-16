#----------------------------------
# define network gateway
#----------------------------------

#---------------------------------------------------------
# Get Public Gateway's for Zone 1
#---------------------------------------------------------
resource "ibm_is_public_gateway" "pubgw-zone1" {
  name = "${var.vpc-name}-${var.zone1}-pubgw"
  vpc  = ibm_is_vpc.vpc1.id
  zone = var.zone1
}

