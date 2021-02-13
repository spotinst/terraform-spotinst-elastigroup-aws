terraform {
  required_version = ">= 0.12.26"

  required_providers {
    spotinst = {
      source  = "spotinst/spotinst"
      version = ">= 1.27.0"
    }
  }
}
