#-------------------------------------------------------
# variables supplied from terraform.tfvars
# Please update and check necessary Terraform version. 
# information is available at Terraform provider Doc. (TODO)
#-------------------------------------------------------

terraform {
  required_providers {
    ibm = {
      source = "IBM-Cloud/ibm"
      version = ">=1.14.0"
    }
  }
}

provider "ibm" {
  ibmcloud_api_key        = var.ibmcloud_api_key
  region                  = var.ibmcloud_region
}
