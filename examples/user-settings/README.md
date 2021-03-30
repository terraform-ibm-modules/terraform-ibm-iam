# Module user_settings

This module is used to configure an user with list of ip addresses from which he can login to IBM Cloud account to which he was invited.

## Example Usage
```

provider "ibm" {
}

module "user_policy" {
  source                 = "terraform-ibm-modules/iam/ibm//modules/user-settings"
  iam_id                 = var.iam_id
  allowed_ip_addresses   = var.allowed_ip_addresses
}

```
## NOTE:

If we want to make use of a particular version of module, then set the argument "version" to respective module version.

## Inputs

| Name                 | Description                                                      | Type         | Default | Required |
|----------------------|------------------------------------------------------------------|:-------------|:------- |:---------|
| iam_id               | iam_id or email address of the user                               | string       | n/a     | yes      |
| allowed_ip_addresses | Lists the IP addresses in common separated format.               | list(string) | n/a     | no       |


## Usage

To create access members group policy run the following command

  `terraform apply -var-file="input.tfvars"`

Similarly to to remove the access group policy run the command

   `terraform destroy -var-file="input.tfvars"`


NOTE : Do not specify arguments "account_management" and "resources" at the same time as both conflict with each other.

