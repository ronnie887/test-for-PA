# Use native Terraform resources since no AVM module exists for Azure AD
resource "time_rotating" "sp_password_rotation" {
  rotation_days = 90
}

resource "azuread_application" "main" {
  display_name = var.azure_ad_app_name

  tags = [
    var.project_name,
    var.environment,
    "terraform-managed"
  ]
}

resource "azuread_service_principal" "main" {
  client_id = azuread_application.main.client_id
  
  tags = [
    var.project_name,
    var.environment,
    "terraform-managed"
  ]
}

resource "azuread_service_principal_password" "main" {
  service_principal_id = "/servicePrincipals/${azuread_service_principal.main.object_id}"
  
  rotate_when_changed = {
    rotation = time_rotating.sp_password_rotation.id
  }
}
