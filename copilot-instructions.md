# Copilot Instructions — Azure Storage Account Lab

## Scope
This project is focused solely on creating an Azure Storage Account Terraform module.
Do not suggest or generate code for other Azure resources unless explicitly asked.

## Terraform Structure
- Use separate files: `main.tf`, `variables.tf`, `outputs.tf`
- Pin the AzureRM provider version (e.g., ~> 3.0 or ~> 4.0)
- Use `terraform.tfvars` for environment-specific values

## Azure Storage Account Rules
- Default location: `uksouth` (adjust to your region)
- Default account_tier: `Standard`
- Default replication: `LRS` (for lab/dev use)
- Always set `https_traffic_only_enabled = true`
- Always set `min_tls_version = "TLS1_2"`
- Disable public blob access: `allow_nested_items_to_be_public = false`

## Naming Convention
- Format: `st<environment><purpose>001` (Azure CAF style)
- Example: `stdevlabstorage001`
- Lowercase, no hyphens (Azure storage account restriction)

## Tagging
- Always include tags: environment, owner, created_by = "terraform"

## Outputs
- Always output: storage account id, name, primary blob endpoint

## Security
- Never hardcode subscription IDs, credentials, or access keys
- Use `sensitive = true` for any key/connection string outputs

## Workflow Commands

# Initialize Terraform
terraform init

# Validate configuration
terraform validate

# Format code
terraform fmt -recursive

# Generate plan
terraform plan -out=tfplan

# Apply changes
terraform apply tfplan

# Destroy resources after lab
terraform destroy

## Development Context
- This is a local development environment
- Authentication is via `az login` (Azure CLI)
- No CI/CD pipeline — all commands run locally in terminal
- No remote state backend — use local state for this lab
