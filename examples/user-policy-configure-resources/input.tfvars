#####################################################
# IAM User Policy
# Copyright 2020 IBM
#####################################################

/********************************************************************************************************************

Example Usage

tags = ["T1","T2"]

roles = ["Manager","Viewer","Editor"]


configure the argument "resources" as follows

resources = [{
    service = "cloud-object-storage"
    resource_instance_id = "crn:v1:bluemix:public:cloud-object-storage:global:a/fcdb764102154c7ea8e1b79d3a64afe0:fc0d5e13-bdc0-4bbb-a20f-d5a567ca8731::"
    resource_type = "resource-group"
    resource = "19e34037c9fe41e5aa9d682c9089b044"
    resource_group_id = "19e34037c9fe41e5aa9d682c9089b044"
    },
]

NOTE : Do not specify arguments "account_management" and "resources" at the same time as both conflict with each other.

If you dont want to configure any optional parameter, assign a `null` value to that argument. E.g:
Say we dont want to configure the "account_management", make it null as follows

     account_management = null

NOTE: Max number of resources can be defined as part of policy is 1 only.

For more info https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/iam_access_group_policy

****************************************************************************************************************************/

resources = [{
  region               = "us-south"
  service              = "containers-kubernetes"
  resource_instance_id = "crn:v1:bluemix:public:containers-kubernetes:us-south:a/fcdb764102154c7ea8e1b79d3a64afe0:btgbsard0ss76j8snblg::"
  resource_group_id    = "19e34037c9fe41e5aa9d682c9089b044"
  attributes = {
    "namespace" = "default"
  }
  },
]

account_management = null

tags = ["T1", "T2"]

roles = ["Manager", "Viewer", "Editor"]



