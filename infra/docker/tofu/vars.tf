# Proxmox Settings
variable "pm_api_url" {
  type = string
}

variable "pm_api_token_id" {
  type = string
}

variable "pm_api_token_secret" {
  type      = string
  sensitive = true
}

variable "pm_tls_insecure" {
  type = bool
  description = "Set to true if the HTTPS certificate is self signed"
}

variable "docker_prod_proxmox_node" {
  type = string
}

variable "docker_prod_disk_location" {
  type = string
}

## Docker Prod VM Settings
variable "docker_prod_hostname" {
  type = string
}

variable "docker_prod_lxc_description" {
  type = string
}

variable "docker_prod_tags" {
  type = string
}

variable "docker_prod_os_template" {
  type = string
}

variable "docker_prod_network_ip" {
  type = string
}

variable "docker_prod_network_name" {
  type = string
}

variable "docker_prod_network_bridge" {
  type = string
}

variable "docker_prod_network_hwaddr" {
  type = string
}

variable "docker_prod_onboot" {
  type = bool
}

variable "docker_prod_start" {
  type = bool
}

variable "docker_prod_disk_size" {
  type = string
}

variable "docker_prod_memory" {
  type = number
}

variable "docker_prod_swap" {
  type = number
}

variable "docker_prod_cpu_cores" {
  type = number
}

variable "docker_prod_password" {
  type = string
}

variable "docker_prod_unprivileged" {
  type = bool
}

variable "docker_prod_ssh_keys" {
  type = string
}

# Azure backend settings
variable "az_resource_group_name" {
  type = string
}

variable "az_storage_account_name" {
  type = string
}

variable "az_container_name" {
  type = string
}

variable "az_tfstate_key" {
  type = string
}
