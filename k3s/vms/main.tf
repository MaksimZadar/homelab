terraform {
  required_providers {
    proxmox = {
      source = "Telmate/proxmox"
      version = "3.0.1-rc3"
    }
  }
  backend "azurerm" {
    resource_group_name  = var.resource_group_name
    storage_account_name = var.storage_account_name
    container_name       = var.container_name
    key                  = var.tfstate_key
  }
}

provider "proxmox" {
  pm_api_url = var.pm_api_url
  pm_api_token_id = var.pm_api_token_id
  pm_api_token_secret = var.pm_api_token_secret
  pm_tls_insecure = var.pm_tls_insecure
}

resource "proxmox_vm_qemu" "kappn" {
    name = "kappn-${count.index + 1}"
    agent = 1
    target_node = var.proxmox_node
    onboot = true
    boot = "order=scsi0"
    count = length(var.k3s_master_ips)
    ipconfig0 = "ip=${var.k3s_master_ips[count.index]}/24,gw=${var.gateway_ip}"
    # vmid = ${ 1000 + count.index } optionally you can set a VM ID for proxmox here

    ciuser = var.k3s_master_user
    sshkeys = var.k3s_master_ssh_keys

    clone = var.proxmox_template_name
    os_type = "cloud-init"
    full_clone = true
    memory = var.k3s_master_memory
    sockets = var.k3s_master_cpu_sockets
    cores = var.k3s_master_cpu_cores
    scsihw = "virtio-scsi-pci"
    tags = "kappn,k3s_master"

    disks {
        ide {
            ide0 {
                cloudinit {
                    storage = var.proxmox_vm_cloudinit_location
                }
            }
        }
        scsi {
            scsi0 {
                disk {
                    storage = var.proxmox_vm_disk_location
                    size = var.k3s_master_disk_size
                    discard = var.k3s_master_emulate_ssd
                    emulatessd = var.k3s_master_emulate_ssd
                }
            }
        }
    }

    lifecycle {
        ignore_changes = [
            network,
        ]
    }
}

resource "proxmox_vm_qemu" "gulliver" {
    name = "gulliver-${count.index + 1}"
    agent = 1
    target_node = var.proxmox_node
    onboot = true
    boot = "order=scsi0"
    count = length(var.k3s_agent_ips)
    ipconfig0 = "ip=${var.k3s_agent_ips[count.index]}/24,gw=${var.gateway_ip}"
    # vmid = ${ 1000 + count.index } optionally you can set a VM ID for proxmox here

    ciuser = var.k3s_agent_user
    sshkeys = var.k3s_agent_ssh_keys

    clone = var.proxmox_template_name
    os_type = "cloud-init"
    full_clone = true
    memory = var.k3s_agent_memory
    sockets = var.k3s_agent_cpu_sockets
    cores = var.k3s_agent_cpu_cores
    scsihw = "virtio-scsi-pci"
    tags = "gulliver,k3s_agent"

    disks {
        ide {
            ide0 {
                cloudinit {
                    storage = var.proxmox_vm_cloudinit_location
                }
            }
        }
        scsi {
            scsi0 {
                disk {
                    storage = var.proxmox_vm_disk_location
                    size = var.k3s_agent_disk_size
                    discard = var.k3s_agent_emulate_ssd
                    emulatessd = var.k3s_agent_emulate_ssd
                }
            }
        }
    }

    lifecycle {
        ignore_changes = [
            network,
        ]
    }
}

output "k3s_master_ips" {
  description = "K3S Master IPs"
  value = proxmox_vm_qemu.kappn.*.default_ipv4_address
}

output "k3s_agent_ips" {
  description = "K3S Agent IPs"
  value = proxmox_vm_qemu.gulliver.*.default_ipv4_address
}