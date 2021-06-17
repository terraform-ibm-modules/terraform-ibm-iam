package test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
)

func TestAccIBMCloudIAMAccessGroup(t *testing.T) {
	t.Parallel()

	// Construct the terraform options with default retryable errors to handle the most common retryable errors in
	// terraform testing.
	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		// The path to where our Terraform code is located
		TerraformDir: "../../examples/access-group",

		Vars: map[string]interface{}{
			"name":        "n-ag",
			"tags":        []string{"T1", "T2"},
			"description": "creation of access group",
			"provision":   true,
			"ibm_ids":     []string{"hkantare@in.ibm.com"},
			"service_ids": []string{"ServiceId-8543541f-41ef-4e4d-a87f-ff50b2728cce", "ServiceId-cfc92f97-a2f5-49ab-b3ed-5fe6728bd004"},
			"policies": map[string]interface{}{
				"admin": map[string]interface{}{
					"roles":              []string{"Manager", "Viewer", "Editor"},
					"tags":               []string{"T1", "T2"},
					"account_management": nil,
					"resources": []interface{}{
						map[string]interface{}{
							"region":               "us-south",
							"service":              "containers-kubernetes",
							"resource_instance_id": "crn:v1:bluemix:public:containers-kubernetes:us-south:a/fcdb764102154c7ea8e1b79d3a64afe0:btgbsard0ss76j8snblg::",
							"resource_group_id":    "19e34037c9fe41e5aa9d682c9089b044",
							"resource_type":        nil,
							"resource":             nil,
							"attributes": map[string]interface{}{
								"namespace": "default",
							},
						},
					},

					"resource_attributes": []string{},
				},
			},
			"dynamic_rules": map[string]interface{}{
				"rule1": map[string]interface{}{
					"expiration":        2,
					"identity_provider": "test-idp.com",
					"rule_conditions": []interface{}{
						map[string]interface{}{
							"claim":    "blueGroups",
							"operator": "CONTAINS",
							"value":    "test-bluegroup-saml",
						},
						map[string]interface{}{
							"claim":    "blueGroups",
							"operator": "EQUALS",
							"value":    "test-bluegroup-saml",
						},
					},
				},

				"rule2": map[string]interface{}{
					"expiration":        1,
					"identity_provider": "test-idp.com",
					"rule_conditions": []interface{}{
						map[string]interface{}{
							"claim":    "blueGroups",
							"operator": "EQUALS",
							"value":    "test-bluegroup-saml",
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
