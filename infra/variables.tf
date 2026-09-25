variable "aws_region" {
  description = "AWS region to deploy into"
  type        = string
  default     = "us-east-1"
}

variable "project" {
  description = "Name prefix for all resources"
  type        = string
  default     = "uzo-cicd"
}

variable "container_port" {
  description = "Port the app listens on inside the container"
  type        = number
  default     = 3000
}

variable "desired_count" {
  description = "How many copies of the app to run"
  type        = number
  default     = 2
}

variable "image_tag" {
  description = "Image tag for the FIRST deploy only. After that, the pipeline deploys new versions."
  type        = string
  default     = "bootstrap"
}

variable "github_repo" {
  description = "GitHub repo allowed to deploy (owner/name)"
  type        = string
  default     = "uzoebele@209199438/uzo-cicd-ecs@1384499721"
}