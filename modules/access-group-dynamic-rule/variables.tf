#####################################################
# IAM Access group dynamic rules
# Copyright 2020 IBM
#####################################################

variable "access_group_id" {
  description = "The ID of the access group."
  type        = string
}

variable "name" {
  description = "name of the dynamic rule for the IAM access group."
  type        = string
}

variable "expiration" {
  type        = number
  description = "Number of hours that authenticated users can work in IBM Cloud before they must refresh their access."
}

variable "identity_provider" {
  description = "Enter the URI for your identity provider."
  type        = string
}

variable "conditions" {
  description = "list of conditions that the rule must satisfy.."
  type        = list(map(string))
}



