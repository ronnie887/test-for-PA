# Web Services Outputs
output "web_services" {
  description = "Web services information"
  value = {
    web_app_hostname        = module.web_app.web_app_hostname
  }
}