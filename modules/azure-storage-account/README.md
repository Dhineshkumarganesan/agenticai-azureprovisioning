# Azure Storage Account Module

This Terraform module provisions an Azure Storage Account (azurerm_storage_account).

Inputs
- name (string) - Storage account name (required).
- resource_group_name (string) - Resource group name (required).
- location (string) - Azure location (required).
- account_tier (string) - Default: "Standard".
- account_replication_type (string) - Default: "LRS".
- kind (string) - Default: "StorageV2".
- access_tier (string) - Default: "Hot".
- enable_https_traffic_only (bool) - Default: true.
- allow_blob_public_access (bool) - Default: false.
- min_tls_version (string) - Default: "TLS1_2".
- tags (map) - Default: {}.

Outputs
- id
- name
- primary_blob_endpoint

Example
module "storage" {
  source = "../"

  name                = "examplestorageacct01"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
}

Notes
Pin provider versions in the root module. This module avoids creating helper random resources so outputs are deterministic.
