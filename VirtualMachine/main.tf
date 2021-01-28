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
      key = "vm/terraform.tfstate"
  }
}

data "terraform_remote_state" "network" {
  backend = "azurerm"
  config = {
    resource_group_name = "rsg_storage_account"
    storage_account_name = "stacc7109"
    container_name = "terraform"
    key    = "network/terraform.tfstate"
  }
}

module "vm" {
  source = "github.com/LuisUrresti/TerraformModules.git//VirtualMachine"

  #Variables
  rsg_name = data.terraform_remote_state.network.outputs.rsg
  location = "northeurope"
  enviroment = "Repaso_1"
  public_ip_name = "public_ip"
  domain_name_label = "test7109"
  interface_name_1 = "interface1"
  interface_name_2 = "interface2"
  ipconfig_name = "ipconfig"
  vnet_name_1 = data.terraform_remote_state.network.outputs.vnet_1
  vnet_name_2 = data.terraform_remote_state.network.outputs.vnet_2
  snet_1 = data.terraform_remote_state.network.outputs.subnet_name_1
  snet_3 = data.terraform_remote_state.network.outputs.subnet_name_3
  vm_name_1 = "vm1"
  vm_name_2 = "vm2"

}

