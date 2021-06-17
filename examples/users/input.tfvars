#####################################################
# IAM user invite
# Copyright 2020 IBM
#####################################################


user_email_addresses = ["user1@in.ibm.com", "user21@in.ibm.com"]


access_groups = ["AccessGroupId-8a45c393-c90d-43c8", "AccessGroupId-3199ff70-fb0323140"]

iam_policies = [{
  roles                          = ["Manager", "Viewer", "Administrator"]
  account_management             = false
  resources_service              = "cloud-object-storage"
  resources_resource_instance_id = "crn:v1:bluemix:public:cloud-object-storage:global:a/fcdb764102154c7ea8e1b79d3a64afe0:fc0d5e13-bdc0-4bbb-a20f-d5a567ca8731::"
  resources_region               = null
  resources_resource_type        = "resource-group"
  resources_resource             = "19e34037c9fe41e5aa9d682c9089b044"
  resources_resource_group_id    = "19e34037c9fe41e5aa9d682c9089b044"
  resources_attributes           = null
}]

classic_infra_roles_permissions = ["PORT_CONTROL", "DATACENTER_ACCESS"]

classic_infra_roles_permission_set = "superuser"

cloud_foundry_roles = [{
  organization_guid = "02260e9d-3334-4933-bdef-458cb3e80143"
  org_roles         = ["Manager", "Auditor"]
  spaces = [{
    space_guid  = "80f28d3b-7d4e-4294-b0fd-071dcc5b0482"
    space_roles = ["Manager", "Developer"]
  }, ]
  },
]

