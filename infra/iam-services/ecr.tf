# Noms provisoires : à remplacer par ceux d'Ibtihal
locals {
  depots_ecr = ["frontend", "api", "test-p2"]
}

resource "aws_ecr_repository" "depot" {
  for_each             = toset(local.depots_ecr)
  name                 = "${var.prefix}${each.key}"
  image_tag_mutability = "IMMUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  encryption_configuration {
    encryption_type = "AES256"
  }
}

resource "aws_ecr_lifecycle_policy" "nettoyage" {
  for_each   = aws_ecr_repository.depot
  repository = each.value.name

  policy = jsonencode({
    rules = [{
      rulePriority = 1
      description  = "Garder les 10 dernieres images"
      selection = {
        tagStatus   = "any"
        countType   = "imageCountMoreThan"
        countNumber = 10
      }
      action = { type = "expire" }
    }]
  })
}
