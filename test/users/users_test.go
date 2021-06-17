package test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
)

func TestAccIBMCloudIAMUsers(t *testing.T) {
	t.Parallel()

	// Construct the terraform options with default retryable errors to handle the most common retryable errors in
	// terraform testing.
	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		// The path to where our Terraform code is located
		TerraformDir: "../../examples/users",

		Vars: map[string]interface{}{
			"user_email_addresses": []string{"anilkumar@in.ibm.com"},
			"access_groups":        []string{"AccessGroupId-8a45c393-c90d-43c8-ae26-6376acfabf4a", "AccessGroupId-3199ff70-fb03-4fde-8ef4-83e52f523140"},
			"iam_policies": []interface{}{
				map[string]interface{}{
					"roles":                          []string{"Manager", "Viewer", "Administrator"},
					"account_management":             false,
					"resources_service":              "cloud-object-storage",
					"resources_resource_instance_id": "crn:v1:bluemix:public:cloud-object-storage:global:a/fcdb764102154c7ea8e1b79d3a64afe0:fc0d5e13-bdc0-4bbb-a20f-d5a567ca8731::",
					"resources_region":               nil,
					"resources_resource_type":        "resource-group",
					"resources_resource":             "19e34037c9fe41e5aa9d682c9089b044",
					"resources_resource_group_id":    "19e34037c9fe41e5aa9d682c9089b044",
					"resources_attributes":           nil,
				},
			},
			"classic_infra_roles_permissions":    []string{"PORT_CONTROL", "DATACENTER_ACCESS"},
			"classic_infra_roles_permission_set": "superuser",
			"cloud_foundry_roles": []interface{}{
				map[string]interface{}{
					"organization_guid": "02260e9d-3334-4933-bdef-458cb3e80143",
					"org_roles":         []string{"Manager", "Auditor"},
					"spaces": []interface{}{
						map[string]interface{}{
							"space_guid":  "80f28d3b-7d4e-4294-b0fd-071dcc5b0482",
							"space_roles": []string{"Manager", "Developer"},
						},
					},
				},
			},
		},
	})

	// At the end of the test, run `terraform destroy` to clean up any resources that were created
	defer terraform.Destroy(t, terraformOptions)

	// This will run `terraform init` and `terraform apply` and fail the test if there are any errors
	terraform.InitAndApply(t, terraformOptions)
}
