# IBM IAM Terraform Module

---

## Module archived

:spider_web: This repo is no longer maintained and is archived. Use the [IBM Cloud Provider](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs) resources directly to create IAM resources, or use one of following public modules if you consume the module from GitHub: 
- [terraform-ibm-iam-service-id](https://github.com/terraform-ibm-modules/terraform-ibm-iam-service-id)
- [terraform-ibm-iam-access-group](https://github.com/terraform-ibm-modules/terraform-ibm-iam-access-group)

## Changes if you use the Hashicorp registry

:exclamation: **Important:**  This module will be deleted from the Hashicorp registry on 1 September 2023. 

If you consume the [access-group](https://github.com/terraform-ibm-modules/terraform-ibm-iam/tree/main/modules/access-group) or [service-ids](https://github.com/terraform-ibm-modules/terraform-ibm-iam/tree/main/modules/service-ids) submodules from the Hashicorp registry, use one of these instead:
- [iam-service-id](https://registry.terraform.io/modules/terraform-ibm-modules/iam-service-id/ibm/latest)
- [iam-access-group](https://registry.terraform.io/modules/terraform-ibm-modules/iam-access-group/ibm/latest)

---

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
