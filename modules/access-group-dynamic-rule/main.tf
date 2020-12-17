#####################################################
# IAM Access group dynamic rule
# Copyright 2020 IBM
#####################################################
	  
resource "ibm_iam_access_group_dynamic_rule" "accgroup" {
	name                = var.name
	access_group_id     = var.access_group_id
	expiration          = var.expiration
	identity_provider   = var.identity_provider
	
  dynamic conditions {
      for_each = var.conditions
      content {
        claim      = conditions.value.claim  
        operator   = conditions.value.operator
		    value      = conditions.value.value
      }
    }
}