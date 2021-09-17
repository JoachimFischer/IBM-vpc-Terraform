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
# Create new VPC
#---------------------------------------------------------
resource "ibm_is_vpc" "vpc1" {
  name                = var.vpc-name
  resource_group      = data.ibm_resource_group.group.id
}

#---------------------------------------------------------
# Create new address prefixes in VPC Zones
#---------------------------------------------------------
resource "ibm_is_vpc_address_prefix" "prefix-1" {
  name = "zone1-cidr-1"
  vpc  = ibm_is_vpc.vpc1.id
  zone = var.zone1
  cidr = var.vpc-address-prefix-1
  is_default  = true
}

resource "ibm_is_vpc_address_prefix" "prefix-2" {
  name = "zone2-cidr-2"
  vpc  = ibm_is_vpc.vpc1.id
  zone = var.zone2
  cidr = var.vpc-address-prefix-2
  is_default  = true
}

resource "ibm_is_vpc_address_prefix" "prefix-3" {
  name = "zone3-cidr-3"
  vpc  = ibm_is_vpc.vpc1.id
  zone = var.zone3
  cidr = var.vpc-address-prefix-3
  is_default  = true
}

#---------------------------------------------------------
## Create Subnets in Zone1 / Zone2 / Zone3
#---------------------------------------------------------
resource "ibm_is_subnet" "server-subnet-zone1" {
  name            = "${var.vpc-name}-${var.zone1}-server"
  vpc             = ibm_is_vpc.vpc1.id
  zone            = var.zone1
  ipv4_cidr_block = var.server-subnet-zone-1
  public_gateway  = ibm_is_public_gateway.pubgw-zone1.id
}

resource "ibm_is_subnet" "server-subnet-zone2" {
  name            = "${var.vpc-name}-${var.zone2}-server"
  vpc             = ibm_is_vpc.vpc1.id
  zone            = var.zone2
  ipv4_cidr_block = var.server-subnet-zone-2
 # public_gateway  = ibm_is_public_gateway.pubgw-zone2.id
}

resource "ibm_is_subnet" "server-subnet-zone3" {
  name            = "${var.vpc-name}-${var.zone3}-server"
  vpc             = ibm_is_vpc.vpc1.id
  zone            = var.zone3
  ipv4_cidr_block = var.server-subnet-zone-3
 # public_gateway  = ibm_is_public_gateway.pubgw-zone3.id
}
