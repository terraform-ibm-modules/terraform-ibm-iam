#####################################################
# IAM Access group dynamic rules
# Copyright 2020 IBM
#####################################################

output "access_group_dynamic_rule_id" {
  description = "The ID of the access group dynamci rule"
  value       = ibm_iam_access_group_dynamic_rule.accgroup.rule_id
}