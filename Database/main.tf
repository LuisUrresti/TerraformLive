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
      key = "database/terraform.tfstate"
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

module "database" {
  source = "github.com/LuisUrresti/TerraformModules.git//Database"

  #Variables
  rsg_name = data.terraform_remote_state.network.outputs.rsg
  location = "northeurope"
  postgre_server_name = "sql-server-7109"
  db_name = "db"
}