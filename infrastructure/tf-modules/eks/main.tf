## EKS cluster
resource "aws_eks_cluster" "aws_cluster" {
  name                      = var.name
  role_arn                  = aws_iam_role.eks_master_role.arn
  enabled_cluster_log_types = ["controllerManager", "scheduler"]
  version                   = var.k8s_version

  vpc_config {
    subnet_ids = var.private_subnets

  }
}

## EKS node group A
resource "aws_eks_node_group" "eks_node_group_a" {
  cluster_name    = aws_eks_cluster.aws_cluster.name
  node_group_name = "m5-large-node-grp-a"
  node_role_arn   = aws_iam_role.eks_nodegrp_role.arn
  subnet_ids      = var.private_subnets
  disk_size       = 20

  scaling_config {
    desired_size = 1
    max_size     = 4
    min_size     = 1
  }

  remote_access {
    ec2_ssh_key = aws_key_pair.eks_keypair.key_name
  }

  instance_types = ["m5.large"]

}

resource "null_resource" "kube_config" {
  provisioner "local-exec" {
    command = "aws eks --region ${var.region} update-kubeconfig --name ${var.name}"
  }

  depends_on = [
    aws_eks_cluster.aws_cluster
  ]
}

resource "aws_key_pair" "eks_keypair" {
  key_name   = "eks-keypair"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC2OeaWY8jk0zSGPNwNsQqeVrbvfybCMkOomq4jdm4sMiwlCmr0oBPmfU0H1Gk5HX2VDyii/TtjiWhXTSqk7JCPMWa3EQTCpqsU+9Ad7zrDAWKoucs7bqTYRvGBSprogFCPIbYrngJNfBW6hD6lrDutd6M8UpWh8kJGP/4giP63zI2w5rusOqNwu4Pa0JEmMxLjQ00l78maLnFnaO1xie0rDQZ3wVh+VZbXO0RkVrEbOx1e/w5zW2ihbovA+AE4xd88WYVNX3nQYCMsGaAXdbDD4h9AFu1po7FeMUYQjQa5a1xTPJEkUWLQEET7Gi6DYcfWq8Jl3Z5WhcKK8ZHRRxljM45y7K2qVDVppmv7w7HWXBu6DoKGh+EcEPUPc7QL1c4XgT/uf8KXlLzmRAKNRUH3UmpNLh0JpqaK2NHDHnC2MSkn4mjoOz9VPH5+hMH9Pmy0vjgyKS4R7pxosS2DbFZ9llHeCkycvLrNhQXGChGVUdU67AI/BgqO19UuHPNpvZc= anish@an.local"
}
