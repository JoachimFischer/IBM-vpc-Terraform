# variables supplied from terraform.tfvars

terraform {
  required_providers {
    ibm = {
      source = "IBM-Cloud/ibm"
      version = "~> 1.12.0"
    }
  }
}

provider "ibm" {
  ibmcloud_api_key        = var.ibmcloud_api_key
  ibmcloud_timeout        = var.ibmcloud_timeout
  region                  = var.ibmcloud_region
}
