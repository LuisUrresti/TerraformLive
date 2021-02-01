terraform {
  required_version = ">= 0.12"
}

provider "azurerm" {
    features {
      
    }
}

terraform {
  backend "azurerm" {
      resource_group_name = "rsg_storage_account"
      storage_account_name = "stacc7109"
      container_name = "terraform"
      key = "network/terraform.tfstate"
  }
}

module "network" {
  source = "github.com/LuisUrresti/TerraformModules.git//Network?ref=ModulesCounter"

  #Variables
  # General
  rsg_name = "rsg_1"
  location = "northeurope"
  enviroment = "Repaso_1"
  #Networks
  networks_count = 2
  vnet = "vnet"
  vnet_address= ["10.10.0.0/16","10.11.0.0/16"]
  snet = "snet"
  snet_address = ["10.10.100.0/24","10.11.100.0/24"]
  # Security Groups
  sg_nsg = ["seg_group_1","seg_group_2"]
  secrule_nsg = "ssh_rule"
  priority_nsg = 100
  direction_nsg = "Inbound"
  access_nsg = "Allow"
  protocol_nsg = "Tcp"
  source_port_nsg = "*"
  destination_port_nsg = "22"
  source_addres_nsg = "*"
  destination_address_nsg = "*"

}

output "rsg" {
  value = module.network.rsg
  description = "Name of the resource group"
}

output "subnet_id_1" {
  value = module.network.subnet_id_1
  description = "ID of the subnet 1"
}

output "subnet_id_3" {
  value = module.network.subnet_id_3
  description = "ID of the subnet 3"
}

/* output "vnet_1" {
  value = module.network.vnet_1
  description = "Name of the vnet 1"
}

output "vnet_2" {
  value = module.network.vnet_2
  description = "Name of the vnet 2"
}

output "subnet_name_1" {
  value = module.network.subnet_name_1
  description = "Name of the subnet 1"
}

output "subnet_name_3" {
  value = module.network.subnet_name_3
  description = "Name of the subnet 3"
} */