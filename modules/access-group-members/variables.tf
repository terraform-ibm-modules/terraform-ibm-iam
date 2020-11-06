#####################################################
# IAM Access group members
# Copyright 2020 IBM
#####################################################

variable "access_group_id" {
    description = "The ID of the access group."
    type        = string
}

variable "ibm_ids" {
    description = "A list of IBM IDs that you want to add to or remove from the access group."
    type        = list(string)
    default     = null
}

variable "service_ids" {
  type        = list(string)
  description = "A list of service IDS that you want to add to or remove from the access group."
  default     = null
}

