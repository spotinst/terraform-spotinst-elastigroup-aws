terraform {
  required_version = ">= 1.4.6"

  required_providers {
    spotinst = {
      source  = "spotinst/spotinst"
      version = ">= 1.188.0"
    }
  }
}

provider "spotinst" {
  token = "spotinst_token"
  account = "spotinst_account"
}