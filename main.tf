# Set the variable value in *.tfvars file
# or using the -var="hcloud_token=..." CLI option
variable "hcloud_token" {}

variable "hcloud_dns_token" {}

# Configure the Hetzner Cloud Provider
provider "hcloud" {
  token = var.hcloud_token
}

provider "hetznerdns" {
  apitoken = var.hcloud_dns_token
}

terraform {
  required_version = ">= 0.13"

  required_providers {
    hcloud = {
      source = "hetznercloud/hcloud"
      version = "1.20.1"
    }
    hetznerdns = {
      source = "timohirt/hetznerdns"
      version = "1.0.7"
    }
  }
}