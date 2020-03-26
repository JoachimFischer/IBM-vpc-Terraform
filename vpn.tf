resource "ibm_is_vpn_gateway" "testacc_vpn_gateway" {
  name   = var.vpn_gw
  subnet = ibm_is_subnet.server-subnet-zone1.id
}

resource "ibm_is_vpn_gateway_connection" "VPNGatewayConnection" {
  name          =  var.vpn_gw_con
  vpn_gateway   = ibm_is_vpn_gateway.testacc_vpn_gateway.id
  peer_address  = var.peer_adress
  preshared_key = var.preshared_key
  local_cidrs = [ibm_is_subnet.server-subnet-zone1.ipv4_cidr_block]
  peer_cidrs = var.peer_ipv4_cidr_block
  admin_state_up = true
}
