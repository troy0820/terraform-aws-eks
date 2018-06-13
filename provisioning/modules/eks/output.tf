output "is_complete" {
  value       = "${null_resource.is_complete.id}"
  description = "This triggers the next resource showing the module is complete."
}

output "kubeconfig" {
  value       = "${locals.kubeconfig-aws-1-9}"
  description = "Kubeconfig that will be copied to connect to cluster"
}
