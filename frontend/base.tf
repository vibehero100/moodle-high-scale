provider "azurerm" {
  features {}
  skip_provider_registration = true

}

variable "moodle-high-scale-rg" {
  type    = string
  default = "Moodle"
}

data "azurerm_resource_group" "moodle-high-scale" {
    name = var.moodle-high-scale-rg
}

data "azurerm_kubernetes_cluster" "moodle-high-scale" {
  name                = "moodle-high-scale"
  resource_group_name = data.azurerm_resource_group.moodle-high-scale.name
}

data "azurerm_virtual_network" "moodle-high-scale" {
  name                = "moodle-high-scale"
  resource_group_name = data.azurerm_resource_group.moodle-high-scale.name
}

data "azurerm_subnet" "app" {
  name                 = "app"
  virtual_network_name = "moodle-high-scale"
  resource_group_name  = data.azurerm_resource_group.moodle-high-scale.name

}

