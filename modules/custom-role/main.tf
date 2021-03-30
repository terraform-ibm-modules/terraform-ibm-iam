#####################################################
# IAM Custom role
# Copyright 2020 IBM
#####################################################

resource "ibm_iam_custom_role" "customrole" {
  name         = var.name
  display_name = var.display_name
  description  = (var.description != null ? var.description : null)
  service      = var.service
  actions      = var.actions
}
