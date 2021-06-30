resource "azurerm_virtual_network" "main" {
  name                = "${var.project_name}-vnet1"
  location            = var.location
  resource_group_name = var.group_name
  address_space       = ["10.0.0.0/16"]
}

// Public Subnet with NSG allowing SSH from everywhere

resource "azurerm_subnet" "frontend" {
  name                 = "${var.project_name}-frontend"
  resource_group_name  = var.group_name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_public_ip" "public" {
  name                = "${var.project_name}-frontendIP"
  resource_group_name = var.group_name
  location            = var.location
  allocation_method   = "Static"
}

resource "azurerm_network_security_group" "frontend" {
  name                = "${var.project_name}-frontend"
  location            = var.location
  resource_group_name = var.group_name

  security_rule {
    name                       = "access"
    priority                   = 600
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

// Network Interface/NSG Group Association

resource "azurerm_network_interface_security_group_association" "frontend" {
  network_interface_id = azurerm_network_interface.frontend.id
  network_security_group_id = azurerm_network_security_group.frontend.id
}


// Network Interface
resource "azurerm_network_interface" "frontend" {
  name                = "${var.project_name}-frontend"
  location            = var.location
  resource_group_name = var.group_name

  ip_configuration {
    name                          = "publicconfiguration"
    subnet_id                     = azurerm_subnet.frontend.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.frontend.id
  }
}


// Private Subnet with NSG allowing SSH only from public subnet

resource "azurerm_subnet" "backend" {
  name                 = "${var.project_name}-backend"
  resource_group_name  = var.group_name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_public_ip" "backend" {
  name                = "${var.project_name}-backend"
  resource_group_name = var.group_name
  location            = var.location
  allocation_method   = "Static"
}

resource "azurerm_network_security_group" "backend" {
  name                = "${var.project_name}-nsg2"
  location            = var.location
  resource_group_name = var.group_name

  security_rule {
    name                       = "access2"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "10.0.1.0/24"
    destination_address_prefix = "*"
  }
}

resource "azurerm_network_interface" "backend" {
  name                = "${var.project_name}-backend"
  location            = var.location
  resource_group_name = var.group_name

  ip_configuration {
    name                          = "privateconfiguration"
    subnet_id                     = azurerm_subnet.backend.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.backend.id
  }
}