output "is_complete" {
  value = "${null_resource.is_complete.id}"
}

output "policy_arn" {
  value = "${aws_iam_role.eks-cluster.name}"
}
