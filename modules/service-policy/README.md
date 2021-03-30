# Module service_id_policy

This module is used to add service policies. The following example service policy to a particular service ID.

## Example Usage
```

provider "ibm" {
}

module "service_policy" {
  source               = "terraform-ibm-modules/iam/ibm//modules/service-policy"
  iam_service_id       = var.iam_service_id
  roles                = var.roles
  tags                 = var.tags
  resources            = var.resources
  account_management   = var.account_management
}

```
## NOTE:

If we want to make use of a particular version of module, then set the argument "version" to respective module version.

## Inputs

| Name                          | Description                                                      | Type         | Default | Required |
|-------------------------------|------------------------------------------------------------------|:-------------|:------- |:---------|
| iam_service_id                | ID used to identify the service                                  | string       | n/a     | yes      |
| roles                         | list of roles.                                                   | list(string) | n/a     | yes      |
| tags                          | list of tags that you want to add to the access group policy.    | list(string) | n/a     | no       |
| resources                     | A nested block describes the resource of this policy             | string       | n/a     | no       |
| account_management            | Gives access to all account management services if set to true   | bool         | false   | no       |

## Resources Inputs

| Name                          | Description                                                      | Type         | Default | Required |
|-------------------------------|------------------------------------------------------------------|:-------------|:------- |:---------|
| service                       | service name that you want to include in your policy definition  | string       | n/a     | no       |
| resource_instance_id          | ID of resource instance of the policy definition.                | string       | n/a     | no       |
| region                        | Region of the policy definition                                  | string       | n/a     | no       |
| resource_type                 | Resource type of the policy definition.                          | string       | n/a     | no       |
| resource                      | Resource of the policy definition.                               | string       | n/a     | no       |
| resource_group_id             | ID of the resource group                                         | string       | n/a     | no       |
| attributes                    | Set resource attributes in the form of name=value,name=value     | string       | n/a     | no       |

## Usage

To create access members group policy run the following command

  `terraform apply -var-file="input.tfvars"`

Similarly to to remove the access group policy run the command

   `terraform destroy -var-file="input.tfvars"`


NOTE : Do not specify arguments "account_management" and "resources" at the same time as both conflict with each other.

