terraform {
  source = "../../tf-modules//eks-cluster"
}

include {
  path = find_in_parent_folders()
}

inputs = {
  cluster_name   = "dev-aws-us-east-1"
  region         = "us-east-1"
  private_subnets = ["subnet-0f890ade0ca050127", "subnet-05683eee51a29785c", "subnet-05b77638d1ae854e8"]
  vpc_id         = "vpc-04fe3ee79813c977b"
}