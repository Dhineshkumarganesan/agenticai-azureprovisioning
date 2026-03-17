variable "name" {
  description = "Name of the storage account. Must be globally unique."
  type        = string

  validation {
    condition     = length(var.name) >= 3 && length(var.name) <= 24 && can(regex("^[a-z0-9]+$", var.name))
    error_message = "Storage account name must be 3-24 chars, lowercase letters and numbers only."
  }
}


variable "resource_group_name" {
  description = "Name of the resource group in which to create the storage account."
  type        = string
}

variable "location" {
  description = "Azure region where the storage account will be created."
  type        = string
  default     = "germanywestcentral"
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(string)
  default     = {}
}

variable "account_tier" {
  description = "The tier to use for this storage account."
  type        = string
  default     = "Standard"
}

variable "account_replication_type" {
  description = "The replication type to use for this storage account."
  type        = string
  default     = "LRS"

  validation {
    condition     = contains(["LRS", "GRS", "RAGRS", "ZRS", "GZRS", "RAGZRS"], var.account_replication_type)
    error_message = "Must be one of: LRS, GRS, RAGRS, ZRS, GZRS, RAGZRS."
  }
}

variable "access_tier" {
  description = "The access tier (Hot|Cool) for blob storage."
  type        = string
  default     = "Hot"

  validation {
    condition     = contains(["Hot", "Cool"], var.access_tier)
    error_message = "Access tier must be Hot or Cool."
  }
}



variable "min_tls_version" {
  description = "Minimum TLS version."
  type        = string
  default     = "TLS1_2"

  validation {
    condition     = contains(["TLS1_0", "TLS1_1", "TLS1_2"], var.min_tls_version)
    error_message = "The min_tls_version must be TLS1_0, TLS1_1, or TLS1_2."
  }
}

variable "https_traffic_only_enabled" {
  description = "Require requests to be made via HTTPS only."
  type        = bool
  default     = true
}

variable "allow_nested_items_to_be_public" {
  description = "Allow public access to blob containers and items."
  type        = bool
  default     = false
}

