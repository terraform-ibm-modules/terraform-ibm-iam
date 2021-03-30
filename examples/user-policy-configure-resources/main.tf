#####################################################
# IAM User Policy
# Copyright 2020 IBM
#####################################################



provider "ibm" {
}

module "service_policy" {
  source = "terraform-ibm-modules/iam/ibm//modules/user-policy"

  ibm_id             = var.ibm_id
  roles              = var.roles
  tags               = var.tags
  resources          = var.resources
  account_management = var.account_management
}