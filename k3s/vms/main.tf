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
  pm_tls_insecure = true
}

resource "proxmox_vm_qemu" "kappn" {
    name = "kappn-${count.index + 1}"
    agent = 1
    target_node = "pve1"
    onboot = true
    boot = "order=scsi0"
    count = 2
    ipconfig0 = "ip=10.17.17.${50 + count.index}/24,gw=10.17.17.1" # Change these to match your internal IP / gateway

    clone = "ubuntu-jammy-cloud"
    os_type = "cloud-init"
    full_clone = true
    memory = 4096
    sockets = 1
    cores = 4
    scsihw = "virtio-scsi-pci"
    tags = "kappn,k3s_master"

    disks {
        ide {
            ide0 {
                cloudinit {
                    storage = "base"
                }
            }
        }
        scsi {
            scsi0 {
                disk {
                    storage = "local-lvm"
                    size = "32G"
                    discard = true
                    emulatessd = true
                }
            }
        }
    }
}

resource "proxmox_vm_qemu" "gulliver" {
    name = "gulliver-${count.index + 1}"
    agent = 1
    target_node = "pve1"
    onboot = true
    boot = "order=scsi0"
    count = 3
    ipconfig0 = "ip=10.17.17.${55 + count.index}/24,gw=10.17.17.1" # Change these to match your internal IP / gateway

    clone = "ubuntu-jammy-cloud"
    os_type = "cloud-init"
    full_clone = true
    memory = 4096
    sockets = 1
    cores = 4
    scsihw = "virtio-scsi-pci"
    tags = "gulliver,k3s_agent"

    disks {
        ide {
            ide0 {
                cloudinit {
                    storage = "base"
                }
            }
        }
        scsi {
            scsi0 {
                disk {
                    storage = "local-lvm"
                    size = "32G"
                    discard = true
                    emulatessd = true
                }
            }
        }
    }
}