## ECR repositories

resource "aws_ecr_repository" "pp-demo-ecr" {
  name = "pp-demo-ecr"

  image_tag_mutability = "MUTABLE"

  encryption_configuration {
    encryption_type = "KMS"
  }
  image_scanning_configuration {
    scan_on_push = true
  }
}