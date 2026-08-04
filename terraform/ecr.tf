resource "aws_ecr_repository" "auth_service" {
  name                 = "auth-service"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}

resource "aws_ecr_repository" "product_service" {
  name                 = "product-service"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}

output "auth_repository_url" {
  value = aws_ecr_repository.auth_service.repository_url
}

output "product_repository_url" {
  value = aws_ecr_repository.product_service.repository_url
}

output "cluster_name" {
  value = aws_eks_cluster.main.name
}