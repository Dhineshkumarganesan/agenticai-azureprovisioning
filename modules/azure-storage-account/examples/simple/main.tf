provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "rg-learning-lab"
  location = "westeurope"
}

module "storage" {
  source              = "../../"
  name                = "stlabdevjohn001"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  tags = {
    env = "example"
  }
}
