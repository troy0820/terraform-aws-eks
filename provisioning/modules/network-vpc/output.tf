output "is_complete" {
  value       = "${null_resource.is_complete.id}"
  description = "Registers the trigger to the next resource to be created afterwards"
}

output "vpc_id" {
  value       = "${aws_vpc.eks-vpc.id}"
  description = "The id of the vpc created for the EKS cluster"
}

output "vpc_cidr_block" {
  value       = "${aws_vpc.eks-vpc.cidr_block}"
  description = "The cidr block that is used to create the VPC"
}
