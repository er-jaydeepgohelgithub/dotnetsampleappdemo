provider "aws" {
  region = "ap-south-1" 
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.5.2"

  name = "eks-vpc"
  cidr = "10.0.0.0/16"
  azs  = ["ap-south-1a"]
  public_subnets = ["10.0.1.0/24"]
  
  enable_nat_gateway = false
}

module "eks" {
  source = "terraform-aws-modules/eks/aws"
  version = "20.4.0"

  cluster_name = "my-single-az-cluster"
  cluster_version = "1.29"
  cluster_endpoint_public_access = true
  
  vpc_id = module.vpc.vpc_id
  subnet_ids = module.vpc.public_subnets

  eks_managed_node_group_defaults = {
    ami_type = "AL2_x86_64"
  }

  eks_managed_node_groups = {
    blue = {
      min_size     = 2
      max_size     = 3
      desired_size = 2
      
      instance_types = ["t3.micro"]
      capacity_type  = "SPOT"
      
      labels = {
        Environment = "test"
      }
    } 
  }
}

module "ecr" {
  source  = "terraform-aws-modules/ecr/aws"
  version = "1.6.0"

  repository_name = "dotnetappsampleecr"

  tags = {
    Environment = "test"
  }
}