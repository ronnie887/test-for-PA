# Web Services Outputs
output "web_services" {
  description = "Web services information"
  value = {
    function_app_hostname   = module.function_app.function_app_hostname
  }
}