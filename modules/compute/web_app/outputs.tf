output "web_app_hostname" {
  description = "Hostname of the web app"
  value       = module.web_app.resource.default_hostname
}
