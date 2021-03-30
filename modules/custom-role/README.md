# Module custom-role

This module is used to create new roles that are scoped to single services. This means that you can't combine actions for two different services in a custom role, but you can combine as many actions that you want into a new role for a single service. After you create a custom role with a name of your choosing, anyone in the account who can assign access to a particular service can use that role when assigning access.

## Example Usage
```
provider "ibm" {
}

module "custom_role" {
  source  = "terraform-ibm-modules/iam/ibm//modules/custom-role"

  name         = var.name
	display_name = var.display_name
	description  = var.description
	service      = var.service
	actions      = var.actions
}

```

## NOTE:

If we want to make use of a particular version of module, then set the argument "version" to respective module version.

## Inputs

| Name               | Description                                                      | Type         | Default | Required |
|--------------------|------------------------------------------------------------------|:-------------|:------- |:---------|
| name               | A descriptive name used to identify the custom role              | string       | n/a     | yes      |
| display_name       | display name of the custom role                                  | string       | n/a     | yes      |
| service            | name of the service for which you want to create the custom role | string       | n/a     | yes      |
| actions            | list of action IDs that you want to add to your custom role      | list(string) | n/a     | yes      |
| description        | description of the custom role                                   | string       | n/a     | no       |

## Usage

To create access group run the following command

  `terraform apply -var-file="input.tfvars"`

Similarly to to remove the access group run the command

   `terraform destroy -var-file="input.tfvars"`

