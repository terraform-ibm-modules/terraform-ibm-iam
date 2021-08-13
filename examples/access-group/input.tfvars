#####################################################
# IAM Access group
# Copyright 2020 IBM
#####################################################

########### Access group ########

tags = ["T1", "T2"]

########### Access group memeber ########

ibm_ids = ["abc@in.ibm.com"]

service_ids = ["ServiceId-1"]


########### Access group policy ########

/***************************************

Following 3 arguments conflict with each other
  * resources
  * resource_attributes and
  * account_management

Hence while configuring one at a time, unset the other

Following configuration defines 3 policies for Admin, Viewer and Editor
For Admin we set the resources argument and unset the account_management and resource_attributes
For Viwer, we set resource_attributes and unset the account_management and resources
and finally for Editor, we set account_management and unset resource_attributes and resources

NOTE: Max number of resources can be defined as part of policy is 1 only.

For more info https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/iam_access_group_policy
****************************************/

policies = {
  admin2 = {
    roles              = ["Viewer"]
    account_management = null
    tags               = ["Ta1", "Ta2"]
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
    resource_attributes = []
  }

  Viwer2 = {
    roles              = ["Viewer"]
    account_management = null
    tags               = ["Ta3", "Ta4"]

    resources = []

    resource_attributes = [{
      name     = "resource"
      value    = "test123*"
      operator = "stringMatch"
      },
      {
        name     = "serviceName"
        value    = "messagehub"
        operator = null
      },
    ]
  }

  Editor2 = {
    roles               = ["Manager"]
    account_management  = false
    tags                = ["Ta5", "Ta6"]
    resources           = []
    resource_attributes = []
  }

}

########### Access group dynamic rule ########

dynamic_rules = {
  rule1 = {
    expiration        = 2
    identity_provider = "test-idp.com"
    rule_conditions = [{
      claim    = "blueGroups"
      operator = "CONTAINS"
      value    = "test-bluegroup-saml"
      },
      {
        claim    = "blueGroups"
        operator = "EQUALS"
        value    = "test-bluegroup-saml"
      },
    ]
  }

  rule2 = {
    expiration        = 1
    identity_provider = "test-idp.com"
    rule_conditions = [{
      claim    = "blueGroups"
      operator = "EQUALS"
      value    = "test-bluegroup-saml"
      },
    ]
  }
}

