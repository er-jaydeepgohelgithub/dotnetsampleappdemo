# Horizontal Pod Autoscaler for DotNet Docker App Sample

This Kubernetes YAML configuration defines a Horizontal Pod Autoscaler (HPA) for scaling a deployment based on CPU resource utilization.

# NOTE : MetrixServer needed for HPA only locally tested in Kind Cluster
## HPA Details

- **Name:** dotnetdockerappsample-hpa
- **API Version:** autoscaling/v2
- **Kind:** HorizontalPodAutoscaler

## Scaling Configuration

- **Scale Target Reference:**
    
    - API Version: apps/v1
    - Kind: Deployment
    - Name: dotnetdockerappsample-deployment
- **Replica Settings:**
    
    - Minimum Replicas: 2
    - Maximum Replicas: 10

## Metrics Configuration

The HPA uses CPU resource metrics for scaling:

- **Metrics Type:** Resource
- **Resource Name:** cpu
- **Target Type:** Utilization
- **Average Utilization:** 70%

## Usage

Apply this YAML configuration to your Kubernetes cluster:

`kubectl apply -f hpa-v2.yaml`

This HPA is designed to automatically adjust the number of replicas for the specified deployment based on CPU utilization, ensuring optimal resource usage.

Adjust the `minReplicas`, `maxReplicas`, and `averageUtilization` values to fit your application's specific scaling requirements.

## Cleanup

To remove the HPA from your cluster:

`kubectl delete hpa dotnetdockerappsample-hpa`
