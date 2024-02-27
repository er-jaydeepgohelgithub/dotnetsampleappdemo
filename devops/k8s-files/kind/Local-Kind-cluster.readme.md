# Multi-Node Kubernetes Cluster Configuration - Kind Cluster Locally only

This repository provides a Kubernetes cluster configuration for a multi-node setup, specifically a three-node cluster with two worker nodes. The configuration is defined in YAML using Kind (Kubernetes IN Docker) For Local Testing as I donot have AWS account.

## Cluster Details

- **Cluster Name:** dotnetcluster
- **API Version:** kind.x-k8s.io/v1alpha4

## Node Configuration

The cluster consists of three nodes, each with a specific role:

1. **Control Plane Node:**
       - Role: control-plane
2. **Worker Nodes:**
       - Role: worker (x2)

## Usage

1. **Install Kind:**
       - Ensure Kind is installed on your system. Follow the Kind documentation for installation instructions: Kind Installation
2. **Create the Cluster:**
       - Save the provided YAML configuration to a file, e.g., `dotnetcluster-config.yaml`.
    - Create the cluster using Kind:
	     `kind create cluster --config dotnetcluster-config.yaml`
        
3. **Verify Cluster:**
    
    - Check the cluster nodes and their roles:
	     `kubectl get nodes`
        
4. **Explore Kubernetes:**
	       Use `kubectl` to interact with your multi-node Kubernetes cluster.

## Customization

Feel free to customize the cluster configuration according to your needs. You can adjust the number of nodes, roles, and any other parameters specified in the YAML file.

## Cleanup

When you're done using the cluster, you can delete it:

`kind delete cluster --name dotnetcluster`

This README provides a simple guide to set up a multi-node Kubernetes cluster using Kind - Locally.