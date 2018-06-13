variable "is_ready" {
  description = "Is the null_resource ready"
  type        = "string"
}

variable "s3_bucket" {
  description = "Name for Dynamo table"
  type        = "string"
}

variable "dynamo_name" {
  description = "Name for Dynamo table"
  type        = "string"
}

# TODO:// Add tags for s3 bucket and dynamodb table

