#####################################################
# IAM User Policy
# Copyright 2020 IBM
#####################################################

resource "ibm_iam_user_policy" "policy" {
	ibm_id   			        = var.ibm_id
	roles                       = var.roles

	dynamic resources {
      for_each = var.resources
      content {
		region                 	= (resources.value.region != null ? resources.value.region : null) 
        service                	= (resources.value.service != null ? resources.value.service : null) 
        resource_instance_id   	= (resources.value.resource_instance_id != null ? resources.value.resource_instance_id : null) 
		resource_type          	= (resources.value.resource_type != null ? resources.value.resource_type : null) 
		resource               	= (resources.value.resource != null ? resources.value.resource : null) 
		resource_group_id      	= (resources.value.resource_group_id != null ? resources.value.resource_group_id : null)
		attributes              = (resources.value.attributes != null ? resources.value.attributes : null)
      }
    }

	account_management 			= (var.account_management != null ? var.account_management : null)
	tags 						= (var.tags != null ? var.tags : null)
}
