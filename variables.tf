#---------------------------------------------------------
# MODIFY VARIABLES AS NEEDED
#---------------------------------------------------------
variable "ibmcloud_api_key" {}


# 1 vpc generation classic, 2 vpc
variable "ibmcloud_vpc_generation" {
  default = "1"
}

# cloud region
variable "ibmcloud_region" {
  default = "eu-de"
}

variable "ibmcloud_timeout" {
   default = 300
}


#---------------------------------------------------------
## DEFINE VPC
#---------------------------------------------------------
variable "vpc-name" {
  default = "vpc-space-1"
}

variable "resource_group" {
  default = "resource-vpc-space"
}


#---------------------------------------------------------
## DEFINE Zones
#---------------------------------------------------------
# for Frankfurt02 data center
variable "zone1" {
  default = "eu-de-1"
}

# for Frankfurt04 data center
variable "zone2" {
  default = "eu-de-2"
}

# for Frankfurt05 data center
variable "zone3" {
  default = "eu-de-3"
}


#---------------------------------------------------------
## DEFINE CIDR Blocks to be used 
#---------------------------------------------------------
variable "address-prefix-1" {
  default = "172.21.0.0/21"
}

#---------------------------------------------------------
## DEFINE subnets for server in each zone
#---------------------------------------------------------
variable "server-subnet-zone-1" {
  default = "172.21.0.0/24"
}
variable "server-subnet-zone-2" {
  default = "172.21.3.0/24"
}
variable "server-subnet-zone-3" {
  default = "172.21.6.0/24"
}

#---------------------------------------------------------
## DEFINE sshkey to be used for compute instances
#---------------------------------------------------------
variable "ssh_keyname" {}

#---------------------------------------------------------
## DEFINE OS image to be used for compute instances
## The image types are different between Gen1 and Gen2
##
##        GEN 1                         GEN 2
##    "windows-2016-amd64"    = "ibm-windows-2016-full-std-64"
##    "ubuntu-16.04-amd64"    = "ibm-ubuntu-16-04-05-64-minimal-for-vsi"
##    "windows-2012-r2-amd64" = "ibm-windows-2012-r2-full-std-64"
##    "windows-2012-amd64"    = "ibm-windows-2012-full-std-64"
##    "centos-7.x-amd64"      = "ibm-centos-7-0-64"
##    "ubuntu-18.04-amd64"    = "ibm-ubuntu-18-04-64"
##    "debian-9.x-amd64"      = "ibm-debian-9-0-64-minimal-for-vsi"
#---------------------------------------------------------
variable "image" {
   default = "ibm-ubuntu-16-04-05-64-minimal-for-vsi"
}

#---------------------------------------------------------
## DEFINE compute instance profile & quantity
## The image types are different between Gen1 and Gen2
##
##        GEN 1        GEN 2
##   "bc1-16x64"   = "bx2-16x64"
##    "bc1-2x8"    = "bx2-2x8"
##    "bc1-32x128" = "bx2-32x128"
##    "bc1-48x192" = "bx2-48x192"
##    "bc1-4x16"   = "bx2-4x16"
##    "bc1-8x32"   = "bx2-8x32"
##    "cc1-16x32"  = "cx2-16x32"
##    "cc1-2x4"    = "cx2-2x4"
##    "cc1-32x64"  = "cx2-32x64"
##    "cc1-4x8"    = "cx2-4x8"
##    "cc1-8x16"   = "cx2-8x16"
##    "mc1-16x128" = "mx2-16x128"
##    "mc1-2x16"   = "mx2-2x16"
##    "mc1-32x256" = "mx2-32x256"
##   "mc1-4x32"    = "mx2-4x32"
##    "mc1-8x64"   = "mx2-8x64"
#---------------------------------------------------------
variable "profile-server" {
  default = "cc2-2x4"
}

variable "server-name" {
  default = "servername"
}

variable "server-count" {
  default = 1
}


