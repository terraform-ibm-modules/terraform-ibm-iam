#####################################################
# IAM Access group
# Copyright 2020 IBM
#####################################################

provider "ibm" {
}

module "access_group" {
  source  = "terraform-ibm-modules/iam/ibm//modules/access-group"

  name         = var.name
  tags         = var.tags
  description  = var.description
}