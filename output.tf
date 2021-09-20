#------------------------------------------------
# Output information will be available in log
#------------------------------------------------

#--------------------------------------
#  Output of IPs from public gateways
#--------------------------------------
output "pgw_ip_addresses" {
  value = ibm_is_public_gateway.pubgw-zone1.floating_ip.address
}

#--------------------------------------
# Output of Floating IPs
#--------------------------------------
 output "ip_address_server_zone1" {
   value = ibm_is_floating_ip.server-zone1-fip.address
 }

#--------------------------------------
# Output of Subnet
#--------------------------------------
 output "subnet_zone1" {
   value = ibm_is_subnet.server-subnet-zone1.ipv4_cidr_block
 }
 output "subnet_zone2" {
   value = ibm_is_subnet.server-subnet-zone2.ipv4_cidr_block
 }
 output "subnet_zone3" {
   value = ibm_is_subnet.server-subnet-zone3.ipv4_cidr_block
 }

