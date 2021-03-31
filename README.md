# Spot Elastigroup Terraform Module

A Terraform module to create a Spot Elastigroup in AWS.

## Table of Contents

- [Usage](#usage)
- [Examples](#examples)
- [Resources](#resources)
- [Requirements](#requirements)
- [Providers](#providers)
- [Inputs](#inputs)
- [Outputs](#outputs)
- [Documentation](#documentation)
- [Getting Help](#getting-help)
- [Community](#community)
- [Contributing](#contributing)
- [License](#license)

## Usage

```hcl
module "elastigroup-aws" {
  source = "github.com/spotinst/terraform-spotinst-elastigroup-aws"

  # Credentials.
  spotinst_token   = var.spotinst_token
  spotinst_account = var.spotinst_account

  # Configuration.
  name                    = var.name
  product                 = var.product
  desired_capacity        = var.desired_capacity
  region                  = var.region
  image_id                = var.image_id
  enable_monitoring       = var.enable_monitoring
  subnet_ids              = var.subnet_ids
  security_groups         = var.security_groups
  instance_types_ondemand = var.instance_types_ondemand
  instance_types_spot     = var.instance_types_spot
}
```

## Examples

- [Simple Elastigroup](https://github.com/spotinst/terraform-spotinst-elastigroup-aws/tree/master/examples/simple-elastigroup)

## Resources

This module creates and manages the following resources:

- spotinst_elastigroup_aws

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12.26 |
| <a name="requirement_spotinst"></a> [spotinst](#requirement\_spotinst) | >= 1.27.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_spotinst"></a> [spotinst](#provider\_spotinst) | >= 1.27.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [spotinst_elastigroup_aws.this](https://registry.terraform.io/providers/spotinst/spotinst/latest/docs/resources/elastigroup_aws) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_capacity_unit"></a> [capacity\_unit](#input\_capacity\_unit) | The capacity unit to launch instances by. If not specified, when choosing the weight unit, each instance will weight as the number of its vCPUs | `string` | `"instance"` | no |
| <a name="input_cpu_credits"></a> [cpu\_credits](#input\_cpu\_credits) | Controls how T3 instances are launched | `string` | `null` | no |
| <a name="input_create_elastigroup"></a> [create\_elastigroup](#input\_create\_elastigroup) | Controls whether Elastigroup should be created (it affects all Elastigroup resources) | `bool` | `true` | no |
| <a name="input_description"></a> [description](#input\_description) | The description of the Elastigroup | `string` | `null` | no |
| <a name="input_desired_capacity"></a> [desired\_capacity](#input\_desired\_capacity) | The desired number of instances the Elastigroup should have at any time | `number` | n/a | yes |
| <a name="input_ebs_optimized"></a> [ebs\_optimized](#input\_ebs\_optimized) | Enable high bandwidth connectivity between instances and AWS's Elastic Block Store (EBS). For instance types that are EBS-optimized by default this parameter will be ignored | `bool` | `null` | no |
| <a name="input_elastic_ips"></a> [elastic\_ips](#input\_elastic\_ips) | List of AWS Elastic IP allocation IDs to associate with the instances | `list(string)` | `null` | no |
| <a name="input_enable_monitoring"></a> [enable\_monitoring](#input\_enable\_monitoring) | Indicates whether monitoring is enabled for the instance | `bool` | n/a | yes |
| <a name="input_fallback_to_ondemand"></a> [fallback\_to\_ondemand](#input\_fallback\_to\_ondemand) | Indicates whether On-Demand instances should be used in the event that no Spot instances are available | `bool` | `true` | no |
| <a name="input_image_id"></a> [image\_id](#input\_image\_id) | The ID of the AMI used to launch the instance | `string` | n/a | yes |
| <a name="input_instance_types_ondemand"></a> [instance\_types\_ondemand](#input\_instance\_types\_ondemand) | The type of instance determines your instance's CPU capacity, memory and storage (e.g., m1.small, c1.xlarge) | `string` | n/a | yes |
| <a name="input_instance_types_preferred_spot"></a> [instance\_types\_preferred\_spot](#input\_instance\_types\_preferred\_spot) | Prioritize a subset of Spot instance types. Must be a subset of the selected spot instance types | `list(string)` | `null` | no |
| <a name="input_instance_types_spot"></a> [instance\_types\_spot](#input\_instance\_types\_spot) | List of Spot instance types | `list(string)` | n/a | yes |
| <a name="input_key_name"></a> [key\_name](#input\_key\_name) | The key name that should be used for the instances | `string` | `null` | no |
| <a name="input_max_size"></a> [max\_size](#input\_max\_size) | The maximum number of instances the Elastigroup should have at any time | `number` | `null` | no |
| <a name="input_min_size"></a> [min\_size](#input\_min\_size) | The minimum number of instances the Elastigroup should have at any time | `number` | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the Elastigroup | `string` | n/a | yes |
| <a name="input_orientation"></a> [orientation](#input\_orientation) | The type of the prediction strategy | `string` | `"balanced"` | no |
| <a name="input_placement_tenancy"></a> [placement\_tenancy](#input\_placement\_tenancy) | Enable dedicated tenancy. Note: There is a flat hourly fee for each region in which dedicated tenancy is used | `string` | `null` | no |
| <a name="input_product"></a> [product](#input\_product) | The type of the operating system | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | The AWS region your Elastigroup will be created in [optional if you specify availability zones (through `availability_zones`) / required if you specify subnets (through `subnet_ids`)] | `string` | `null` | no |
| <a name="input_scaling_down_policies"></a> [scaling\_down\_policies](#input\_scaling\_down\_policies) | List of `scaling_down_policy` objects, see: https://registry.terraform.io/providers/spotinst/spotinst/latest/docs/resources/elastigroup_aws#scaling-policies | `list(any)` | `[]` | no |
| <a name="input_scaling_up_policies"></a> [scaling\_up\_policies](#input\_scaling\_up\_policies) | List of `scaling_up_policy` objects, see: https://registry.terraform.io/providers/spotinst/spotinst/latest/docs/resources/elastigroup_aws#scaling-policies | `list(any)` | `[]` | no |
| <a name="input_scheduled_tasks"></a> [scheduled\_tasks](#input\_scheduled\_tasks) | List of `scheduled_task` objects, see: https://registry.terraform.io/providers/spotinst/spotinst/latest/docs/resources/elastigroup_aws#scheduled-tasks | `list(any)` | `[]` | no |
| <a name="input_security_groups"></a> [security\_groups](#input\_security\_groups) | List of associated security group identifiers | `list(string)` | n/a | yes |
| <a name="input_spot_percentage"></a> [spot\_percentage](#input\_spot\_percentage) | The percentage of Spot instances that would spin up from the `desired_capacity` number | `number` | `null` | no |
| <a name="input_spotinst_account"></a> [spotinst\_account](#input\_spotinst\_account) | Spot account ID | `string` | n/a | yes |
| <a name="input_spotinst_token"></a> [spotinst\_token](#input\_spotinst\_token) | Spot Personal Access token | `string` | n/a | yes |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | List of subnet identifiers | `list(string)` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | List of key/value mapping of tags to assign to the resource | `list(any)` | `[]` | no |
| <a name="input_user_data"></a> [user\_data](#input\_user\_data) | The user data to provide when launching the instances | `string` | `null` | no |
| <a name="input_utilize_reserved_instances"></a> [utilize\_reserved\_instances](#input\_utilize\_reserved\_instances) | Indicates whether Reserved instances should be used first before purchasing Spot instances | `bool` | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_elastigroup_id"></a> [elastigroup\_id](#output\_elastigroup\_id) | The ID of the Elastigroup |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Documentation

If you're new to [Spot](https://spot.io/) and want to get started, please checkout our [Getting Started](https://docs.spot.io/connect-your-cloud-provider/) guide, available on the [Spot Documentation](https://docs.spot.io/) website.

## Getting Help

We use GitHub issues for tracking bugs and feature requests. Please use these community resources for getting help:

- Ask a question on [Stack Overflow](https://stackoverflow.com/) and tag it with [terraform-spotinst](https://stackoverflow.com/questions/tagged/terraform-spotinst/).
- Join our [Spot](https://spot.io/) community on [Slack](http://slack.spot.io/).
- Open an issue.

## Community

- [Slack](http://slack.spot.io/)
- [Twitter](https://twitter.com/spot_hq/)

## Contributing

Please see the [contribution guidelines](CONTRIBUTING.md).

## License

Code is licensed under the [Apache License 2.0](LICENSE).
