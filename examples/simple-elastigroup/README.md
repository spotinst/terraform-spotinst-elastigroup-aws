# Simple Elastigroup

This example illustrates how to create an Elastigroup.

## Usage

To provision this example, run the following from within this directory:
- `terraform init` to get the plugins
- `terraform plan` to see the infrastructure plan
- `terraform apply` to apply the infrastructure build
- `terraform destroy` to destroy the built infrastructure

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_elastigroup-aws"></a> [elastigroup-aws](#module\_elastigroup-aws) | ../.. |  |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_desired_capacity"></a> [desired\_capacity](#input\_desired\_capacity) | The desired number of instances the Elastigroup should have at any time | `number` | n/a | yes |
| <a name="input_enable_monitoring"></a> [enable\_monitoring](#input\_enable\_monitoring) | Indicates whether monitoring is enabled for the instance | `bool` | n/a | yes |
| <a name="input_image_id"></a> [image\_id](#input\_image\_id) | The ID of the AMI used to launch the instance | `string` | n/a | yes |
| <a name="input_instance_types_ondemand"></a> [instance\_types\_ondemand](#input\_instance\_types\_ondemand) | The type of instance determines your instance's CPU capacity, memory and storage (e.g., m1.small, c1.xlarge) | `string` | n/a | yes |
| <a name="input_instance_types_spot"></a> [instance\_types\_spot](#input\_instance\_types\_spot) | List of Spot instance types | `list(string)` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | The name of the Elastigroup | `string` | n/a | yes |
| <a name="input_product"></a> [product](#input\_product) | The type of the operating system | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | The AWS region your Elastigroup will be created in [optional if you specify availability zones (through `availability_zones`) / required if you specify subnets (through `subnet_ids`)] | `string` | n/a | yes |
| <a name="input_scaling_down_policies"></a> [scaling\_down\_policies](#input\_scaling\_down\_policies) | List of `scaling_down_policy` objects, see: https://registry.terraform.io/providers/spotinst/spotinst/latest/docs/resources/elastigroup_aws#scaling-policies | `list(any)` | `[]` | no |
| <a name="input_scaling_up_policies"></a> [scaling\_up\_policies](#input\_scaling\_up\_policies) | List of `scaling_up_policy` objects, see: https://registry.terraform.io/providers/spotinst/spotinst/latest/docs/resources/elastigroup_aws#scaling-policies | `list(any)` | `[]` | no |
| <a name="input_scheduled_tasks"></a> [scheduled\_tasks](#input\_scheduled\_tasks) | List of `scheduled_task` objects, see: https://registry.terraform.io/providers/spotinst/spotinst/latest/docs/resources/elastigroup_aws#scheduled-tasks | `list(any)` | `[]` | no |
| <a name="input_security_groups"></a> [security\_groups](#input\_security\_groups) | List of associated security group identifiers | `list(string)` | n/a | yes |
| <a name="input_spotinst_account"></a> [spotinst\_account](#input\_spotinst\_account) | Spot account ID | `string` | n/a | yes |
| <a name="input_spotinst_token"></a> [spotinst\_token](#input\_spotinst\_token) | Spot Personal Access token | `string` | n/a | yes |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | List of subnet identifiers | `list(string)` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | List of key/value mapping of tags to assign to the resource | `list(any)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_elastigroup_id"></a> [elastigroup\_id](#output\_elastigroup\_id) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
