# Module users

This module is used to invite a batch of users to a particular IBM Cloud account and define the user policies and settings.

## Example Usage
```
provider "ibm" {
}

module "user_invite" {
  source = "terraform-ibm-modules/iam/ibm//modules/users"

  user_email_addresses               = var.user_email_addresses
  access_groups                      = var.access_groups
  iam_policies                       = var.iam_policies
  classic_infra_roles_permissions    = var.classic_infra_roles_permissions
  classic_infra_roles_permission_set = var.classic_infra_roles_permission_set
  cloud_foundry_roles                = var.cloud_foundry_roles
}

```

## NOTE:

If we want to make use of a particular version of module, then set the argument "version" to respective module version.

## Inputs

| Name                                 | Description                                               | Type         | Default| Required |
|--------------------------------------|-----------------------------------------------------------|:-------------|:------- |:---------|
| user_email_addresses                 | A comma separated list of user email IDs.                 | lis(string)  | n/a     | yes      |
| access_groups                        | Comma separated list of access group IDs                  | lis(string)  | n/a     | no       |
| iam_policies                         | IAM policies for invited users.                           | list         | n/a     | no       |
| classic_infra_roles_permissions      | List of classic infrastructure permissions.               | list         | n/a     | no       |
| classic_infra_roles_permission_set   | The permission set to be applied                          | string       | n/a     | no       |
| cloud_foundry_roles                  | Cloud foundry roles of inviting user.                     | list(string) | n/a     | no       |


## iam_policies inputs

| Name                              | Description                                                   | Type         | Default | Required |
|-----------------------------------|---------------------------------------------------------------|:-------------|:------- |:---------|
| roles                             | comma separated list of roles.                                | list(string) | n/a     | yes      |
| account_management                | Gives access to all account management service if true is set | boolean      | n/a     | no       |
| resources_service                 | service name of the policy definition.                        | string       | n/a     | no       |
| resources_resource_instance_id    | ID of the resource instance of the policy definition.         | string       | n/a     | no       |
| resources_region                  | region of the policy definition.                              | string       | n/a     | no       |
| resources_resource_type           | resource type of the policy definition.                       | string       | n/a     | no       |
| resources_resource                | resource of the policy definition.                            | string       | n/a     | no       |
| resources_resource_group_id       | ID of the resource group.                                     | string       | n/a     | no       |
| resources_attributes              | set of resource attributes in the format name=value,name=value| string       | n/a     | no       |

## cloud_foundry_roles inputs
| Name                  | Description                                                      | Type         | Default | Required |
|-----------------------|------------------------------------------------------------------|:-------------|:------- |:---------|
| organization_guid     | ID of the Cloud Foundry organization.                            | string       | n/a     | yes      |
| org_roles             | organization roles that are assigned to invited user.            | list         | n/a     | yes      |
| spaces                | nested block describes Cloud Foundry space roles and space detail| list         | n/a     | no       |

## cloud_foundry_roles.spaces inputs
| Name               | Description                                                      | Type         | Default | Required |
|--------------------|------------------------------------------------------------------|:-------------|:------- |:---------|
| space_guid         | ID of the Cloud Foundry space.                                   | string       | n/a     | yes      |
| space_roles        | space roles that you want to assign to the invited user.         | list         | n/a     | yes      |


## Ouputs

| Name                     | Description                             |
|--------------------------|-----------------------------------------|
| number_of_invited_users  | Number of invited users                 |
| iam_user_policy_id       | ID of the User policy                   |
| iam_user_setting_id      | ID of the User setting                  |

## Usage

To create access group run the following command

  `terraform apply -var-file="input.tfvars"`

Similarly to to remove the access group run the command

   `terraform destroy -var-file="input.tfvars"`

