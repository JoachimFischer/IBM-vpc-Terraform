#---------------------------------------------------------
# Create sshkey from file
#---------------------------------------------------------
# resource "ibm_is_ssh_key" "sshkey" {
#  name       = "wordpress-demo"
#  public_key = "${file(var.ssh_public_key)}"
# }

data "ibm_is_ssh_key" "sshkey" {
  name = "${var.ssh_keyname}"
}

#---------------------------------------------------------
# Create instances in each subnet in zone1
#---------------------------------------------------------
resource "ibm_is_instance" "webappserver-zone1" {
  count   = "${var.webappserver-count}"
  name    = "${var.webappserver-name}-${var.zone1}"
  image   = "${var.image}"
  profile = "${var.profile-server}"

  primary_network_interface = {
    subnet          = "${ibm_is_subnet.webapptier-subnet-zone1.id}"
    security_groups = ["${ibm_is_security_group.webapptier-securitygroup.id}"]
  }

  vpc       = "${ibm_is_vpc.vpc1.id}"
  zone      = "${var.zone1}"
  keys      = ["${data.ibm_is_ssh_key.sshkey.id}"]
#  keys      = ["${ibm_is_ssh_key.sshkey.id}"]
#  user_data = "${data.template_cloudinit_config.cloud-init-webapptier.rendered}"
}
