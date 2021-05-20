#####################################################
# IAM Service IDs
# Copyright 2020 IBM
#####################################################

provider "ibm" {
}

module "iam_service_ids" {
  // Uncomment following line to point the source to registry level module
  //source = "terraform-ibm-modules/iam/ibm//modules/service-ids"

  source      = "../../modules/service-ids"
  name        = var.name
  tags        = var.tags
  description = var.description
  provision   = var.provision

  ############ service policies ######################
  policies = var.policies
}