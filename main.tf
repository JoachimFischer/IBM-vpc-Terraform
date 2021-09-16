#---------------------------------------------------------
# Get resource_group id
#---------------------------------------------------------
data "ibm_resource_group" "group" {
  name = var.resource_group
}

#---------------------------------------------------------
# Get VSI image id
#---------------------------------------------------------
data ibm_is_image "select_image" {
  name = var.select_image_name
}

#---------------------------------------------------------
# Create new VPC, 
# ACL can added in network-acls.tf
#---------------------------------------------------------
resource "ibm_is_vpc" "vpc1" {
  name                = var.vpc-name
  resource_group      = data.ibm_resource_group.group.id
}

#---------------------------------------------------------
# Create new address prefixes in VPC
#---------------------------------------------------------
resource "ibm_is_vpc_address_prefix" "prefix1" {
  name = "zone1-cidr-1"
  vpc  = ibm_is_vpc.vpc1.id
  zone = var.zone1
  cidr = var.vpc-address-prefix
}

#---------------------------------------------------------
## Create Webapp Subnets in Zone1
#---------------------------------------------------------
resource "ibm_is_subnet" "server-subnet-zone1" {
  name            = "${var.vpc-name}-${var.zone1}-server"
  vpc             = ibm_is_vpc.vpc1.id
  zone            = var.zone1
  ipv4_cidr_block = var.server-subnet-zone-1
  public_gateway  = ibm_is_public_gateway.pubgw-zone1.id
}
