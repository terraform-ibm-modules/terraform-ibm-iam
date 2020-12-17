#####################################################
# IAM Custom role
# Copyright 2020 IBM
#####################################################

output "custom_role_id" {
  description = "The ID of the custom role"
  value       = ibm_iam_custom_role.customrole.id  
}