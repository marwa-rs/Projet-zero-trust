output "ecr_urls" {
  value = { for k, r in aws_ecr_repository.depot : k => r.repository_url }
}
