variable "rancher_host_sku" {
  type    = string
  default = "cpx21"
}

variable "rancher_host_os" {
  type    = string
  default = "debian-10"
}

variable "rancher_host_name" {
  type    = string
}

variable "rancher_version_tag" {
  type    = string
  default = "v2.4.5"
}

variable "path_to_public_key" {
  type    = string
  default = "~/.ssh/id_rsa.pub"
}

variable "path_to_private_key" {
  type    = string
  default = "~/.ssh/id_rsa"
}

