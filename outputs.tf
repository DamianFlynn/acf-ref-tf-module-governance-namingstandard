output "full_name" {
  description = "Combination of environment, application name and application role"
  value       = module.log_analytics_name.full_name
}

output "default_tags" {
  description = "Default tags"
  value       = module.log_analytics_name.default_tags
}