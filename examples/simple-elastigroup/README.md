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

No provider.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| desired\_capacity | The desired number of instances the Elastigroup should have at any time | `number` | n/a | yes |
| enable\_monitoring | Indicates whether monitoring is enabled for the instance | `bool` | n/a | yes |
| image\_id | The ID of the AMI used to launch the instance | `string` | n/a | yes |
| instance\_types\_ondemand | The type of instance determines your instance's CPU capacity, memory and storage (e.g., m1.small, c1.xlarge) | `string` | n/a | yes |
| instance\_types\_spot | List of Spot instance types | `list(string)` | n/a | yes |
| name | The name of the Elastigroup | `string` | n/a | yes |
| product | The type of the operating system | `string` | n/a | yes |
| region | The AWS region your Elastigroup will be created in [optional if you specify availability zones (through `availability_zones`) / required if you specify subnets (through `subnet_ids`)] | `string` | n/a | yes |
| scaling\_down\_policies | List of `scaling_down_policy` objects, see: https://registry.terraform.io/providers/spotinst/spotinst/latest/docs/resources/elastigroup_aws#scaling-policies | `list(any)` | `[]` | no |
| scaling\_up\_policies | List of `scaling_up_policy` objects, see: https://registry.terraform.io/providers/spotinst/spotinst/latest/docs/resources/elastigroup_aws#scaling-policies | `list(any)` | `[]` | no |
| scheduled\_tasks | List of `scheduled_task` objects, see: https://registry.terraform.io/providers/spotinst/spotinst/latest/docs/resources/elastigroup_aws#scheduled-tasks | `list(any)` | `[]` | no |
| security\_groups | List of associated security group identifiers | `list(string)` | n/a | yes |
| spotinst\_account | Spot account ID | `string` | n/a | yes |
| spotinst\_token | Spot Personal Access token | `string` | n/a | yes |
| subnet\_ids | List of subnet identifiers | `list(string)` | n/a | yes |
| tags | List of key/value mapping of tags to assign to the resource | `list(any)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| elastigroup\_id | n/a |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
