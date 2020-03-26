#---------------------------------------------------------
# MODIFY VARIABLES AS NEEDED
#---------------------------------------------------------
variable "ibmcloud_api_key" {}

#---------------------------------------------------------
## DEFINE sshkey to be used for compute instances
#---------------------------------------------------------
variable "ssh_keyname" {}

#---------------------------------------------------------
# 1 vpc generation classic, 2 vpc
#---------------------------------------------------------
variable "ibmcloud_vpc_generation" {
  description = "You can change between GEN1 und GEN2 with value 1 or 2"
  default = "2"
}

#---------------------------------------------------------
## DEFINE VPC name and available Ressource Group (IAM)
#---------------------------------------------------------
variable "vpc-name" {
  description = "Provide the name of your VPC"
  default = "vpc-space"
}

variable "resource_group" {
  description = "The Ressource Roup must be defined in IBM Cloud IAM"
  default = "resource-vpc-space"
}

#---------------------------------------------------------
## DEFINE Region and Zones in US-South Dallas or
## Frankfurt region eu-de
## To switch regin via CLI:  $ibmcloud target -r us-south  
## or   ibmcloud target -r eu-de
#---------------------------------------------------------
# cloud region like eu-de (GEN1) or us-south (GEN2)
variable "ibmcloud_region" {
  description = "Region of VPC like eu-de (GEN1) or us-south (GEN2)"
  default = "us-south"
}
#---------------------------------------------------------
## can use us-south-1 / use-south-2 / use-south-3
## or eu-de-1 / eu-de-2 /eu-de-3
#----------------------------------------------------------
variable "zone1" {
  description = "use  eu-de-1 for GEN1 or us-south-1 for GEN2"
  default = "us-south-1"
}

variable "zone2" {
    description = "use  eu-de-2 for GEN1 or us-south-3 for GEN2"
  default = "us-south-2"
}

variable "zone3" {
    description = "use  eu-de-3 for GEN1 or us-south-3 for GEN2"
  default = "us-south-3"
}

#---------------------------------------------------------
## DEFINE CIDR Blocks for VPC in Region
#---------------------------------------------------------
variable "vpc-address-prefix" {
  description = "The VPC address prefix"
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
## DEFINE OS image to be used for compute instances
## The image types are different between Gen1 and Gen2
## You can generate the full list via CLI   $ibmcloud is images
## To switsch between both genaration via CLI   $ibmcloud is target --gen 2
## or   $ibmcloud is target --gen 1
##
##        GEN 1                                             GEN 2
##    "ibm-ubuntu-16-04-6-minimal-amd64-1 "               = "ibm-ubuntu-16-04-5-minimal-amd64-1 "
##    "ibm-windows-server-2012-r2-full-standard-amd64-1 " =  actual not available
##    "ibm-windows-server-2012-full-standard-amd64-1"     =  actual not available
##    "ibm-centos-7-6-minimal-amd64-1 "                   = "ibm-centos-7-0-64"
##    "ibm-ubuntu-18-04-2-minimal-amd64-1"                = "ibm-centos-7-6-minimal-amd64-1 "
##    "ibm-debian-9-9-minimal-amd64-1 "                   = "ibm-debian-9-9-minimal-amd64-1 "
#---------------------------------------------------------
variable "select_image_name" {
  description = "use  GEN1 ubuntu-16.04-amd64  or GEN2  ibm-ubuntu-18-04-1-minimal-amd64-1"
  default = "ibm-ubuntu-18-04-1-minimal-amd64-1"
}

#---------------------------------------------------------
## DEFINE compute instance profile & quantity
## The image types are different between Gen1 and Gen2
## You can generate this list via CLI   $ibmcloud is instance-profiles
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
##
## plus power server within GEN 2 like:
##     "bp2-2x8"
##     "cp2-2x4"
##     "gp2-24x224x2"
##     "mp2-2x16"
#---------------------------------------------------------
variable "profile-server" {
  description = "use  GEN1 cc1-2x4  or GEN2  cx2-2x4"
  default = "cx2-2x4"
}

variable "server-name" {
  default = "servername"
}

variable "server-count" {
  default = 1
}

variable "ibmcloud_timeout" {
   default = 300
}

#---------------------------------------------------------
## Create VPN Connection 
#---------------------------------------------------------
variable "vpn_gw"{
  default = "vpngw1"
}

variable "vpn_gw_con"{
  default = "vpngwcon1"
}

variable "peer_adress"{
  default = "1.2.3.4"
}

variable "preshared_key" {
  default = "DEADBEEF"
}

variable "peer_ipv4_cidr_block"{
  default = ["192.168.178.0/24"]
}

