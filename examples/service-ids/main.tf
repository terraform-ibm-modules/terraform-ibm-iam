#####################################################
# IAM Service IDs
# Copyright 2020 IBM
#####################################################

provider "ibm" {
}

module "iam_service_ids" {
  source       = "terraform-ibm-modules/iam/ibm//modules/service-ids"
  
  name         = var.name
  tags         = var.tags
  description  = var.description
}