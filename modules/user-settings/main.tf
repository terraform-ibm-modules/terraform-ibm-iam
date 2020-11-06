#####################################################
# IAM User Settings
# Copyright 2020 IBM
#####################################################

resource "ibm_iam_user_settings" "settings" {
	iam_id   			   = var.iam_id
	allowed_ip_addresses   = var.allowed_ip_addresses
}
