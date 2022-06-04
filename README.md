# Introduction
 The purpose of this project is to deploy a simple web app to Amazon Elastic Kubernetes Service instance. This repository achieves this by using Github Actions to perform the following actions:
 * Provision Elastic Container Repository (ECR) with Terraform
 * Provision Elastic Kubernetes Service (EKS) with Terraform
 * Build Docker image 
 * Push Docker image to ECR
 * Create Kubernetes Deployment with Terraform
 * Create Kubernetes Service with Terraform

# Requirements:
* [AWS Account](https://aws.amazon.com/premiumsupport/knowledge-center/create-and-activate-aws-account/)
* [Terraform Cloud Account](https://app.terraform.io/signup/account)

# Configuration
## Required
* [Create AWS Secret Access Credentials](https://docs.aws.amazon.com/general/latest/gr/aws-sec-cred-types.html)
* [Create Terraform Cloud Workspace](https://www.terraform.io/cloud-docs/workspaces/creating)
  * Create two CLI Driven workspaces. One will manage the ECR and EKS instances. The other will manage the Kubernetes Deployment. 
  * Update terraform/eks/versions.tf and terraform/kubernetes/versions.tf to reflect your terraform cloud organization name and workspace name.
* [Create Terraform API Token](https://www.terraform.io/cloud-docs/users-teams-organizations/users#user-settings)
* [Add AWS Credentials secrets to Terraform Cloud Workspaces](https://www.terraform.io/cloud-docs/workspaces/variables)
  * In both workspaces, add AWS_ACCESS_KEY_ID. Mark as sensitive
  * In both workspaces, add AWS_SECRET_ACCESS_KEY. Mark as sensitive
* [Add Github Secrets](https://docs.github.com/en/actions/security-guides/encrypted-secrets)
  * Add secret TF_API_TOKEN (Terraform API Token)
  * Add secret AWS_ACCESS_KEY_ID
  * Add secret AWS_SECRET_ACCESS_KEY
  * Add secret AWS_ACCOUNT_ID
## Optional
* Edit AWS_REGION in .github/workflows/workflow.yml. Default us-east-1
* Edit terraform/eks/eks.tfvars
  * Defaults:
    * ecr_repository = "demo-webapp"
    * cluster_name = "demo-cluster"
    * vpc_name = "demo-vpc"
* Edit terraform/kubernetes/kubernetes.tfvars
  * Defaults:
    * load_balancer_name = "demo-webapp-svc"
    * deployment_name = "demo-webapp-deployment"
    * app_name = "demo-webapp-fastapi"
    * container_name = "fastapi"
# Installation
1. Manually run Github Actions workflow Create Cluster Demo
   * [How to manually run a workflow](https://docs.github.com/en/actions/managing-workflow-runs/manually-running-a-workflow)
2. When job completes successfully check the step "Terraform Apply Kubernetes Deployment". At the bottom of the log, find the outputs section. You will find load_balancer_hostname = "\<YOUR URL\>". Enter this URL enter your browser to see the response from the webapp.
# Troubleshooting
* Something went horribly wrong and I need to delete everything created by the Create Cluster Demo workflow. Run the Destroy Cluster Demo workflow found in this repository. 
# Maintainers
* Timothy Spotswood