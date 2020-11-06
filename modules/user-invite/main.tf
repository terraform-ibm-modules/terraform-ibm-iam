#####################################################
# IAM user invite
# Copyright 2020 IBM
#####################################################

resource "ibm_iam_user_invite" "invite_user" {
    users                           = var.user_email_addresses
    access_groups                   = (var.access_groups != null ? var.access_groups : null)
	
	dynamic iam_policy {
      for_each = var.iam_policies
      content {
		roles                 	    = iam_policy.value.roles 
	    resources {
			region                 	= (iam_policy.value.resources_region != null ? iam_policy.value.resources_region : null) 
			attributes             	= (iam_policy.value.resources_attributes != null ? iam_policy.value.resources_attributes : null) 
        	service                	= (iam_policy.value.resources_service != null ? iam_policy.value.resources_service : null)  
        	resource_instance_id   	= (iam_policy.value.resources_resource_instance_id != null ? iam_policy.value.resources_resource_instance_id : null) 
			resource_type          	= (iam_policy.value.resources_resource_type != null ? iam_policy.value.resources_resource_type : null) 
			resource               	= (iam_policy.value.resources_resource != null ? iam_policy.value.resources_resource : null) 
			resource_group_id      	= (iam_policy.value.resources_resource_group_id != null ? iam_policy.value.resources_resource_group_id : null)
		} 
        
		account_management          = iam_policy.value.account_management
      }
    }

	classic_infra_roles  {
		permissions                 = (var.classic_infra_roles_permissions != null ? var.classic_infra_roles_permissions : null)
		permission_set              = (var.classic_infra_roles_permission_set != null ? var.classic_infra_roles_permission_set : null)
	}

	dynamic cloud_foundry_roles{
		for_each = (var.cloud_foundry_roles != null ? var.cloud_foundry_roles : [])
		content{
			organization_guid       = cloud_foundry_roles.value.organization_guid
			org_roles               = cloud_foundry_roles.value.org_roles
			dynamic spaces{
				for_each = cloud_foundry_roles.value.spaces
				content{
					space_guid      = spaces.value.space_guid
					space_roles     = spaces.value.space_roles
				}
			}
		}
	}
}
