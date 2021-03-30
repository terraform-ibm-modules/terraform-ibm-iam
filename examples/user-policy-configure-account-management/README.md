# Module user_policy

This module is used to assign policies to already invited users. To assign a policy to one user, the user must exist in the account to which you assign the policy.

## Example Usage
```

provider "ibm" {
}

module "service_policy" {
  source               = "terraform-ibm-modules/iam/ibm//modules/user-policy"
  ibm_id               = var.ibm_id
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
| ibm_id             | IBMid or email address of the user                               | string       | n/a     | yes      |
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

