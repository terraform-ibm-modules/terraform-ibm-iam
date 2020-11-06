#####################################################
# IAM Access group
# Copyright 2020 IBM
#####################################################

output "access_group_member_id" {
  description = "The ID of the access group"
  value       = ibm_iam_access_group_members.accgroupmem.id  
}