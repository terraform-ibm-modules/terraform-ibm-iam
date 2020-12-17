#####################################################
# IAM User Settings
# Copyright 2020 IBM
#####################################################

provider "ibm" {
}

module "user_policy" {
  source                 = "terraform-ibm-modules/iam/ibm//modules/user-settings"
  iam_id                 = var.iam_id
  allowed_ip_addresses   = var.allowed_ip_addresses
}