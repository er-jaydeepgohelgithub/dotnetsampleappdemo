# DotNet Docker App Sample Deployment

This Kubernetes YAML configuration defines a deployment for a .NET application using Docker containers. The deployment includes settings for scaling, rolling updates, probes, and resource allocation.

## Deployment Details

- **Name:** dotnetdockerappsample-deployment
- **API Version:** apps/v1
- **Kind:** Deployment

## Replica Configuration

- **Replicas:** 2

## Rolling Update Strategy

- **Type:** RollingUpdate
- **Max Surge:** 1
- **Max Unavailable:** 1

## Selector

The deployment selects pods based on the label:

- **Label:** app=dotnetdockerappsample

## Pod Template

The pod template includes the following specifications:

- **Container:**
    - **Name:** dotnetdockerappsample
    - **Image:** 0000000000.dkr.ecr.ap-south-1.amazonaws.com/dotnetappsampleecr:xyz
    - **Ports:** 5000
- **Health Probes:**
    - **Startup Probe:**
        - HTTP Get: `/` on port 5000
        - Failure Threshold: 30
        - Period Seconds: 10
    - **Readiness Probe:**
        - HTTP Get: `/` on port 5000
        - Initial Delay Seconds: 5
        - Period Seconds: 5
    - **Liveness Probe:**
        - HTTP Get: `/` on port 5000
        - Initial Delay Seconds: 3
        - Period Seconds: 3
- **Resources:**
    - **Requests:**
        - Memory: "64Mi"
        - CPU: "50m"
    - **Limits:**
        - Memory: "256Mi"
        - CPU: "250m"

## Usage

Apply this YAML configuration to your Kubernetes cluster:

`kubectl apply -f dotnetdockerappsample-deployment.yaml`

Adjust the replica count, image, probes, and resource settings based on your application's requirements.

## Cleanup

To remove the deployment from your cluster:

`kubectl delete deployment dotnetdockerappsample-deployment`
