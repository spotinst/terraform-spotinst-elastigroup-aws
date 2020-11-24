name                    = "example"
product                 = "Linux/UNIX"
desired_capacity        = 0
region                  = "us-west-2"
image_id                = "ami-07a0da1997b55b23e"
enable_monitoring       = false
subnet_ids              = ["subnet-foo", "subnet-bar"]
security_groups         = ["sg-foo"]
instance_types_ondemand = "t2.large"
instance_types_spot     = ["c3.large", "c4.large", "c5.large"]

tags = [
  {
    key   = "environment"
    value = "labs"
  },
  {
    key   = "project"
    value = "app"
  },
]

scheduled_tasks = [
  {
    is_enabled = true
    task_type  = "backup_ami"
    frequency  = "hourly"
  },
  {
    is_enabled            = true
    task_type             = "roll"
    frequency             = "daily"
    batch_size_percentage = 30
  },
]

scaling_up_policies = [
  {
    policy_name        = "CPU80"
    metric_name        = "CPUUtilization"
    namespace          = "AWS/EC2"
    statistic          = "average"
    unit               = "percent"
    cooldown           = 60
    threshold          = 80
    operator           = "gt"
    evaluation_periods = 10
    period             = 60
    action_type        = "adjustment"
    adjustment         = 1
    dimensions = [
      {
        name  = "foo",
        value = "bar",
      },
    ],
  },
]

scaling_down_policies = [
  {
    policy_name        = "CPU30"
    metric_name        = "CPUUtilization"
    namespace          = "AWS/EC2"
    statistic          = "average"
    unit               = "percent"
    cooldown           = 60
    threshold          = 30
    operator           = "lt"
    evaluation_periods = 10
    period             = 60
    action_type        = "adjustment"
    adjustment         = 1
    dimensions = [
      {
        name  = "foo",
        value = "bar",
      },
    ],
  },
]
