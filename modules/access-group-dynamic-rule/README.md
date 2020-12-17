# Module access_group_dynamic_rule

This module is used to automatically add federated users to access groups based on specific identity attributes. When your users log in with a federated ID, the data from the identity provider dynamically maps your users to an access group based on the rules that you set.

## Example Usage
```

provider "ibm" {
}

module "access_group_dynamic_rule" {
  source            = "terraform-ibm-modules/iam/ibm//modules/access-group-dynamic-rule"
  access_group_id   =  var.access_group_id
  name              =  var.name
  expiration        =  var.expiration
  identity_provider =  var.identity_provider
  conditions        =  var.conditions
}

```
## NOTE: 

If we want to make use of a particular version of module, then set the argument "version" to respective module version.

## Inputs

| Name               | Description                                                      | Type         | Default | Required |
|--------------------|------------------------------------------------------------------|:-------------|:------- |:---------|
| access_group_id    | ID used to identify the access group                             | string       | n/a     | yes      |
| name               | name of the dynamic rule                                         | string       | n/a     | yes      |
| expiration         | The expiration in hours.                                         | number       | n/a     | yes      |
| identity_provider  | URI for your identity provider..                                 | string       | n/a     | yes      |
| conditions         | list of conditions that the rule must satisfy.                   | list(map)    | n/a     | yes      |


## conditions Inputs

| Name                 | Description                                                      | Type     | Default | Required |
|----------------------|------------------------------------------------------------------|----------|---------|----------|
| claim                | The key value to evaluate the condition against.                 | String   | n/a     | yes      |
| operator             | The operation to perform on the claim.                           | String   | n/a     | yes      |
| value                | Value that the claim is compared by using the conditions.operator| String   | n/a     | yes      |

## Usage

To create dynamic rule for access group run the following command

  `terraform apply -var-file="input.tfvars"`

Similarly to to remove the dynamic rule run the command

   `terraform destroy -var-file="input.tfvars"`

