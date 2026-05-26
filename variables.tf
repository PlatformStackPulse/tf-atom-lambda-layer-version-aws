variable "filename" {
  description = "Path to the layer zip file"
  type        = string
  default     = null
}

variable "s3_bucket" {
  description = "S3 bucket containing the layer zip"
  type        = string
  default     = null
}

variable "s3_key" {
  description = "S3 key of the layer zip"
  type        = string
  default     = null
}

variable "compatible_runtimes" {
  description = "List of compatible runtimes"
  type        = list(string)
  default     = []
}

variable "compatible_architectures" {
  description = "List of compatible architectures (x86_64, arm64)"
  type        = list(string)
  default     = null
}

variable "description" {
  description = "Description of the layer version"
  type        = string
  default     = null
}

variable "source_code_hash" {
  description = "Hash of the layer zip for change detection"
  type        = string
  default     = null
}
