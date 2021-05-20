#####################################################
# IAM Service IDs
# Copyright 2020 IBM
#####################################################

variable "name" {
  description = "Name of the service ID"
  type        = string
}

variable "description" {
  description = "Description to service ID"
  type        = string
  default     = null
}

variable "tags" {
  type        = list(string)
  description = "Tags that should be applied to the service"
  default     = null
}

variable "provision" {
  type        = bool
  description = "Would you like to provision a new access group (true/false)"
  default     = true
}


############ service policies ####################

variable "policies" {
  description = "list of policies"
  type        = map(any)
}

