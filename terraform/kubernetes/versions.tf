terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.0.1"
    }
  }

  required_version = ">= 0.14"

  cloud {
    organization = "tspotswo"
    workspaces {
      name = "demo-kubernetes"
    }
  }
}