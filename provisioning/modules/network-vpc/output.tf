output "is_complete" {
  value = "${null_resource.is_complete.id}"
}

output "vpc_id" {
  value = "${aws_vpc.eks-vpc.id}"
}

output "vpc_cidr_block" {
  value = "${aws_vpc.eks-vpc.cidr_block}"
}
