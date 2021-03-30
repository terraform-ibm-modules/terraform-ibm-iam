#####################################################
# IAM service ID policy
# Copyright 2020 IBM
#####################################################



provider "ibm" {
}

module "service_policy" {
  source = "terraform-ibm-modules/iam/ibm//modules/service-policy"

  iam_service_id     = var.iam_service_id
  roles              = var.roles
  tags               = var.tags
  resources          = var.resources
  account_management = var.account_management
}