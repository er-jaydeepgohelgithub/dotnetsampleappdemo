# DotNet Docker App Sample Service

This Kubernetes YAML configuration defines a service for a .NET application deployed using Docker containers. The service exposes the application within the cluster, allowing external access.

## Service Details

- **Name:** dotnetdockerappsample-service
- **API Version:** v1
- **Kind:** Service

## Service Type

- **Type:** LoadBalancer 

## Selector

The service selects pods based on the label:

- **Label:** app=dotnetdockerappsample

## Ports

The service exposes the following port configuration:

- **Protocol:** TCP
- **Port:** 8080
- **Target Port:** 5000

## Usage

Apply this YAML configuration to your Kubernetes cluster:

`kubectl apply -f dotnetdockerappsample-service.yaml`

This service allows external access to your .NET application on the specified port. If using `LoadBalancer`, an external IP will be assigned. If using `NodePort`, you can access the service on any node's IP at the specified NodePort.

## Cleanup

To remove the service from your cluster:

`kubectl delete service dotnetdockerappsample-service`
