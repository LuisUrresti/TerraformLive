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
      key = "analytics/terraform.tfstate"
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

module "analytics" {
  source = "github.com/LuisUrresti/TerraformModules.git//Analytics"

  #Variables
  rsg_name = data.terraform_remote_state.network.outputs.rsg
  location = "northeurope"
  enviroment = "Repaso_1"
  log_analytics_name = "log-analytics-7109"
}