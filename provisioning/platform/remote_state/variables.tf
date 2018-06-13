variable "s3_bucket" {
  description = "Tags for Dynamo table"
  type        = "string"
}

variable "dynamo_name" {
  description = "Tags for Dynamo table"
  type        = "string"
}

variable "region" {
  description = "The region this will be deployed in"
  type        = "string"
}

variable "profile" {
  description = "The AWS profile you will use to deploy this platform"
  type        = "string"
}
