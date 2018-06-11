resource "null_resource" "is_ready" {
  triggers {
    is_ready = "${var.is_ready}"
  }
}

######################################################
# Random ID generator for unique hash                #
######################################################

resource "random_id" "s3-bucket" {
  byte_length = 8
}

####################################################
# S3 Bucket for storing state                      #
####################################################

resource "aws_s3_bucket" "terraform-remote-state-bucket" {
  depends_on = ["null_resource.is_ready"]
  bucket     = "${var.s3_bucket}-${random_id.s3-bucket.hex}"

  versioning = {
    enabled = true
  }

  lifecycle = {
    prevent_destroy = true
  }

  # TODO:// Add Tags for remote state
  tags {}
}

############################################################
# Dynamo DB table for locking state
############################################################
resource "aws_dynamodb_table" "dynamodb-terraform-state-lock" {
  depends_on     = ["null_resource.is_ready"]
  name           = "${var.dynamo_name}"
  hash_key       = "LockID"
  read_capacity  = 5
  write_capacity = 5

  attribute {
    name = "LockID"
    type = 5
  }

  # TODO:// Add Tags for remote state
  tags {}
}

resource "null_resource" "is_complete" {
  depends_on = ["null_resource.is_ready", "aws_s3_bucket.terraform-remote-state-bucket", "aws_dynamodb_table.dynamodb-terraform-state-lock"]
}
