# Web Services Outputs
output "web_services" {
  description = "Web services information"
  value = {
    app_service_plan_id     = module.app_service_plan.resource_id
  }
}