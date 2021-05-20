#####################################################
# IAM User Settings
# Copyright 2020 IBM
#####################################################

provider "ibm" {
}

module "user_policy" {
  // Uncomment following line to point the source to registry level module
  //source = "terraform-ibm-modules/iam/ibm//modules/user-settings"

  source               = "../../modules/user-settings"
  iam_id               = var.iam_id
  allowed_ip_addresses = var.allowed_ip_addresses
}