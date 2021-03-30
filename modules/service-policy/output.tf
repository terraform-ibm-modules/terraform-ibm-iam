#####################################################
# IAM service ID policy
# Copyright 2020 IBM
#####################################################

output "iam_service_id" {
  description = "The ID of the service ID policy"
  value       = ibm_iam_service_policy.policy.id
}