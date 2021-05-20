#####################################################
# IAM authorization policy
# Copyright 2020 IBM
#####################################################

variable "source_service_name" {
  description = "Enter The source service name."
  type        = string
}

variable "target_service_name" {
  description = " Enter The target service name."
  type        = string
}

variable "roles" {
  type        = list(string)
  description = "Enter comma separated list of roles."
}

variable "source_resource_instance_id" {
  description = "Enter The source resource instance ID."
  type        = string
  default     = null
}

variable "target_resource_instance_id" {
  description = "Enter The target resource instance ID."
  type        = string
  default     = null
}

variable "source_resource_group_id" {
  description = "Enter The ID of the resource group from which you want to allow access to IBM Cloud services in another resource group."
  type        = string
  default     = null
}

variable "target_resource_group_id" {
  description = "Enter The ID of the resource group that holds the IBM Cloud services that you want to allow access to."
  type        = string
  default     = null
}

variable "source_resource_type" {
  description = "Enter resource type of the source service."
  type        = string
  default     = null
}

variable "target_resource_type" {
  description = "Enter resource type of the target service."
  type        = string
  default     = null
}

variable "source_service_account" {
  description = "Enter GUID of the account where the source service is provisioned."
  type        = string
  default     = null
}



