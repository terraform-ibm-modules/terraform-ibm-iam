#####################################################
# IAM Access group members
# Copyright 2020 IBM
#####################################################

resource "ibm_iam_access_group_members" "accgroupmem" {
  	access_group_id 	= var.access_group_id
  	ibm_ids         	= (var.ibm_ids != null ? var.ibm_ids : null) 
  	iam_service_ids 	= (var.service_ids != null ? var.service_ids : null)
}