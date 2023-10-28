provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "East US"
}

resource "azurerm_container_group" "primeiro_projeto" {
  name                = "primeiro_projeto-containergroup"
  location            = azurerm_resource_group.primeiro_projeto.location
  resource_group_name = azurerm_resource_group.primeiro_projeto.name
  os_type             = "Linux"

  container {
    name   = "primeiro_projeto-container"
    image  = "nginx"
    cpu    = "0.5"
    memory = "1.5"
  }

  tags = {
    environment = "testing"
  }
}

resource "azurerm_dev_test_policy" "primeiro_projeto" {
  name                = "primeiro_projeto-devtestpolicy"
  lab_name            = "primeiro_projeto-devtestlab"
  resource_group_name = azurerm_resource_group.primeiro_projeto.name

  tags = {
    environment = "testing"
  }
}
