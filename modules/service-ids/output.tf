#####################################################
# IAM Service IDs
# Copyright 2020 IBM
#####################################################

output "service_id" {
  description = "The unique identifier of the service ID."
  value       = ibm_iam_service_id.serviceID.id
}