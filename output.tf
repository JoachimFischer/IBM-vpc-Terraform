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
# output "ip_address" {
#   value = ibm_is_floating_ip.server-zone1-fip.address
# }

