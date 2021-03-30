#####################################################
# IAM Access group policy
# Copyright 2020 IBM
#####################################################

/****************************************************
Example Usage

conditions = [{
    claim    = "blueGroups"
    operator = "CONTAINS"
    value    = "test-bluegroup-saml"
    },
]

******************************************************/

conditions = [{
  claim    = "blueGroups"
  operator = "CONTAINS"
  value    = "test-bluegroup-saml"
  },
]
