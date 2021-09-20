#------------------------------------------------
# Output information will be available in log
#------------------------------------------------

#--------------------------------------
#  Output of IPs from public gateways
#--------------------------------------
#output "pgw_ip_addresses" {
#  value = ibm_is_public_gateway.pubgw-zone1.floating_ip.address
#}

#--------------------------------------
# Output of Floating IPs
#--------------------------------------
# output "ip_address" {
#   value = ibm_is_floating_ip.server-zone1-fip.address
# }

output "vpc" {
	value = {
		vpc = {
			name = data.ibm_is_vpc.vpc.name
			id   = data.ibm_is_vpc.vpc.id
		}
		addresss_prefixes = {
			zone1 = ibm_is_vpc_address_prefix.vpc_address_prefix1
			zone2 = ibm_is_vpc_address_prefix.vpc_address_prefix2
			zone3 = ibm_is_vpc_address_prefix.vpc_address_prefix3
		}
		subnets = {
			zone1 = ibm_is_subnet.vpc_subnet1
			zone2 = ibm_is_subnet.vpc_subnet2
			zone3 = ibm_is_subnet.vpc_subnet3
		}
		pgw = {
                       zone1 = ibm_is_public_gateway.pubgw-zone1.floating_ip.address
                     # zone2 = ibm_is_public_gateway.pubgw-zone2.floating_ip.address
                     # zone3 = ibm_is_public_gateway.pubgw-zone3.floating_ip.address    
	        }
}
