output "is_complete" {
  value       = "${null_resource.is_complete.id}"
  description = "This triggers the next resource showing the module is complete."
}

output "policy_arn" {
  value       = "${aws_iam_role.eks-cluster.name}"
  description = "The arn for the policy creaed for the EKS cluster."
}
