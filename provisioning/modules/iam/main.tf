resource "null_resource" "is_ready" {
  triggers {
    is_ready = "${var.is_ready}"
  }
}

resource "aws_iam_role" "eks-cluster" {
  depends_on = ["null_resource.is_ready"]

  name = "${var.iam_policy_name}"

  assume_role_policy = <<POLICY
 {
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "eks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
 }
 POLICY
}

resource "aws_iam_role_policy_attachment" "eks-cluster-AmazonEKSClusterPolicy" {
  depends_on = ["null_resource.is_ready", "aws_iam_role.eks-cluster"]
  policy_arn = "arn:aws:iam:aws:policy/AmazonEKSClusterPolicy"
  role       = "${aws_iam_role.eks-cluster.name}"
}

resource "aws_iam_role_policy_attachment" "eks-cluster-AmazonEKSServicePolicy" {
  depends_on = ["null_resource.is_ready", "aws_iam_role.eks-cluster"]
  policy_arn = "arn:aws:iam:aws:policy/AmazonEKSServicePolicy"
  role       = "${aws_iam_role.eks-cluster.name}"
}

resource "null_resource" "is_complete" {
  depends_on = [
    "null_resource.is_ready",
    "aws_iam_role.eks-cluster",
    "aws_iam_role_policy_attachment.eks-cluster-AmazonEKSClusterPolicy",
    "aws_iam_role_policy_attachment.eks-cluster-AmazonEKSServicePolicy",
  ]
}
