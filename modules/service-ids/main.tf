#####################################################
# IAM Service IDs
# Copyright 2020 IBM
#####################################################

resource "ibm_iam_service_id" "serviceID" {
  count       = var.provision ? 1 : 0
  name        = var.name
  description = (var.description != null ? var.description : null)
  tags        = (var.tags != null ? var.tags : null)
}

data "ibm_iam_service_id" "serviceIDdata" {
  count = var.provision ? 0 : 1
  name  = var.name
}

resource "ibm_iam_service_policy" "policy" {
  iam_service_id = var.provision ? ibm_iam_service_id.serviceID[0].id : data.ibm_iam_service_id.serviceIDdata[0].service_ids[0].id

  for_each = var.policies

  roles              = each.value["roles"]
  account_management = (each.value["account_management"] != null ? each.value["account_management"] : null)
  tags               = (each.value["tags"] != null ? each.value["tags"] : null)

  dynamic resources {
    for_each = (each.value["resources"] != null ? each.value["resources"] : [])
    content {
      region               = lookup(element(each.value["resources"], 0), "region", null)
      attributes           = lookup(element(each.value["resources"], 0), "attributes", null)
      service              = lookup(element(each.value["resources"], 0), "service", null)
      resource_instance_id = lookup(element(each.value["resources"], 0), "resource_instance_id", null)
      resource_type        = lookup(element(each.value["resources"], 0), "resource_type", null)
      resource             = lookup(element(each.value["resources"], 0), "resource", null)
      resource_group_id    = lookup(element(each.value["resources"], 0), "resource_group_id", null)
    }
  }

  dynamic resource_attributes {
    for_each = (each.value["resource_attributes"] != null ? each.value["resource_attributes"] : [])
    content {
      name     = resource_attributes.value.name
      value    = resource_attributes.value.value
      operator = (resource_attributes.value.operator != null ? resource_attributes.value.operator : null)
    }
  }
}


