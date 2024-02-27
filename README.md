# Project Overview

This repository contains configurations and deployment files for setting up a containerized .NET application on Kubernetes using Terraform and GitHub Actions. The infrastructure is designed to run on Amazon Web Services (AWS) and includes Amazon Elastic Kubernetes Service (EKS), Elastic Container Registry (ECR), and other components.

## Contents

1. **AWS Infrastructure with Terraform:**    
    - Directory: `devops/terraform`
    - Terraform configurations for provisioning an AWS infrastructure with EKS, VPC, and ECR.
    - Detailed README available in the directory.
2. **Kubernetes Deployment Files:**    
    - Directory: `devops/k8s-files`
    - Kubernetes deployment files for deploying the .NET application on the EKS cluster.
    - Includes deployments, services, and **Horizontal Pod Auto-scaler only Locally tested**  configurations.
3. **Dockerfile:**    
    - File: `Dockerfile`
    - Dockerfile for building the Docker image of the .NET application.
4. **GitHub Actions Workflow:**    
    - File: `.github/workflows/build-and-deploy.yml`
    - GitHub Actions workflow for building and deploying the Docker image to Amazon ECR and updating the EKS cluster using deployment file.

## Usage

1. **Terraform Setup:**    
    - Navigate to the `devops/terraform` directory.
    - Follow the README instructions for setting up the AWS infrastructure using Terraform.
2. **Kubernetes Deployment:**    
    - Customize the Kubernetes deployment / service files in the `devops/k8s-files/manifests` directory if needed.
    - Apply the Kubernetes configurations to deploy the application.
3. **Docker Image Build:**    
    - Build the Docker image using the provided Dockerfile.
    - Push the image to your preferred container registry or in this case ECR.
4. **GitHub Actions Workflow:**    
    - Utilize the GitHub Actions workflow to automate the Docker image build and deployment process.

## Cleanup

1. **Terraform Cleanup:**    
    - Navigate to the `devops/terraform` directory.
    - Run `terraform destroy` to clean up the AWS infrastructure.
2. **Kubernetes Cleanup:**    
    - Apply the necessary `kubectl delete` commands to remove Kubernetes resources.
3. **GitHub Actions Workflow:**    
    - If GitHub Actions were used for continuous integration, consider adjusting or removing the workflow file.