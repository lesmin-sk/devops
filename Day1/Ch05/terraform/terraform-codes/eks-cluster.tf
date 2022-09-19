resource "aws_eks_cluster" "skt-user05-eks-cluster" {

  depends_on = [
    aws_iam_role_policy_attachment.skt-user05-iam-policy-eks-cluster,
    aws_iam_role_policy_attachment.skt-user05-iam-policy-eks-cluster-vpc,
  ]

  name     = var.cluster-name
  role_arn = aws_iam_role.skt-user05-iam-role-eks-cluster.arn
  version = "1.23"

  enabled_cluster_log_types = ["api", "audit", "authenticator", "controllerManager", "scheduler"]

  vpc_config {
    security_group_ids = [aws_security_group.skt-user05-sg-eks-cluster.id]
    subnet_ids         = [aws_subnet.skt-user05-public-subnet1.id, aws_subnet.skt-user05-public-subnet3.id]
    endpoint_public_access = true
  }


}
