# Set the variable value in *.tfvars file
# or using the -var="hcloud_token=..." CLI option
variable "hcloud_token" {}

variable "hcloud_dns_token" {}

locals {
  rancher_api_url = format("https://%s.%s", var.rancher_host_name, var.dns_zone)
}

# Configure the Hetzner Cloud Provider
provider "hcloud" {
  token = var.hcloud_token
}

provider "hetznerdns" {
  apitoken = var.hcloud_dns_token
}

provider "rancher2" {
  alias = "bootstrap"
  api_url   = local.rancher_api_url
  bootstrap = true
}

provider "rancher2" {
  alias = "admin"

  api_url = rancher2_bootstrap.admin.url
  token_key = rancher2_bootstrap.admin.token
  insecure = true
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
    rancher2 = {
      source = "rancher/rancher2"
      version = "1.10.1"
    }
  }
}