############################
#  Required configuration  #
############################

variable "cluster_name" {}

variable "hcloud_token" {}

variable "servers" {}

# Example attributes, see more at
# https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/server:
# - name
# - image
# - server_type
# - location
# - backups
# - user_data_file for user_data

variable "ssh_keys" {}

############################
#  Optional configuration  #
############################

variable "hcloud_location" {
  default = "nbg1"
}

variable "private_ip_range" {
  default = "10.0.0.0/16"
}

variable "private_network_name" {
  default = "default"
}

variable "private_network_zone" {
  default = "eu-central"
}

# variable "floating_ip_name" {
#   default = "default"
# }

variable "load_balancer_type" {
  default = "lb11"
}

variable "load_balancer_location" {
  default = "nbg1"
}

variable "load_balancer_ipv4" {
  default = "10.0.0.254"
}

