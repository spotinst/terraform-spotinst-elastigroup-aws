module "elastigroup-aws" {
  source = "spotinst/elastigroup-aws/spotinst"

  name                          = "AWS-EG-Sample"
  subnet_ids                    = ["subnet-1234ab", "subnet-6789fed"]
  region                        = "us-west-2"
  security_groups               = ["sg-123456789abcd"]
  instance_types_ondemand       = "t3.small"
  instance_types_spot           = ["t3.micro", "t3.small", "t3.medium"]
  max_size                      = 5
  min_size                      = 0
  desired_capacity              = 2
  image_id                      = "ami-123456789"
  instance_types_preferred_spot = ["t3.small"]
  product                       = "Linux/UNIX (Amazon VPC)"
  spot_percentage               = 100
  draining_timeout              = 300
  fallback_to_ondemand          = true
  health_check_grace_period     = 360
  orientation                   = "costOriented"
  max_replacements_percentage   = 10

}