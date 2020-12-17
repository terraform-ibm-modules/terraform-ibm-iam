#####################################################
# IAM Access group policy
# Copyright 2020 IBM
#####################################################

variable "access_group_id" {
    description = "Enter the ID of the access group."
    type        = string
}

variable "roles" {
    description = "list of roles"
    type        = list(string)
}

variable "tags" {
  type        = list(string)
  description = "Tags that should be applied to the service"
  default     = null
}


variable "account_management" {
    description = "Enter true if you want give access to all account management services"
    type        = bool
    default     = false
}

variable "resources" {
    type = list(any)
    description = "A nested block describes the resource of this policy."
    default     = null
}



