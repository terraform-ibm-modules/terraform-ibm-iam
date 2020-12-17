# Module access_group_policy

This module is used to add IAM policy to a members of a acess group. The following example creates an IAM policy that grants roles to members of the access group. 

As both arguments "account_management" and "resources" conflict with each other, this example shows how to configure the `account_management` argument to apply the policy.

## Example Usage
```

provider "ibm" {
}

module "access_group_policy" {
  source               = "terraform-ibm-modules/iam/ibm//modules/access-group-policy"
  access_group_id      = var.access_group_id
  roles                = var.roles
  tags                 = var.tags
  resources            = var.resources
  account_management   = var.account_management
}

```
## NOTE: 

If we want to make use of a particular version of module, then set the argument "version" to respective module version.

## Inputs

| Name               | Description                                                      | Type         | Default | Required |
|--------------------|------------------------------------------------------------------|:-------------|:------- |:---------|
| access_group_id    | ID used to identify the access group                             | string       | n/a     | yes      |
| roles              | list of roles.                                                   | list(string) | n/a     | yes      |
| tags               | list of tags that you want to add to the access group policy.    | list(string) | n/a     | no       |
| resources          | A nested block describes the resource of this policy             | string       | n/a     | no       |
| account_management | Gives access to all account management services if set to true   | bool         | false   | no       |

## Usage

To create access members group policy run the following command

  `terraform apply -var-file="input.tfvars"`

Similarly to to remove the access group policy run the command

   `terraform destroy -var-file="input.tfvars"`
   

NOTE : Do not specify arguments "account_management" and "resources" at the same time as both conflict with each other.

