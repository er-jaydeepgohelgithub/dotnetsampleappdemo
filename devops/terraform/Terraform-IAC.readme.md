# Terraform AWS Infrastructure for EKS and ECR

This Terraform configuration sets up an Amazon Web Services (AWS) infrastructure including a Virtual Private Cloud (VPC), Amazon Elastic Kubernetes Service (EKS) cluster, and Amazon Elastic Container Registry (ECR) for containerized applications.

# NOTE : Not Tested As I do Not Have AWS Account
## Prerequisites

- [Terraform](https://www.terraform.io/) installed on your local machine.

## AWS Provider Configuration

```
provider "aws" {
  region = "ap-south-1" 
}
```

## VPC Module

```
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.5.2"

  name           = "eks-vpc"
  cidr           = "10.0.0.0/16"
  azs            = ["ap-south-1a"]
  public_subnets = ["10.0.1.0/24"]
  
  enable_nat_gateway = false
}
```

## EKS Module

```
module "eks" {
  source            = "terraform-aws-modules/eks/aws"
  version           = "20.4.0"

  cluster_name                    = "my-single-az-cluster"
  cluster_version                 = "1.29"
  cluster_endpoint_public_access   = true
  
  vpc_id            = module.vpc.vpc_id
  subnet_ids        = module.vpc.public_subnets

  eks_managed_node_group_defaults = {
    ami_type = "AL2_x86_64"
  }

  eks_managed_node_groups = {
    blue = {
      min_size         = 2
      max_size         = 3
      desired_size     = 2
      instance_types   = ["t3.micro"]
      capacity_type    = "SPOT"
      labels           = { Environment = "test" }
    } 
  }
}
```

## ECR Module

```
module "ecr" {
  source  = "terraform-aws-modules/ecr/aws"
  version = "1.6.0"

  repository_name = "dotnetappsampleecr"

  tags = {
    Environment = "test"
  }
}
```

## Usage

1. Clone this repository:
    
    `git clone`
    
2. Navigate to the project directory:

    `cd devops/terraform`
    
3. Run Terraform commands:

    - `terraform init`
    - `terraform apply`
    
4. Follow the on-screen prompts to confirm the changes.
    

## Cleanup

To destroy the created infrastructure, run:

`terraform destroy`

This Terraform configuration provides a foundation for managing your AWS infrastructure with EKS, ECR, and VPC components.