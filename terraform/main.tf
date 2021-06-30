// Terraform configuration
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.46.0"
    }
  }
}

// Provider
provider "azurerm" {
  features {}
}

// Resource Group
resource "azurerm_resource_group" "rg" {
  name     = "${var.project_name}-rg"
  location = var.location
}

module "cluster" {
    source        = "./cluster"
    project_name  = var.project_name
    group_name    = azurerm_resource_group.rg.name
    location      = var.location
    vm_size       = var.vm_size
    interface_ids = module.vnet.interface_ids
}

module "vnet" {
    source       = "./vnet"
    project_name = var.project_name
    group_name   = azurerm_resource_group.rg.name
    location     = var.location
}