#####################################################
# IAM Access group
# Copyright 2020 IBM
#####################################################

output "access_group_id" {
  description = "The ID of the access group"
  value       = ibm_iam_access_group.accgroup.id  
}