# IBM IAM Terraform Module

This is a collection of modules that make it easier to provision a IAM resources on IBM Cloud Platform:

* access-group
* service-ids
* service-authorization
* custom-role
* users
* user-policy
* user-settings

## Compatibility

This module is meant for use with Terraform 0.13.

## Usage

Full examples are in the [examples](./examples/) folder, but basic usage is as follows for creation of access group and attaching members to it :

```hcl
provider "ibm" {
}

module "access_group" {
  // Uncomment following line to point the source to registry level module
  //source = "terraform-ibm-modules/iam/ibm//modules/access-group"

  source = "../../modules/access-group"

  ######### access group ######################
  name        = var.name
  tags        = var.tags
  description = var.description
  provision   = var.provision

  ######### access group members ##############
  ibm_ids     = var.ibm_ids
  service_ids = var.service_ids

  ######### access group policy ###############
  policies = var.policies

  ######### access group dynamic rule #########
  dynamic_rules = var.dynamic_rules
}

```
## NOTE:

If we want to make use of a particular version of module, then set the argument "version" to respective module version.

## Requirements

### Terraform plugins

- [Terraform](https://www.terraform.io/downloads.html) 0.13
- [terraform-provider-ibm](https://github.com/IBM-Cloud/terraform-provider-ibm)

## Install

### Terraform

Be sure you have the correct Terraform version (0.13), you can choose the binary here:
- https://releases.hashicorp.com/terraform/

### Terraform plugins

Be sure you have the compiled plugins on $HOME/.terraform.d/plugins/

- [terraform-provider-ibm](https://github.com/IBM-Cloud/terraform-provider-ibm)

### Pre-commit Hooks

Run the following command to execute the pre-commit hooks defined in `.pre-commit-config.yaml` file

  `pre-commit run -a`

We can install pre-coomit tool using

  `pip install pre-commit`

## How to input varaible values through a file

To review the plan for the configuration defined (no resources actually provisioned)

`terraform plan -var-file=./input.tfvars`

To execute and start building the configuration defined in the plan (provisions resources)

`terraform apply -var-file=./input.tfvars`

To destroy the VPC and all related resources

`terraform destroy -var-file=./input.tfvars`

All optional parameters by default will be set to null in respective example's varaible.tf file. If user wants to configure any optional paramter he has overwrite the default value.

## Note

All optional fields should be given value `null` in respective resource varaible.tf file. User can configure the same by overwriting with appropriate values.