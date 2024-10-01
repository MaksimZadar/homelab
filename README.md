# Homelab Setup
This is my proxmox homelab setup repo. This contains all the IaC code (I'm using OpenTofu, but Terraform should work) as well 
as Ansible playbooks to setup the vms. 

## Requirements
1. You will need either [OpenTofu](https://opentofu.org/docs/intro/install/) or [Terraform](https://developer.hashicorp.com/terraform/install) installed
2. You will need [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html) installed
3. You will also need [Git](https://git-scm.com/downloads) installed
4. Obviously you will need a [Proxmox](https://www.proxmox.com/en/proxmox-virtual-environment/get-started) server running or you can adapt this to use any other provider

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
1. `cd` to `/k3s/vms`
2. Create a `terraform.tfvars` file and fill in the variables (look at `terraform.tfvars.template` for exmaples)
3. Run `tofu plan` (`terraform plan`)
4. Make sure out put looks good
5. Run `tofu apply` (`terraform apply`)
6. To remove the infra run `tofu destroy` (`terraform destroy`)