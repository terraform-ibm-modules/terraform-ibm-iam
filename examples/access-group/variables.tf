#####################################################
# IAM Access group
# Copyright 2020 IBM
#####################################################

variable "name" {
  description = "Name of the access group"
  type        = string
}

variable "description" {
  description = "Description to access group"
  type        = string
  default     = null
}

variable "tags" {
  type        = list(string)
  description = "Tags that should be applied to the service"
  default     = null
}

