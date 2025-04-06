terraform {
  required_providers {
    proxmox = {
      source = "Telmate/proxmox"
      version = "3.0.1-rc3"
    }
  }
  backend "azurerm" {
    resource_group_name  = var.az_resource_group_name
    storage_account_name = var.az_storage_account_name
    container_name       = var.az_container_name
    key                  = var.az_tfstate_key
  }
}

provider "proxmox" {
  pm_api_url = var.pm_api_url
  pm_api_token_id = var.pm_api_token_id
  pm_api_token_secret = var.pm_api_token_secret
  pm_tls_insecure = var.pm_tls_insecure
}

resource "proxmox_lxc" "docker_prod" {
    hostname = var.docker_prod_hostname
    target_node = var.docker_prod_proxmox_node
    ostemplate   = var.docker_prod_os_template
    description = var.docker_prod_lxc_description
    password = var.docker_prod_password
    unprivileged = var.docker_prod_unprivileged
    tags = var.docker_prod_tags

    ssh_public_keys = var.docker_prod_ssh_keys
    
    onboot = var.docker_prod_onboot
    start = var.docker_prod_start

    cores    = var.docker_prod_cpu_cores
    memory   = var.docker_prod_memory
    swap     = var.docker_prod_swap

    network {
      name   = var.docker_prod_network_name
      bridge = var.docker_prod_network_bridge
      ip     = var.docker_prod_network_ip
      hwaddr = var.docker_prod_network_hwaddr
    }

    rootfs {
      storage = var.docker_prod_disk_location
      size    = var.docker_prod_disk_size
    }

    lifecycle {
        ignore_changes = [
            network,
        ]
    }
}

output "docker_lxc_ip" {
  value = length(proxmox_lxc.docker_prod.network) > 0 ? proxmox_lxc.docker_prod.network[0].ip : "IP not available"
  description = "The IP address of the Docker LXC container"
}
