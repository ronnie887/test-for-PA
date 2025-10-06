module "role_assignment_managed_identity_contributor" {
  source  = "Azure/avm-res-authorization-roleassignment/azurerm"
  version = "~> 0.3"

  role_assignments_azure_resource_manager = {
    managed_identity_contributor = {
      principal_id         = var.managed_identity_principal_id
      role_definition_name = "Contributor"
      scope                = var.resource_group_id
      description          = "Managed Identity Contributor access to resource group"
      principal_type       = "ServicePrincipal"
    }
  }
}

module "role_assignment_service_principal_reader" {
  source  = "Azure/avm-res-authorization-roleassignment/azurerm"
  version = "~> 0.3"

  role_assignments_azure_resource_manager = {
    service_principal_reader = {
      principal_id         = var.service_principal_object_id
      role_definition_name = "Reader"
      scope                = var.resource_group_id
      description          = "Service Principal Reader access to resource group"
      principal_type       = "ServicePrincipal"
    }
  }
}

# Repeat for other data types if required
module "role_assignment_function_app_storage_queue" {
  source  = "Azure/avm-res-authorization-roleassignment/azurerm"
  version = "~> 0.3"

  role_assignments_azure_resource_manager = {
    storage_queue = {
      principal_id         = var.managed_identity_principal_id
      role_definition_name = "Storage Queue Data Contributor"
      scope                = var.storage_account_id
      description          = "Function App MI Storage Queue Data access"
      principal_type       = "ServicePrincipal"
    }
  }
}

