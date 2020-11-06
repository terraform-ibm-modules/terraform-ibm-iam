#####################################################
# IAM Access group policy
# Copyright 2020 IBM
#####################################################

output "access_group_policy_id" {
  description = "The ID of the access group policy"
  value       = ibm_iam_access_group_policy.policy.id  
}