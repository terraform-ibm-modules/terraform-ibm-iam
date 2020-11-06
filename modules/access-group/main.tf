#####################################################
# IAM Access group
# Copyright 2020 IBM
#####################################################

resource "ibm_iam_access_group" "accgroup" {
	name        	= var.name
	description 	= (var.description != null ? var.description : null )
	tags        	= ( var.tags != null ? var.tags : null )
}