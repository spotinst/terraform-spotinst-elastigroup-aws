variable "name" {
  type        = string
  description = "The group name."
}
variable "description" {
  type        = string
  default     = null
  description = "The group description."
}
variable "product" {
  type        = string
  default     = "Linux/UNIX"
  description = "Operation system type. Valid values: \"Linux/UNIX\", \"SUSE Linux\", \"Windows\". For EC2 Classic instances: \"Linux/UNIX (Amazon VPC)\", \"SUSE Linux (Amazon VPC)\", \"Windows (Amazon VPC)\"."
}
variable "subnet_ids" {
  type        = list(string)
  default     = null
  description = " List of Strings of subnet identifiers. Note: When this parameter is set, availability_zones should be left unused."
}
variable "region" {
  type        = string
  default     = null
  description = "The AWS region your group will be created in. Note: This parameter is required if you specify subnets (through subnet_ids). This parameter is optional if you specify Availability Zones (through availability_zones)."
}
variable "preferred_availability_zones" {
  type        = list(string)
  default     = null
  description = "The AZs to prioritize when launching Spot instances. If no markets are available in the Preferred AZs, Spot instances are launched in the non-preferred AZs. Note: Must be a sublist of availability_zones and orientation value must not be \"equalAzDistribution\"."
}
variable "max_size" {
  type        = number
  default     = null
  description = "The maximum number of instances the group should have at any time."
}
variable "min_size" {
  type        = number
  default     = null
  description = "The minimum number of instances the group should have at any time."
}
variable "desired_capacity" {
  type        = number
  default     = 1
  description = "The desired number of instances the group should have at any time."
}
variable "capacity_unit" {
  type        = string
  default     = "instance"
  description = "Default: instance) The capacity unit to launch instances by. If not specified, when choosing the weight unit, each instance will weight as the number of its vCPUs. Valid values: instance, weight."
}
variable "security_groups" {
  type        = list(string)
  description = "A list of associated security group IDS."
}
variable "image_id" {
  type        = string
  default     = null
  description = "The ID of the AMI used to launch the instance."
}
variable "iam_instance_profile" {
  type        = string
  default     = null
  description = "The ARN or name of an IAM instance profile to associate with launched instances."
}
variable "key_name" {
  type        = string
  default     = null
  description = "The key name that should be used for the instance."
}
variable "enable_monitoring" {
  type        = bool
  default     = false
  description = "Indicates whether monitoring is enabled for the instance."
}
variable "user_data" {
  type        = string
  default     = null
  description = "The user data to provide when launching the instance."
}
variable "shutdown_script" {
  type        = string
  default     = null
  description = "The Base64-encoded shutdown script that executes prior to instance termination, for more information please see: Shutdown Script"
}
variable "ebs_optimized" {
  type        = bool
  default     = true
  description = "Enable high bandwidth connectivity between instances and AWS’s Elastic Block Store (EBS). For instance types that are EBS-optimized by default this parameter will be ignored."
}
variable "placement_tenancy" {
  type        = string
  default     = "default"
  description = "Default: \"default\". Enable dedicated tenancy. Note: There is a flat hourly fee for each region in which dedicated tenancy is used. Valid values: \"default\", \"dedicated\" ."
}
## metadata_options ##
variable "http_tokens" {
  type        = string
  default     = null
  description = "The state of token usage for your instance metadata requests. Valid values: optional or required."
}
variable "http_put_response_hop_limit" {
  type        = number
  default     = null
  description = "Default: 1. The desired HTTP PUT response hop limit for instance metadata requests. The larger the number, the further instance metadata requests can travel. Valid values: Integers from 1 to 64."
}
variable "instance_metadata_tags" {
  type        = string
  default     = "disabled"
  description = "Indicates whether access to instance tags from the instance metadata is enabled or disabled. Can’t be null."
}

## cpu_options ##
variable "threads_per_core" {
  type        = number
  default     = null
  description = "The ability to define the number of threads per core in instances that allow this."
}
####

variable "instance_types_ondemand" {
  type        = string
  description = "The type of instance determines your instance's CPU capacity, memory and storage (e.g., m1.small, c1.xlarge)."
}
variable "instance_types_spot" {
  type        = list(string)
  default     = null
  description = "One or more instance types."
}
variable "instance_types_preferred_spot" {
  type        = list(string)
  default     = null
  description = "Prioritize a subset of spot instance types. Must be a subset of the selected spot instance types."
}

variable "instance_types_ondemand_types" {
  type        = list(string)
  default     = null
  description = "Available on demand instance types. Note: Either ondemand or onDemandTypes must be defined, but not both."
}

variable "instance_types_weights" {
  type            = list(object({
    weight        = number
    instance_type = string
  }))
  default         = null
  description     = "List of weights per instance type for weighted groups. "
}

variable "cpu_credits" {
  type        = string
  default     = null
  description = "Controls how T3 instances are launched. Valid values: standard, unlimited."
}
variable "fallback_to_ondemand" {
  type        = bool
  default     = true
  description = "In a case of no Spot instances available, Elastigroup will launch on-demand instances instead."
}
variable "wait_for_capacity" {
  type        = number
  default     = null
  description = "Minimum number of instances in a 'HEALTHY' status that is required before continuing. This is ignored when updating with blue/green deployment. Cannot exceed desired_capacity."
}
variable "wait_for_capacity_timeout" {
  type        = number
  default     = null
  description = "Time (seconds) to wait for instances to report a 'HEALTHY' status. Useful for plans with multiple dependencies that take some time to initialize. Leave undefined or set to 0 to indicate no wait. This is ignored when updating with blue/green deployment."
}
variable "orientation" {
  type        = string
  default     = "balanced"
  description = " Default: balanced. Select a prediction strategy. Valid values: balanced, costOriented, equalAzDistribution, availabilityOriented. You can read more in our documentation."
}
variable "spot_percentage" {
  type        = number
  default     = 100
  description = "The percentage of Spot instances that would spin up from the desired_capacity number."
}
variable "draining_timeout" {
  type        = number
  default     = 120
  description = "The time in seconds, the instance is allowed to run while detached from the ELB. This is to allow the instance time to be drained from incoming TCP connections before terminating it, during a scale down operation."
}
variable "immediate_od_recover_threshold" {
  type        = number
  default     = null
  description = ""
}
variable "utilize_reserved_instances" {
  type        = bool
  default     = true
  description = "In a case of any available reserved instances, Elastigroup will utilize them first before purchasing Spot instances."
}
variable "utilize_commitments" {
  type        = bool
  default     = true
  description = "If there are available Reserved Instances or Savings Plans, Elastigroup will utilize them before using Spot instances."
}
variable "ondemand_count" {
  type        = number
  default     = null
  description = "Minimum number of instances that will always be on-demand."
}
variable "consider_od_pricing" {
  type        = bool
  default     = false
  description = "When the value is set to true, Elastigroup will prioritize launching On-Demand instances if they are found to be more cost-effective than available Spot markets."
}
variable "restrict_single_az" {
  type          = bool
  default       = false
  description   = "Elastigroup will automatically scale your instances in the most available and cost efficient availability zone."
}
variable "minimum_instance_lifetime" {
  type        = number
  default     = null
  description = "Defines the preferred minimum instance lifetime in hours. Markets which comply with this preference will be prioritized. Optional values: 1, 3, 6, 12, 24."
}
## scaling_strategy ##
variable "terminate_at_end_of_billing_hour" {
  type        = string
  default     = null
  description = "Specify whether to terminate instances at the end of each billing hour."
}
variable "termination_policy" {
  type        = string
  default     = null
  description = "Determines whether to terminate the newest instances when performing a scaling action. Valid values: \"default\", \"newestInstance\"."
}
###

## health check ##
variable "health_check_type" {
  type        = string
  default     = null
  description = "The service that will perform health checks for the instance. Valid values: \"ELB\", \"HCS\", \"TARGET_GROUP\", \"MLB\", \"EC2\", \"MULTAI_TARGET_SET\", \"MLB_RUNTIME\", \"K8S_NODE\", \"NOMAD_NODE\", \"ECS_CLUSTER_INSTANCE\"."
}
variable "health_check_grace_period" {
  type        = number
  default     = 300
  description = "The amount of time, in seconds, after the instance has launched to starts and check its health."
}
variable "health_check_unhealthy_duration_before_replacement" {
  type        = number
  default     = null
  description = "The amount of time, in seconds, that we will wait before replacing an instance that is running and became unhealthy (this is only applicable for instances that were once healthy)."
}
variable "auto_healing" {
  type  =  bool
  default = true
  description = "Auto-healing replacement won't be triggered if this parameter value is `false`"
}
##########

variable "tags" {
  type            = map(string)
  default         = null
  description     = "Additional Tags to be added to resources"
}
variable "elastic_ips" {
  type            = list(string)
  default         = null
  description     = "A list of AWS Elastic IP allocation IDs to associate to the group instances."
}
variable "revert_to_spot" {
  type            = object({
    perform_at    = string
    time_windows  = list(string)
  })
  default         = null
  description     = "Hold settings for strategy correction – replacing On-Demand for Spot instances."
}

# resourceTagSpecification
variable "should_tag_enis" {
  type        = string
  default     = null
  description = "Tag specification for ENI resources."
}
variable "should_tag_volumes" {
  type        = string
  default     = null
  description = "Tag specification for Volume resources."
}
variable "should_tag_snapshots" {
  type        = string
  default     = null
  description = "Tag specification for Snapshot resources."
}
variable "should_tag_amis" {
  type            = string
  default         = null
  description     = "Tag specification for AMI resources."
}
variable "elastic_load_balancers" {
  type            = list(string)
  default         = null
  description     = "List of Elastic Load Balancers names."
}
variable "target_group_arns" {
  type            = list(string)
  default         = null
  description     = "List of Target Group ARNs to register the instances to."
}

variable "signal" {
  type        = list(object({
    name      = string
    timeout   = number
  }))
  default     = null
  description = "Signal object."
}
# task scheduling #
variable "scheduled_task" {
  type = list(object({
    task_type               = string
    cron_expression         = string
    start_time              = string
    frequency               = string
    scale_target_capacity   = number
    scale_min_capacity      = number
    scale_max_capacity      = number
    is_enabled              = bool
    target_capacity         = number
    min_capacity            = number
    max_capacity            = number
    batch_size_percentage   = number
    grace_period            = number
    adjustment              = number
    adjustment_percentage   = number
  }))
  default                   = null
  description               = "scheduled task object"
}

variable "scaling_up_policy" {
  type = list(object({
    policy_name           = optional(string,null)
    metric_name           = optional(string,null)
    statistic             = optional(string,null)
    unit                  = optional(string,null)
    threshold             = optional(number,null)
    action_type           = optional(string,null)
    namespace             = optional(string,null)
    is_enabled            = optional(bool,null)
    period                = optional(number,null)
    evaluation_periods    = optional(number,null)
    cooldown              = optional(number,null)
    operator              = optional(string,null)
    source                = optional(string,null)
    adjustment            = optional(number,null)
    maximum               = optional(number,null)
    minimum               = optional(number,null)
    min_target_capacity   = optional(number,null)
    max_target_capacity   = optional(number,null)
    target                = optional(number,null)
  }))
  default                 = []
  description             = "scaling_up object"
}
variable "scaling_up_dimensions" {
  type            = list(object({
    name            = string
    value           = string
  }))
  default = null
  description = "scaling_up dimensions"
}
variable "scaling_up_step_adjustment" {
  type     = list(object({
    type                = string
    adjustment          = number
    maximum             = number
    minimum             = number
    min_target_capacity = number
    max_target_capacity = number
    target              = number
    threshold           = number
  }))
  default = null
  description = "scaling up step adjustment"
}

variable "scaling_down_policy" {
  type = list(object({
      policy_name           = optional(string,null)
      metric_name           = optional(string,null)
      statistic             = optional(string,null)
      unit                  = optional(string,null)
      threshold             = optional(number,null)
      action_type           = optional(string,null)
      namespace             = optional(string,null)
      is_enabled            = optional(bool,null)
      period                = optional(number,null)
      evaluation_periods    = optional(number,null)
      cooldown              = optional(number,null)
      operator              = optional(string,null)
      source                = optional(string,null)
      adjustment            = optional(number,null)
      maximum               = optional(number,null)
      minimum               = optional(number,null)
      min_target_capacity   = optional(number,null)
      max_target_capacity   = optional(number,null)
      target                = optional(number,null)
    }))
    default                 = []
  description             = "scaling_down object"
}

variable "scaling_down_dimensions" {
  type = list(object({
    name                = string
    value               = string
  }))
  default = null
  description = "scaling down dimensions object"
}

variable "scaling_down_step_adjustment" {
  type = list(object({
    type                = string
    adjustment          = number
    maximum             = number
    minimum             = number
    min_target_capacity = number
    target              = number
    threshold           = number
  }))
  default = null
  description = "scaling down step adjustment"
}

variable "scaling_target_policy" {
  type                    = list(object({
    policy_name           = string
    metric_name           = string
    statistic             = string
    unit                  = string
    namespace             = string
    cooldown              = number
    source                = string
    dimensions            = list(object({
      name                = string
      value               = string
    }))
    target                = number
    max_capacity_per_scale= number
    predictive_mode       = string
  }))
  default                 = null
  description             = "scaling_target_policy object"
}

variable "scaling_multiple_metrics" {
  type                    = list(object({
    expressions           = list(object({
      name                = string
      expression          = string
    }))
    metrics = list(object({
      metric_name         = string
      name                = string
      name_space          = string
      statistic           = string
      extended_statistic  = string
      unit                = string
      dimensions          = string
    }))
  }))
  default                 = null
  description             = "scaling_multiple_metrics object"
}

variable "network_interface" {
  type = list(object({
    network_interface_id                = string
    device_index                        = string
    description                         = string
    private_ip_address                  = string
    delete_on_termination               = number
    secondary_private_ip_address_count  = number
    associate_public_ip_address         = string
    associate_ipv6_address              = number
  }))
  default = null
  description = "scaling_target_policy object"
}
##Block Device Mappings
variable "ebs_block_device" {
  type        = list(object({
      device_name = optional(string,null)
      delete_on_termination = optional(bool,null)
      encrypted = optional(bool,null)
      iops = optional(number,null)
      kms_key_id = optional(string,null)
      snapshot_id = optional(string,null)
      throughput = optional(number,null)
      volume_size = optional(number,null)
      volume_type = optional(string,null)
      dynamic_iops = optional(set(object({
          base_size = optional(number,null)
          resource = optional(string,null)
          size_per_resource_unit = optional(number,null)
      })), [])
      dynamic_volume_size = optional(set(object({
          base_size = optional(number,null)
          resource = optional(string,null)
          size_per_resource_unit = optional(number,null)
      })), [])
  }))
  default     = []
  description = "Block Device Mapping Object"
}

variable "ephemeral_block_device" {
  type 								= list(object({
    device_name						= string
    virtual_name					= string
  }))
  default 							= null
  description 						= "ephemeral_block_device Object"
}

variable "persist_root_device" {
  type        = bool
  default     = null
  description = "should the instance maintain its root device volumes."
}
variable "persist_block_devices" {
  type        = bool
  default     = null
  description = "should the instance maintain its Data volumes."
}
variable "persist_private_ip" {
  type        = bool
  default     = null
  description = "should the instance maintain its private IP."
}
variable "block_devices_mode" {
  type        = string
  default     = null
  description = "Determine the way we attach the data volumes to the data devices."
}
variable "private_ips" {
  type        = list(string)
  default     = null
  description = "List of Private IPs to associate to the group instances."
}
##########

## stateful_deallocation ##
variable "stateful_deallocation" {
  type 								    = object({
    should_delete_images			    = bool
    should_delete_network_interfaces	= bool
    should_delete_volumes			    = bool
    should_delete_snapshots	            = bool
  })
  default 							    = null
  description 						    = "stateful_deallocation Object"
}
##########

## stateful_instance_action ##
variable "stateful_instance_action" {
  type 					    = list(object({
    stateful_instance_id    = string
    type					= string
  }))
  default 					= null
  description 				= "stateful_instance_action Object"
}
##########

## integration_rancher ##
variable "integration_rancher" {
  type 			  = object({
    master_host   = string
    access_key	  = string
    secret_key    = string
    version       = number
  })
  default 		  = null
  description     = "integration_rancher Object"
}
##########

## integration_ecs ##
variable "integration_ecs" {
  type 			                            = object({
    cluster_name                            = string
    autoscale_is_enabled                    = bool
    autoscale_cooldown                      = number
    autoscale_is_auto_config                = bool
    autoscale_scale_down_non_service_tasks  = bool
    autoscale_headroom                      = object({
      cpu_per_unit                          = number
      memory_per_unit                       = number
      num_of_units                          = number
    })
    autoscale_down                          = object({
      evaluation_periods                  = number
      max_scale_down_percentage           = number
    })
    autoscale_attributes	                = string
    batch                                   = object({
      job_queue_names                     = list(string)
    })
  })
  default 		                            = null
  description                               = "integration_ecs Object"
}
##########

## integration_codedeploy ##
variable "integration_codedeploy" {
  type 			                    = object({
    cleanup_on_failure              = optional(bool,null)
    terminate_instance_on_failure	= optional(bool,null)
    deployment_groups               = list(object({
      application_name              = optional(string,null)
      deployment_group_name         = optional(string,null)
    }))
  })
  default 		                    = null
  description                       = "integration_codedeploy Object"
}
##########

## integration_route53 ##
variable "integration_route53" {
  type 			                    = object({
    domains                         = list(object({
      hosted_zone_id                = string
      spotinst_acct_id              = string
      record_set_type               = string
      record_sets                   = object({
        name                        = string
        use_public_ip               = bool
        use_public_dns              = bool
      })
    }))
  })
  default 		                    = null
  description                       = "integration_route53 Object"
}
##########

## Update Policy ##
variable "should_resume_stateful" {
  type        = bool
  default     = null
  description = "This will apply resuming action for Stateful instances in the Elastigroup upon scale up or capacity changes."
}
variable "should_roll" {
  type        = bool
  default     = null
  description = "Sets the enablement of the roll option."
}
variable "auto_apply_tags" {
  type        = bool
  default     = null
  description = "Enables updates to tags without rolling the group when set to true."
}
variable "roll_config" {
  type = object({
    batch_size_percentage       = number
    health_check_type           = string
    grace_period                = number
    wait_for_roll_percentage    = number
    wait_for_roll_timeout       = number
  })
  default = null
  description = "roll_config object"
}
############

variable "update_strategy" {
  type = object({
    action                              = string
    should_drain_instances              = bool
    batch_min_healthy_percentage        = number
    on_failure                          = object({
      action_type                       = string
      should_handle_all_batches         = bool
      draining_timeout                  = number
      should_decrement_target_capacity  = bool
    })
  })
  default                               = null
  description                           = "The update strategy object."
}

variable "resource_requirements" {
    type = object({
        excluded_instance_families = optional(list(string),null)
        excluded_instance_generations = optional(list(string),null)
        excluded_instance_types = optional(list(string),null)
        required_gpu_minimum = optional(number,null)
        required_gpu_maximum = optional(number,null)
        required_memory_minimum = optional(number,null)
        required_memory_maximum = optional(number,null)
        required_vcpu_minimum = optional(number,null)
        required_vcpu_maximum = optional(number,null)
        })
    default = null
    description = "Resource requirements object"
    }


variable "images" {
  type = list(object({
      image = set(object({
        id   = string
      }))
  }))
  default     = null
  description = "Array of objects (Image object, containing the id of the image used to launch instances.)"
}

variable "max_replacements_percentage" {
  type        = number
  default     = null
  description = "The percentage of active instances that can be replaced in parallel. This is used to prevent a large number of instances from being replaced at once."
}