#####################################################
# IAM User Policy
# Copyright 2020 IBM
#####################################################



provider "ibm" {
}

module "user_policy" {
  // Uncomment following line to point the source to registry level module
  //source = "terraform-ibm-modules/iam/ibm//modules/user-policy"

  source = "../../modules/user-policy"

  ibm_id             = var.ibm_id
  roles              = var.roles
  tags               = var.tags
  resources          = var.resources
  account_management = var.account_management
}