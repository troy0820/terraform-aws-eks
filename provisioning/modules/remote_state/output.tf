output "s3_bucket_id" {
  value       = "${aws_s3_bucket.terraform-remote-state-bucket.id}"
  description = "This is the s3 bucket id for the remote state."
}

output "s3_bucket_arn" {
  value       = "${aws_s3_bucket.terraform-remote-state-bucket.arn}"
  description = "This is the arn for the s3 bucket."
}

output "dynamo_table_id" {
  value       = "${aws_dynamodb_table.dynamodb-terraform-state-lock.id}"
  description = "This is the dynamodb table id for the remote state."
}

output "dynamo_table_arn" {
  value       = "${aws_dynamodb_table.dynamodb-terraform-state-lock.arn}"
  description = "This is the arn for the dynamodb table for the remote state."
}

output "is_complete" {
  value       = "${null_resource.is_complete.id}"
  description = "This is the trigger from the null_resource that shows this module is complete."
}
