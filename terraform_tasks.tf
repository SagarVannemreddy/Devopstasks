
#Task3:
#Create a Terraform script to create the following resources:
 #    i. Resource Group
 #   ii. Virtual Network
 #  iii. Subnet
# 2. Create a github repository and push it to github 


# Configure the Azure Provider
provider "azurerm" {
  # whilst the `version` attribute is optional, we recommend pinning to a given version of the Provider
  version = "=2.0.0"
  features {}
}

# Create a resource group
resource "azurerm_resource_group" "Mytasks" {
  name     = "Tasks_RG"
  location = "East US"
}

# Create a virtual network within the resource group
resource "azurerm_virtual_network" "Mytasks" {
  name                = "tasks_network"
  resource_group_name = azurerm_resource_group.Mytasks.name
  location            = azurerm_resource_group.Mytasks.location
  address_space       = ["10.0.0.0/16"]
}

# Create a subnet within the resource group
resource "azurerm_subnet" "Mytasks" {
  name                 = "task_subnet"
  resource_group_name  = azurerm_resource_group.Mytasks.name
  virtual_network_name = azurerm_virtual_network.Mytasks.name
  address_prefix       = "10.0.1.0/24"
}