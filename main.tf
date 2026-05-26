resource "aws_lambda_layer_version" "this" {
  count = module.this.enabled ? 1 : 0

  layer_name               = module.this.id
  filename                 = var.filename
  s3_bucket                = var.s3_bucket
  s3_key                   = var.s3_key
  compatible_runtimes      = var.compatible_runtimes
  compatible_architectures = var.compatible_architectures
  description              = var.description
  source_code_hash         = var.source_code_hash
}
