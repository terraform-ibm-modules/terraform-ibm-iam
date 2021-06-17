package test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
)

func TestAccIBMCloudIAMUserPolicyAccountManagement(t *testing.T) {
	t.Parallel()
	// Construct the terraform options with default retryable errors to handle the most common retryable errors in
	// terraform testing.
	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		// The path to where our Terraform code is located
		TerraformDir: "../../examples/user-policy-configure-account-management",
		Vars: map[string]interface{}{
			"ibm_id":             "anilkumar@in.ibm.com",
			"tags":               []string{"T8", "T6"},
			"roles":              []string{"Editor"},
			"account_management": false,
		},
	})
	// At the end of the test, run `terraform destroy` to clean up any resources that were created
	defer terraform.Destroy(t, terraformOptions)
	// This will run `terraform init` and `terraform apply` and fail the test if there are any errors
	terraform.InitAndApply(t, terraformOptions)
}
