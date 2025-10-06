# Web Services Outputs
output "web_services" {
  description = "Web services information"
  value = {
    app_service_plan_id     = module.app_service_plan.resource_id
    web_app_hostname        = module.web_app.web_app_hostname
    function_app_hostname   = module.function_app.function_app_hostname
    static_web_app_url      = module.static_web_app.static_web_app_url
  }
}