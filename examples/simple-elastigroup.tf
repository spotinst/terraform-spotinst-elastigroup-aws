module "spotinst-eg-aws" {
  source = ""

  name                    = "terraform_test"
  subnet_ids              = ["subnet-123456789", "subnet-123456789", "subnet-123456789"]
  region                  = "us-west-2"
  security_groups         = ["sg-123456789", "sg-123456789"]
  instance_types_ondemand = "t3.large"
  instance_types_spot     = ["t3.large"]
  max_size                = 1
  image_id                = "ami-123456789"
}
