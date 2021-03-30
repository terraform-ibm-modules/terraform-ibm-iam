#####################################################
# IAM Service IDs
# Copyright 2020 IBM
#####################################################

variable "name" {
  description = "Name of the service ID"
  type        = string
}

variable "description" {
  description = "Description to Service ID"
  type        = string
  default     = null
}

variable "tags" {
  type        = list(string)
  description = "Tags that should be applied to the service"
  default     = null
}

