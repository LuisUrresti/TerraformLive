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
  interface_name_1 = "interface1"
  interface_name_2 = "interface2"
  ipconfig_name = "ipconfig"
  # Security Groups
  sg_nsg = ["seg_group_1","seg_group_2"]
  secrule_nsg = "ssh_rule"
  priority_nsg = 100
  direction_nsg = "Inbound"
  access_nsg = "Allow"
  protocol_nsg = "Tcp"
  source_port_nsg = "*"
  destination_port_nsg = "22"
  source_address_nsg = "*"
  destination_address_nsg = "*"
  # Peering
  peering1to2 = "peering1to2"
  peering2to1 = "peering2to1"
  # Virtual Machine
  vm_name_1 = "vm1"
  vm_name_2 = "vm2"
  ssh_public_key_file = "../Resources/key.pub"
  vm_size = "Standard_A1_v2"
  admin_username = "adminuser"
  publisher = "Canonical"
  offer = "UbuntuServer" 
  sku = "18.04-LTS"
  storage_account_type = "Standard_LRS"
}

output "rsg" {
  value = module.network.rsg
  description = "Name of the resource group"
}



