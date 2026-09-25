output "app_url" {
  description = "Open this in your browser"
  value       = "http://${aws_lb.main.dns_name}"
}

output "ecr_repository_url" {
  value = aws_ecr_repository.app.repository_url
}

output "ecs_cluster_name" {
  value = aws_ecs_cluster.main.name
}

output "ecs_service_name" {
  value = aws_ecs_service.app.name
}

output "task_definition_family" {
  value = aws_ecs_task_definition.app.family
}

output "github_deploy_role_arn" {
  description = "The pipeline will use this"
  value       = aws_iam_role.github_deploy.arn
}