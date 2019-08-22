# variables supplied from terraform.tfvars

provider "ibm" {
  ibmcloud_api_key   = "${var.ibmcloud_api_key}"
  ibmcloud_timeout   = "${var.ibmcloud_timeout}"
  generation = 1
  region="eu-de"
}
