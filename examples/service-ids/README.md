# Module iam_service_ids

This module is used to create a IAM service IDs.

## Example Usage
```
provider "ibm" {
}

module "iam_service_ids" {
  source       = "terraform-ibm-modules/iam/ibm//modules/service-ids"
  name         = var.name
  tags         = var.tags
  description  = var.description
}

```
## NOTE:

If we want to make use of a particular version of module, then set the argument "version" to respective module version.

## Inputs

| Name               | Description                                                      | Type         | Default | Required |
|--------------------|------------------------------------------------------------------|:-------------|:------- |:---------|
| name               | A descriptive name used to identify the access group             | string       | n/a     | yes      |
| description        | The description of the access group.                             | string       | n/a     | no       |
| tags               | Tags that should be applied to the service                       | list(string) | n/a     | no       |

## Usage

To create service IDs run the following command

  `terraform apply -var-file="input.tfvars"`

Similarly to to remove the Service IDs run the command

   `terraform destroy -var-file="input.tfvars"`