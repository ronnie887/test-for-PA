# Detect your current public IP automatically
data "http" "myip" {
  url = "https://ifconfig.me/ip"
}

locals {
  my_ip_cidr = "${chomp(data.http.myip.response_body)}/32"
}

resource "random_integer" "kv_suffix" {
  min = 1000
  max = 9999
}

module "key_vault" {
  source  = "Azure/avm-res-keyvault-vault/azurerm"
  version = "~> 0.10"

  name                = "kv-${var.project_name}-${var.environment}-${random_integer.kv_suffix.result}"
  resource_group_name = var.resource_group_name
  location            = var.location
  tenant_id           = var.tenant_id
  sku_name            = "standard"
  #secrets_value       = var.secrets_value

  purge_protection_enabled = var.environment == "prod" ? true : false

  role_assignments = {
    managed_identity_secrets_user = {
      role_definition_id_or_name = "Key Vault Secrets User"
      principal_id               = var.managed_identity_principal_id
    }
    service_principal_contributor = {
      role_definition_id_or_name = "Key Vault Contributor"
      principal_id               = var.service_principal_object_id
    }
  }

  # --- SET NETWORK ACLs HERE ---
  #network_acls = {
  #  bypass         = "AzureServices" 
  #  default_action = "Deny"
  #  ip_rules       = [local.my_ip_cidr]  # Or ["0.0.0.0/0"] for open (NOT recommended)
    # Optionally, add virtual network subnet IDs if needed:
  #  virtual_network_subnet_ids = []
  #}

  #secrets = {
  #  sp_client_id = {
  #    name  = "sp-client-id"
  #    value = var.secrets_value["sp_client_id"]
  #  }
  #  sp_client_secret = {
  #    name  = "sp-client-secret"
  #    value = var.secrets_value["sp_client_secret"]
  #  }
  #}
  tags = var.tags
}

