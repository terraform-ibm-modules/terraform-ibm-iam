#####################################################
# IAM Access group members
# Copyright 2020 IBM
#####################################################


provider "ibm" {
}

module "access_group_members" {
  source = "terraform-ibm-modules/iam/ibm//modules/access-group-members"

  access_group_id = var.access_group_id
  ibm_ids         = var.ibm_ids
  service_ids     = var.service_ids
}