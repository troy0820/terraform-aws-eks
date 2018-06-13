output "s3_bucket_id" {
  description = "The id of the bucket for the remote state."
  value       = "${module.eks-remote-state.s3_bucket_id}"
}

output "s3_bucket_arn" {
  description = "The arn of the s3 bucket for the remote state."
  value       = "${module.eks-remote-state.s3_bucket_arn}"
}

output "dynamo_table_id" {
  description = "The dynamodb table id of the remote state."
  value       = "${module.eks-remote-state.dynamo_table_id}"
}

output "dynamo_table_arn" {
  description = "The dynamodb table arn of the remote state."
  value       = "${module.eks-remote-state.dynamo_table_arn}"
}

output "is_complete" {
  description = "The trigger to signify that the resource is complete."
  value       = "${module.eks-remote-state.is_complete}"
}
