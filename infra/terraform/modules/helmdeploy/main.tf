data "aws_region" "current" {}

data "aws_eks_cluster" "cluster" {
  name = "testeks"
}

provider "helm" {
  kubernetes {
    host                   = data.aws_eks_cluster.cluster.endpoint
    cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
    exec {
      api_version = "client.authentication.k8s.io/v1beta1"
      args        = ["eks", "get-token", "--cluster-name", data.aws_eks_cluster.cluster.name]
      command     = "aws"
    }
  }
}

resource "helm_release" "this" {
  name      = "string-tmnl"
  chart     = "${path.module}/string-tmnl"
  version   = var.app_version
  namespace = "string-tmnl"
  values = [
    "${file("${path.module}/string-tmnl/values.yaml")}"
  ]
  set {
    name  = "ingress.hosts[0].host"
    value = var.ingress_hosts
  }
}


provider "kubernetes" {
  host                   = data.aws_eks_cluster.cluster.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)

  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    command     = "aws"
    # This requires the awscli to be installed locally where Terraform is executed
    args = ["eks", "get-token", "--cluster-name", data.aws_eks_cluster.cluster.name]
  }
}