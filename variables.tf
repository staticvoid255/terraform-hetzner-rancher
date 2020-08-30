variable "enable_backups" {
  type    = bool
  default = true
}

variable "rancher_host_sku" {
  type    = string
  default = "cpx21"
}

variable "rancher_host_os" {
  type    = string
  default = "debian-10"
}

variable "location" {
  type    = string
  default = "nbg1"
}

variable "dns_zone" {
  type    = string
  default = "example.com"
}

variable "rancher_host_name" {
  type    = string
  default = "rancher" # concatenated with dns_zone to rancher.example.com
}

variable "rancher_version_tag" {
  type    = string
  default = "v2.4.5"
}

variable "rancher_admin_password" {
  type    = string
}

variable "hetzner_docker_machine_driver_version" {
  type    = string
  default = "2.1.0"
}

variable "path_to_public_key" {
  type    = string
  default = "~/.ssh/id_rsa.pub"
}

variable "path_to_private_key" {
  type    = string
  default = "~/.ssh/id_rsa"
}


