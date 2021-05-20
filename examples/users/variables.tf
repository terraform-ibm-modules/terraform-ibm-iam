#####################################################
# IAM user invite
# Copyright 2020 IBM
#####################################################

variable "user_email_addresses" {
  description = "A comma separated list of user email IDs."
  type        = list(string)
}

variable "access_groups" {
  description = "comma separated list of access group IDs."
  type        = list(string)
  default     = null
}

variable "iam_policies" {
  type        = any
  description = "A nested block describes the resource of user invited."
  default     = null
}

variable "classic_infra_roles_permissions" {
  type        = list(string)
  description = "comma separated list of classic infrastructure permissions."
  default     = null
}

variable "classic_infra_roles_permission_set" {
  type        = string
  description = "A nested block describes the resource of user invited."
  default     = null
}

variable "cloud_foundry_roles" {
  type        = list(any)
  description = "A nested block describes the cloud foundry roles of inviting user. "
  default     = null
}




