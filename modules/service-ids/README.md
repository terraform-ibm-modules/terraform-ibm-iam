# Module service-ids

This module is used to create a IAM service IDs and add policies to them. A service ID identifies a service or application similar to how a user ID identifies a user. Create service IDs to enable access to your IBM Cloud services by applications hosted both inside and outside of IBM Cloud.

## Example Usage
```
provider "ibm" {
}

module "iam_service_ids" {
  // Uncomment following line to point the source to registry level module
  //source = "terraform-ibm-modules/iam/ibm//modules/service-ids"

  source = "../../modules/service-ids"
  name        = var.name
  tags        = var.tags
  description = var.description

  ############ service policies ######################
  policies              = var.policies
}

```
## NOTE:

If we want to make use of a particular version of module, then set the argument "version" to respective module version.

## Inputs

| Name                      | Description                                                      | Type         | Default | Required |
|---------------------------|------------------------------------------------------------------|:-------------|:------- |:---------|
| name                      | A descriptive name used to identify the service id               | string       | n/a     | yes      |
| provision                 | Used to decide whether to create a new service id or not         | bool         | true    | no       |
| description               | The description of the service id.                               | string       | n/a     | no       |
| tags                      | Tags that should be applied to the service                       | list(string) | n/a     | no       |
| policies                  | List of service id policies.                                     | list(any)    | n/a     | yes      |

## policies inputs

| Name                | Description                                                      | Type         | Default | Required |
|---------------------|------------------------------------------------------------------|:-------------|:------- :--------- |
| roles               | list of roles.                                                   | list(string) | n/a     | yes      |
| tags                | list of tags that you want to add to the access group policy.    | list(string) | n/a     | no       |
| account_management  | Gives access to all account management services if set to true   | bool         | false   | no       |
| resources           | A nested block describes the resource of this policy             | string       | n/a     | no       |
| resource_attributes | A nested block describes the resource attributes of the policy   | string       | n/a     | no       |

## resources inputs

| Name                          | Description                                                      | Type         | Default | Required|
|-------------------------------|------------------------------------------------------------------|:-------------|:------- :---------|
| service                       | service name that you want to include in your policy definition  | string       | n/a     | no      |
| resource_instance_id          | ID of resource instance of the policy definition.                | string       | n/a     | no      |
| region                        | Region of the policy definition                                  | string       | n/a     | no      |
| resource_type                 | Resource type of the policy definition.                          | string       | n/a     | no      |
| resource                      | Resource of the policy definition.                               | string       | n/a     | no      |
| resource_group_id             | ID of the resource group                                         | string       | n/a     | no      |
| attributes                    | Set resource attributes in the form of name=value,name=value     | string       | n/a     | no      |

## resource_attributes inputs

| Name                          | Description                                                      | Type    | Default     | Required|
|-------------------------------|------------------------------------------------------------------|:--------|:------------|:--------|
| name                          | Name of the Attribute.                                           | string  | n/a         | yes     |
| value                         | Value of the Attribute.                                          | string  | n/a         | yes     |
| operator                      | Operator of the Attribute                                        | string  | stringEquals| no      |

## Outputs

| Name                 | Description                             |
|----------------------|-----------------------------------------|
| service_id           | Unique identifier of the service ID     |
| service_policy_ids   | List of service policy IDs              |


## Usage

To create service IDs run the following command

  `terraform apply -var-file="input.tfvars"`

Similarly to to remove the Service IDs run the command

   `terraform destroy -var-file="input.tfvars"`