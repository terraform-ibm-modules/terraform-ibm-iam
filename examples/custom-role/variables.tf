#####################################################
# IAM Custom role
# Copyright 2020 IBM
#####################################################

variable "name" {
  description = "Enter the name of the custom role."
  type        = string
}

variable "description" {
  description = "Enter description of the custom role. Make sure to include information about the level of access this role assignment gives a user"
  type        = string
  default     = null
}

variable "display_name" {
  type        = string
  description = "Enter the display name of the custom role"
}

variable "service" {
  type        = string
  description = "Enter the name of the service for which you want to create the custom role. "
}

variable "actions" {
  type        = list(string)
  description = "A list of action IDs that you want to add to your custom role. "
}

