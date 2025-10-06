output "static_web_app_url" {
  description = "URL of the static web app"
  value       = module.static_web_app.resource.default_host_name
}
