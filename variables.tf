#---------------------------------------------------------
# MODIFY VARIABLES AS NEEDED
#---------------------------------------------------------
#---------------------------------------------------------
variable "ibmcloud_api_key" {
   default = "XXXXXXX"
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
variable "zone1" {
  default = "eu-de-1"
}


#---------------------------------------------------------
## DEFINE CIDR Blocks to be used in each zone
#---------------------------------------------------------
variable "address-prefix-vpc" {
  default = "172.21.0.0/20"
}

variable "address-prefix-1" {
  default = "172.21.0.0/21"
}

#---------------------------------------------------------
## DEFINE subnets for zone 1
#---------------------------------------------------------

variable "webapptier-subnet-zone-1" {
  default = "172.21.0.0/24"
}

#---------------------------------------------------------
## DEFINE sshkey to be used for compute instances
#---------------------------------------------------------
variable "ssh_keyname" {
  default="joachim-ssh"
}
# variable "ssh_public_key" {
#  default = "~/.ssh/id_rsa.pub"
# }

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

variable "webappserver-name" {
  default = "webapp"
}

variable "webappserver-count" {
  default = 1
}


