# 1. EKS Control Plane
resource "aws_eks_cluster" "main" {
  name     = var.cluster_name
  role_arn = aws_iam_role.eks_cluster_role.arn

  vpc_config {
    subnet_ids = [
      aws_subnet.public_1.id,
      aws_subnet.public_2.id,
      aws_subnet.private_1.id,
      aws_subnet.private_2.id
    ]
  }

  depends_on = [
    aws_iam_role_policy_attachment.eks_cluster_policy
  ]
}

# 2. Worker Node Group (Runs in private subnets)
resource "aws_eks_node_group" "nodes" {
  cluster_name    = aws_eks_cluster.main.name
  node_group_name = "main-node-group"
  node_role_arn   = aws_iam_role.eks_node_role.arn
  subnet_ids      = [aws_subnet.private_1.id, aws_subnet.private_2.id]

  scaling_config {
    desired_size = 2
    min_size     = 1
    max_size     = 2
  }

  # Validated Free Tier allowed instance type for your account
  instance_types = ["t3.small"]
  ami_type       = "AL2023_x86_64_STANDARD"
  capacity_type  = "ON_DEMAND"

  # Disk configuration in GB
  disk_size = 20

  depends_on = [
    aws_iam_role_policy_attachment.node_worker,
    aws_iam_role_policy_attachment.node_cni,
    aws_iam_role_policy_attachment.node_ecr
  ]
}