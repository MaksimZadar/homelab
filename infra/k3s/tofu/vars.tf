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

variable "gateway_ip" {
  type = string
}

# Master node variables
variable "k3s_master_nodes" {
  type = list(object({
    name = string
    disk_size = string
    memory = number
    cpu_cores = number
    cpu_sockets = number
    emulate_ssd = bool
    user = string
    password = string
    ssh_keys = string
    tags = string
    proxmox_node = string
    proxmox_disk_location = string
    proxmox_cloudinit_location = string
    proxmox_vm_template_name = string
  }))
}

variable "k3s_worker_nodes" {
  type = list(object({
    name = string
    disk_size = string
    memory = number
    cpu_cores = number
    cpu_sockets = number
    emulate_ssd = bool
    user = string
    password = string
    ssh_keys = string
    tags = string
    proxmox_node = string
    proxmox_disk_location = string
    proxmox_cloudinit_location = string
    proxmox_vm_template_name = string
  }))
}

variable "k3s_storage_nodes" {
  type = list(object({
    name = string
    disk_size = string
    memory = number
    cpu_cores = number
    cpu_sockets = number
    emulate_ssd = bool
    user = string
    password = string
    ssh_keys = string
    tags = string
    proxmox_node = string
    proxmox_disk_location = string
    proxmox_cloudinit_location = string
    proxmox_vm_template_name = string
  }))
}
