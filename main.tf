#Copyright © 2024 NetApp, Inc.
#All rights reserved.

#create an Elastigroup
resource "spotinst_elastigroup_aws" "elastigroup" {

  name                          = var.name
  description                   = var.description
  product                       = var.product
  subnet_ids                    = var.subnet_ids
  region                        = var.region
  preferred_availability_zones  = var.preferred_availability_zones
  max_size                      = var.max_size
  min_size                      = var.min_size
  desired_capacity              = var.desired_capacity
  capacity_unit                 = var.capacity_unit
  security_groups               = var.security_groups
  image_id                      = var.image_id
  iam_instance_profile          = var.iam_instance_profile
  key_name                      = var.key_name
  enable_monitoring             = var.enable_monitoring
  user_data                     = var.user_data
  shutdown_script               = var.shutdown_script
  ebs_optimized                 = var.ebs_optimized
  placement_tenancy             = var.placement_tenancy
  persist_root_device           = var.persist_root_device
  persist_block_devices         = var.persist_block_devices
  persist_private_ip            = var.persist_private_ip
  block_devices_mode            = var.block_devices_mode
  private_ips                   = var.private_ips

  dynamic "metadata_options" {
    for_each = (var.http_tokens != null && var.http_put_response_hop_limit != null) ? [1] : []
    content {
      http_tokens                 = var.http_tokens
      http_put_response_hop_limit = var.http_put_response_hop_limit
      instance_metadata_tags      = var.instance_metadata_tags
    }
  }

  dynamic "cpu_options" {
    for_each = var.threads_per_core != null ? [1] : []
    content {
      threads_per_core            = var.threads_per_core
    }
  }

  instance_types_ondemand       = var.instance_types_ondemand
  instance_types_spot           = var.instance_types_spot != "" ? var.instance_types_spot : null
  instance_types_preferred_spot = var.instance_types_preferred_spot
  on_demand_types = var.instance_types_ondemand_types

  dynamic "instance_types_weights" {
    for_each = var.instance_types_weights != null ? [var.instance_types_weights] : []
    content {
      weight                    = instance_types_weights.value.weight
      instance_type             = instance_types_weights.value.instance_type
    }
  }
  cpu_credits                   = var.cpu_credits
  fallback_to_ondemand          = var.fallback_to_ondemand
  wait_for_capacity             = var.wait_for_capacity
  wait_for_capacity_timeout     = var.wait_for_capacity_timeout
  orientation                   = var.orientation
  spot_percentage               = var.spot_percentage
  draining_timeout              = var.draining_timeout
  utilize_reserved_instances    = var.utilize_reserved_instances
  utilize_commitments           = var.utilize_commitments
  ondemand_count                = var.ondemand_count
  consider_od_pricing           = var.consider_od_pricing
  minimum_instance_lifetime     = var.minimum_instance_lifetime
  immediate_od_recover_threshold = var.immediate_od_recover_threshold
  auto_healing                   = var.auto_healing
  restrict_single_az             = var.restrict_single_az
  max_replacements_percentage    = var.max_replacements_percentage

  dynamic "scaling_strategy" {
    for_each = (var.terminate_at_end_of_billing_hour != null || var.termination_policy != null) ? [1] :[]
    content {
      terminate_at_end_of_billing_hour = var.terminate_at_end_of_billing_hour
      termination_policy               = var.termination_policy
    }
  }

  health_check_type             = var.health_check_type
  health_check_grace_period     = var.health_check_grace_period
  health_check_unhealthy_duration_before_replacement = var.health_check_unhealthy_duration_before_replacement

  dynamic tags {
    for_each = var.tags == null ? {} : var.tags
    content {
      key   = tags.key
      value = tags.value
    }
  }

  elastic_ips = var.elastic_ips

  dynamic "revert_to_spot" {
    for_each = var.revert_to_spot != null ? [var.revert_to_spot] : []
    content {
      perform_at    = revert_to_spot.value.perform_at
      time_windows  = revert_to_spot.value.time_windows
    }
  }

  dynamic "resource_tag_specification" {
    for_each = (var.should_tag_enis != null || var.should_tag_volumes != null || var.should_tag_snapshots != null || var.should_tag_amis != null) ? [1] : []
    content {
      should_tag_enis       = var.should_tag_enis
      should_tag_volumes    = var.should_tag_volumes
      should_tag_snapshots  = var.should_tag_snapshots
      should_tag_amis       = var.should_tag_amis
    }
  }

  elastic_load_balancers  = var.elastic_load_balancers
  target_group_arns       = var.target_group_arns

  dynamic "signal" {
    for_each = var.signal != null ? [var.signal] : []
    content {
      name    = signal.value.name
      timeout = signal.value.timeout
    }
  }

  dynamic "scheduled_task" {
    for_each = var.scheduled_task != null ? [var.scheduled_task] : []
    content {
      task_type               = scheduled_task.value.task_type
      cron_expression         = scheduled_task.value.cron_expression
      start_time              = scheduled_task.value.start_time
      frequency               = scheduled_task.value.frequency
      scale_target_capacity   = scheduled_task.value.scale_target_capacity
      scale_min_capacity      = scheduled_task.value.scale_min_capacity
      scale_max_capacity      = scheduled_task.value.scale_max_capacity
      is_enabled              = scheduled_task.value.is_enabled
      target_capacity         = scheduled_task.value.target_capacity
      min_capacity            = scheduled_task.value.min_capacity
      max_capacity            = scheduled_task.value.max_capacity
      batch_size_percentage   = scheduled_task.value.batch_size_percentage
      grace_period            = scheduled_task.value.grace_period
      adjustment              = scheduled_task.value.adjustment
      adjustment_percentage   = scheduled_task.value.adjustment_percentage
    }
  }

  dynamic "scaling_up_policy" {
    for_each = var.scaling_up_policy != null ? var.scaling_up_policy : []
    content {
      policy_name         = scaling_up_policy.value.policy_name
      metric_name         = scaling_up_policy.value.metric_name
      statistic           = scaling_up_policy.value.statistic
      unit                = scaling_up_policy.value.unit
      operator            = scaling_up_policy.value.operator
      source              = scaling_up_policy.value.source
      threshold           = scaling_up_policy.value.threshold
      action_type         = scaling_up_policy.value.action_type
      namespace           = scaling_up_policy.value.namespace
      is_enabled          = scaling_up_policy.value.is_enabled
      period              = scaling_up_policy.value.period
      evaluation_periods  = scaling_up_policy.value.evaluation_periods
      cooldown            = scaling_up_policy.value.cooldown
      dynamic "dimensions" {
        for_each          = var.scaling_up_dimensions != null ? [var.scaling_up_dimensions] : []
        content {
          name            = dimensions.value.name
          value           = dimensions.value.value
        }
      }
      adjustment                = scaling_up_policy.value.adjustment
      min_target_capacity       = scaling_up_policy.value.min_target_capacity
      max_target_capacity       = scaling_up_policy.value.max_target_capacity
      minimum                   = scaling_up_policy.value.minimum
      maximum                   = scaling_up_policy.value.maximum
      target                    = scaling_up_policy.value.target
    }
  }


  dynamic "scaling_down_policy" {
    for_each = var.scaling_down_policy != null ? var.scaling_down_policy : []
    content {
      policy_name         = scaling_down_policy.value.policy_name
      metric_name         = scaling_down_policy.value.metric_name
      statistic           = scaling_down_policy.value.statistic
      unit                = scaling_down_policy.value.unit
      operator            = scaling_down_policy.value.operator
      source              = scaling_down_policy.value.source
      threshold           = scaling_down_policy.value.threshold
      action_type         = scaling_down_policy.value.action_type
      namespace           = scaling_down_policy.value.namespace
      is_enabled          = scaling_down_policy.value.is_enabled
      period              = scaling_down_policy.value.period
      evaluation_periods  = scaling_down_policy.value.evaluation_periods
      cooldown            = scaling_down_policy.value.cooldown
      dynamic "dimensions" {
        for_each          = var.scaling_down_dimensions != null ? [var.scaling_down_dimensions] : []
        content {
          name            = dimensions.value.name
          value           = dimensions.value.value
        }
      }
      adjustment                = scaling_down_policy.value.adjustment
      min_target_capacity       = scaling_down_policy.value.min_target_capacity
      max_target_capacity       = scaling_down_policy.value.max_target_capacity
      minimum                   = scaling_down_policy.value.minimum
      maximum                   = scaling_down_policy.value.maximum
      target                    = scaling_down_policy.value.target
    }
  }

  dynamic "resource_requirements" {
      for_each = var.resource_requirements != null ? [var.resource_requirements] : []
      content {
    excluded_instance_families      = resource_requirements.value.excluded_instance_families
    excluded_instance_generations   = resource_requirements.value.excluded_instance_generations
    excluded_instance_types         = resource_requirements.value.excluded_instance_types
    required_gpu_minimum            = resource_requirements.value.required_gpu_minimum
    required_gpu_maximum            = resource_requirements.value.required_gpu_maximum
    required_memory_minimum         = resource_requirements.value.required_memory_minimum
    required_memory_maximum         = resource_requirements.value.required_memory_maximum
    required_vcpu_minimum           = resource_requirements.value.required_vcpu_minimum
    required_vcpu_maximum           = resource_requirements.value.required_vcpu_maximum
  }
  }

  dynamic "images" {
      for_each = var.images == null ? [] : var.images
      content {
      dynamic "image" {
          for_each = images.value.image
          content {
            id              = image.value.id
          }
      }
    }
  }
  ## Block Device Mappings ##
    dynamic "ebs_block_device" {
      for_each = var.ebs_block_device != null ? var.ebs_block_device : []
      content {
        device_name = ebs_block_device.value.device_name
          delete_on_termination = try(ebs_block_device.value.delete_on_termination,null)
          encrypted             = try(ebs_block_device.value.encrypted,null)
          iops                  = try(ebs_block_device.value.iops,null)
          kms_key_id            = try(ebs_block_device.value.kms_key_id,null)
          snapshot_id           = try(ebs_block_device.value.snapshot_id,null)
          volume_type           = try(ebs_block_device.value.volume_type,null)
          volume_size           = try(ebs_block_device.value.volume_size,null)
          throughput            = try(ebs_block_device.value.throughput,null)
          dynamic "dynamic_volume_size" {
            for_each = ebs_block_device.value.dynamic_volume_size
            content {
              base_size              = dynamic_volume_size.value.base_size
              resource               = dynamic_volume_size.value.resource
              size_per_resource_unit = dynamic_volume_size.value.size_per_resource_unit
            }
          }
          dynamic "dynamic_iops" {
            for_each = ebs_block_device.value.dynamic_iops
            content {
              base_size              = dynamic_iops.value.base_size
              resource               = dynamic_iops.value.resource
              size_per_resource_unit = dynamic_iops.value.size_per_resource_unit
            }
          }
      }
    }

    dynamic "integration_codedeploy" {
        for_each = var.integration_codedeploy != null ? [var.integration_codedeploy] : []
        content {
            cleanup_on_failure = integration_codedeploy.value.cleanup_on_failure
            terminate_instance_on_failure = integration_codedeploy.value.terminate_instance_on_failure
            dynamic "deployment_groups" {
                for_each = integration_codedeploy.value.deployment_groups
                content {
                     application_name = deployment_groups.value.application_name
                     deployment_group_name = deployment_groups.value.deployment_group_name
                }
            }
        }
    }

  /* lifecycle {
    ignore_changes = [
      desired_capacity
    ]
  } */
}