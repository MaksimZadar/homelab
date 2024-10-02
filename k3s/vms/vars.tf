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

variable "proxmox_template_name" {
  type = string
}

variable "proxmox_node" {
  type = string
}

variable "proxmox_vm_disk_location" {
  type = string
}

variable "proxmox_vm_cloudinit_location" {
  type = string
}

variable "gateway_ip" {
  type = string
}

## K3S Master Settings
variable "k3s_master_ips" {
  type = list(string)
}

variable "k3s_master_disk_size" {
  type = string
}

variable "k3s_master_memory" {
  type = number
}

variable "k3s_master_cpu_cores" {
  type = number
}

variable "k3s_master_cpu_sockets" {
  type = number
}

variable "k3s_master_emulate_ssd" {
  type = bool
}

variable "k3s_master_user" {
  type = string
}

variable "k3s_master_ssh_keys" {
  type = string
}

## K3S Agent Settings
variable "k3s_agent_ips" {
  type = list(string)
}

variable "k3s_agent_disk_size" {
  type = string
}

variable "k3s_agent_memory" {
  type = number
}

variable "k3s_agent_cpu_cores" {
  type = number
}

variable "k3s_agent_cpu_sockets" {
  type = number
}

variable "k3s_agent_emulate_ssd" {
  type = bool
}

variable "k3s_agent_user" {
  type = string
}

variable "k3s_agent_ssh_keys" {
  type = string
}

# Azure backend settings
variable "resource_group_name" {
  type = string
}

variable "storage_account_name" {
  type = string
}

variable "container_name" {
  type = string
}

variable "tfstate_key" {
  type = string
}
