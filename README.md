# Type Script PingPong Application

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
- *cicd* - Contains the K8's yaml file
- *infrastructure/tf-modules* - Contains the terraform modules for EKS, ALB Ingress , Monitoring
- *infrastructure/helm* - Contains the Helm Charts for PingPong Application
- *infrastructure/us-east-1* - Contains the terraform code for EKS Cluster, Monitoring

## Deployment Architecture EKS

![Deployment Architecture](./ping-pong.png)

## Building PingPong Application

```bash
cd app/ping-pong
docker build -t anishnath/ping-pong .
```

## Running PingPong Application locally 

```bash
docker run -p 3000:3000 anishnath/ping-pong
```

## Image Vuln Scanning with Trivy 

TODO this step needs to be Automated

```bash
➜ rivy  image --severity HIGH,CRITICAL  anishnath/ping-pong:f2500bc044669a69d1056761e8b75add742889df
2024-04-29T18:57:40.788+0530    INFO    Vulnerability scanning is enabled
2024-04-29T18:57:40.789+0530    INFO    Secret scanning is enabled
2024-04-29T18:57:40.789+0530    INFO    If your scanning is slow, please try '--scanners vuln' to disable secret scanning
2024-04-29T18:57:40.789+0530    INFO    Please see also https://aquasecurity.github.io/trivy/v0.50/docs/scanner/secret/#recommendation for faster secret detection
2024-04-29T18:57:43.821+0530    INFO    Detected OS: alpine
2024-04-29T18:57:43.822+0530    INFO    Detecting Alpine vulnerabilities...
2024-04-29T18:57:43.825+0530    INFO    Number of language-specific files: 1
2024-04-29T18:57:43.825+0530    INFO    Detecting node-pkg vulnerabilities...

anishnath/ping-pong:f2500bc044669a69d1056761e8b75add742889df (alpine 3.17.6)

Total: 0 (HIGH: 0, CRITICAL: 0)

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
- Route53
- Custom Certs