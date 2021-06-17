package test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
)

func TestAccIBMCloudIAMServiceID(t *testing.T) {
	t.Parallel()

	// Construct the terraform options with default retryable errors to handle the most common retryable errors in
	// terraform testing.
	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		// The path to where our Terraform code is located
		TerraformDir: "../../examples/service-ids",

		Vars: map[string]interface{}{
			"name":        "sid",
			"tags":        []string{"T1", "T2"},
			"description": "creation of service id",
			"provision":   true,
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
		},
	})

	// At the end of the test, run `terraform destroy` to clean up any resources that were created
	defer terraform.Destroy(t, terraformOptions)

	// This will run `terraform init` and `terraform apply` and fail the test if there are any errors
	terraform.InitAndApply(t, terraformOptions)
}
