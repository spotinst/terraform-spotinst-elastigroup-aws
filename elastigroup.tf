provider "spotinst" {
  token   = var.spotinst_token
  account = var.spotinst_account
}

resource "spotinst_elastigroup_aws" "this" {
  count = var.create_elastigroup ? 1 : 0

  name                          = var.name
  description                   = var.description
  product                       = var.product
  max_size                      = var.max_size
  min_size                      = var.min_size
  desired_capacity              = var.desired_capacity
  capacity_unit                 = var.capacity_unit
  region                        = var.region
  image_id                      = var.image_id
  enable_monitoring             = var.enable_monitoring
  ebs_optimized                 = var.ebs_optimized
  subnet_ids                    = var.subnet_ids
  security_groups               = var.security_groups
  elastic_ips                   = var.elastic_ips
  key_name                      = var.key_name
  user_data                     = var.user_data
  placement_tenancy             = var.placement_tenancy
  instance_types_ondemand       = var.instance_types_ondemand
  instance_types_spot           = var.instance_types_spot
  instance_types_preferred_spot = var.instance_types_preferred_spot
  cpu_credits                   = var.cpu_credits
  orientation                   = var.orientation
  fallback_to_ondemand          = var.fallback_to_ondemand
  utilize_reserved_instances    = var.utilize_reserved_instances
  spot_percentage               = var.spot_percentage

  dynamic "tags" {
    for_each = var.tags

    content {
      key   = lookup(tags.value, "key", null)
      value = lookup(tags.value, "value", null)
    }
  }

  dynamic "scheduled_task" {
    for_each = var.scheduled_tasks

    content {
      is_enabled            = lookup(scheduled_task.value, "is_enabled", null)
      task_type             = lookup(scheduled_task.value, "task_type", null)
      cron_expression       = lookup(scheduled_task.value, "cron_expression", null)
      frequency             = lookup(scheduled_task.value, "frequency", null)
      target_capacity       = lookup(scheduled_task.value, "target_capacity", null)
      batch_size_percentage = lookup(scheduled_task.value, "batch_size_percentage", null)
    }
  }

  dynamic "scaling_up_policy" {
    for_each = var.scaling_up_policies

    content {
      policy_name         = lookup(scaling_up_policy.value, "policy_name", null)
      metric_name         = lookup(scaling_up_policy.value, "metric_name", null)
      namespace           = lookup(scaling_up_policy.value, "namespace", null)
      source              = lookup(scaling_up_policy.value, "source", null)
      statistic           = lookup(scaling_up_policy.value, "statistic", null)
      unit                = lookup(scaling_up_policy.value, "unit", null)
      cooldown            = lookup(scaling_up_policy.value, "cooldown", null)
      threshold           = lookup(scaling_up_policy.value, "threshold", null)
      operator            = lookup(scaling_up_policy.value, "operator", null)
      evaluation_periods  = lookup(scaling_up_policy.value, "evaluation_periods", null)
      period              = lookup(scaling_up_policy.value, "period", null)
      action_type         = lookup(scaling_up_policy.value, "action_type", null)
      min_target_capacity = lookup(scaling_up_policy.value, "min_target_capacity", null)
      adjustment          = lookup(scaling_up_policy.value, "adjustment", null)
      minimum             = lookup(scaling_up_policy.value, "minimum", null)
      maximum             = lookup(scaling_up_policy.value, "maximum", null)
      target              = lookup(scaling_up_policy.value, "target", null)

      dynamic "dimensions" {
        for_each = try(scaling_up_policy.value.dimensions, [])

        content {
          name  = lookup(dimensions.value, "name", null)
          value = lookup(dimensions.value, "value", null)
        }
      }
    }
  }

  dynamic "scaling_down_policy" {
    for_each = var.scaling_down_policies

    content {
      policy_name         = lookup(scaling_down_policy.value, "policy_name", null)
      metric_name         = lookup(scaling_down_policy.value, "metric_name", null)
      namespace           = lookup(scaling_down_policy.value, "namespace", null)
      source              = lookup(scaling_down_policy.value, "source", null)
      statistic           = lookup(scaling_down_policy.value, "statistic", null)
      unit                = lookup(scaling_down_policy.value, "unit", null)
      cooldown            = lookup(scaling_down_policy.value, "cooldown", null)
      threshold           = lookup(scaling_down_policy.value, "threshold", null)
      operator            = lookup(scaling_down_policy.value, "operator", null)
      evaluation_periods  = lookup(scaling_down_policy.value, "evaluation_periods", null)
      period              = lookup(scaling_down_policy.value, "period", null)
      action_type         = lookup(scaling_down_policy.value, "action_type", null)
      min_target_capacity = lookup(scaling_down_policy.value, "min_target_capacity", null)
      adjustment          = lookup(scaling_down_policy.value, "adjustment", null)
      minimum             = lookup(scaling_down_policy.value, "minimum", null)
      maximum             = lookup(scaling_down_policy.value, "maximum", null)
      target              = lookup(scaling_down_policy.value, "target", null)

      dynamic "dimensions" {
        for_each = try(scaling_down_policy.value.dimensions, [])

        content {
          name  = lookup(dimensions.value, "name", null)
          value = lookup(dimensions.value, "value", null)
        }
      }
    }
  }

  lifecycle {
    ignore_changes = [
      desired_capacity,
    ]
  }
}
