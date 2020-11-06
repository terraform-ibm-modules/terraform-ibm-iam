#####################################################
# IAM Service IDs
# Copyright 2020 IBM
#####################################################

resource "ibm_iam_service_id" "serviceID" {
	name        	= var.name
	description 	= ( var.description != null ? var.description : null )
	tags        	= ( var.tags != null ? var.tags : null )
}