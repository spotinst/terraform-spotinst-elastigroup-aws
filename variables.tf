variable "spotinst_token" {
  type        = string
  description = "Spot Personal Access token"
}

variable "spotinst_account" {
  type        = string
  description = "Spot account ID"
}

variable "create_elastigroup" {
  type        = bool
  description = "Controls whether Elastigroup should be created (it affects all Elastigroup resources)"
  default     = true
}

variable "name" {
  type        = string
  description = "The name of the Elastigroup"
}

variable "description" {
  type        = string
  description = "The description of the Elastigroup"
  default     = null
}

variable "product" {
  type        = string
  description = "The type of the operating system"
}

variable "max_size" {
  type        = number
  description = "The maximum number of instances the Elastigroup should have at any time"
  default     = null
}

variable "min_size" {
  type        = number
  description = "The minimum number of instances the Elastigroup should have at any time"
  default     = null
}

variable "desired_capacity" {
  type        = number
  description = "The desired number of instances the Elastigroup should have at any time"
}

variable "capacity_unit" {
  type        = string
  description = "The capacity unit to launch instances by. If not specified, when choosing the weight unit, each instance will weight as the number of its vCPUs"
  default     = "instance"
}

variable "region" {
  type        = string
  description = "The AWS region your Elastigroup will be created in [optional if you specify availability zones (through `availability_zones`) / required if you specify subnets (through `subnet_ids`)]"
  default     = null
}

variable "image_id" {
  type        = string
  description = "The ID of the AMI used to launch the instance"
}

variable "enable_monitoring" {
  type        = bool
  description = "Indicates whether monitoring is enabled for the instance"
}

variable "ebs_optimized" {
  type        = bool
  description = "Enable high bandwidth connectivity between instances and AWS's Elastic Block Store (EBS). For instance types that are EBS-optimized by default this parameter will be ignored"
  default     = null
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

variable "instance_types_preferred_spot" {
  type        = list(string)
  description = "Prioritize a subset of Spot instance types. Must be a subset of the selected spot instance types"
  default     = null
}

variable "orientation" {
  type        = string
  description = "The type of the prediction strategy"
  default     = "balanced"
}

variable "cpu_credits" {
  type        = string
  description = "Controls how T3 instances are launched"
  default     = null
}

variable "fallback_to_ondemand" {
  type        = bool
  description = "Indicates whether On-Demand instances should be used in the event that no Spot instances are available"
  default     = true
}

variable "utilize_reserved_instances" {
  type        = bool
  description = "Indicates whether Reserved instances should be used first before purchasing Spot instances"
  default     = true
}

variable "spot_percentage" {
  type        = number
  description = "The percentage of Spot instances that would spin up from the `desired_capacity` number"
  default     = null
}

variable "elastic_ips" {
  type        = list(string)
  description = "List of AWS Elastic IP allocation IDs to associate with the instances"
  default     = null
}

variable "key_name" {
  type        = string
  description = "The key name that should be used for the instances"
  default     = null
}

variable "user_data" {
  type        = string
  description = "The user data to provide when launching the instances"
  default     = null
}

variable "placement_tenancy" {
  type        = string
  description = "Enable dedicated tenancy. Note: There is a flat hourly fee for each region in which dedicated tenancy is used"
  default     = null
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
