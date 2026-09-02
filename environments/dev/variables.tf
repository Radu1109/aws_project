variable "aws_region" {
  description = "AWS region where the resources will be created"
  type        = string
}

variable "environment" {
  description = "The environment for which the resources are being created (e.g., dev, staging, prod)"
  type        = string
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
}

variable "cluster_name" {
  description = "The name of the EKS cluster"
  type        = string
}

variable "subnet_public_1" {
  type = string
}

variable "subnet_public_2" {
  type = string
}

variable "subnet_private_1" {
  type = string
}

variable "subnet_private_2" {
  type = string
}

variable "availability_zones" {
  type = list(string)
}