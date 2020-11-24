module "elastigroup-aws" {
  source = "../.."

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
  scheduled_tasks         = var.scheduled_tasks
  scaling_up_policies     = var.scaling_up_policies
  scaling_down_policies   = var.scaling_down_policies
  tags                    = var.tags
}
