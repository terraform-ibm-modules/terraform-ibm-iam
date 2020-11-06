#####################################################
# IAM user invite
# Copyright 2020 IBM
#####################################################

output "number_of_invited_users" {
  description = "number of invited users"
  value       = ibm_iam_user_invite.invite_user.number_of_invited_users  
}