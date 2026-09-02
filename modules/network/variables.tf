variable "vpc" {
  type        = string
  description = "VPC"
}

variable "subnet_public_1" {
  type        = string
  description = "Subnet public 1"
}

variable "subnet_public_2" {
  type        = string
  description = "Subnet public 2"
}

variable "subnet_private_1" {
  type        = string
  description = "Subnet private 1"
}

variable "subnet_private_2" {
  type        = string
  description = "Subnet private 2"
}

variable "availability_zones" {
  type        = list(string)
  description = "List of AZs"
  default     = ["eu-central-1a", "eu-central-1b"]
}