output "is_complete" {
  value = "${null_resource.is_complete.id}"
}

output "availability_zones" {
  value = "${data.aws_availability_zones.available.names}"
}

output "public_subnets" {
  value = "${join(",", aws_subnet.eks-subnet.*.id)}"
}

output "subnet_cidr_blocks" {
  value = "${join(",", aws_subnet.eks-subnet.*.cidr_block)}"
}
