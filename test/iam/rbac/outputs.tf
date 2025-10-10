# RBAC Outputs
output "rbac" {
  description = "RBAC role assignments"
  value = {
    managed_identity_role_assignment_id   = module.rbac.managed_identity_role_assignment_id
    service_principal_role_assignment_id  = module.rbac.service_principal_role_assignment_id
  }
}