output "s3_bucket_id" {
  value = "${aws_s3_bucket.terraform-remote-state-bucket.id}"
}

output "s3_bucket_arn" {
  value = "${aws_s3_bucket.terraform-remote-state-bucket.arn}"
}

output "dynamo_table_id" {
  value = "${aws_dynamodb_table.dynamodb-terraform-state-lock.id}"
}

output "dynamo_table_arn" {
  value = "${aws_dynamodb_table.dynamodb-terraform-state-lock.arn}"
}

output "is_complete" {
  value = "${null_resource.is_complete.id}"
}
