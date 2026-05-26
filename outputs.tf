output "enabled" {
  description = "Whether the module is enabled"
  value       = local.enabled
}

output "arn" {
  description = "ARN of the Lambda layer version"
  value       = try(aws_lambda_layer_version.this[0].arn, null)
}

output "version" {
  description = "Version number of the layer"
  value       = try(aws_lambda_layer_version.this[0].version, null)
}

output "layer_arn" {
  description = "ARN of the layer (without version)"
  value       = try(aws_lambda_layer_version.this[0].layer_arn, null)
}
