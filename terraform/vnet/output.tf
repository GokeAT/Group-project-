output "interface_ids" {
    value = {
        "public" = azurerm_network_interface.frontend.id
        "private" = azurerm_network_interface.backend.id
    }
}