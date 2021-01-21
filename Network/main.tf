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
  source = "github.com/LuisUrresti/TerraformModules.git"

  #Variables
  rsg_name = "rsg_1"
  location = "northeurope"
  enviroment = "Repaso_1"
  vnet_name = "vnet_1"
  vnet_address = "10.10.0.0/16"
  snet_1 = "snet_1"
  snet_address_1 = "10.10.100.0/24"
  snet_2 = "snet_2"
  snet_address_2 = "10.10.200.0/24"
  sg1_name = "seg_group_1"
  sg2_name = "seg_group_2"
}