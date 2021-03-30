# Module access_group_members

This module is used to add members to a particular acess group. The following example creates an IAM access group and a service ID. Then, the service ID and a user with the ID is added to the access group.

## Example Usage
```
provider "ibm" {
}

module "access_group_members" {
  source            = "terraform-ibm-modules/iam/ibm//modules/access-group-members"
  access_group_id   = var.access_group_id
  ibm_ids           = var.ibm_ids
  service_ids       = var.service_ids
}

```
## NOTE:

If we want to make use of a particular version of module, then set the argument "version" to respective module version.

## Inputs

| Name               | Description                                                      | Type         | Default | Required |
|--------------------|------------------------------------------------------------------|:-------------|:------- |:---------|
| access_group_id    | ID used to identify the access group                             | string       | n/a     | yes      |
| service_ids        | List of service IDS add to  access group.                        | string       | n/a     | no       |
| ibm_ids            | IBM IDs that you want to add to or remove from the access group. | list(string) | n/a     | no       |

## Usage

To create access members group run the following command

  `terraform apply -var-file="input.tfvars"`

Similarly to to remove the access group members run the command

   `terraform destroy -var-file="input.tfvars"`

