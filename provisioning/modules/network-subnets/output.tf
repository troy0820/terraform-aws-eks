output "is_complete" {
  value       = "${null_resource.is_complete.id}"
  description = "Triggers the upcoming resource that this module is done"
}

output "availability_zones" {
  value       = "${data.aws_availability_zones.available.names}"
  description = "The available availability_zones within the AWS region"
}

output "public_subnets" {
  value       = "${join(",", aws_subnet.eks-subnet.*.id)}"
  description = "Subnets that are going to be used for the EKS Cluster"
}

output "subnet_cidr_blocks" {
  value       = "${join(",", aws_subnet.eks-subnet.*.cidr_block)}"
  description = "The subnet cidr blocks for the EKS Cluster"
}
