# Infrastructure Deployment with Terraform and GitHub Actions

This repository contains Terraform configurations to deploy a set of infrastructure resources on AWS including a VPC, subnets, ECR (Elastic Container Registry), RDS (Relational Database Service), and an EKS (Elastic Kubernetes Service) cluster. The deployment process is automated using GitHub Actions.

## Prerequisites

Before deploying the infrastructure, make sure you have the following prerequisites:

- An AWS account with appropriate permissions to create the required resources.
- Terraform installed locally or configured to run on your CI/CD platform (in this case, GitHub Actions).
- AWS CLI configured with appropriate credentials to authenticate Terraform and push Docker images to ECR.

## Getting Started

To deploy the infrastructure, follow these steps:

1. Clone this repository:

```bash
   git clone https://github.com/mabdulmoghni/pp-infra-assignment.git
   cd pp-infra-assignment
```

## Set up the necessary variables:

Update variables.tf in the root module (main.tf) to specify any required variables such as region, VPC settings, subnet settings, etc.
Optionally, you can create a terraform.tfvars file to store sensitive or environment-specific variables.

## Configure GitHub Secrets:

In your GitHub repository, go to Settings > Secrets.
Add the following secrets:
AWS_ACCESS_KEY_ID: Your AWS access key ID.
AWS_SECRET_ACCESS_KEY: Your AWS secret access key.
AWS_REGION: The AWS region where you want to deploy the resources.

## Deploy Manually
```bash
cd pp-infra-assignment
terraform init
terrafrorm fmt
terraform validate
terraform plan
terraform apply -var dbPass="xxxxxxxxxx" -auto-approve
```

## Deploy using Github Actions
## Commit and Push, Github workflow will auto trigger terraform apply.
```bash
git add .
git commit -m "Add Terraform configurations"
git push origin main
```

## GitHub Actions Workflow:

Once you push your changes, GitHub Actions will automatically trigger the workflow defined in .github/workflows/deploy-aws-infra.yml. This workflow will execute Terraform commands to plan and apply the infrastructure changes.

## Testing
Checkout the github actions job status and notice the terraform output
## Connect using kubectl
```bash
aws sts get-caller-identity
aws eks --region eu-west-1 update-kubeconfig --name pp-demo-cluster
kubectl get ns
kubectl get pods -A
kubectl get svc -A
```

## Cleanup
To destroy the deployed infrastructure and clean up resources:
```bash
terraform destroy
```


