# terraform-hcloud

A simple and opinionated module to create servers in Hetzner Cloud and -
by default - to provision the servers with Ansible first and then
install Kubernetes with Rancher, but both of these are optional. See the
variables file for the available configuration settings.

## Usage

Add the provider to your `main.tf`:

```
terraform {
  required_providers {
    hcloud = {
      source  = "hetznercloud/hcloud"
      version = "~> 1.23.0"
    }
  }
}

provider "hcloud" {
  token = var.hcloud_token
}
```

Example config:

```
cluster_name    = ...
ssh_private_key = "~/.ssh/id_rsa"
ssh_public_key  = "~/.ssh/id_rsa.pub"

install_ansible_dependencies = true
ansible_playbook_path       = ...
ansible_vault_password_path = ...

run_rancher_deploy = true

servers = {
  1 = {
    name               = "master"
    private_ip_address = "10.0.0.2"
    server_type        = "cx41"
    image              = "centos-7"
    location           = "nbg1"
    backups            = true
    roles              = "--etcd --controlplane" # to deploy Kubernetes with Rancher
    user_data_file     = "cloud-init.conf"
  },

  2 = {
    name               = "worker"
    private_ip_address = "10.0.0.3"
    server_type        = "cx41"
    image              = "centos-7"
    location           = "nbg1"
    backups            = true
    roles              = "--worker" # to deploy Kubernetes with Rancher
    user_data_file     = "cloud-init.conf"
  },

  ...
}
```

## Development

- Hetzner Cloud service: https://hetzner.com/
- Hetzner Cloud API Documentation: https://docs.hetzner.cloud/
- Hetzner Terraform Cloud Provider Documentation: https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs
