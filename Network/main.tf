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
  source = "github.com/LuisUrresti/TerraformModules.git//Network"

  #Variables
  rsg_name = "rsg_1"
  location = "northeurope"
  enviroment = "Repaso_1"
  vnet_name_1 = "vnet_1"
  vnet_address_1 = "10.10.0.0/16"
  snet_1 = "snet_1"
  snet_address_1 = "10.10.100.0/24"
  snet_2 = "snet_2"
  snet_address_2 = "10.10.200.0/24"
  vnet_name_2 = "vnet_2"
  vnet_address_2 = "10.11.0.0/16"
  snet_3 = "snet_3"
  snet_address_3 = "10.11.100.0/24"
  snet_4 = "snet_4"
  snet_address_4 = "10.11.200.0/24"
  sg = ["seg_group_1","seg_group_2","seg_group_3","seg_group_4"]
  secrule = "ssh_rule"
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