#####################################################
# IAM User Settings
# Copyright 2020 IBM
#####################################################

variable "iam_id" {
    description = "IBMid or email address of the user."
    type        = string
}

variable "allowed_ip_addresses" {
    description = "Lists the IP addresses in common separated format. "
    type        = list(string)
    default     = null
}




