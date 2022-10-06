# Spot Elastigroup Terraform Module

A Terraform module to create a Spot Elastigroup in AWS.

## Table of Contents

- [Usage](#usage)
- [Examples](#examples)
- [Resources](#resources)
- [Requirements](#requirements)
- [Providers](#providers)
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

  # Configuration.
  name                    = "terraform_test"
  subnet_ids              = ["subnet-123456789", "subnet-123456789", "subnet-123456789"]
  region                  = "us-west-2"
  security_groups         = ["sg-123456789", "sg-123456789"]
  instance_types_ondemand = "t3.large"
  instance_types_spot     = ["t3.large"]
  max_size                = 1
  image_id                = "ami-123456789"
}
```

## Examples

- [Simple Elastigroup](https://github.com/spotinst/terraform-spotinst-elastigroup-aws/tree/master/examples/)

## Resources

This module creates and manages the following resources:

- spotinst_elastigroup_aws

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_spotinst"></a> [spotinst](#provider\_spotinst) | >= 1.78.0 |

## Resources

| Name | Type |
|------|------|
| [spotinst_elastigroup_aws.this](https://registry.terraform.io/providers/spotinst/spotinst/latest/docs/resources/elastigroup_aws) | resource |


## Outputs

| Name | Description |
|------|-------------|
| <a name="output_elastigroup_id"></a> [elastigroup\_id](#output\_elastigroup\_id) | The ID of the Elastigroup |

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
