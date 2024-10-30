resource "azurerm_network_security_group" "nsg" {
  name                = "${var.nsg_prefix}${local.naming_suffix_seperated}"
  location            = var.location
  resource_group_name = var.rg_name
  security_rule {
    name                       = "tcp-inbound-p443"
    priority                   = 1043
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "443"
    source_address_prefix      = var.source_address_prefix
    destination_address_prefix = "*"
  }
  tags = local.common_tags
}

resource "azurerm_virtual_network" "vnet" {
  name                = "${var.vnet_prefix}${local.naming_suffix_seperated}"
  location            = var.location
  resource_group_name = var.rg_name
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]
  tags                = local.common_tags
}

resource "azurerm_subnet" "subnet" {
  name                 = "${var.subnet_prefix}${local.naming_suffix_seperated}"
  resource_group_name  = var.rg_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_subnet_network_security_group_association" "snnsg" {
  subnet_id                 = azurerm_subnet.subnet.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}

resource "azurerm_public_ip" "app_lb_public_ip" {
  name                = "public-ip-lb"
  location            = var.location
  resource_group_name = var.rg_name
  allocation_method   = "Static"
}

resource "azurerm_lb" "app_lb" {
  name                = "${var.lb_prefix}${local.naming_suffix_seperated}"
  location            = var.location
  resource_group_name = var.rg_name

  frontend_ip_configuration {
    name                 = "public-ip-address"
    public_ip_address_id = azurerm_public_ip.app_lb_public_ip.id
  }
  depends_on = [azurerm_public_ip.app_lb_public_ip]
}

resource "azurerm_lb_rule" "app_lb_rule" {
  name                           = "https-rule"
  loadbalancer_id                = azurerm_lb.app_lb.id
  protocol                       = "Tcp"
  frontend_port                  = 443
  backend_port                   = 443
  frontend_ip_configuration_name = azurerm_lb.app_lb.frontend_ip_configuration[0].name
  backend_address_pool_ids       = [azurerm_lb_backend_address_pool.app_lb_backend_pool.id]
  probe_id                       = azurerm_lb_probe.app_lb_probe.id
}

resource "azurerm_lb_backend_address_pool" "app_lb_backend_pool" {
  name               = "backend-address-pool"
  loadbalancer_id    = azurerm_lb.app_lb.id
  virtual_network_id = azurerm_virtual_network.vnet.id
}

resource "azurerm_lb_probe" "app_lb_probe" {
  name                = "https-probe"
  loadbalancer_id     = azurerm_lb.app_lb.id
  protocol            = "Https"
  port                = 443
  request_path        = "/health"
  interval_in_seconds = 5
  number_of_probes    = 2
}
