#####################################################
# IAM User Policy
# Copyright 2020 IBM
#####################################################

resource "ibm_iam_user_policy" "policy" {
  ibm_id = var.ibm_id
  roles  = var.roles

  dynamic resources {
    for_each = var.resources != null ? var.resources : []
    content {
      region               = lookup(element(var.resources, 0), "region", null)
      attributes           = lookup(element(var.resources, 0), "attributes", null)
      service              = lookup(element(var.resources, 0), "service", null)
      resource_instance_id = lookup(element(var.resources, 0), "resource_instance_id", null)
      resource_type        = lookup(element(var.resources, 0), "resource_type", null)
      resource             = lookup(element(var.resources, 0), "resource", null)
      resource_group_id    = lookup(element(var.resources, 0), "resource_group_id", null)
    }
  }

  account_management = (var.account_management != null ? var.account_management : null)
  tags               = (var.tags != null ? var.tags : null)
}
