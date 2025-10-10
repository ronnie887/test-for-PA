# Azure AD Outputs
output "application_client_id" {
  value = module.azure_ad_sp.application_client_id
  sensitive = true
}

output "service_principal_object_id" {
  value = module.azure_ad_sp.service_principal_object_id
  sensitive = true
}
  
output "service_principal_password" {
  value = module.azure_ad_sp.service_principal_password
  sensitive = true
}