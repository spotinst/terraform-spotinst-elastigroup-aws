variable "spotinst_token" {
  type        = string
  description = "Spot Personal Access token"
}

variable "spotinst_account" {
  type        = string
  description = "Spot account ID"
}

variable "name" {
  type        = string
  description = "The name of the Elastigroup"
}

variable "product" {
  type        = string
  description = "The type of the operating system"
}

variable "desired_capacity" {
  type        = number
  description = "The desired number of instances the Elastigroup should have at any time"
}

variable "region" {
  type        = string
  description = "The AWS region your Elastigroup will be created in [optional if you specify availability zones (through `availability_zones`) / required if you specify subnets (through `subnet_ids`)]"
}

variable "image_id" {
  type        = string
  description = "The ID of the AMI used to launch the instance"
}

variable "enable_monitoring" {
  type        = bool
  description = "Indicates whether monitoring is enabled for the instance"
}

variable "subnet_ids" {
  type        = list(string)
  description = "List of subnet identifiers"
}

variable "security_groups" {
  type        = list(string)
  description = "List of associated security group identifiers"
}

variable "instance_types_ondemand" {
  type        = string
  description = "The type of instance determines your instance's CPU capacity, memory and storage (e.g., m1.small, c1.xlarge)"
}

variable "instance_types_spot" {
  type        = list(string)
  description = "List of Spot instance types"
}

variable "tags" {
  type        = list(any)
  description = "List of key/value mapping of tags to assign to the resource"
  default     = []
}

variable "scheduled_tasks" {
  type        = list(any)
  description = "List of `scheduled_task` objects, see: https://registry.terraform.io/providers/spotinst/spotinst/latest/docs/resources/elastigroup_aws#scheduled-tasks"
  default     = []
}

variable "scaling_up_policies" {
  type        = list(any)
  description = "List of `scaling_up_policy` objects, see: https://registry.terraform.io/providers/spotinst/spotinst/latest/docs/resources/elastigroup_aws#scaling-policies"
  default     = []
}

variable "scaling_down_policies" {
  type        = list(any)
  description = "List of `scaling_down_policy` objects, see: https://registry.terraform.io/providers/spotinst/spotinst/latest/docs/resources/elastigroup_aws#scaling-policies"
  default     = []
}
