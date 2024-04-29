# Type Script Node Application

This module is used to deploy a Node.js application to a Kubernetes cluster. The module will create a deployment, service, and ingress for the application.

The terraform Modules uses ALB Ingress Controller
https://kubernetes-sigs.github.io/aws-load-balancer-controller/v1.1/



## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | ~> 2.14.0 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | ~> 2.0.0 |

Node.js Application

## Folder Structure

- *app* - Contains the TypeScript ping-pong application
- *app/terraform* - Deploying Local chart to Kubernetes
- *infrastructure/tf-modules* - Contains the terraform modules for EKS, ALB Ingress , Monitoring
- *infrastructure/helm* - Contains the Helm Charts for PingPong Application
- *infrastructure/us-east-1* - Contains the terraform code for EKS Cluster, Monitoring


## Building PingPong Application

```bash
cd app/ping-pong
docker build -t anishnath/ping-pong .
```

## Running PingPong Application locally 

```bash
docker run -p 3000:3000 ping-pong:latest
```

## Running PingPong Application in Kubernetes

```bash
helm install ping-pong ./infrastructure/helm/ping-pong
```

## Terraform EKS Cluster

```bash
cd infrastructure/us-east-1/eks
terragrunt init
terragrunt plan 
terragrunt apply
```
This will setup a EKS cluster in us-east-1 region


## Monitoring

```bash
cd infrastructure/us-east-1/monitoring
terragrunt init
terragrunt plan
terragrunt apply
```

### (TODO)
- Add TLS Cert CertBot
- Deploy Falco/Sysdig on Kubernetes
- Adding ArgoCD Pipeline
- Security Alerting