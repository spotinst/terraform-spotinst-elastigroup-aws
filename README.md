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
| terraform | >= 0.12.26 |
| spotinst | >= 1.27.0 |

## Providers

| Name | Version |
|------|---------|
| spotinst | >= 1.27.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| capacity\_unit | The capacity unit to launch instances by. If not specified, when choosing the weight unit, each instance will weight as the number of its vCPUs | `string` | `"instance"` | no |
| cpu\_credits | Controls how T3 instances are launched | `string` | `null` | no |
| create\_elastigroup | Controls whether Elastigroup should be created (it affects all Elastigroup resources) | `bool` | `true` | no |
| description | The description of the Elastigroup | `string` | `null` | no |
| desired\_capacity | The desired number of instances the Elastigroup should have at any time | `number` | n/a | yes |
| ebs\_optimized | Enable high bandwidth connectivity between instances and AWS's Elastic Block Store (EBS). For instance types that are EBS-optimized by default this parameter will be ignored | `bool` | `null` | no |
| elastic\_ips | List of AWS Elastic IP allocation IDs to associate with the instances | `list(string)` | `null` | no |
| enable\_monitoring | Indicates whether monitoring is enabled for the instance | `bool` | n/a | yes |
| fallback\_to\_ondemand | Indicates whether On-Demand instances should be used in the event that no Spot instances are available | `bool` | `true` | no |
| image\_id | The ID of the AMI used to launch the instance | `string` | n/a | yes |
| instance\_types\_ondemand | The type of instance determines your instance's CPU capacity, memory and storage (e.g., m1.small, c1.xlarge) | `string` | n/a | yes |
| instance\_types\_preferred\_spot | Prioritize a subset of Spot instance types. Must be a subset of the selected spot instance types | `list(string)` | `null` | no |
| instance\_types\_spot | List of Spot instance types | `list(string)` | n/a | yes |
| key\_name | The key name that should be used for the instances | `string` | `null` | no |
| max\_size | The maximum number of instances the Elastigroup should have at any time | `number` | `null` | no |
| min\_size | The minimum number of instances the Elastigroup should have at any time | `number` | `null` | no |
| name | The name of the Elastigroup | `string` | n/a | yes |
| orientation | The type of the prediction strategy | `string` | `"balanced"` | no |
| placement\_tenancy | Enable dedicated tenancy. Note: There is a flat hourly fee for each region in which dedicated tenancy is used | `string` | `null` | no |
| product | The type of the operating system | `string` | n/a | yes |
| region | The AWS region your Elastigroup will be created in [optional if you specify availability zones (through `availability_zones`) / required if you specify subnets (through `subnet_ids`)] | `string` | `null` | no |
| scaling\_down\_policies | List of `scaling_down_policy` objects, see: https://registry.terraform.io/providers/spotinst/spotinst/latest/docs/resources/elastigroup_aws#scaling-policies | `list(any)` | `[]` | no |
| scaling\_up\_policies | List of `scaling_up_policy` objects, see: https://registry.terraform.io/providers/spotinst/spotinst/latest/docs/resources/elastigroup_aws#scaling-policies | `list(any)` | `[]` | no |
| scheduled\_tasks | List of `scheduled_task` objects, see: https://registry.terraform.io/providers/spotinst/spotinst/latest/docs/resources/elastigroup_aws#scheduled-tasks | `list(any)` | `[]` | no |
| security\_groups | List of associated security group identifiers | `list(string)` | n/a | yes |
| spot\_percentage | The percentage of Spot instances that would spin up from the `desired_capacity` number | `number` | `null` | no |
| spotinst\_account | Spot account ID | `string` | n/a | yes |
| spotinst\_token | Spot Personal Access token | `string` | n/a | yes |
| subnet\_ids | List of subnet identifiers | `list(string)` | n/a | yes |
| tags | List of key/value mapping of tags to assign to the resource | `list(any)` | `[]` | no |
| user\_data | The user data to provide when launching the instances | `string` | `null` | no |
| utilize\_reserved\_instances | Indicates whether Reserved instances should be used first before purchasing Spot instances | `bool` | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| elastigroup\_id | The ID of the Elastigroup |

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
