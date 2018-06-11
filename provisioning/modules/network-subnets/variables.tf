variable "is_ready" {
  description = "Wait until it's ready"
  type        = "string"
}

variable "subnet_count" {
  description = "How many subnets for vpc"
  type        = "string"
}

variable "vpc_id" {
  description = "ID of the VPC"
  type        = "string"
}

variable "cidr_block" {
  description = "CIDR Block of the vpc to be segmented"
  type        = "string"
}

variable "vpc_cidr_block_chunk_size" {
  description = "CIDR math for segmenting subnets"
  type        = "string"
}

variable "vpc_start" {
  description = "Where the subnets start from"
  type        = "string"
}
