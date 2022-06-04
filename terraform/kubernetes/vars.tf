# All variables in this file will be inputted by Github Actions pipeline. See workflow.yml in this repository

# URL of ECR repository <aws_account_id>.dkr.ecr.<region>.amazonaws.com/<my-repository>
variable "repository_url" {
  default = ""
  type    = string
}

# Image tag used in this deployment
variable "image_tag" {
  default = ""
  type    = string
}

# Cluster ID to create kubernetes resources on
variable "eks_cluster_id" {
  default = ""
  type    = string
}

variable "aws_region" {
  default     = ""
  description = "AWS region"
}

variable "load_balancer_name" {
  default     = "demo-webapp-svc"
  description = "name of load balancer in cluster"
}

variable "deployment_name" {
  default     = ""
  description = "name of deployment in cluster"
}

variable "app_name" {
  default     = ""
  description = "label of deployment app"
}

variable "container_name" {
  default     = ""
  description = "name of container in deployment pod"
}