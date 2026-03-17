resource "azurerm_storage_account" "this" {
  name                      = var.name
  resource_group_name       = var.resource_group_name
  location                  = var.location
  account_tier              = var.account_tier
  account_replication_type  = var.account_replication_type
  access_tier               = var.access_tier
  https_traffic_only_enabled = var.https_traffic_only_enabled
  allow_nested_items_to_be_public   = var.allow_nested_items_to_be_public
  min_tls_version           = var.min_tls_version
  tags                      = var.tags
}
