resource "proxmox_vm_qemu" "worker-node" {
    count = length(var.k3s_worker_nodes)
    name = var.k3s_worker_nodes[count.index]["name"]
    agent = 1
    target_node = var.k3s_worker_nodes[count.index]["proxmox_node"]
    onboot = true
    boot = "order=scsi0"
    ipconfig0 = "ip=dhcp"
    vmid = "${ 2000 + count.index }"

    ciuser = var.k3s_worker_nodes[count.index]["user"]
    cipassword = var.k3s_master_nodes[count.index]["password"]
    sshkeys = var.k3s_worker_nodes[count.index]["ssh_keys"]
    ciupgrade = true

    clone = var.k3s_worker_nodes[count.index]["proxmox_vm_template_name"]
    os_type = "cloud-init"
    full_clone = true
    memory = var.k3s_worker_nodes[count.index]["memory"]
    sockets = var.k3s_worker_nodes[count.index]["cpu_sockets"]
    cores = var.k3s_worker_nodes[count.index]["cpu_cores"]
    scsihw = "virtio-scsi-pci"
    tags = var.k3s_worker_nodes[count.index]["tags"]

    disks {
        ide {
            ide0 {
                cloudinit {
                    storage = var.k3s_worker_nodes[count.index]["proxmox_cloudinit_location"]
                }
            }
        }
        scsi {
            scsi0 {
                disk {
                    storage = var.k3s_worker_nodes[count.index]["proxmox_disk_location"]
                    size = var.k3s_worker_nodes[count.index]["disk_size"]
                    discard = var.k3s_worker_nodes[count.index]["emulate_ssd"]
                    emulatessd = var.k3s_worker_nodes[count.index]["emulate_ssd"]
                }
            }
        }
    }

    vga {
        type = "serial0"
    }

    serial {
        id = 0
        type = "socket"
    }

    network {
        id = 0
        model = "virtio"
        bridge = "vmbr0"
    }

    lifecycle {
        ignore_changes = [
            network,
        ]
    }
}
