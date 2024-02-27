# Build and Deploy Docker Image to ECR and EKS

Automate the process of building a Docker image, pushing it to Amazon ECR, and deploying it to Amazon EKS with GitHub Actions.

## Workflow Overview

This GitHub Actions workflow is triggered on every push to the `main` branch. It performs the following steps:

1. **Check out code:**
        - Uses the `actions/checkout` action to fetch the repository code.
2. **Configure AWS credentials:**
        - Uses the `aws-actions/configure-aws-credentials` action to set up AWS credentials for subsequent steps.
3. **Login to Amazon ECR:**
        - Uses the `aws-actions/amazon-ecr-login` action to authenticate Docker with Amazon ECR.
4. **Build, tag, and push image to Amazon ECR:**
        - Builds the Docker image, tags it with the GitHub SHA, and pushes it to the specified Amazon ECR repository.
5. **Update Deployment Image:**
        - Modifies the Kubernetes deployment.yaml file to use the latest Docker image tag.
6. **Update kube config:**
        - Updates the kubeconfig file for the specified Amazon EKS cluster.
7. **Deploy to EKS with File:**
        - Applies the modified Kubernetes deployment.yaml and service.yaml files to deploy the updated image to Amazon EKS.

## Environment Variables

Make sure to set the following environment variables in your GitHub repository secrets:

- `AWS_ACCESS_KEY_ID`: AWS access key ID.
- `AWS_SECRET_ACCESS_KEY`: AWS secret access key.

## Usage

1. Clone this repository:
    
    `git clone`
    
2. Set up AWS credentials and repository secrets.
    
3. Customize Kubernetes manifest files in `devops/k8s-files/manifests` as needed.
    
4. Push changes to the `xyz` branch to trigger the GitHub Actions workflow.
    

This workflow provides an automated pipeline for building, pushing, and deploying Docker images to ECR and EKS.