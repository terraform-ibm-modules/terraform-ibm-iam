#####################################################
# IAM User Settings
# Copyright 2020 IBM
#####################################################

output "iam_user_setting_id" {
  description = "The ID of the User setting"
  value       = ibm_iam_user_settings.settings.id
}