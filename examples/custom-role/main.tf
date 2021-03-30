#####################################################
# IAM Custom role
# Copyright 2020 IBM
#####################################################

provider "ibm" {
}

module "custom_role" {
  source = "terraform-ibm-modules/iam/ibm//modules/custom-role"

  name         = var.name
  display_name = var.display_name
  description  = var.description
  service      = var.service
  actions      = var.actions
}