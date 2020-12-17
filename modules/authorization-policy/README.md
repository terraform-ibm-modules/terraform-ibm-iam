# Module authorization_policy

This module is used to apply IAM service authorization policy. 

## Example Usage
```

provider "ibm" {
}

module "authorization_policy" {
  source  = "terraform-ibm-modules/iam/ibm//modules/authorization-policy"

  source_service_name           = var.source_service_name
  roles                         = var.roles
  target_service_name           = var.target_service_name
  source_resource_instance_id   = var.source_resource_instance_id
  target_resource_instance_id   = var.target_resource_instance_id
  source_resource_group_id      = var.source_resource_group_id
  target_resource_group_id      = var.target_resource_group_id
  source_resource_type          = var.source_resource_type
  target_resource_type          = var.target_resource_type
  source_service_account        = var.source_service_account
}

```
## NOTE: 

If we want to make use of a particular version of module, then set the argument "version" to respective module version.

## Inputs

| Name                        | Description                                                      | Type         | Default | Required |
|-----------------------------|------------------------------------------------------------------|:-------------|:------- |:---------|
| source_service_name         | The source service name                                          | string       | n/a     | yes      |
| roles                       | list of roles.                                                   | list(string) | n/a     | yes      |
| target_service_name         | The target service name.                                         | string       | n/a     | yes      |
| source_resource_instance_id | The source resource instance ID                                  | string       | n/a     | no       |
| target_resource_instance_id | The target resource instance ID                                  | string       | n/a     | no       |
| source_resource_group_id    | The source resource group ID                                     | string       | n/a     | no       |
| target_resource_group_id    | The target resource group ID                                     | string       | n/a     | no       |
| source_resource_type        | Resource type of the source service.                             | string       | n/a     | no       |
| target_resource_type        | Resource type of the target service.                             | string       | n/a     | no       |
| source_service_account      | GUID of the account where the source service is provisioned      | string       | n/a     | no       |


## Usage

To create access members group policy run the following command

  `terraform apply -var-file="input.tfvars"`

Similarly to to remove the access group policy run the command

   `terraform destroy -var-file="input.tfvars"`
   



