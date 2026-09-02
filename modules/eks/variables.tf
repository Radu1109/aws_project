variable "cluster_name" {
  description = "Name of the cluster"
  default     = "My_Cluster"
}
variable "subnet_ids" {
  type        = list(string)
  description = "List of subnet IDs for the EKS cluster"
}