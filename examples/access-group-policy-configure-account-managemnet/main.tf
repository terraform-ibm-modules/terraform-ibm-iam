#####################################################
# IAM Access group policy 
# Copyright 2020 IBM
#####################################################

provider "ibm" {
}

module "access_group_policy" {
  source               = "terraform-ibm-modules/iam/ibm//modules/access-group-policy"

  access_group_id      = var.access_group_id
  roles                = var.roles
  tags                 = var.tags
  resources            = var.resources
  account_management   = var.account_management
}