resource "aws_ecr_repository" "app" {
  name                 = "${var.project}-app"
  image_tag_mutability = "IMMUTABLE" # a tag can never be overwritten, so every version stays traceable
  force_delete         = true        # lets 'terraform destroy' remove it even with images inside (lab only)

  image_scanning_configuration {
    scan_on_push = true # scan every image for known vulnerabilities
  }

  encryption_configuration {
    encryption_type = "AES256"
  }
}

# Keep only the 10 newest images to control storage cost
resource "aws_ecr_lifecycle_policy" "app" {
  repository = aws_ecr_repository.app.name

  policy = jsonencode({
    rules = [{
      rulePriority = 1
      description  = "Keep last 10 images"
      selection = {
        tagStatus   = "any"
        countType   = "imageCountMoreThan"
        countNumber = 10
      }
      action = { type = "expire" }
    }]
  })
}