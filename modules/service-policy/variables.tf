#####################################################
# IAM Access group policy
# Copyright 2020 IBM
#####################################################

variable "iam_service_id" {
  description = "The ID of the service ID."
  type        = string
}

variable "roles" {
  description = "list of roles"
  type        = list(string)
  default     = null
}

variable "tags" {
  type        = list(string)
  description = "Tags that should be applied to the service"
  default     = null
}

variable "account_management" {
  description = "Attributes of the resource"
  type        = bool
  default     = false
}

variable "resources" {
  type    = list(any)
  default = []
}


