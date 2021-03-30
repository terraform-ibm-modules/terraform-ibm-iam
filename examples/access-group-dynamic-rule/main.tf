#####################################################
# IAM Access group dynamic rule
# Copyright 2020 IBM
#####################################################


provider "ibm" {
}

module "access_group_dynamic_rule" {
  source = "terraform-ibm-modules/iam/ibm//modules/access-group-dynamic-rule"

  access_group_id   = var.access_group_id
  name              = var.name
  expiration        = var.expiration
  identity_provider = var.identity_provider
  conditions        = var.conditions
}