# Homelab Setup
This is my homelab setup repo. This contains all the IaC code (I'm using OpenTofu, but Terraform should work) as well 
as Ansible playbooks to setup the vms. 

## Requirements
1. You will need either [OpenTofu](https://opentofu.org/docs/intro/install/) or [Terraform](https://developer.hashicorp.com/terraform/install) installed
2. You will need [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html) installed
3. You will also need [Git](https://git-scm.com/downloads) installed

## Getting started
1. Clone the repo to a desired location: `cd ~/your/dir && git clone https://github.com/MaksimZadar/homelab`

### Get started with k3s
1. `cd` to `/k3s/vms`
2. Create a `terraform.tfvars` file and fill in the variables (look at `terraform.tfvars.template` for exmaples)
3. Run `tofu plan` (`terraform plan`)
4. Make sure out put looks good
5. Run `tofu apply` (`terraform apply`)
6. To remove the infra run `tofu destroy` (`terraform destroy`)