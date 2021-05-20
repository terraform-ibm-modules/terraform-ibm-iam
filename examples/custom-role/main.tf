#####################################################
# IAM Custom role
# Copyright 2020 IBM
#####################################################

provider "ibm" {
}

module "custom_role" {
  // Uncomment following line to point the source to registry level module
  //source = "terraform-ibm-modules/iam/ibm//modules/custom-role"

  source = "../../modules/custom-role"

  name         = var.name
  display_name = var.display_name
  description  = var.description
  service      = var.service
  actions      = var.actions
}