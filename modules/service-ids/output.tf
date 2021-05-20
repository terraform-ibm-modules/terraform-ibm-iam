#####################################################
# IAM Service IDs
# Copyright 2020 IBM
#####################################################

output "service_id" {
  description = "The unique identifier of the service ID."
  value       = var.provision ? ibm_iam_service_id.serviceID[0].id : data.ibm_iam_service_id.serviceIDdata[0].service_ids[0].id
}

output "service_policy_ids" {
  description = "List of service policy IDs"
  value = toset([
    for policy in ibm_iam_service_policy.policy : policy.id
  ])
}
