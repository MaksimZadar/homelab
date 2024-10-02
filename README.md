# Homelab Setup
This is my proxmox homelab setup repo. This contains all the IaC code (I'm using OpenTofu, but Terraform should work) as well 
as Ansible playbooks to setup the vms. 

## Requirements
1. You will need either [OpenTofu](https://opentofu.org/docs/intro/install/) or [Terraform](https://developer.hashicorp.com/terraform/install) installed
2. You will need [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html) installed
3. You will also need [Git](https://git-scm.com/downloads) installed
4. Obviously you will need a [Proxmox](https://www.proxmox.com/en/proxmox-virtual-environment/get-started) server running or you can adapt this to use any other provider
5. If using proxmox you will need a VM template setup

## Useful Links
- [Proxmox Terraform Provider](https://registry.terraform.io/providers/Telmate/proxmox/latest/docs)
- [Proxmox Docs](https://pve.proxmox.com/pve-docs/)
- [Ansible Docs](https://docs.ansible.com/ansible/latest/getting_started/index.html)
- [OpenTofu Docs](https://opentofu.org/docs/intro/)
- [Terraform Docs](https://developer.hashicorp.com/terraform/docs)

## Getting started
1. Fork this repository on github
2. Clone your fork to a desired location: `cd ~/your/dir && git clone https://github.com/{ your github name }/homelab`

### Get started with k3s

#### OpenTouf / Terraform
1. `cd` to `/k3s/vms`
2. Create a `terraform.tfvars` file and fill in the variables (look at `terraform.tfvars.template` for exmaples)
3. Update the `main.tf` file to use your template(s) on proxmox in the `clone=""` setting 
4. Run `tofu plan` (`terraform plan`)
5. Make sure out put looks good
6. Run `tofu apply` (`terraform apply`)
    - To remove the infra run `tofu destroy` (`terraform destroy`)

#### Ansible
Ansible allows us to quickly automate tasks on the VMs we created.

##### Getting Started

1. To get the IP addresses of the machine you just created run the following command

```bash
tofu output -json | jq '. | { master_ips: .k3s_master_ips.value, agent_ips: .k3s_agent_ips.value}'
```

2. Update `inventory/k3s_masters.yaml` and `inventory/k3s_agents.yaml` to point to your hosts (using the IPs above) 
and update the `ansible_user` field to be the user on your VMs (set in `k3s_master_user / k3s_agent_user` variables in `terraform.tfvars`)
