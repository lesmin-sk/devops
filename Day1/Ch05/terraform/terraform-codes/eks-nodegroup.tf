resource "aws_eks_node_group" "skt-user05-eks-nodegroup" {
  cluster_name    = aws_eks_cluster.skt-user05-eks-cluster.name
  node_group_name = "skt-user05-eks-nodegroup"
  node_role_arn   = aws_iam_role.skt-user05-iam-role-eks-nodegroup.arn
  subnet_ids      = [aws_subnet.skt-user05-public-subnet1.id, aws_subnet.skt-user05-public-subnet3.id]
  instance_types = ["t3a.medium"]
  disk_size = 20

  labels = {
    "role" = "eks-nodegroup"
  }

  scaling_config {
    desired_size = 3
    min_size     = 3
    max_size     = 3
  }

  depends_on = [
    aws_iam_role_policy_attachment.skt-user05-iam-policy-eks-nodegroup,
    aws_iam_role_policy_attachment.skt-user05-iam-policy-eks-nodegroup-cni,
    aws_iam_role_policy_attachment.skt-user05-iam-policy-eks-nodegroup-ecr,
  ]

}
