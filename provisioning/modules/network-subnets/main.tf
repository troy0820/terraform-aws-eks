resource "null_resource" "is_ready" {
  triggers {
    is_ready = "${var.is_ready}"
  }
}

data "aws_availability_zones" "available" {
  depends_on = ["null_resource.is_ready"]
  state      = "available"
}

resource "aws_subnet" "eks-subnet" {
  depends_on = ["null_resource.is_ready", "data.aws_availability_zones.available"]

  lifecycle {
    ignore_changes = ["*"]
  }

  count             = "${var.subnet_count}"
  vpc_id            = "${var.vpc_id}"
  cidr_block        = "${cidrsubnet(var.cidr_block, var.vpc_cidr_block_chunk_size, count.index + var.vpc_start)}"
  availability_zone = "${element(data.aws_availability_zones.available.names, count.index)}"

  # TODO:// Add tags to subnets 
  tags {}
}

resource "null_resource" "is_complete" {
  depends_on = ["null_resource.is_ready", "aws_subnet.eks-subnet"]
}
