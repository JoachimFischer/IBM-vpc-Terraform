#---------------------------------------------------------
# Get resource_group id
#---------------------------------------------------------
data "ibm_resource_group" "group" {
  name = "${var.resource_group}"
}

#---------------------------------------------------------
# Create new VPC
#---------------------------------------------------------
resource "ibm_is_vpc" "vpc1" {
  name                = "${var.vpc-name}"
  resource_group      = "${data.ibm_resource_group.group.id}"
#  default_network_acl = "${ibm_is_network_acl.default_all_acl.id}"
}

#---------------------------------------------------------
# Create new address prefixes in VPC
#---------------------------------------------------------
resource "ibm_is_vpc_address_prefix" "prefix1" {
  name = "zone1-cidr-1"
  vpc  = "${ibm_is_vpc.vpc1.id}"
  zone = "${var.zone1}"
  cidr = "${var.address-prefix-1}"
}


#---------------------------------------------------------
# Get Public Gateway's for Zone 1
#---------------------------------------------------------
resource "ibm_is_public_gateway" "pubgw-zone1" {
  name = "${var.vpc-name}-${var.zone1}-pubgw"
  vpc  = "${ibm_is_vpc.vpc1.id}"
  zone = "${var.zone1}"
}


#---------------------------------------------------------
## Create Webapp Subnets in Zone1
#---------------------------------------------------------
resource "ibm_is_subnet" "server-subnet-zone1" {
  name            = "${var.vpc-name}-${var.zone1}-server"
  vpc             = "${ibm_is_vpc.vpc1.id}"
  zone            = "${var.zone1}"
  ipv4_cidr_block = "${var.server-subnet-zone-1}"
  public_gateway  = "${ibm_is_public_gateway.pubgw-zone1.id}"
}
