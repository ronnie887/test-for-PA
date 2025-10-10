# Web Services Outputs
output "web_services" {
  description = "Web services information"
  value = {
    static_web_app_url      = module.static_web_app.static_web_app_url
  }
}