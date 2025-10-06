output "function_app_hostname" {
  description = "Hostname of the function app"
  value       = module.function_app.resource.default_hostname
}