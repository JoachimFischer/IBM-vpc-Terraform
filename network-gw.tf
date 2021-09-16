#----------------------------------
# define network gateway
#----------------------------------

resource "ibm_is_public_gateway" "vpc1_gateway" {
  name = "vpc1-gateway"
  vpc  = ibm_is_vpc.vpc1.id
  zone = var.server-subnet-zone-1

  //User can configure timeouts
  timeouts {
    create = "90m"
  }
}
