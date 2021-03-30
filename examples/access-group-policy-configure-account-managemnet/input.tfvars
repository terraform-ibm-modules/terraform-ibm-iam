#####################################################
# IAM Access group policy
# Copyright 2020 IBM
#####################################################

/****************************************************
Example Usage

tags = ["T1","T2"]

roles = ["Manager","Viewer","Editor"]

account_management = false

NOTE : Do not specify arguments "account_management" and "resources" at the same time as both conflict with each other.

If dont want to configure the argument "resources", make it empty as follows

     resources = []

******************************************************/


resources = []

account_management = false

tags = ["T1", "T2"]

roles = ["Manager", "Viewer", "Editor"]



