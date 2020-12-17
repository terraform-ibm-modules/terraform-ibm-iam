#####################################################
# IAM User Policy
# Copyright 2020 IBM
#####################################################

output "iam_user_policy_id" {
  description = "The ID of the User policy"
  value       = ibm_iam_user_policy.policy.id  
}