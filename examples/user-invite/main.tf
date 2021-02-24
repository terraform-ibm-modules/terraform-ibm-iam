#####################################################
# IAM user invite
# Copyright 2020 IBM
#####################################################

provider "ibm" {
}

module "user_invite" {
  source  = "terraform-ibm-modules/iam/ibm//modules/user-invite"
  
  user_email_addresses                = var.user_email_addresses
  access_groups                       = var.access_groups
  iam_policies                        = var.iam_policies
  classic_infra_roles_permissions     = var.classic_infra_roles_permissions
  classic_infra_roles_permission_set  = var.classic_infra_roles_permission_set
  cloud_foundry_roles                 = var.cloud_foundry_roles
}
