#---------------------------------------------------------
# MODIFY VARIABLES AS NEEDED
#---------------------------------------------------------
#---------------------------------------------------------
variable "ibmcloud_api_key" {
   default = "XXXXXXX"
}

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
variable "ssh_keyname" {
  default="XXXXXXX"
}

#---------------------------------------------------------
## DEFINE OS image to be used for compute instances
#---------------------------------------------------------

#image = Ubuntu-16.04-amd64
variable "image" {
  default = "7eb4e35b-4257-56f8-d7da-326d85452591"
}

#---------------------------------------------------------
## DEFINE compute instance profile & quantity
#---------------------------------------------------------
variable "profile-server" {
  default = "cc1-2x4"
}

variable "server-name" {
  default = "webapp"
}

variable "server-count" {
  default = 1
}


